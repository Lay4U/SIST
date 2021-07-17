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
			conn = DBUtil.open();
		} catch (Exception e) {
			System.out.println("CardDAO.CardDAO()");
			e.printStackTrace();
		}
	}

	public ArrayList<CardDTO> add(CardDTO dto) {
		try {
			String sql = "insert into tblCard (seq, korname, engname, tel, email, company, position)\r\n"
					+ "values(seqCard.nextVal, ?, ?, ?, ?, ?, ?);";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getKorname());
			pstat.setString(2, dto.getEngname());
			pstat.setString(3, dto.getTel());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getCompany());
			pstat.setString(6, dto.getPosition());
			
			int result =  pstat.executeUpdate(); //성공(1), 실패(0)
			
			ArrayList<CardDTO> list = new ArrayList<CardDTO>();
			
			while(rs.next()) {
				CardDTO dto1 = new CardDTO();
				
				dto1.setSeq(rs.getString("seq"));
				dto1.setKorname(rs.getString("korname"));
				dto1.setEngname(rs.getString("engname"));
				dto1.setEngname(rs.getString("tel"));
				dto1.setEngname(rs.getString("email"));
				dto1.setEngname(rs.getString("company"));
				dto1.setEngname(rs.getString("position"));
				
				list.add(dto1);
			}
			return list;
			
			
		} catch (Exception e) {
			System.out.println("CardDAO.add()");
			e.printStackTrace();
		}
		return 0;
	}
	
}
