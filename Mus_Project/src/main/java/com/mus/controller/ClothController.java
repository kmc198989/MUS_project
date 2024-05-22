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
import org.springframework.web.bind.annotation.PathVariable;

import com.mus.model.CateVO;
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
	public void searchGoodsGET(Criteria cri, Model model) {
		logger.info("search 페이지 진입");
		cri.setAmount(100);

		// 1차 카테고리 조회
		List<CateVO> cate1 = clothservice.getCateCode1();
		
		// 각 1차 카테고리에 해당하는 2차 카테고리 조회 및 map에 저장
		Map<CateVO, List<CateVO>> cate = new LinkedHashMap<>();
		for (CateVO firstcate : cate1) {
			List<CateVO> cate2list = clothservice.getCateCode2(firstcate.getCateCode());
			cate.put(firstcate, cate2list);
		}
		model.addAttribute("cate", cate);
		PageDTO pageMaker = new PageDTO(cri, clothservice.goodsGetTotal(cri));
		System.out.println("search pageMaker + " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("filter_info", clothservice.getCateInfoList(cri));
	}
	
	
	@GetMapping("/searchtool")
	public String searchtoolGET(Criteria cri, Model model) {
		System.out.println("searchtool 동작");
		cri.setAmount(100);
		System.out.println("searchtool + " + cri.getCateCode());
		// 검색 기능
		logger.info("cri : " + cri);
		
		List<ClothVO> list = clothservice.getGoodsList(cri);
		logger.info("pre list : " + list);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);			
		} else {
			model.addAttribute("listcheck", "empty");
			return "searchtool";
		}
		
		return "includes/searchtool";
	}
	
	/* 상품 상세 */
	@GetMapping("/goodsDetail/{clothId}")
	public String goodsDetailGET(@PathVariable("clothId")int clothId, Model model) {
		logger.info("goodsDetailGET()..........");
		model.addAttribute("goodsInfo", clothservice.getGoodsInfo(clothId));
		
		return "/goodsDetail";
	}
}
