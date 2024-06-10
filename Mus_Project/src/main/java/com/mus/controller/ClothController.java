package com.mus.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mus.mapper.ClothMapper;
import com.mus.model.AttachImageVO;
import com.mus.model.CateVO;
import com.mus.model.ClothVO;
import com.mus.model.Criteria;
import com.mus.model.PageDTO;
import com.mus.model.ReplyDTO;
import com.mus.service.AttachService;
import com.mus.service.ClothService;
import com.mus.service.ReplyService;

@Controller
public class ClothController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClothController.class);

	@Autowired
	private ClothService clothservice;	
	
	@Autowired
	private ClothMapper clothmapper;
	
	@Autowired
	private AttachService attachservice;
	
	@Autowired
	private ReplyService replyService;
	
	// 상품 검색	
	@GetMapping("/search")
	public void searchGoodsGET(Criteria cri, Model model) {
		logger.info("search 페이지 진입");
	}
	
	
	@GetMapping("/searchtool")
	public String searchtoolGET(Criteria cri, Model model) {
		System.out.println("searchtool 동작");
		cri.setAmount(100);
		System.out.println("searchtool + " + cri.getCateCode());
		
		// 검색 기능
		logger.info("before cri : " + cri);
		
		List<ClothVO> list = clothservice.getGoodsList(cri);
		logger.info("after cri : " + cri);
		logger.info("pre list : " + list);
		
		PageDTO pageMaker = new PageDTO(cri, clothservice.goodsGetTotal(cri));
		System.out.println("search pageMaker + " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("filter_info", clothservice.getCateInfoList(cri));

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);			
		} else {
			model.addAttribute("listcheck", "empty");
			return "includes/searchtool";
		}
		
		return "includes/searchtool";
	}
	
	@GetMapping("/nav")
	public String navCateGET(Criteria cri, Model model) {
		System.out.println("clothcontroller 내 nav 동작");
		
		// 각 1차 카테고리에 해당하는 2차 카테고리 조회 및 map에 저장
		Map<CateVO, List<CateVO>> cate = clothservice.getCateCount();

		System.out.println("navtool cate + " + cate);
		model.addAttribute("cate", cate);
		return "includes/nav";
	}
	
	
	/* 상품 상세 */
	@GetMapping("/goodsDetail/{clothId}")
	public String goodsDetailGET(@PathVariable("clothId")int clothId, Model model) {
		logger.info("goodsDetailGET()..........");
		
		model.addAttribute("goodsInfo", clothservice.getGoodsInfo(clothId));
		
		return "/goodsDetail";
	}
	
	// 이미지 표시
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		
		// logger.info("getImage().........." + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 이미지 정보 반환
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int clothId) {		
		
		return new ResponseEntity<List<AttachImageVO>>(attachservice.getAttachList(clothId), HttpStatus.OK);		
	}
	
	//
	@GetMapping("/replyEnroll/{memberId}")
	public String replyEnrollWindowGET(@PathVariable("memberId")String memberId, int clothId, Model model) {
		ClothVO cloth = clothservice.getClothIdName(clothId);
		model.addAttribute("clothInfo", cloth);
		model.addAttribute("memberId", memberId);
		
		return "/replyEnroll";
	}
	
	// 리뷰 수정 팝업창
	@GetMapping("/replyUpdate")
	public String replyUpdateWindowGET(ReplyDTO dto, Model model) {
		ClothVO cloth = clothservice.getClothIdName(dto.getclothId());
		model.addAttribute("clothInfo", cloth);
		model.addAttribute("replyInfo", replyService.getUpdateReply(dto.getReplyId()));
		model.addAttribute("memberId", dto.getMemberId());
		
		return "/replyUpdate";
	}
	
	// 좋아요 조회
	@GetMapping("/likes/{clothId}")
    @ResponseBody
	public int likesTOTAL(@PathVariable("clothId")int clothId) {
		int likes = clothmapper.getLikeTotal(clothId);
		return likes;
	}
	
	// 좋아요 업데이트
	@PostMapping("/likes/update")
    @ResponseBody
	public void likesUPDATE(int clothId) {
		logger.info("likes update 동작");
		int likes = clothmapper.getLikeTotal(clothId);
		logger.info("likes = " + String.valueOf(likes));

		clothmapper.updateLike(likes, clothId);
	}
	
	// 좋아요 추가
	@PostMapping("/likes/add")
    @ResponseBody
	public void likesADD(int clothId, String memberId) {
		logger.info("likes add 동작");
		clothmapper.addLike(clothId, memberId);
		int likes = clothmapper.getLikeTotal(clothId);
		clothmapper.updateLike(likes, clothId);
	}
	
	// 좋아요 중복 체크
	@PostMapping("/likes/check")
    @ResponseBody
	public int likesCHECK(@RequestParam("clothId") int clothId, @RequestParam("memberId") String memberId) {
		logger.info("likes check 동작");
		int result = clothmapper.checkLike(clothId, memberId);
		logger.info(String.valueOf(result));
		return result;
	}
	
	// 좋아요 제거
	@PostMapping("likes/delete")
    @ResponseBody
	public void likesDELETE(int clothId, String memberId) {
		logger.info("likes delete 동작");
		clothmapper.deleteLike(clothId, memberId);
		int likes = clothmapper.getLikeTotal(clothId);
		logger.info("likes = " + String.valueOf(likes));
		clothmapper.updateLike(likes, clothId);
	}
}
