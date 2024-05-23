package com.mus.mapper;

import java.util.List;
import java.util.Map;

import com.mus.model.CateFilterDTO;
import com.mus.model.CateVO;
import com.mus.model.ClothVO;
import com.mus.model.Criteria;


public interface ClothMapper {

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
	
	// 검색 대상 카테고리 리스트
	public String[] getCateList(Criteria cri);
	
	// 카테고리 정보(+검색대상 갯수)
	public CateFilterDTO getCateInfo(Criteria cri);
	
	// 상품 정보
	public ClothVO getGoodsInfo(int clothId);
}
