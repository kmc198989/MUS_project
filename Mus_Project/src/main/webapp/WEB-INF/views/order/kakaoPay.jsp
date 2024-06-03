<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 테스트</title>
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 포트원 결제 -->
</head>
<body>

	<h1> kakaoPay api 이용하기 </h1>
 
		<form method="post" action="/payment/kakaoPay">
		    <button id="payment">카카오페이로 결제하기</button>
		</form>

<script>


//카카오결제
$(function(){
	$("#payment").click(function(){
		
		// 필수입력값을 확인.
		var name = $("#form-payment input[name='pay-name']").val();
		var tel = $("#form-payment input[name='pay-tel']").val();
		var email = $("#form-payment input[name='pay-email']").val();
		
		if(name == ""){
			$("#form-payment input[name='pay-name']").focus();
		}
		if(tel == ""){
			$("#form-payment input[name='pay-tel']").focus();
		}
		if(email == ""){
			$("#form-payment input[name='pay-email']").focus();
		}
		
		// 결제 정보를 form에 저장한다.
		let usePoint = $("#point-use").val();
		let useUserCouponNo = $(":radio[name='userCoupon']:checked").val();
		
		// 카카오페이 결제전송
		$.ajax({
			type:'get'
			,url:'/order/kakaoPay'
			,data:{
				,payUserName: name
				,sumPrice:totalPrice
				,memberPhone:tel
				,memberMail:email
				,Point:usePoint	
				
			},
			success:function(response){
				location.href = response.next_redirect_pc_url			
			}
		});
	});
});
</script>
</body>
</html>