package com.mus.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.AdminMapper;
import com.mus.mapper.AttachMapper;
import com.mus.mapper.ClothMapper;
import com.mus.model.CateFilterDTO;
import com.mus.model.CateVO;
import com.mus.model.ClothVO;
import com.mus.model.Criteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ClothServiceImpl implements ClothService {

	@Autowired
	private ClothMapper clothmapper;
	
	@Autowired
	private AttachMapper attachmapper;
	
	@Autowired
	AdminMapper adminmapper;

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
	
	// 1,2차 카테고리 조회(nav용)
	@Override
	public Map<CateVO, List<CateVO>> getCateCount() {
		
		List<CateVO> cate1 = clothmapper.getCateCode1();

		// 각 1차 카테고리에 해당하는 2차 카테고리 조회 및 map에 저장
		Map<CateVO, List<CateVO>> cate = new LinkedHashMap<>();
		for (CateVO firstcate : cate1) {
			int count1 = 0;
			List<CateVO> cate2list = clothmapper.getCateCount2(firstcate.getCateCode());
			for (CateVO c : cate2list) {
				count1 += c.getCount();
			}
			firstcate.setCount(count1);
			cate.put(firstcate, cate2list);
		}	

		return cate;
	}

	// 2차 카테고리 상품 수 조회
	@Override
	public List<CateVO> getCateCount2(String catecode) {
		List<CateVO> cate2count = clothmapper.getCateCount2(catecode);
		return cate2count;
	}
	
	// 상품 검색
	@Override
	public List<ClothVO> getGoodsList(Criteria cri) {
		log.info("getGoodsList()............");
		if (!cri.getCateCode().isEmpty()) {
			int catenum = Integer.parseInt(cri.getCateCode());			
			if (catenum % 1000 == 0) {
				cri.setType("1");
			} else {
				cri.setType("2");
			}
		}
		List<ClothVO> list = clothmapper.getGoodsList(cri);
		return list;
	}
	
	// 상품 총 갯수
	@Override
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal()...........");
		return clothmapper.goodsGetTotal(cri);
	}
	
	// 검색결과 카테고리 필터 정보
	@Override
	public List<CateFilterDTO> getCateInfoList(Criteria cri) {
		List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();
		
		
		String[] cateList = clothmapper.getCateList(cri);
		String tempCateCode = cri.getCateCode();
		
		for(String cateCode : cateList) {
			cri.setCateCode(cateCode);
			CateFilterDTO filterInfo = clothmapper.getCateInfo(cri);
			filterInfoList.add(filterInfo);
		}
		cri.setCateCode(tempCateCode);
		
		return filterInfoList;
	}

	/* 상품 정보 */
	@Override
	public ClothVO getGoodsInfo(int clothId) {
		ClothVO goodsInfo = clothmapper.getGoodsInfo(clothId);
		goodsInfo.setImageList(adminmapper.getAttachInfo(clothId));
		
		return goodsInfo;
	}
	
}
