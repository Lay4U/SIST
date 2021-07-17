package com.test.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import com.test.jsp.jdbc.DBUtil;

// MVC 디자인 패턴
// -> 데이터 처리를 담당하는 객체 -> DAO

//DAO, Data Access Object
// - 데이터를 처리하는 전용 객체


//************ 철칙!!: JDBC와 관련된 코드는 앞으로 DAO에서만 구현한다.(************)
public class AuthDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	//DB 연결
	
	public AuthDAO() {
		try {
			conn = DBUtil.open();
		} catch(Exception e) {
			System.out.println("AuthDAO.AuthDAO()");
			e.printStackTrace();
		}
	}

	//LoginOk 서블릿이 id와 pw를 줄테니 DB에서 회원이 맞는지를 검사해주세요
	public int login(AuthDTO dto) {
		try {
//			String sql = "select count(*) from tblUser where id='hong' and pw='1111' ";
			String sql = "select count(*) as cnt from tblUser where id=? and pw=? ";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");	//1 or 0
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public AuthDTO login2(AuthDTO dto) {
		try {
			String sql = "select * from tblUser where id=? and pw=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();

//			ResultSetMetaData rsmd = rs.getMetaData();
//			int columnsNumber = rsmd.getColumnCount();
//			while (rs.next()) {
//			    for (int i = 1; i <= columnsNumber; i++) {
//			        if (i > 1) System.out.print(",  ");
//			        String columnValue = rs.getString(i);
//			        System.out.print(columnValue + " " + rsmd.getColumnName(i));
//			    }
//			    System.out.println("!!!");
//			}
//			System.out.println(rs);
			if (rs.next()) {
				AuthDTO resultDTO = new AuthDTO();
				
				resultDTO.setId(rs.getString("id"));
				resultDTO.setName(rs.getString("name"));
				resultDTO.setLv(rs.getString("lv"));
				resultDTO.setRegdate(rs.getString("regdate"));
				
				return resultDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
