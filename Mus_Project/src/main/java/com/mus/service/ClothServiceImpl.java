package com.mus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.ClothMapper;
import com.mus.model.ClothVO;

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
	
}
