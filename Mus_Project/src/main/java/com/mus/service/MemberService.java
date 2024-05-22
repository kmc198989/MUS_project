package com.mus.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mus.model.MemberVO;

public interface MemberService {
	
	//회원 가입
	public void memberJoin(MemberVO member) throws Exception;
	
	//아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	//로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;

	//아이디 찾기
	public String findId(String memberName, String memberMail);
	
	//휴대폰번호 인증
	public void certifiedPhoneNumber(String memberPhone, int randomNumber);
	
	//비밀번호 찾기
	public MemberVO searchPwd(MemberVO vo) throws Exception;
		
	public void updatePwd(MemberVO vo) throws Exception;
	
	//카카오 로그인
	public String getAccessToken(String authorize_code);
	
	public String getuserinfo(String access_Token, HttpSession session, RedirectAttributes rttr);
	
	
	
}
