package com.test.jsp.jdbc;

import java.sql.Connection;
import java.sql.Statement;

public class Ex03_Statement {
   
   public static void main(String[] args) {
      
      // Ex03_Statement.java
      
      /*
      
      Statement 클래스
      - 모든 SQL 구문을 실행하는 역할
      
      Statement 종류
      1. Statement
         - 기본
         
      2. PrepareStatement
         - 인자값과 관련된 작업을 특화
         - 코드 안정성 높음, 가독성 높음
         - 코드량 많음
      --------------------------------- 텍스트 쿼리 실행
      
      3. CollableStatement
         - 프로시저 전용 Statement
      --------------------------------- 프로시저 실행
      
      */
      
      Connection conn = null;
      
      try {
         
         conn = DBUtil.open();
         System.out.println(conn.isClosed() ? "연결 실패" : "연결 성공");
         
         // 질의!!
         // - SQL 사용 -> 문자열 취급
         // - 문자열로 SQL을 미리 준비한다.
         // - ';' 사용 금지
         String sql = "insert into tblAddress(seq, name, age, gender, address) values (seqAddress.nextVal, '아무개', 25, 'm', '서울시 강남구 대치동')";
         
         // Statement
         // - Connection을 통해서 생성한다.
         // - Statement 객체가 실행할 SQL을 어느 서버에서 실행할지 모르기 때문에 그 정보를 가지고 있는 Connection과 연관되어 있다.
         Statement stat = conn.createStatement();
         
         
         // SQL 실행
         // 1. 반환값이 없는 쿼리
         // - stat.executeUpdate()
         // 2. 반환값이 있는 쿼리
         // - stat.executeQuery()
         
         int result = stat.executeUpdate(sql); // SQL Developer에서 Ctrl + Enter와 동일한 행동, 쿼리 실행(***)
         
         System.out.println("result: " + result);
         
         
         // 종료
         stat.close();
         conn.close();
         
         System.out.println("완료");
         
         
      } catch (Exception e) {
         System.out.println("에러메세지: " + e.getMessage());
         e.printStackTrace();
      }
      
   } // main

} // Ex03






















