package com.mus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mus.mapper.AdminMapper;
import com.mus.mapper.MemberMapper;
import com.mus.model.AttachImageVO;
import com.mus.model.CateVO;
import com.mus.model.ClothVO;
import com.mus.model.Criteria;
import com.mus.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;

	// 상품 등록
	@Transactional
	@Override
	public void clothEnroll(ClothVO cloth) {
		log.info("(srevice)clothEnroll........");
		adminMapper.clothEnroll(cloth);
		
		if(cloth.getImageList() == null || cloth.getImageList().size() <= 0) {
			return;
		}
		
		cloth.getImageList().forEach(attach -> {
			attach.setClothId(cloth.getClothId());
			adminMapper.imageEnroll(attach);
		});
	}

	// 카테고리 리스트
	@Override
	public List<CateVO> cateList() {
		log.info("(service)cateList........");
		return adminMapper.cateList();
	}

	// 상품 리스트
	@Override
	public List<ClothVO> goodsGetList(Criteria cri) {
		log.info("goodsGetTotalList()..........");
		return adminMapper.goodsGetList(cri);
	}

	// 상품 총 갯수
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(cri);
	}

	// 상품 조회 페이지
	@Override
	public ClothVO goodsGetDetail(int clothId) {
		log.info("(service)clothGetDetail......." + clothId);
		return adminMapper.goodsGetDetail(clothId);
	}

	// 상품 정보 수정
	@Transactional
	@Override
	public int goodsModify(ClothVO vo) {
		int result = adminMapper.goodsModify(vo);
		log.info("goodsModify........");
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			adminMapper.deleteImageAll(vo.getClothId());
			vo.getImageList().forEach(attach -> {
				attach.setClothId(vo.getClothId());
				adminMapper.imageEnroll(attach);
			});
		}
		return result;
	}

	// 상품 정보 삭제
	@Override
	@Transactional
	public int goodsDelete(int clothId) {
		log.info("goodsDelete..........");
		adminMapper.deleteImageAll(clothId);
		return adminMapper.goodsDelete(clothId);
	}

	// 지정 상품 이미지 정보 얻기
	@Override
	public List<AttachImageVO> getAttachInfo(int clothId) {
		log.info("getAttachInfo........");
		return adminMapper.getAttachInfo(clothId);
	}

	// 회원 리스트
	@Override
	public List<MemberVO> membersGetList(Criteria cri) {
		log.info("membersGetList........");
		return adminMapper.membersGetList(cri);
	}

	// 회원 총 수
	@Override
	public int membersGetTotal(Criteria cri) {
		log.info("membersGetTotal........");
		return adminMapper.membersGetTotal(cri);
	}

	// 이미지 등록
	@Override
	public void imageEnroll(AttachImageVO vo) {
		// TODO Auto-generated method stub
		
	}

	// 회원 수정
	@Override
	public int memberModify(MemberVO vo) {
		log.info("goodsModify........");
		return adminMapper.memberModify(vo);
	}

	// 회원 정보 삭제
	@Override
	public int memberDelete(String memberId) {
		log.info("memberDelete..........");
		return adminMapper.memberDelete(memberId);
	}

	// 회원 조회 페이지
	@Override
	public MemberVO memberGetDetail(String memberId) {
		log.info("(service)memberGetDetail......." + memberId);
		return adminMapper.memberGetDetail(memberId);
	}
	
}
