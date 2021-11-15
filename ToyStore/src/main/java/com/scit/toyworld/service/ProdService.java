package com.scit.toyworld.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.scit.toyworld.util.FileService;
import com.scit.toyworld.dao.ProdDAO;
import com.scit.toyworld.vo.InfoVO;
import com.scit.toyworld.vo.PositionVO;
import com.scit.toyworld.vo.ProdVO;

@Service
public class ProdService {
	
	@Autowired
	private ProdDAO dao;
	
	@Autowired
	private HttpSession ss;
	
	private static final String uploadPath = "/prodUpload";
	
	public String insertProd(ProdVO prod, MultipartFile upload) {
		String loginId = (String)ss.getAttribute("loginId");
		prod.setEmpId(loginId);
		String path = "";
		
		if (!upload.isEmpty()) {
			String originalFileName = upload.getOriginalFilename();
			String savedFileName = FileService.saveFile(upload, uploadPath);
			prod.setProdOriginalFileName(originalFileName);
			prod.setProdSavedFileName(savedFileName);
		}
		
		int cnt = dao.insertProd(prod);
		if (cnt > 0) {
			path = "redirect:/prod/listForm";
		} else {
			path = "redirect:/prod/insertForm";
		}
		return path;
	}
	
	public ArrayList<HashMap<String, Object>> allList(PositionVO positionNum) {
		return dao.allList(positionNum);
	}
	
	public ProdVO oneProd(String prodNum) {
		return dao.oneProd(prodNum);
	}
	
	public ArrayList<PositionVO> allPositionNum() {
		return dao.allPositionNum();
	}
	
	public String RegInfo(int positionNum, List<String> SaveProdNumList) {
		List<InfoVO> RegInfoList = new ArrayList<InfoVO>();
		
		for (int i = 0; i < SaveProdNumList.size(); i++) {
			InfoVO info = new InfoVO();
			info.setProdNum(SaveProdNumList.get(i));
			info.setPosNum(positionNum);;
			RegInfoList.add(info);
		}
		
		String path = "";
		int cnt = dao.RegInfo(RegInfoList);
		if (cnt > 0) {
			path = "redirect:/prod/listForm";
		} else {
			path = "redirect:/prod/goToMap";
		}
		return path;
	}
	
	public ArrayList<PositionVO> search(String searchText) {
		return dao.search(searchText);
	}
	
}
