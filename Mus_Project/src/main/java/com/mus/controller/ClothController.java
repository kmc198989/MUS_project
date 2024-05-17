package com.mus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.mus.model.ClothVO;
import com.mus.model.Criteria;
import com.mus.model.PageDTO;
import com.mus.service.ClothService;

@Controller
public class ClothController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClothController.class);

	@Autowired
	private ClothService clothservice;
	
	// 상품 검색	
	@GetMapping("/search")
	public String searchGoodsGET(Criteria cri, Model model) {
		
		logger.info("cri : " + cri);
		
		List<ClothVO> list = clothservice.getGoodsList(cri);
		logger.info("pre list : " + list);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);			
		} else {
			model.addAttribute("listcheck", "empty");
			return "search";
		}
		model.addAttribute("pageMaker", new PageDTO(cri, clothservice.goodsGetTotal(cri)));
		

		model.addAttribute("filter_info", clothservice.getCateInfoList(cri));
		
		return "search";
	}
	
	/* 상품 상세 */
	@GetMapping("/goodsDetail/{clothId}")
	public String goodsDetailGET(@PathVariable("clothId")int clothId, Model model) {
		logger.info("goodsDetailGET()..........");
		model.addAttribute("goodsInfo", clothservice.getGoodsInfo(clothId));
		
		return "/goodsDetail";
	}
}
