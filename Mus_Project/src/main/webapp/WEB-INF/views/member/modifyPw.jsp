<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/member/modifyPw.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
   <%@include file="../includes/header.jsp"%>

<form action="/member/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
            <input type="hidden" id="memberId" name="memberId" value="${member.memberId}">
            
   <div class="wrapper">
      <div class="wrap">
            <div class="title">
               <h2>비밀번호 변경</h2>
            </div>
            <div class="form-group1">
                    <label>* 현재 비밀번호</label>
                    <input type="password" class="pass_update1" name="memberPw" id="memberPw"/>
                </div>
                <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                
                <div class="form-group2">
                   <label>* 새 비밀번호</label>
                    <input type="password" class="pass_update2" name="memberPw1"/>
                </div>
                <span class="final_pwck_ck">비밀번호 확인란을 입력해주세요.</span>
            <span class="pwck_input_re_1">새 비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">새 비밀번호가 일치하지 않습니다.</span>
                
                <div class="form-group3">
                   <label>* 새 비밀번호 확인</label>
                    <input type="password" class="pass_update3" name="memberPw2"/>
                </div>
                
                <input type="button" id="pwUpdate" name="pwUpdate" class="pwUpdate_button" value="변경하기">
                <button type="button" class="cancle_button" onclick="location.href='/member/modifypage'">취소하기</button>
      </div>
   </div>
</form>

<script>
//유효성 검사 통과유무 변수
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인

$(document).ready(function(){
   $(".pwUpdate_button").click(function(){

      var pw = $('.pass_update2').val();           // 비밀번호 입력
      var pwck = $('.pass_update3').val();       // 비밀번호 확인 입력란
      
      
      /* 비밀번호 유효성검사 */
      if(pw == ""){
         $('.final_pw_ck').css('display','block');
         pwCheck = false;
      }else{
         $('.final_pw_ck').css('display','none');
         pwCheck = true;
      }
      
      /* 비밀번호 확인 유효성검사 */
      if(pwck == ""){
         $('.final_pwck_ck').css('display','block');
         pwckCheck = false;
      }else{
         $('.final_pwck_ck').css('display','none');
         pwckCheck = true;
      }
      
      /* 최종 유효성 검사 */
        if(pwCheck&&pwckCheck&&pwckcorCheck){

           $("#pwUpdateForm").attr("action", "/member/pwUpdate");
         $("#pwUpdateForm").submit();
        }
      return false;
      
   });
   
});

/* 비밀번호 확인 일치 유효성 검사 */

$('.pass_update3').on("propertychange change keyup paste input", function(){
   
   var pw = $('.pass_update2').val();
   var pwck = $('.pass_update3').val();
   $('.final_pwck_ck').css('display', 'none');
   
   if(pw == pwck){
      $('.pwck_input_re_1').css("display","block");
      $('.pwck_input_re_2').css("display","none");
      pwckcorCheck = true;
   }else{
      $('.pwck_input_re_1').css("display","none");
      $('.pwck_input_re_2').css("display","block");
      pwckcorCheck = false;
   }
   
});
</script>
</body>
</html>