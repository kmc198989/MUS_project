package com.mus.service;

import java.util.List;

import com.mus.model.AttachImageVO;
import com.mus.model.ClothVO;
import com.mus.model.CateVO;
import com.mus.model.Criteria;
import com.mus.model.MemberVO;

public interface AdminService {
	// 상품 등록
	public void clothEnroll(ClothVO cloth);
	
	// 카테고리 리스트
	public List<CateVO> cateList();
	
	// 상품 리스트
	public List<ClothVO> goodsGetList(Criteria cri);
	
	// 상품 총 개수
	public int goodsGetTotal(Criteria cri);
	
	// 상품 조회 페이지
	public ClothVO goodsGetDetail(int clothId);
	
	// 상품 수정
	public int goodsModify(ClothVO vo);
	
	// 상품 정보 삭제
	public int goodsDelete(int clothId);

	// 지정 상품 이미지 정보 얻기
	public List<AttachImageVO> getAttachInfo(int clothId);
	
	// 회원 리스트
	public List<MemberVO> membersGetList(Criteria cri);
	
	// 회원 총 개수
	public int membersGetTotal(Criteria cri);
	
}
