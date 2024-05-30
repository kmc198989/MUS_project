package com.mus.mapper;

import java.util.List;

import com.mus.model.Criteria;
import com.mus.model.ReplyDTO;
import com.mus.model.UpdateReplyDTO;

public interface ReplyMapper {

	// 댓글 등록
	public int enrollReply(ReplyDTO dto);
	
	// 댓글 존재 체크
	public Integer checkReply(ReplyDTO dto);
	
	// 댓글 페이징
	public List<ReplyDTO> getReplyList(Criteria cri);
	
	// 댓글 총 갯수(페이징)
	public int getReplyTotal(int clothId);
	
	// 댓글 수정
	public int updateReply(ReplyDTO dto);
	
	// 댓글 한개 정보(수정 페이지)
	public ReplyDTO getUpdateReply(int replyId);
	
	// 댓글 삭제
	public int deleteReply(int replyId);

	// 평균 평점 구하기
	public Double getRatingAverage(int clothId);
	
	// 평균 평점 반영하기
	public int updateRating(UpdateReplyDTO dto);
}
