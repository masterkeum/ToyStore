package com.scit.toyworld.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit.toyworld.service.ProdService;
import com.scit.toyworld.vo.PositionVO;
import com.scit.toyworld.vo.ProdVO;

@Controller
public class ProdController {
	
	@Autowired
	private ProdService sv;
	
	private List<String> SaveProdNumList;

	@RequestMapping(value = "/prod/listForm", method = RequestMethod.GET)
	public String listForm(Model model, PositionVO positionNum) {
		ArrayList<HashMap<String, Object>> list = sv.allList(positionNum);
		model.addAttribute("list", list);
		return "prod/listForm";
	}

	@RequestMapping(value = "/prod/insertForm", method = RequestMethod.GET)
	public String insertForm() {
		return "prod/insertForm";
	}
	
	@RequestMapping(value = "/prod/insert", method = RequestMethod.POST)
	public String insertProd(ProdVO prod, MultipartFile upload) {
		return sv.insertProd(prod, upload);
	}
	
	@RequestMapping(value = "/prod/readForm", method = RequestMethod.GET)
	public String readForm(Model model, String prodNum) {
		ProdVO prod = sv.oneProd(prodNum);
		model.addAttribute("prod", prod);
		return "prod/readForm";
	}
	
	@RequestMapping(value = "/prod/loadImage", method = RequestMethod.GET)
	public String loadImage(String fileName, HttpServletResponse response) throws IOException {
		response.setContentType("image/jpg");
	    ServletOutputStream bout = response.getOutputStream();
		String imagePath = "C:/prodUpload/" + fileName;
		FileInputStream f = new FileInputStream(imagePath);
		int length;
		byte[] buffer = new byte[10];
		while((length=f.read(buffer)) != -1){
			bout.write(buffer,0,length);
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/prod/SaveProdNum", method = RequestMethod.GET)
	public boolean SaveProdNum(@RequestParam(value = "prodNumList[]", defaultValue = "") List<String> prodNumList){
		if (prodNumList.isEmpty()) {
			return false;
		} else {
			SaveProdNumList = prodNumList;
			return true;
		}
		
	}
	
	@RequestMapping(value = "/prod/goToMap", method = RequestMethod.GET)
	public String goToMap(Model model) {
		ArrayList<PositionVO> posNumList = sv.allPositionNum();
		model.addAttribute("posList", posNumList);
		return "prod/insertMap";
	}
	
	@RequestMapping(value = "/prod/RegInfo", method = RequestMethod.GET)
	public String RegInfo(int positionNum) {
		return sv.RegInfo(positionNum, SaveProdNumList);
	}
	
	@ResponseBody
	@RequestMapping(value = "/prod/search", method = RequestMethod.GET)
	public ArrayList<PositionVO> search(
			@RequestParam(value = "searchText", defaultValue = "") String searchText) {
		System.out.println(searchText);
		ArrayList<PositionVO> searchNum = sv.search(searchText);
		return searchNum;
	}
	
}
