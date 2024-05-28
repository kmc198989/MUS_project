package com.mus.mapper;

import java.util.List;

import com.mus.model.Criteria;
import com.mus.model.ReplyDTO;

public interface ReplyMapper {

	// 댓글 등록
	public int enrollReply(ReplyDTO dto);
	
	// 댓글 존재 체크
	public Integer checkReply(ReplyDTO dto);
	
	// 댓글 페이징
	public List<ReplyDTO> getReplyList(Criteria cri);
	
	// 댓글 총 갯수(페이징)
	public int getReplyTotal(int clothId);

}
