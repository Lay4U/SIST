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

			String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, tag)"
					+ " values (seqBoard.nextVal, ?, ?, ?, default, default, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getSubject());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getTag());

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
				// 검색하기
				// where name like '%홍길동%'
				// where subject like '%날씨%'

				if (map.get("column").equals("all")) {
					where = String.format(" where subject like '%%%s%%' or content like '%%%s%%' ", map.get("search"),
							map.get("search"));
				} else {
					where = String.format(" where %s like '%%%s%%' ", map.get("column"), map.get("search"));
				}
			}

			String sql = String.format("select * from vwBoard %s order by seq desc", where);

			pstat = conn.prepareStatement(sql);

			rs = pstat.executeQuery();

			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>(); // 옮겨 담을 큰상자

			while (rs.next()) {

				// 레코드 1줄 -> BoardDTO 1개
				BoardDTO dto = new BoardDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setRegdate(rs.getString("regdate"));

				dto.setIsnew(rs.getString("isnew")); // 글 쓰고 난 뒤 며칠이 지났는지에대한 시간
				
				dto.setCcnt(rs.getString("ccnt"));
				
				list.add(dto);

			}

			return list;

		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}

		return null;
	}

	public BoardDTO get(String seq) {
		try {
			String sql = "select b.*, (select name from tblUser where id = b.id) as name "
					+ "from tblBoard b where seq=?";

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

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// View 서블릿이 글번호를 줄테니 조회수를 +1 해달라고 요청
	public void updateReadcount(String seq) {
		try {
			String sql = "update tblBoard set readcount = readcount+1 where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.executeUpdate();
		} catch (Exception e) {
			System.out.println("BoardDAO.updateReadcount()");
			e.printStackTrace();
		}

	}

	// EditOk 서블릿이 수정할 DTO를 줄테니 update 해주세요
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
			System.out.println("BoardDAO.Edit()");
			e.printStackTrace();
		}

		return 0;

	}

	// DelOk 서블릿이 글 번호를 줄테니 글을 삭제 해다오
	public int del(String seq) {
		try {

			String sql = "delete from tblBoard where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.del()");
			System.out.println(seq);
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

	public ArrayList<CommentDTO> listComment(String seq) {

		try {

			// 부모 글번호를 조건으로
			String sql = "select c.*, (select name from tblUser where id = c.id) as name from tblComment c where pseq = ? order by seq desc"; // 부모
																																				// 글번호를
																																				// 조건으로..

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();

			while (rs.next()) {

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
			e.printStackTrace();
		}

		return null;
	}

	public int delComment(String seq) {
		try {

			String sql = "delete from tblComment where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.addComment()");
			e.printStackTrace();
		}

		return 0;
	}

	//DelOk 서블릿이 글번호를 줄테니 글번호를 부모로하는 모든 댓글을 삭제해주세요
	public void delAllComment(String seq) {
		try {
			String sql = "delete from tblComment where pseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
