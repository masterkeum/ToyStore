package com.scit.toyworld.dao;

import com.scit.toyworld.vo.EmpVO;

public interface EmpMapper {
	
	public int join(EmpVO emp);
	public EmpVO login(String empId);
}
