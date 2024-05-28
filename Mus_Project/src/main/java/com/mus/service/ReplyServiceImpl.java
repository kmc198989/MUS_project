package com.mus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.ReplyMapper;
import com.mus.model.Criteria;
import com.mus.model.PageDTO;
import com.mus.model.ReplyDTO;
import com.mus.model.ReplyPageDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replyMapper;
	
	// 댓글등록
	@Override
	public int enrollReply(ReplyDTO dto) {
		
		log.info("ReplyServiceImpl enrollReply(댓글등록).............");
		
		int result = replyMapper.enrollReply(dto);
		
		return result;
	}
	
	// 댓글 존재 체크
	@Override
	public String checkReply(ReplyDTO dto) {
		log.info("ReplyServiceImpl checkReply(댓글 존재 체크).............");
		
		Integer result = replyMapper.checkReply(dto);
		
		if(result == null) {
			return "0";
		} else {
			return "1";
		}
	}
	
	// 댓글 페이징
	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();
		
		dto.setList(replyMapper.getReplyList(cri));
		dto.setPageInfo(new PageDTO(cri, replyMapper.getReplyTotal(cri.getClothId())));
		
		return dto;
	}
	
	
	
}
