package com.scit.toyworld.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.toyworld.vo.EmpVO;

@Repository
public class EmpDAO {

	@Autowired
	private SqlSession ss;
	
	public int join(EmpVO emp) {
		int cnt = 0;
		try {
			EmpMapper mapper = ss.getMapper(EmpMapper.class);
			cnt = mapper.join(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public EmpVO login(String empId) {
		EmpVO emp = null;
		try {
			EmpMapper mapper = ss.getMapper(EmpMapper.class);
			emp = mapper.login(empId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}
}
