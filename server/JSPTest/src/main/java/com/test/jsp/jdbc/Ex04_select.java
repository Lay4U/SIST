package com.test.jsp.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex04_select {
    public static void main(String[] args){

        //교환값이 있는 쿼리 -> select문
        //template();
//        m1();
//        m3();
//    	  m4();
    	  m5();
    }

    private static void m5() {
//    	N개 레코드 + N개 컬럼
        Connection conn = null;
        Statement stat = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.open();
            stat = conn.createStatement();
            String sql = "select * from tblAddress order by seq asc";
            rs = stat.executeQuery(sql);
            while(rs.next()) {
            	String seq = rs.getString("seq");
            	String name = rs.getString("name");
            	String age = rs.getString("age");
            	String gender = rs.getString("gender");
            	String address = rs.getString("address");
            	
            	System.out.println(seq);
            	System.out.println(name);
            	System.out.println(age);
            	System.out.println(gender);
            	System.out.println(address);
            	System.out.println();
            }
            stat.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }		
	}

	private static void m4() {
//    	N개 레코드 + 1개 컬럼
        Connection conn = null;
        Statement stat = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.open();
            stat = conn.createStatement();
            String sql = "select name from tbladdress order by nmae desc";
            
            rs = stat.executeQuery(sql);
            
            while(rs.next()) {
            	
            }
            stat.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
	}

	private static void m3() {
    	//1개 레코드 + N개 컬럼
    	
        Connection conn = null;
        Statement stat = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtil.open();
            stat = conn.createStatement();
            String sql = "select * from tblAddress where seq = 41";
            
            rs = stat.executeQuery(sql);
            
            if(rs.next()) {
            	String seq = rs.getString("seq");
            	String name = rs.getString("name");
            	String age = rs.getString("age");
            	String gender = rs.getString("gender");
            	String address = rs.getString("address");
            	
            	System.out.println(seq);
            	System.out.println(name);
            	System.out.println(age);
            	System.out.println(gender);
            	System.out.println(address);
            	
            	
            }
            stat.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
	}

	private static void template(){
        Connection conn = null;
        Statement stat = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.open();
            stat = conn.createStatement();
            String sql = "";

            stat.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    

    private static void m1(){
        //단일값 반환 select
        // -> select -> 1행 1열
        Connection conn = null;
        Statement stat = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.open();
            stat = conn.createStatement();
            String sql = "select name as nick from tblAddress";

            rs = stat.executeQuery(sql);

            //커서를 다음 레코드로 전진시킨다.
            rs.next();

            //커서가 가리키고 있는 레코드의 특정 컬럼값을 가져온다.
            //rs.getXXX();
            int count = rs.getInt(1);

            System.out.println("인원수: " + count);

            String strCount = rs.getString(1);
            System.out.println("인원수: " + strCount);


            rs.close();
            stat.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    private static void m2() {
        Connection conn = null;
        Statement stat = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.open();
            stat = conn.createStatement();
            
            String sql = "select name from tblAddress where seq = 41";
            
            rs = stat.executeQuery(sql);
            
            if (rs.next()) {
            	//String name = rs.getString(1);
//            	String name = rs.getString("name");
            	String name = rs.getString("nick");
            	System.out.println("이름: " + name);
            } else {
            	System.out.println("41번 레코드가 없습니다.");
            }
            
            stat.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
