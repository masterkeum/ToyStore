package com.scit.toyworld;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.toyworld.service.ProdService;
import com.scit.toyworld.vo.PositionVO;

@Controller
public class HomeController {
	
	@Autowired
	private ProdService sv;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		ArrayList<PositionVO> posNumList = sv.allPositionNum();
		model.addAttribute("posList", posNumList);
		
		return "home";
	}
	
}
