package com.scit.toyworld.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.scit.toyworld.vo.InfoVO;
import com.scit.toyworld.vo.PositionVO;
import com.scit.toyworld.vo.ProdVO;

public interface ProdMapper {
	
	public int insertProd(ProdVO prod);
	public ArrayList<HashMap<String, Object>> allList(PositionVO positionNum);
	public ProdVO oneProd(String prodNum);
	public ArrayList<PositionVO> allPositionNum();
	public int RegInfo(List<InfoVO> RegInfoList);
	public ArrayList<PositionVO> search(String searchText);
}
