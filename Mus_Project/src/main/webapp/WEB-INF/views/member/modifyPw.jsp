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
                <div class="form-group2">
                	<label>* 새 비밀번호</label>
                    <input type="password" class="pass_update2" name="memberPw1"/>
                </div>
                <div class="form-group3">
                	<label>* 새 비밀번호 확인</label>
                    <input type="password" class="pass_update3" name="memberPw2"/>
                </div>
                
                <input type="submit" id="pwUpdate" name="pwUpdate" class="pwUpdate_button" value="변경하기">
                <button type="button" class="cancle_button" onclick="location.href='/member/modifypage'">취소하기</button>
		</div>
	</div>
</form>

<script>
$(document).ready(function(){
	
	$("pwUpdate").on("click", function(){
		if($("#memberPw").val==""){
			alert("현재 비밀번호를 입력해주세요");
			$("#memberPw").focus();
			return false;
		}
		
		if($("#memberPw1").val==""){
			alert("변경비밀번호를 입력해주세요");
			$("#memberPw1").focus();
			return false;
		}
		
		if($("#memberPw2").val==""){
			alert("변경비밀번호를 입력해주세요");
			$("#memberPw2").focus();
			return false;
		}
		
		if ($("#memberPw").val() != $("#memberPw2").val()) {
			alert("변경비밀번호가 일치하지 않습니다.");
			$("#memberPw2").focus();
		}
		
		
		$.ajax({
			url : "/member/pwCheck",
			type : "POST",
			dataType : "json",
			data : $("#pwUpdateForm").serializeArray(),
			success: function(data){
				
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
				}else{
					if(confirm("변경하시겠습니까?")){
						$("#pwUpdateForm").submit();
					}
					
				}
			}
		});
		
	}); //ajax 종료
	
		
});
</script>
</body>
</html>