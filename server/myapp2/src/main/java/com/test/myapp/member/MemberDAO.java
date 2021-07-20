package com.test.myapp.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.myapp.DBUtil;

public class MemberDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			conn = DBUtil.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberDTO login(MemberDTO dto) {
		try {
			String sql = "select * from tblUser where id=? and pw=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs=pstat.executeQuery();
			
			if(rs.next()) {
				MemberDTO result = new MemberDTO();
				result.setId(rs.getString("id"));
				result.setLv(rs.getString("lv"));
				result.setName(rs.getString("name"));
				result.setRegdate(rs.getString("regdate"));
				
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
