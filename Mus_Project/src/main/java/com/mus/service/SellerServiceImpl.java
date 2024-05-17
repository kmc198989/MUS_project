package com.mus.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.SellerMapper;
import com.mus.model.SellerVO;
import com.mus.model.Criteria;

@Service
public class SellerServiceImpl implements SellerService {
	
	private static final Logger log = LoggerFactory.getLogger(SellerServiceImpl.class);
	
	@Autowired
	SellerMapper sellerMapper;

	// 판매자 등록
	@Override
	public void sellerEnroll(SellerVO seller) throws Exception {
		sellerMapper.sellerEnroll(seller);
	}

	// 판매자 목록
	@Override
	public List<SellerVO> sellerGetList(Criteria cri) throws Exception {
		System.out.println("sellerServiceImpl 진입");
		return sellerMapper.sellerGetList(cri);
	}

	// 판매자 총 수
	@Override
	public int sellerGetTotal(Criteria cri) throws Exception {
		log.info("(service)sellerGetTotal()......." + cri);
		return sellerMapper.sellerGetTotal(cri);
	}

	// 판매자 상세 페이지
	@Override
	public SellerVO sellerGetDetail(int sellerId) throws Exception {
		log.info("sellerGetDetail........" + sellerId);
		return sellerMapper.sellerGetDetail(sellerId);
	}
	
	// 판매자 정보 수정
	@Override
	public int sellerModify(SellerVO seller) throws Exception {
		log.info("(service) sellerModify........." + seller);
		return sellerMapper.sellerModify(seller);
	}

	// 판매자 정보 삭제
	@Override
	public int sellerDelete(int sellerId) {
		log.info("sellerDelete..........");
		return sellerMapper.sellerDelete(sellerId);
	}
}
