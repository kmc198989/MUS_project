package com.mus.mapper;

import org.apache.ibatis.annotations.Param;

import com.mus.model.MemberVO;

public interface MemberMapper {
	
	//회원 가입
	public void memberJoin(MemberVO member) throws Exception;
		
	//아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
		
	//로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	//카카오로그인
	public String getAccessToken(String authorize_code) throws Exception;
	
	//아이디 찾기
	public String findId(@Param("memberName")String memberName, @Param("memberMail")String memberMail);
}
