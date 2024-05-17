<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/member/findId.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
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
        .phone_check_button{
		    border: 1px solid black;
		    height: 39px;
		    width: 31%;
		    float: right;
		    line-height: 50px;
		    text-align: center;
		    font-size: 14px;
		    font-weight: 900;
		    background-color: #ececf7;
		    cursor: pointer;
		    
		}
		.phone_check_input_box{
			border: 1px solid black;
		    height: 41px;
		    padding: 10px 14px;
		    width: 65%;
		    float: left;
		    box-sizing: border-box;
		    border: 1px solid #cccccc;
			
		}

</style>
</head>
<body>
<!-- 파일 불러오기 -->
<%@ include file="../modal/modal.jsp" %>

<div id="wrap">
	<form id="login_form" method="post">
		<div id="login_area">
			<div id="login_header">
	          <img src="/resources/img/musinsaLogo.png" />
	        </div>
	        
	        <div id="login_box">
			    <input class="input" type="text" id="memberId" name="memberId" placeholder="아이디를 입력해 주세요" required/>
			    <br/>
			   <input class="input" type="text" id="memberPhone" name="memberPhone" placeholder="휴대폰번호를 입력해 주세요" required/>
            	<br/>
            	
            	
            	<div class="phone_check_wrap">
					<div class="phone_check_input_box">
						<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/></br>
					</div>
					
					<div class="phone_check_button">
						<span id="phoneChk">인증번호 전송</span>
					</div><br/><br/><br/><br/>
					
					<span id="phoneChk2" class="doubleChk"></span>
					<span class="point successPhoneChk"></span>
					<input type="hidden" id="phoneDoubleChk"/>
				</div>
				
	    		
	    		<span class="submit">	
    				<button type="button" id="findPw" value="비밀번호찾기" class="login_button" onclick="findId_click()">비밀번호 찾기</button>
    			</span>
    			
    			<ul id="sub_menu">
		            <li><a href="/member/join">회원 가입</a></li>
		            <li><a href="/member/login">로그인 하기</a></li>
		            <li><a href="#">메인화면으로</a></li>
		        </ul>
    		</div>
    	</div>
	</form>
</div>

<script>
/* 아이디 찾기 */ 
//아이디 & 스토어 값 저장하기 위한 변수
	// 아이디 값 받고 출력하는 ajax
	
	function findPw_click(){
		var memberId=$('#memberId').val();
		var memberPhone=$('#memberPhone').val();
		
		$.ajax({
			url:"/member/findPw",
			type:"POST",
			data:{"memberId":memberId, "memberPhone":memberPhone},
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");
					$('#memberId').val('');
					$('#memberPhone').val('');
				} else {
					$('#id_value').text(data);
					$('#memberId').val('');
					$('#memberPhone').val('');
					
				}
			 },
			 error:function(){
	                alert("에러입니다");
	         }
		});
	};
	
const modal = document.getElementById("modal");
const btnModal = document.getElementById("findPw");

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