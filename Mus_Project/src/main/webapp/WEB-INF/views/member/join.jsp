<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script
     src="https://code.jquery.com/jquery-3.4.1.js"
     integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
     crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
   <form id="join_form" method="post">
   <div class="wrap">
         <div class="subjecet">
            <h2>MUSINSA 회원가입</h2>
         </div>
         
         
            <div class="id_name">*아이디</div>
            <div class="id_input_box">
               <input class="id_input" name="memberId"><br>
            </div>
            <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
            <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
            <span class="final_id_ck">아이디를 입력해주세요.</span>
            <span></span>
         
         
         
            <div class="pw_name">*비밀번호</div>
            <div class="pw_input_box">
               <input class="pw_input" name="memberPw"><br>
            </div>
            <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
         
         
         
            <div class="pwck_name">*비밀번호 확인</div>
            <div class="pwck_input_box">
               <input class="pwck_input"><br>
            </div>
            <span class="final_pwck_ck">비밀번호 확인란을 입력해주세요.</span>
            <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
         
         
         
            <div class="user_name">*이름</div>
            <div class="user_input_box">
               <input class="user_input" name="memberName"><br>
            </div>
            <span class="final_name_ck">이름을 입력해주세요.</span>
         
         
         
            <div class="mail_name">*이메일</div> 
            <div class="mail_input_box">
               <input class="mail_input" name="memberMail">
               <div class="mail_check_button">
                  <span>인증번호 전송</span>
               </div><br>
            </div>
            <span class="final_mail_ck">이메일을 입력해주세요.</span>
            <span class="mail_input_box_warn"></span>
            
            
               <div class="mail_check_input_box" id="mail_check_input_box_false">
                  <input class="mail_check_input" disabled="disabled">
                  
               </div>
            
               
               
               <div class="clearfix"></div>
               <span id="mail_check_input_box_warn"></span>
            
         
         
         
            <div class="phone_name">*휴대폰번호</div>
               <div class="phone_input_box">
                  <input class="phone_input" id="phone" type="text" name="memberPhone" title="전화번호 입력" required/>
                  <div class="phone_check_button">
                  <span id="phoneChk">인증번호 전송</span><br>
               </div>
               </div>
               
               <span class="final_phone_ck">휴대폰번호를 입력해주세요.</span>
               <span class="phone_input_box_warn"></span>
               
            
               
               
               
            
               <div class="phone_check_input_box">
                  <input id="phone2" class="phone_check_input" type="text" name="phone2" title="인증번호 입력" disabled required/></br>
               </div>
               
               <span id="phoneChk2"></span>
                  
               <span class="successPhoneChk"></span>
               <input type="hidden" id="phoneDoubleChk"/>
               
         
         
         
            <div class="address_name">*주소</div>
            <div class="address_input_1_wrap">
               <div class="address_input_1_box">
                  <input class="address_input_1" name="memberAddr1" readonly="readonly">
                  <div class="address_button" onclick="execution_daum_address()">
                  <span>주소 찾기</span>
               </div><br>
               </div>
               
               
               
               <div class="clearfix"></div>
            </div>
            
            <div class ="address_input_2_wrap">
               <div class="address_input_2_box">
                  <input class="address_input_2" name="memberAddr2" readonly="readonly"><br>
               </div>
            </div>
            
            <div class ="address_input_3_wrap">
               <div class="address_input_3_box">
                  <input class="address_input_3" name="memberAddr3" readonly="readonly"><br><br>
               </div>
            </div>
            <span class="final_addr_ck">주소를 입력해주세요.</span>
         
      
            <input type="button" class="join_button" value="가입하기">
         
         
      </div>
   </form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var code = ""; //이메일전송 인증번호를 저장하기위한 코드
   
   //유효성 검사 통과유무 변수
    var idCheck = false;            // 아이디
    var idckCheck = false;            // 아이디 중복 검사
    var pwCheck = false;            // 비번
    var pwckCheck = false;            // 비번 확인
    var pwckcorCheck = false;        // 비번 확인 일치 확인
    var nameCheck = false;            // 이름
    var mailCheck = false;            // 이메일
    var mailnumCheck = false;        // 이메일 인증번호 확인
    var phoneCheck = false;          //핸드폰번호
    var successPhoneChk = false;       //핸드폰번호 성공 체크
    var addressCheck = false         // 주소

   $(document).ready(function(){
      //회원가입 버튼(회원가입 기능 작동)
      $(".join_button").click(function(){
         
         /* 입력값 변수 */
         var id = $('.id_input').val();           // ID입력
         var pw = $('.pw_input').val();           // 비밀번호 입력
         var pwck = $('.pwck_input').val();       // 비밀번호 확인 입력란
         var name = $('.user_input').val();       // 이름 입력락
         var mail = $('.mail_input').val();       // 이메일 입력란
         var phone = $('.phone_input').val();     // 핸드폰번호 입력란
         var addr = $('.address_input_3').val();  // 주소 입력란
         
         /* 아이디 유효성검사 */
         if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
         }else{
            $('.final_id_ck').css('display','none');
            idCheck = true;
            //alert("ID유효성");
         }
         
         /* 비밀번호 유효성검사 */
         if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
         }else{
            $('.final_pw_ck').css('display','none');
            pwCheck = true;
            //alert("PW유효성");
         }
         
         /* 비밀번호 확인 유효성검사 */
         if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
         }else{
            $('.final_pwck_ck').css('display','none');
            pwckCheck = true;
            //alert("PWCK유효성");
         }
         
         /* 이름 유효성검사 */
         if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
         }else{
            $('.final_name_ck').css('display','none');
            nameCheck = true;
            //alert("NAME유효성");
         }
         
         /* 이메일 유효성검사 */
         if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
         }else{
            $('.final_mail_ck').css('display','none');
            mailCheck = true;
            //alert("MAIL유효성");
         }
         
         /* 핸드폰번호 유효성검사 */
         if(phone == ""){
            $('.final_phone_ck').css('display','block');
            phoneCheck = false;
         }else{
            $('.final_phone_ck').css('display','none');
            phoneCheck = true;
         }
         
         /* 주소 유효성검사 */
         if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
         }else{
            $('.final_addr_ck').css('display','none');
            addressCheck = true;
         }
         
         /* 최종 유효성 검사 */
           if(idCheck&&idckCheck
                 &&pwCheck&&pwckCheck
                 &&pwckcorCheck&&nameCheck
                 &&mailCheck&&mailnumCheck
                 &&addressCheck ){
    
              $("#join_form").attr("action", "/member/join");
            $("#join_form").submit();
            //alert("최종 유효성");
           }
         return false;
         
      });
      
   });
   
   //아이디 중복검사
   $('.id_input').on("propertychange change keyup paste input", function(){
      
      /*console.log("keyup 테스트");*/
      var memberId = $('.id_input').val();     // .id_input에 입력되는 값
      var data = {memberId : memberId}        // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
      
      $.ajax({
         type : "post",
         url : "/member/memberIdChk",
         data : data,
         success : function(result){
            //console.log("성공 여부" + result);
            if(result != 'fail'){
               $('.id_input_re_1').css("display","inline-block");
               $('.id_input_re_2').css("display","none");
               idckCheck = true;
            }else{
               $('.id_input_re_2').css("display","inline-block");
               $('.id_input_re_1').css("display","none");
               idckCheck = false;
            }
         } //success 종료
         
      }); //ajax 종료
      
   });
   
   /* 인증번호 이메일 전송 */
   $(".mail_check_button").click(function(){
       
      var email = $(".mail_input").val(); //입력한 이메일
      var cehckBox = $(".mail_check_input"); //인증번호 입력란
      var boxWrap = $(".mail_check_input_box"); //인증번호 입력란 박스
      var warnMsg = $(".mail_input_box_warn"); //이메일 입력 경고글
      
      /* 이메일 형식 유효성 검사 */
       if(mailFormCheck(email)){
           warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
           warnMsg.css("display", "inline-block");
       } else {
           warnMsg.html("올바르지 못한 이메일 형식입니다.");
           warnMsg.css("display", "inline-block");
           return false;
       }    
      
      $.ajax({
           
           type:"GET",
           url:"mailCheck?email=" + email,
           success:function(data){
               
               //console.log("data : " + data);
              cehckBox.attr("disabled", false);
              boxWrap.attr("id", "mail_check_input_box_true");
              code = data;
           }
                   
       });
   });
   
   /* 이메일 인증번호 비교 */
   $(".mail_check_input").blur(function(){
       
      var inputCode = $(".mail_check_input").val(); //입력코드
      var checkResult = $("#mail_check_input_box_warn"); //비교결과
      
      if(inputCode == code){
         checkResult.html("인증번호가 일치합니다.");
         checkResult.attr("class", "correct");
         mailnumCheck = true;
      }else{
         checkResult.html("인증번호를 다시 확인해주세요.");
         checkResult.attr("class", "incorrect");
         mailnumCheck = false;
      }
       
   });
   
   //휴대폰 번호 인증
   var code2 = "";
   $("#phoneChk").click(function(){
      alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
      var phone = $("#phone").val();
      $.ajax({
           type:"GET",
           url:"phoneCheck?phone=" + phone,
           cache : false,
           success:function(data){
              if(data == "error"){
                 alert("휴대폰 번호가 올바르지 않습니다.")
               $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
               $(".successPhoneChk").css("color","red");
               $("#phone").attr("autofocus",true);
               
              }else{                 
                 $("#phone2").attr("disabled",false);
                 $("#phoneChk2").css("display","inline-block");
                 $(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
                 $(".successPhoneChk").css("color","green");
                 $("#phone").attr("readonly",true);
                 code2 = data;
              }
           }
       });
   });
   
   //휴대폰 인증번호 대조
   $("#phoneChk2").click(function(){
      if($("#phone2").val() == code2){
         $(".successPhoneChk").text("인증번호가 일치합니다.");
         $(".successPhoneChk").css("color","green");
         $("#phoneDoubleChk").val("true");
         $("#phone2").attr("disabled",true);
      }else{
         $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
         $(".successPhoneChk").css("color","red");
         $("#phoneDoubleChk").val("false");
         $(this).attr("autofocus",true);
      }
   });
   
   
   
   
   //다음 주소 연동
   function execution_daum_address(){
      
      new daum.Postcode({
           oncomplete: function(data) {
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                
                } else {
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               $(".address_input_1").val(data.zonecode);
               //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
               $(".address_input_2").val(addr);
               //$("[name=memberAddr2]").val(addr);            // 대체가능
                  // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
                  $(".address_input_3").attr("readonly", false);
               $(".address_input_3").focus();
                 
               
    
           }
       }).open();
    
   }
   
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
   
   /* 입력 이메일 형식 유효성 검사 */
   function mailFormCheck(email){
      var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
      return form.test(email);
   }
</script>

</body>
</html>