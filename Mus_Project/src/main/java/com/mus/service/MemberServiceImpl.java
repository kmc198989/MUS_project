package com.mus.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mus.mapper.MemberMapper;
import com.mus.model.MemberKakaoVO;
import com.mus.model.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberMapper mapper;
	
	private BCryptPasswordEncoder pwEncoder;
	
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
		
		String api_key = "";
		String api_secret = "";
		
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
	
	/* 비밀번호 찾기 */
	@Override
	public MemberVO searchPwd(MemberVO vo) throws Exception {
		logger.info("searchPwd");
		return mapper.searchPwd(vo);
	}
	
	@Override
	public void updatePwd(MemberVO vo) throws Exception {
		logger.info("updatePwd");
		mapper.updatePwd(vo);
		
	}
	
	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=1c708f7af76b7f87a9198d58ea20109c");  //발급받은 key
	        sb.append("&redirect_uri=http://localhost:8080/member/login/auth_kakao");     // 본인이 설정해 놓은 redirect_uri 주소
	        sb.append("&code=" + authorize_code);
	        bw.write(sb.toString());
	        bw.flush();
	        
//	      결과 코드가 200이라면 성공
	      // 여기서 안되는경우가 많이 있어서 필수 확인 !! **
	      int responseCode = conn.getResponseCode();
	      System.out.println("responseCode : " + responseCode + "확인");
	      
	      //요청을 통해 얻은 JSON타입의 response 메세지 읽어오기
	      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));			
	      String line = "";
	      String result = "";
	      
	      while((line = br.readLine()) !=null) {
	    	  result += line;
	      }
	      System.out.println("responbody : " + result + "결과");
	      
	      //GSON 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	      JsonParser parser = new JsonParser();
	      JsonElement element = parser.parse(result);
	      
	      access_Token = element.getAsJsonObject().get("access_token").getAsString();
	      refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	      
	      System.out.println("access_token : " + access_Token);
	      System.out.println("refresh_token : " + refresh_Token);
	      
	      br.close();
	      bw.close();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	@Override
	public String getuserinfo(String access_Token, HttpSession session, RedirectAttributes rttr) {
		
		HashMap<String, Object> userInfo = new HashMap<>();
		logger.info("getuserinfo()");
		
		String requestURL = "https://kapi.kakao.com/v2/user/me";
		String view = null;
		String msg = null;
		
		try {
			URL url = new URL(requestURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode + "there");
			BufferedReader buffer = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			while((line = buffer.readLine()) !=null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	       
	        System.out.println("properties : " + properties );
	        System.out.println("kakao_account : " + kakao_account);
	        String memberNickName = properties.getAsJsonObject().get("nickname").getAsString();
	        String memberKMail = kakao_account.getAsJsonObject().get("email").getAsString();
	        //Long memberKId = element.getAsJsonObject().get("id").getAsLong();
	        
	        //System.out.println("memberKId : " + memberKMail);
	        System.out.println("NickName : " + memberNickName);
	        System.out.println("Kmail : " + memberKMail);
	        
	        
	        userInfo.put("memberId", memberKMail);
	        userInfo.put("memberNickName", memberNickName);
	        userInfo.put("memberMail", memberKMail);
	        
	        logger.info(String.valueOf(userInfo));
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		MemberKakaoVO member = mapper.findkakao(userInfo);
		//저장되어있는지 체크
		logger.info("S : " + member);
		
		if(member == null) {
			mapper.kakaoinsert(userInfo);
			member = mapper.selectKMember((String)userInfo.get("memberNickName"));
			session.setAttribute("member", member);
			
			//로그인 처리후 메인 페이지로 이동
			view = "redirect:/";
			msg = "로그인 성공";
		}else {
			session.setAttribute("member", member);
			view = "redirect:/";
			msg = "로그인 성공";
		}
		rttr.addFlashAttribute("msg", msg);
		return view;
		
	}
	
	/* 마이페이지 구현 */
	@Override
	public MemberVO memberInfo(String memberId) throws Exception {
		MemberVO vo = new MemberVO();
		
		vo = mapper.memberInfo(memberId);
		return vo;
	}
	
	/* 마이페이지 구현(카카오)*/
	@Override
	public MemberKakaoVO memberKInfo(String memberId) throws Exception {
		MemberKakaoVO vo = new MemberKakaoVO();
		
		vo = mapper.memberKInfo(memberId);
		
		return vo;
	}
	
	/* 비밀번호 변경 */
	@Override
	public String pwCheck(String memberId) throws Exception {
		return mapper.pwCheck(memberId);
	}
	
	/* 비밀번호 변경(POST) */
	@Override
	public void pwUpdate(String memberId, String memberPw) throws Exception {
		mapper.pwUpdate(memberId, memberPw);
	}
	
	/* 마이페이지 회원탈퇴 */
	@Override
	public void delete(String memberId) throws Exception {
		mapper.delete(memberId);
		
	}
	
	/* 회원정보 수정 */
	@Override
	public void updateMember(String memberId, Model model) throws Exception {
		model.addAttribute("member", mapper.memberInfo(memberId));
	}
	
	/* 회원정보 수정(POST) */
	@Override
	public int modifySave(MemberVO vo) throws Exception {
		return mapper.modifySave(vo);
	}
	
	/* 주문자 정보 */
	@Override
	public MemberVO getMemberInfo(String memberId) {
		
		return mapper.getMemberInfo(memberId);
		
	}
	
	
}
