package com.test.card;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.jsp.jdbc.DBUtil;

public class CardDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public CardDAO() {
		try {
			conn=DBUtil.open();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public int add(CardDTO dto) {
		try {
			String sql = "insert into tblCard values(seqcard.nextval, ?, ?, ?, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getKorname());
			pstat.setString(2, dto.getEngname());
			pstat.setString(3, dto.getTel());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getCompany());
			pstat.setString(6, dto.getPosition());
			
			return pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return 0;
	}
	public ArrayList<CardDTO> list() {
		try {
			String sql = "select * from tblCard order by korname asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CardDTO> list = new ArrayList<CardDTO>();
			while(rs.next()) {
				CardDTO dto = new CardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setKorname(rs.getString("korname"));
				dto.setEngname(rs.getString("engname"));
				dto.setTel(rs.getString("email"));
				dto.setCompany(rs.getString("company"));
				dto.setPosition(rs.getString("position"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return null;
	}
}
