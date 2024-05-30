<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
 #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            z-index: 10;
        }
        #modal .modal-window {
            background: rgba( 0, 0, 0, 0.70 ); // 69, 139, 197
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 300px;
            position: relative;
            top: -100px;
            padding: 10px;
            z-index: 20;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
            text-align: center;
    		margin-left: 132px;
   			line-height: 5;
    		font-style: inherit;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        #modal .modal_pass > label{
        	margin-left: 19px;
		    font-size: 16px;
		    color: white;
		    line-height: 2;
        }
        #modal .modal_pass > input{
        	margin-left: 35px;
		    height: 21px;
		    margin-bottom: 15px;
		    width: 177px;
		        
        }
        #modal .modal_pass > label{
        	margin-left: 27px;
		    font-size: 16px;
		    color: white;
		    line-height: 2;
        }
        
       	#modal .modal_pass > input{
       		margin-left: 43px;
		    height: 21px;
		    margin-bottom: 15px;
		    width: 177px;
       	}
       	#modal .modal_checkpass > label{
       		margin-left: 9px;
		    font-size: 16px;
		    color: white;
		    line-height: 2;
       	}
       	#modal .modal_checkpass > input{
       		margin-left: 23px;
		    height: 21px;
		    margin-bottom: 15px;
		    width: 177px;
       	}
       	#modal .modal_checkButton{
       		margin-left: 198px;
		    margin-top: 15px;
		    width: 66px;
		    height: 26px;
		    font-size: 14px;
		    font-style: italic;
       	}
       	#modal .modal_cancleButton{
       		margin-left: 15px;
		    width: 50px;
		    height: 26px;
		    font-size: 14px;
		    font-style: italic;
       	}
</style>
	
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<%@include file="../modal/modalDelete.jsp" %>

	<div class="wrapper">
	<div class="wrap">
			<div class="subjecet">
				<h2>MUSINSA 회원정보</h2>
			</div>
			
			
				<div class="id_name">*아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId" value="${member.memberId}" readonly="readonly"><br>
				</div>
			
						
				<div class="pw_name">*비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" type="password" name="memberPw" value="${member.memberPw}" readonly="readonly"><br>
				</div>
			
			
			
				<div class="user_name">*이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName" value="${member.memberName}" readonly="readonly"><br>
				</div>
			
			
			
				<div class="mail_name">*이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail" value="${member.memberMail}" readonly="readonly">
				</div>
			
				
					
					
				<div class="clearfix"></div>
				<span id="mail_check_input_box_warn"></span>
				
			
			
			
				<div class="phone_name">*휴대폰번호</div>
					<div class="phone_input_box">
						<input class="phone_input" id="phone" type="text" name="memberPhone"value="${member.memberPhone}" readonly="readonly" required/>
					</div>
									
					
					<span id="phoneChk2"></span>
					
					<input type="hidden" id="phoneDoubleChk"/>
					
			
			
			
				<div class="address_name">*주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1" value="${member.memberAddr2}" readonly="readonly">

					</div>
					
					
					
					<div class="clearfix"></div>
				</div>

				<input type="submit" class="modify_button" value="수정페이지" onclick="location.href='/member/modifypage'">
				<button type="button" class="home_button" onclick="location.href='/main'">메인으로</button>
				<button type="button" id="modalDelete" class="secession_button" onclick="">탈퇴하기</button>
		</div>
</div>
<script>
const modal = document.getElementById("modal");
const btnModal = document.getElementById("modalDelete");

btnModal.addEventListener("click", e => {
    modal.style.display = "flex";
});

    
const closeBtn = modal.querySelector(".close-area");
closeBtn.addEventListener("click", e => {
    modal.style.display = "none";
});

modal.addEventListener("click", e => {
    const evTarget = e.target;
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none";
    }
});
</script>


</body>
</html>