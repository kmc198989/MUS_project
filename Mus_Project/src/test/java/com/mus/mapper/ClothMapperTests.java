package com.mus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ClothMapperTests {

	@Autowired
	private ClothMapper mapper;
	
	@Test
	public void getCateCode2() {
		String cateCode = "100000";
		mapper.getCateCode2(cateCode);
	}
	
	/*
	@Test
	public void getCateCode1() {
		
		mapper.getCateCode1();
	}
	*/
	
	
}
