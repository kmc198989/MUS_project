package com.mus.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mus.model.CateVO;
import com.mus.service.ClothService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private ClothService clothservice;
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
			
		logger.info("메인 페이지 진입");
		
		// 1차 카테고리 조회
		List<CateVO> cate1 = clothservice.getCateCode1();
		
		// 각 1차 카테고리에 해당하는 2차 카테고리 조회 및 map에 저장
		Map<CateVO, List<CateVO>> cate = new LinkedHashMap<>();
		for (CateVO firstcate : cate1) {
			List<CateVO> cate2list = clothservice.getCateCode2(firstcate.getCateCode());
			cate.put(firstcate, cate2list);
		}
		model.addAttribute("cate", cate);

	}

}
