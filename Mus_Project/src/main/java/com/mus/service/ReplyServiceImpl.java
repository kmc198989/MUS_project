package com.mus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.ReplyMapper;
import com.mus.model.Criteria;
import com.mus.model.PageDTO;
import com.mus.model.ReplyDTO;
import com.mus.model.ReplyPageDTO;
import com.mus.model.UpdateReplyDTO;

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
		
		setRating(dto.getclothId());
		
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
	
	// 댓글 수정
	@Override
	public int updateReply(ReplyDTO dto) {
		
		int result = replyMapper.updateReply(dto);
		
		setRating(dto.getclothId());

		return result;
	}
	
	// 댓글 한개 정보(수정 페이지)
	@Override
	public ReplyDTO getUpdateReply(int replyId) {
		
		return replyMapper.getUpdateReply(replyId);
	}
	
	// 댓글 삭제
	@Override
	public int deleteReply(ReplyDTO dto) {
		
		int result = replyMapper.deleteReply(dto.getReplyId());
		
		setRating(dto.getclothId());

		return result;
	}
	
	public void setRating(int clothId) {
		
		Double ratingAvg = replyMapper.getRatingAverage(clothId);	
		
		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}	
		
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;
		
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setClothId(clothId);
		urd.setRatingAvg(ratingAvg);	
		
		replyMapper.updateRating(urd);		
		
	}
	
}
