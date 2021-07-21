package com.test.myapp.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.myapp.DBUtil;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BoardDAO() {

		try {
			conn = DBUtil.open();
		} catch (Exception e) {
			System.out.println("BoardDAO.BoardDAO()");
			e.printStackTrace();
		}

	}

	// AddOk 서블릿이 DTO을 줄테니 insert해주세요..
	public int add(BoardDTO dto) {

		try {

			String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, tag, thread, depth)"
					+ " values (seqBoard.nextVal, ?, ?, ?, default, default, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getSubject());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getTag());
			
			pstat.setInt(5, dto.getThread());
			pstat.setInt(6, dto.getDepth());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.add()");
			e.printStackTrace();
		}

		return 0;
	}

	// List 서블릿이 게시판 목록을 달라고..
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {

		try {

			// 이 메소드 입장
			// 1. 목록보기
			// 2. 검색하기

			String where = "";

			if (map.get("isSearch").equals("y")) {
				// 검색
				// where name like '%홍길동%'
				// where subject like '%날씨%'
				// where all like '%날씨%'

				if (map.get("column").equals("all")) {
					where = String.format(" and where subject like '%%%s%%' or content like '%%%s%%' ",
							map.get("search"), map.get("search"));
				} else {
					where = String.format(" and where %s like '%%%s%%' ", map.get("column"), map.get("search"));
				}

			}

//			String sql = String.format("select * from vwBoard %s order by seq desc", where);

			String sql = String.format("select * from vwBoard where rnum between %s and %s %s order by thread desc",
					map.get("begin"), map.get("end"), where);

			pstat = conn.prepareStatement(sql);

			rs = pstat.executeQuery();

			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>(); // 옮겨 담을 큰상자

			while (rs.next()) {

				// 레코드 1줄 -> BoardDTO 1개
				BoardDTO dto = new BoardDTO();

				dto.setSeq(rs.getString("seq"));
				// dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setRegdate(rs.getString("regdate"));

				dto.setIsnew(rs.getString("isnew")); // 글쓰고 난뒤 며칠이 지났는지 시간

				dto.setCcnt(rs.getString("ccnt")); // 현재 글에 달린 댓글 개수
				
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));

				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}

		return null;
	}

	// View 서블릿이 글번호를 줄테니 레코드 내용 전부를 DTO 담아 돌려주세요..
	public BoardDTO get(String seq) {

		try {

			String sql = "select b.*, (select name from tblUser where id = b.id) as name"
					+ " from tblBoard b where seq=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				BoardDTO dto = new BoardDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setTag(rs.getString("tag"));
				
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));

				return dto;

			}

		} catch (Exception e) {
			System.out.println("BoardDAO.get()");
			e.printStackTrace();
		}

		return null;
	}

	// View 서블릿이 글번호를 줄테니 조회수를 +1 해달라고 요청..
	public void updateReadcount(String seq) {

		try {

			String sql = "update tblBoard set readcount = readcount + 1 where seq=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.updateReadcount()");
			e.printStackTrace();
		}

	}

	// EditOk 서블릿이 수정할 DTO를 줄테니 update 해주세요..
	public int edit(BoardDTO dto) {

		try {

			String sql = "update tblBoard set subject = ?, content = ?, tag = ? where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getTag());
			pstat.setString(4, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.edit()");
			e.printStackTrace();
		}

		return 0;
	}

	// DelOk 서블릿이 글번호를 줄테니 글을 삭제해다오..
	public int del(String seq) {

		try {

			String sql = "delete from tblBoard where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.del()");
			e.printStackTrace();
		}

		return 0;
	}

	// AddComment 서블릿이 댓글 써달라고 요청
	public int addComment(CommentDTO dto) {

		try {

			String sql = "insert into tblComment (seq, id, content, regdate, pseq)"
					+ " values (seqComment.nextVal, ?, ?, default, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId()); // ?
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getPseq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.addComment()");
			e.printStackTrace();
		}

		return 0;
	}

	// View 서블릿이 댓글 목록 달라고 요청
	public ArrayList<CommentDTO> listComment(String seq) {

		try {

			// 부모글번호를 조건으로..
			String sql = "select c.*, (select name from tblUser where id = c.id) as name from tblComment c where pseq = ? order by seq desc";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();

			while (rs.next()) {
				// 레코드 1줄 -> DTO 1개
				CommentDTO dto = new CommentDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPseq(rs.getString("pseq"));
				dto.setName(rs.getString("name"));

				clist.add(dto);
			}

			return clist;

		} catch (Exception e) {
			System.out.println("BoardDAO.listComment()");
			e.printStackTrace();
		}

		return null;
	}

	// View 서블릿이 글번호를 줄테니 댓글을 삭제해주세요..
	public int delComment(String seq) {

		try {

			String sql = "delete from tblComment where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.delComment()");
			e.printStackTrace();
		}

		return 0;
	}

	// DelOk 서블릿이 글번호를 줄테니 글번호를 부모로 하는 모든 댓글을 삭제해주세요..
	public void delAllComment(String seq) {

		try {

			String sql = "delete from tblComment where pseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.delAllComment()");
			e.printStackTrace();
		}

	}

	// List 서블릿이 총 게시물 수 알려달라고 요청
	public int getTotalCount(HashMap<String, String> map) {
		try {
			String where = "";

			if (map.get("isSearch").equals("y")) {
				// 검색
				// where name like '%홍길동%'
				// where subject like '%날씨%'
				// where all like '%날씨%'

				if (map.get("column").equals("all")) {
					where = String.format(" where subject like '%%%s%%' or content like '%%%s%%' ",
							map.get("search"), map.get("search"));
				} else {
					where = String.format(" where %s like '%%%s%%' ", map.get("column"), map.get("search"));
				}

			}
			String sql = String.format("select count(*) as cnt from tblBoard %s", where);
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	
	//AddOk 서블릿이 가장 큰 thread값을 찾아달라 요청
	public int getMaxThread() {
		try {
			String sql = "select nvl(max(thread), 0) + 1000 as thread from tblBoard";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("thread");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	//AddOk 서블릿이 답변 글쓰기에 필요한 업무를 위임
	public void updateThread(int parentThread, int previousThread) {
		try {
			String sql = "update tblBoard set thread = thread - 1 where thread > ? and thread < ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, previousThread);
			pstat.setInt(2, parentThread);
			
			pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
