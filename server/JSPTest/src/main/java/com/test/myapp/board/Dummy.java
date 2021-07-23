package com.test.myapp.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.myapp.DBUtil;

public class Dummy {
	
	public static void main(String[] args) {
		
		//글쓰기
		
		
		String[] id = { "hong", "test", "admin" };
		String[] subject = { "게시판 테스트입니다.", 
							 "JSP/Servlet 게시판 만드는 중입니다.", 
							 "페이징 구현을 어떻게 하나요?", 
							 "오늘은 수요일입니다.", 
							 "안녕하세요. 오늘 가입했어요~ 반갑습니다.", 
							 "지금 자바 복습하고 있습니다. 어려워요;;", 
							 "키보드 샀어요~ 기계식 키보드 샀어요~", 
							 "배고프다. 점심 먹으러 갑시다!!", 
							 "페이징이 잘 안됩니다. 어디가 틀렸을까요?", 
							 "오라클이 자바보다 더 재미있어요!!", 
							 "게시판 제목인데 아무거나 적고 있습니다.", 
							 "페이지가 여러개로 나뉠 예정입니다.", 
							 "한때 페이징이 게시판의 꽃이라고 불렸었습니다.", 
							 "밖에 오늘은 더 덥대요. 집안에서 공부합시다.", 
							 "자 이제 제목 몇개 안남았음.", 
							 "오늘은 게시판 중요한 기술들만 수업 예정", 
							 "홍길동입니다. 공지사항있습니다.",
							 "노트북도 발열이 있어서 더 더워요~;;" };
		String content = "내용입니다.";
		String tag = "n";
		
		Random rnd = new Random();
		
		Connection conn = null;
		PreparedStatement stat = null;
		
		try {

			String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, tag, thread, depth)"
							+ " values (seqBoard.nextVal, ?, ?, ?, default, default, ?, ?, ?)";
			
			conn = DBUtil.open();
			stat = conn.prepareStatement(sql);
			
			int thread = 3000;
			
			for (int i=0; i<50; i++) {
				
				thread += 1000;
				
				stat.setString(1, id[rnd.nextInt(id.length)]);
				stat.setString(2, subject[rnd.nextInt(subject.length)]);
				stat.setString(3, content);
				stat.setString(4, tag);
				stat.setInt(5, thread);
				stat.setInt(6, 0);
				
				stat.executeUpdate();
				
				System.out.println(i + "번째 게시물 작성 완료.");				
			}
			
			
			stat.close();
			conn.close();
			
			

		} catch (Exception e) {
			System.out.println("Dummy.main()");
			e.printStackTrace();
		}
		
		
		
		
		
	}

}












