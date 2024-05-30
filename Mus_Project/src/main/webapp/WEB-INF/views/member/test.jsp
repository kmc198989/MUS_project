<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
//유효성 검사 통과유무 변수

var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인


$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
		/* 입력값 변수 */
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

       	$("#join_form").attr("action", "/member/join");
		$("#join_form").submit();
			//alert("최종 유효성");
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
</script>
</body>
</html>