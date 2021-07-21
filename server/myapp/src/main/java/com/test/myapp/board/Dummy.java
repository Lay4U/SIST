package com.test.myapp.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.myapp.DBUtil;

public class Dummy {
	public static void main(String[] args) {
		//글쓰기
		
		String[] id = { "hong", "test", "admin"};
		String[] subject = { 
				"게시판 테스트입니다.", 
				"JSP/Servlet 게시판 만드는 중입니다.", 
				"페이징 구현을 어떻게 하나요?", 
				"오늘은 수요일 입니다.", 
				"안녕하세요. 오늘 가입했어요~ 반갑습니다.", 
				"지금 자바 복습하고 있습니다. 어려워요;;", 
				"배고프다. 점심 먹으러 갑시다!!", 
				"페이징이 잘 안됩니다. 어디가 틀렸을까요?", 
				"오라클이 자바보다 더 재미있어요!!", 
				"게시판 제목인데 아무거나 적고 있습니다.", 
				"페이지가 여러개로 나뉠 예정입니다.", 
				"한때 페이징이 게시판의 꽃이라고 불렸습니다.", 
				"밖에 오늘은 더 덥대요. 집안에서 공부합시다.", 
				"자 이제 게시판 몇개 안남았음", 
				"오늘은 게시판 중요한 기술들만 수업 예정", 
				"홍길동입니다. 공지사항 있습니다.",
				"노트북도 발열이 있어서 더 더워요~;;"};
		String content = "내용입니다.";
		String tag = "n";
		
		Random rnd = new Random();
		
		Connection conn = null;
		PreparedStatement stat = null;
		
		try {
			String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, tag)"
					+ " values (seqBoard.nextVal, ?, ?, ?, default, default, ?)";
			
			conn = DBUtil.open();
			stat = conn.prepareStatement(sql);
			
			for (int i=0; i<387; i++) {
				stat.setString(1, id[rnd.nextInt(id.length)]);
				stat.setString(2, subject[rnd.nextInt(subject.length)]);
				stat.setString(3, content);
				stat.setString(4, tag);
				
				stat.executeUpdate();
				
				System.out.println(i + "번째 게시물 작성 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

/*
 * 답변형 게시판
 * 
 * thread(number), depth(number) 컬럼 추가
 * 
 * 1. 새글 쓰기
 * - /board/add.do
 * a. 현존하는 모든 게시물 중에서 가장 큰 thread값을 찾는다. > 그 찾은 thread값에 +1000 한 값을 새글의 thread값으로 사용한다.
 * b. 현재 새글의 depth는 0을 넣는다.
 * 
 * 
 * 2. 답변글 쓰기
 * - /board/add.do?reply=1
 * a. 현존 모든 게시물의 thread값을 대상으로 현재 작성 중인 답변글의 부모글의 thread값 보다 작고, 이전 새글의 thread값보다 큰 thread를 찾아서 모두 -1을 한다.
 * b. 현재 작성중인 답변글의 thread값은 부모글의 thread - 1을 넣는다.
 * c. 현재 작성중인 답변글의 depth값을 부모글의 depth + 1을 넣는다.
 * 
 * 
 * 
 * 
 */
