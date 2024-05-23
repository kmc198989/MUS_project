package com.mus.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mus.model.CateVO;
import com.mus.model.Criteria;
import com.mus.model.PageDTO;
import com.mus.service.ClothService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private ClothService clothservice;
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model, Criteria cri) {
		logger.info("main 페이지 진입");
		cri.setAmount(100);


		PageDTO pageMaker = new PageDTO(cri, clothservice.goodsGetTotal(cri));
		System.out.println("search pageMaker + " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("filter_info", clothservice.getCateInfoList(cri));
	}
	


}
