package com.test.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.jsp.jdbc.DBUtil;

public class AuthDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public AuthDAO() {
		try {
			conn = DBUtil.open();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("AuthDAO.AuthDAO()");
			e.printStackTrace();
		}
	}

	public int login(AuthDTO dto) {
		try {
			String sql = "select count(*) as cnt from tblUser where id=? and pw=?";
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public AuthDTO login2(AuthDTO dto) {
		String sql = "select * from tblUser where id=? and pw=?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());

			rs = pstat.executeQuery();

			if (rs.next()) {
				AuthDTO resultDTO = new AuthDTO();

				resultDTO.setId(rs.getString("id"));
				resultDTO.setName(rs.getString("name"));
				resultDTO.setLv(rs.getString("lv"));
				resultDTO.setRegdate(rs.getString("regdate"));
				
				return resultDTO;

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
