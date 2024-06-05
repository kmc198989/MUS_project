<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/member/delete" method="post" id="deleteForm" name="deleteForm">
         <input type="hidden" id="memberId" name="memberId" value="${member.memberId}">
<div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>회원 탈퇴</h2>
            </div>
            <div class="close-area">X</div>
            
            <div class="modal_pass">
                 <label>현재 비밀번호</label>
                 <input type="password" class="pw_input" name="memberPw" maxlength="30">
              </div>
              <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
              
              <div class="modal_checkpass">
                 <label>현재 비밀번호 확인</label>
                 <input type="password" class="pwck_input" name="memberPw2" maxlength="30">
              </div>
              <span class="final_pwck_ck">비밀번호 확인란을 입력해주세요.</span>
         <span class="pwck_input_re_1">현재 비밀번호와 일치합니다.</span>
            <span class="pwck_input_re_2">현재 비밀번호와 일치하지 않습니다.</span>
              
              <button type="button" id="deletee" name="delete" class="modal_checkButton">회원탈퇴</button>
            <button type="button" class="modal_cancleButton" onclick="location.href='/member/mypage'">취소</button>
            
        </div>
    </div>
</form>
</body>

<script>
//유효성 검사 통과유무 변수
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인

$(document).ready(function(){
   $(".modal_checkButton").click(function(){

      var pw = $('.pw_input').val();           // 비밀번호 입력
      var pwck = $('.pwck_input').val();       // 비밀번호 확인 입력란
      
      
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

           $("#deleteForm").attr("action", "/member/delete");
         $("#deleteForm").submit();
        }
      return false;
      
   });
   
});

/* 비밀번호 확인 일치 유효성 검사 */

$('.pwck_input').on("propertychange change keyup paste input", function(){
   
   var pw = $('.pw_input').val();
   var pwck = $('.pwck_input').val();
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






/*
$(document).ready(function(){
   
   $("#deletee").on("click", function(){
      
      if($("#memberPw").val()==""){
         alert("비밀번호를 입력해주세요");
         $("#memberPw").focus();
         return false
      }
      
      if($("#memberPw2").val()==""){
         alert("비밀번호 확인을 입력해주세요");
         $("#memberPw2").focus();
         return false
      }
      
      if ($("#memberPw").val() != $("#memberPw2").val()) {
         alert("비밀번호가 일치하지 않습니다.");
         $("#memberPw").focus();
          
         return false;
      }
      
      $.ajax({
         url : "/member/pwCheck",
         type : "POST",
         dataType : "json",
         data : $("#deleteForm").serializeArray(),
         success: function(data){
            
            if(data==0){
               alert("비밀번호를 확인해주세요.");
               return;
            }else{
               if(confirm("탈퇴하시겠습니까?")){
                  $("#deleteForm").submit();
               }
               
            }
         }
      })
   });
})
*/
</script>
</html>