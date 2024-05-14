package com.mus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.MemberMapper;
import com.mus.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	/* 회원가입 */
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		mapper.memberJoin(member);
	}
	
	/* 아이디 중복 체크 */
	@Override
	public int idCheck(String memberId) throws Exception {
		return mapper.idCheck(memberId);
	}
	
	/* 로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return mapper.memberLogin(member);
	}
}
