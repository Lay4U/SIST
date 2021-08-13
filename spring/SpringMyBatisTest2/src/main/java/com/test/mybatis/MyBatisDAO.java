package com.test.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyBatisDAO {

	@Autowired
	private SqlSessionTemplate template; //Statement + ResultSet + Mapping
	
	public int add(MyBatisDTO dto) {
		//반환값 없는 쿼리 > insert
		
//		stast.executeUpdate
//		template.insert()
//		template.update()
//		template.delete()
		
//		stat.executeQuery()
//		template.selectXXX()
		
//		template.insert("") : 인자가 없는 쿼리
//		template.insert("", obs) : 인자가 있는 쿼리
		
//		template.insert("쿼리", dto)
		//MyBatis > SQL을 XML로 작성한다.
		
//		return template.insert("test.m1", dto); // executeUpdate() // 매개변수가 없는 반환값 없는 쿼리
//		return template.insert("test.m2", dto);
//		return template.delete("test.m2", 2); //매개변수가 있는 반환값 없는 쿼리
		return template.update("test.m3", dto); //매개변수가 있고 반환값 없는 쿼리
	}

}
