package com.mus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mus.model.Criteria;
import com.mus.model.ReplyDTO;
import com.mus.model.ReplyPageDTO;
import com.mus.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private ReplyService replyService;
	
	// 댓글 등록 
	@PostMapping("/enroll")
	public void enrollReplyPOST(ReplyDTO dto) {
		
		logger.info("ReplyController /reply/enroll 댓글 등록...........");
		replyService.enrollReply(dto);
	}
	
	// 댓글 체크
	// memeberId, clothId 파라미터
	// 존재 : 1 / 존재x : 0
	@PostMapping("/check")
	public String replyCheckPOST(ReplyDTO dto) {
		return replyService.checkReply(dto);
	}
	
	// 댓글 페이징
	@GetMapping(value="/list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ReplyPageDTO replyListPOST(Criteria cri) {
		return replyService.replyList(cri);
	}
	
}
