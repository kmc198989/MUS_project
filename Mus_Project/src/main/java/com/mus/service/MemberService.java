package com.mus.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
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
	
	//마이페이지 구현
	public MemberVO memberInfo(String memberId) throws Exception;
	
	//비밀번호 변경
	public String pwCheck(String memberId) throws Exception;
	
	//비밀번호 변경(POST)
	public void pwUpdate(String memberId, String memberPw) throws Exception;
	
	//회원탈퇴
	public void delete(String memberId)throws Exception;
	
	//회원수정
	public void updateMember(String memberId, Model model) throws Exception;
	
	//회원수정(POST)
	public int modifySave(MemberVO vo) throws Exception;
	
	
	
	
}
