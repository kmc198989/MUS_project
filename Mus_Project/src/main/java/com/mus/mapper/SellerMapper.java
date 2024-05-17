package com.mus.mapper;

import java.util.List;

import com.mus.model.SellerVO;
import com.mus.model.Criteria;

public interface SellerMapper {
	// 판매자 등록
	public void sellerEnroll(SellerVO seller);
	
	// 판매자 등록
	public List<SellerVO> sellerGetList(Criteria cri);
	
	// 판매자 총 수
	public int sellerGetTotal(Criteria cri);
	
	// 판매자 상세
	public SellerVO sellerGetDetail(int sellerId);
	
	// 판매자 정보 수정
	public int sellerModify(SellerVO seller);
	
	// 판매자 정보 삭제
	public int sellerDelete(int sellerId);
}
