package com.mus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mus.model.ClothVO;
import com.mus.model.Criteria;
import com.mus.service.ClothService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ClothMapperTests {

	@Autowired
	private ClothMapper mapper;
	
	@Autowired
	private ClothService service;
	
	/*상품 상세 정보*/
	@Test
	public void getGoodsInfoTest() {
		
		int clothId = 315;
		
		ClothVO goodsInfo = service.getGoodsInfo(clothId);
		
		System.out.println("==결과==");
		System.out.println("전체 : " + goodsInfo);
		System.out.println("clothId : " + goodsInfo.getClothId() );
		System.out.println("이미지 정보 : " + goodsInfo.getImageList().isEmpty());
	}
	/*
	@Test
	public void getGoodsInfo() {
		int clothId = 315;
		ClothVO goodsInfo = mapper.getGoodsInfo(clothId);
		System.out.println("===================");
		System.out.println(goodsInfo);
		System.out.println("===================");
	}
	*/
	/*
	@Test
	public void getGoodsList() {
		Criteria cri = new Criteria();
		cri.setKeyword("200110");
		mapper.getGoodsList(cri);
	}
	*/
	
	/*
	@Test
	public void getCateCode2() {
		String cateCode = "100000";
		mapper.getCateCode2(cateCode);
	}
	*/
	/*
	@Test
	public void getCateCode1() {
		
		mapper.getCateCode1();
	}
	*/	
}
