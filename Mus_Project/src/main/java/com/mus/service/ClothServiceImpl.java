package com.mus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.ClothMapper;
import com.mus.model.CateVO;
import com.mus.model.ClothVO;
import com.mus.model.Criteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ClothServiceImpl implements ClothService {

	@Autowired
	private ClothMapper clothmapper;

	// 전체 상품 조회
	@Override
	public List<ClothVO> clothAll() {

		log.info("clothAll()..................");

		List<ClothVO> list = clothmapper.clothAll();

		return list;
	}

	// 1차 카테고리 조회
	@Override
	public List<CateVO> getCateCode1() {
		log.info("getCateCode1().............");
		List<CateVO> cate1 = clothmapper.getCateCode1();
		return cate1;
	}

	// 2차 카테고리 조회
	@Override
	public List<CateVO> getCateCode2(String cateCode) {
		log.info("getCateCode2().............");
		List<CateVO> cate2 = clothmapper.getCateCode2(cateCode);
		return cate2;
	}

	// 상품 검색
	@Override
	public List<ClothVO> getGoodsList(Criteria cri) {
		log.info("getGoodsList()............");
		List<ClothVO> list = clothmapper.getGoodsList(cri);
		return list;
	}
	
	// 상품 총 갯수
	@Override
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal()...........");
		return clothmapper.goodsGetTotal(cri);
	}
	
}
