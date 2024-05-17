package com.mus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mus.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ClothMapperTests {

	@Autowired
	private ClothMapper mapper;
	
	@Test
	public void getGoodsList() {
		Criteria cri = new Criteria();
		cri.setKeyword("200110");
		mapper.getGoodsList(cri);
	}
	
	
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
