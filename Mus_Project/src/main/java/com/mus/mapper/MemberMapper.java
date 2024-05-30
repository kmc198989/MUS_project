package com.mus.mapper;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mus.model.MemberKakaoVO;
import com.mus.model.MemberVO;

public interface MemberMapper {
	
	//회원 가입
	public void memberJoin(MemberVO member) throws Exception;
		
	//아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
		
	//로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	//카카오로그인(1)
	public MemberKakaoVO findkakao(HashMap<String, Object> userInfo);
	
	//카카오 로그인 회원정보 저장(2)
	public void kakaoinsert(HashMap<String, Object> userInfo);
	
	//데이터 조회(3)
	public MemberKakaoVO selectKMember(String memberKId);
	
	//아이디 찾기
	public String findId(@Param("memberName")String memberName, @Param("memberMail")String memberMail);
	
	//비밀번호 찾기
	public MemberVO searchPwd(MemberVO vo) throws Exception;
	
	public void updatePwd(MemberVO vo) throws Exception;
	
	//마이페이지 구현
	public MemberVO memberInfo(String memberId) throws Exception;
	
	//비밀번호 변경
	public String pwCheck(String memberId) throws Exception;
	
	//비밀번호 변경(POST)
	public void pwUpdate(@Param("memberId") String memberId, @Param("memberPw") String memberPw);
	
	//회원탈퇴
	public void delete(String memberId)throws Exception;
	
	//회원정보 수정
	public int modifySave(MemberVO vo) throws Exception;
	
	
	
}
