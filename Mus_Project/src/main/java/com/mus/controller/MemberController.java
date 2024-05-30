package com.mus.controller;


import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mus.model.MemberVO;
import com.mus.service.MemberService;
import com.mus.util.MailUtil;


@Controller
@RequestMapping(value = "/member")
@SessionAttributes({"member"})
public class MemberController {	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	
	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGET() {
				
		logger.info("회원가입 페이지 진입");
				
	}
	
	/* 회원가입 */
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
				
		String rawPw = "";            //인코딩 전 비밀번호
		String encodePw = "";         //인코딩 후 비밀번호
			
		rawPw = member.getMemberPw();
		encodePw = pwEncoder.encode(rawPw);
		member.setMemberPw(encodePw);
				
		// 회원가입 서비스 실행
		memberservice.memberJoin(member);
				
		return "redirect:/main";
				
	}
	
	/* 로그인 페이지 이동 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void joinGET() {
				
		logger.info("로그인 페이지 진입");
				
	}
	
	
	/* 아이디 중복 검사 */
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		
		//logger.info("memberIdChk() 진입");
		int result = memberservice.idCheck(memberId);
		
		//logger.info("결과값= " + result);
		if(result !=0) {
			return "fail"; //중복 아이디 O
		}else {
			return "success"; //중복 아이디 X
		}
	}
	
	/* 이메일 인증 */
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheckGET(String email) throws Exception {
    	/* 뷰(View)로부너 넘어온 데이터 확인 */
	    logger.info("이메일 데이터 전송 확인");
	    logger.info("인증번호 : " + email);
	      
	    /* 인증번호(난수) 생성*/
	    Random random = new Random();
	    int checkNum = random.nextInt(888888) + 111111;
	    logger.info("인증번호 " + checkNum);
	      
	    /* 이메일 보내기 */
	    String setFrom = "kmcsandaetg@gmail.com";
	    String toMail = email;
	    String title = "회원가입 인증 이메일입니다.";
	    String content = 
	          "홈페이지를 방문해 주셔서 감사합니다." +
	          "<br><br>" +
	          "인증 번호는" + checkNum + "입니다." +
	          "<br>" + 
	          "해당 인증 번호를 인증번호 확인란에 기입하여 주세요.";

	      String num = Integer.toString(checkNum);
	      return num;
    }
    /* 휴대폰 인증 */
    @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
    @ResponseBody
    public String sendSMS(@RequestParam("phone") String memberPhone) {
    	logger.info("문자전송테스트");
    	//휴대폰 문자 보내기
    	int randomNumber = (int)((Math.random()* (9999-1000+1)) + 1000);
    	memberservice.certifiedPhoneNumber(memberPhone, randomNumber);
    	
    	return Integer.toString(randomNumber);
    }
    
    /* 로그인 */
    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, MemberVO member, Model model) throws Exception{
    	
    	HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO lvo = memberservice.memberLogin(member);
		
		if(lvo !=null) {
			
			rawPw = member.getMemberPw();
			encodePw = lvo.getMemberPw();
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				lvo.setMemberPw("");
				model.addAttribute("member", lvo);
				System.out.println(lvo);
				return "redirect:/main";
			}else {
				model.addAttribute("result", 0);
				return "redirect:/member/login";
			}
			
		}else {
			model.addAttribute("result", 0);
			return "redirect:/member/login";
		}
    }
    /* 아이디 찾기 */
    @PostMapping("/findId")
    @ResponseBody
	public String findId(HttpServletRequest request,
			@RequestParam("memberName") String memberName, 
			@RequestParam("memberMail") String memberMail) {
    	
    	logger.info("아이디찾기(POST)");
    	
    	String result = memberservice.findId(memberName, memberMail);
		
    	return result;
	}
    //아이디 찾기 페이지 이동
  	@GetMapping("findId")
  	public void findIdPageGET() {
  		logger.info("아이디찾기 진입(GET)");
  	}
  	
  	//비밀번호 찾기 페이지 이동
  	@GetMapping("findPw")
  	public void findPwPageGET() {
  		logger.info("비밀번호찾기 진입(GET)");
  	}
	
  	/* 비밀번호 찾기 */
	@PostMapping(value = "findPw", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String findPwPOST(MemberVO vo) throws Exception{
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;
	
		
		//회원정보 불러오기
		MemberVO vo1 = memberservice.searchPwd(vo);
		System.out.println(vo1);
		
		//가입된 이메일이 존재한다면 이메일 전송
		if(vo1!=null) {
			//임시 비밀번호 생성(UUID이용)
			String tempPw = UUID.randomUUID().toString().replace("-", ""); //-를 제거
			tempPw = tempPw.substring(0,10);  //tempPw를 앞에서부터 10자리 제거
			
			vo1.setMemberPw(tempPw); //임시 비밀번호 담기
			MailUtil mail = new MailUtil(); //메일전송
			mail.sendEmail(vo1);
			
			String securePw = encoder.encode(vo1.getMemberPw()); //비밀번호 암호화후 vo객체에 담기
			vo1.setMemberPw(securePw);
			
			memberservice.updatePwd(vo1);
			
			
			result = "true";
		}else{
			result="false";
		}
		return result;
	}
    
    
    /* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request, SessionStatus sessionStatus) throws Exception{
		

		
        sessionStatus.setComplete(); // 세션 무효화
		
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 자체를 무효화
        }
		return "redirect:/main";
	}
	
	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	@ResponseBody
	public String logoutPOST(HttpServletRequest request, SessionStatus sessionStatus) throws Exception {
	    logger.info("비동기 로그아웃 메서드 진입");
	    
        sessionStatus.setComplete(); // 세션 무효화

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 자체를 무효화
        }
	    return "success"; // 성공 메시지 반환
	}
	
	
	/* 카카오 로그인 기능 */
	@RequestMapping(value = "/login/getKakaoAuthUrl")
	@ResponseBody
	public String getKakaoAuthUrl(HttpServletRequest request) throws Exception{
		logger.info("카카오페이지 진입");
		
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=9ae60badd8feddaff2167169e12ee080&redirect_uri=http://localhost:8081/member/login/auth_kakao";
		
		return reqUrl;
	}
	
	/* 카카오 로그인 기능uri */
	@RequestMapping(value = "/login/auth_kakao")
	public String oauthKaKao(
			@RequestParam(value = "code", required = false) String code
			, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		logger.info("#######" + code);
		String access_Token = memberservice.getAccessToken(code);
		String view = memberservice.getuserinfo(access_Token, session, rttr);
		
		return view;
	}
	
	/* 회원 마이페이지(GET) */
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String myInfo(HttpSession session, Model model) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String memberId = vo.getMemberId();
		
		//System.out.println(memberId);
		vo = memberservice.memberInfo(memberId);
		model.addAttribute("member", vo);
		//System.out.println(vo);
		
		return "/member/mypage";
		
	}
	
	/* 회원 수정페이지(GET) */
	@GetMapping("/modifypage")
	public String modifypageGET(HttpSession session, Model model) throws Exception {
		logger.info("회원수정페이지 진입");
		
		model.addAttribute("member", memberservice.memberInfo((String)session.getAttribute("memberId")));
		return "/member/modifypage";
	}
	
	/* 회원 수정페이지(POST) */
	@PostMapping("/modifypage")
	public String modify(MemberVO vo, RedirectAttributes rttr) throws Exception {
		String modifyPwd = pwEncoder.encode(vo.getMemberPw());
		vo.setMemberPw(modifyPwd);
		int result = 0;
		
		try {
			result = memberservice.modifySave(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result==1) {
			rttr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해 주세요.");
			return "redirect:/main";
		}
		return "redirect:/member/modifypage";
	}
	
	/* 비밀번호 확인(POST) */
	@RequestMapping(value = "/pwCheck", method =RequestMethod.POST)
	@ResponseBody
	public int pwCheck(MemberVO vo) throws Exception{
		String memberPw = memberservice.pwCheck(vo.getMemberId());
		if(vo == null || !pwEncoder.matches(vo.getMemberPw(), memberPw)) {
			return 0;
		}
		return 1;
	}
	/* 비밀번호 변경(GET) */
	@RequestMapping(value = "/modifyPw", method = RequestMethod.GET)
	public String pwUpdateView() throws Exception{
		return "/member/modifyPw";
	}
	
	/* 비밀번호 변경(POST) */
	@RequestMapping(value = "/pwUpdate", method = RequestMethod.POST)
	public String pwUpdate(String memberId, String memberPw1, RedirectAttributes rttr, HttpSession session) throws Exception{
		memberPw1 = pwEncoder.encode(memberPw1);
		//System.out.println("ControllerMember: " + memberPw1);
		memberservice.pwUpdate(memberId, memberPw1);
		session.invalidate();
		rttr.addFlashAttribute("msg", "비밀번호수정이 완료되었습니다.");
		
		return "redirect:/member/login";
	}
	
	/* 회원탈퇴(GET) */
	@RequestMapping(value = "/modalDelete", method = RequestMethod.GET)
	public String deleteView() throws Exception{
		return "/member/modalDelete";
		
	}
	
	/* 회원탈퇴(POST) */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(String memberId, RedirectAttributes rttr, HttpSession session) throws Exception{
		memberservice.delete(memberId);
		session.invalidate();
		rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
		
		return "redirect:/member/login";
		
	}
	
	
	
}
