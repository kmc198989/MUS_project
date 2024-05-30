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
           	
           	<div class="modal_checkpass">
           		<label>현재 비밀번호 확인</label>
           		<input type="password" class="pwck_input" name="memberPw2" maxlength="30">
           	</div>
           	
           	<button type="button" id="deletee" name="delete" class="modal_checkButton">회원탈퇴</button>
            <button type="button" class="modal_cancleButton" onclick="location.href='/member/mypage'">취소</button>
            
        </div>
    </div>
</form>
</body>

<script>
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
</script>
</html>