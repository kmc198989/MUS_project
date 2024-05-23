package com.mus.service;

import java.util.List;
import java.util.Map;

import com.mus.model.CateFilterDTO;
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
	
	// 2차 카테고리 상품 수 조회
	public List<CateVO> getCateCount2(String cateCode);
	
	// 1,2차 카테고리 상품 수 조회(nav용)
	public Map<CateVO, List<CateVO>> getCateCount();	
	
	// 상품 검색
	public List<ClothVO> getGoodsList(Criteria cri);
	
	// 상품 총 갯수
	public int goodsGetTotal(Criteria cri);
	
	// 검색결과 카테고리 필터 정보
	public List<CateFilterDTO> getCateInfoList(Criteria cri);
	
	// 상품 정보
	public ClothVO getGoodsInfo(int clothId);
}
