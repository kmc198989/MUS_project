<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUSINSA LOGIN</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>
<div id="wrap">
	<form id="login_form" method="post">
      <div id="login_area">
        <div id="login_header">
          <img src="/resources/img/musinsaLogo.png" />
        </div>
        
        <div id="login_box">
          
            <input class="input" type="text" name="memberId" placeholder="아이디를 입력해 주세요"/>
            <br/>
            <input class="input" type="password" name="memberPw" placeholder="비밀번호를 입력해 주세요"/>
            <br/>
            
            <span class="submit">
            	<input type="submit" class="login_button" value="로그인" />
            </span>
            
            <label class="checkbox">
            	<input type="checkbox" name="autologin" id="autologin" onclick="funcAuto();"/> 
            </label>
     
          
          <ul id="sub_menu">
            <li><a href="/member/join">회원 가입</a></li>
            <li><a href="/member/findId">아이디 찾기</a></li>
            <li><a href="/member/findPw">비밀번호 찾기</a></li>
          </ul>
        </div>
        
        <div id="social" class="kakao-btn" onclick="kakaoLogin()">
          <a id="kakao">
            <span>카카오 간편로그인</span>
          </a>
          
           <a id="apple" href="#">
            <span>Apple 간편로그인</span>
          </a>
        </div>
        
       </div>
       </form>
     </div>
     
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>

	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){
		
		/* 로그인 메서드 서버 요청 */
		$("#login_form").attr("action", "/member/login.do");
		$("#login_form").submit();
	});
</script>
	

<script th:inline="javascript">
	function kakaoLogin() {
		$.ajax({
			 url:'/member/login/getKakaoAuthUrl',
			 type:'post',
			 async: false,
			 dataType: 'text',
			 success: function (res) {
			 location.href = res;
			 
			 }
		});
	}
	
</script>
</body>
</html>