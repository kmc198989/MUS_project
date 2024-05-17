package com.mus.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mus.mapper.MemberMapper;
import com.mus.model.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
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
	
	/* 아이디 찾기 */
	@Override
	public String findId(String memberName, String memberMail) {
		
		String result = "";
		
		try {
			result = mapper.findId(memberName, memberMail);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 휴대폰 인증 */
	@Override
	public void certifiedPhoneNumber(String memberPhone, int randomNumber) {
		System.out.println("휴대폰인증 TEST");
		
		String api_key = "NCSUSYJWWOARCOID";
		String api_secret = "MGNSZPJZ0M8GPTKFE2KRYWUBXDBHUZPK";
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", memberPhone); //수신전화번호
		params.put("from", "010-2433-9413"); //발신전화번호
		//테스트시 발신,수신 둘다 본인 번호로
		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는 : " + randomNumber + "입니다.");
		params.put("app_version", "test app 1.2");
		
		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			
		}catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
