package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.jsp.jdbc.DBUtil;

public class AddressDAO {

	Connection conn = null;
	Statement stat = null;
	PreparedStatement pstat = null;
	ResultSet rs = null;
	
	AddressDAO(){
		try {
			conn = DBUtil.open();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<AddressDTO> list() {
		try {
			String sql = "select * from tblAddress order by seq";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<AddressDTO> list = new ArrayList<AddressDTO>();
			while(rs.next()) {
				AddressDTO dto = new AddressDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setAddress(rs.getString("address"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setName(rs.getString("name"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public int add(AddressDTO dto) {
		try {
			String sql = "insert into tblAddress values(seqAddress.nextVal, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAge());
			pstat.setString(3, dto.getGender());
			pstat.setString(4, dto.getAddress());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
		
	}
	public AddressDTO getToEdit(AddressDTO dto) {
		try {
			String sql = "select * from tblAddress where seq = " + dto.getSeq();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			AddressDTO sqldto = new AddressDTO();
			if(rs.next()) {
				sqldto.setSeq(rs.getString("seq"));
				sqldto.setName(rs.getString("name"));
				sqldto.setAge(rs.getString("age"));
				sqldto.setAddress(rs.getString("address"));
				sqldto.setGender(rs.getString("gender"));
				
			}
			return sqldto;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public HashMap<String, String> getToEdit2(String seq) {
		try {
			String sql = "select * from tblAddress where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			HashMap<String, String> list = new HashMap<String, String>();
			
			if(rs.next()) {
				System.out.println("쿼리실행완료");
				list.put("seq", rs.getString("seq"));
				list.put("name", rs.getString("name"));
				list.put("age", rs.getString("age"));
				list.put("gender", rs.getString("gender"));
				list.put("address", rs.getString("address"));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int insert(AddressDTO dto) {
		int result = -1;
		try {
			String sql = "update tblAddress set name = ?, age = ?, gender = ?, address = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAge());
			pstat.setString(3, dto.getGender());
			pstat.setString(4, dto.getAddress());
			pstat.setString(5, dto.getSeq());
			
			result = pstat.executeUpdate();
			
			return result;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int delete(String seq) {

		try {
			String sql = "delete from tblAddress where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			return pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
