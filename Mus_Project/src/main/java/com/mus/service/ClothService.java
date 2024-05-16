package com.mus.service;

import java.util.List;

import com.mus.model.CateVO;
import com.mus.model.ClothVO;
import com.mus.model.Criteria;

public interface ClothService {
	
	// 상품 전체 리스트
	public List<ClothVO> clothAll(); 	
	
	// 1차 카테고리 조회
	public List<CateVO> getCateCode1();
	
	// 2차 카테고리 조회
	public List<CateVO> getCateCode2(String cateCode);
	
	// 상품 검색
	public List<ClothVO> getGoodsList(Criteria cri);
	
	// 상품 총 갯수
	public int goodsGetTotal(Criteria cri);
}
