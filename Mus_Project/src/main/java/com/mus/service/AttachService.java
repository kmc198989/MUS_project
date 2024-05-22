package com.mus.service;

import java.util.List;

import com.mus.model.AttachImageVO;

public interface AttachService {
	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int clothId);
}
