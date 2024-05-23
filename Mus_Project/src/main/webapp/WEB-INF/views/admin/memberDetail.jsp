<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
<link rel="stylesheet" href="/resources/css/admin/memberDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"></script>
</head>
<body>

    <div class="wrapper">
        <form id="join_form" method="post">
            <div class="wrap">
                <div class="subject">
                    <span>회원 상세</span>
                </div>

                <div class="id_wrap">
                    <div class="id_name">아이디</div>
                    <div class="id_input_box">
                        <input class="id_input" name="memberId" value="<c:out value="${memberInfo.memberId }"/>" disabled>
                    </div>
                </div>

                <div class="pw_wrap">
                    <div class="pw_name">비밀번호</div>
                    <div class="pw_input_box">
                        <input class="pw_input" name="memberPw" value="<c:out value="${memberInfo.memberPw }"/>" disabled>
                    </div>
                </div>

                <div class="user_wrap">
                    <div class="user_name">이름</div>
                    <div class="user_input_box">
                        <input class="user_input" name="memberName" value="<c:out value="${memberInfo.memberName }"/>" disabled>
                    </div>
                </div>

                <div class="phone_wrap">
                    <div class="phone_name">전화번호</div>
                    <div class="phone_input_box">
                        <input class="phone_input" name="memberPhone" value="<c:out value="${memberInfo.memberPhone }"/>" disabled>
                    </div>
                </div>

                <div class="mail_wrap">
                    <div class="mail_name">이메일</div>
                    <div class="mail_input_box">
                        <input class="mail_input" name="memberMail" value="<c:out value="${memberInfo.memberMail }"/>" disabled>
                    </div>
                </div>

                <div class="address_wrap">
                    <div class="address_name">주소</div>
                    <div class="address_input_1_wrap">
                        <div class="address_input_1_box">
                            <input class="address_input_1" name="memberAddr1" value="<c:out value="${memberInfo.memberAddr1 }"/>" disabled readonly="readonly">
                        </div>
                    </div>

                    <div class="address_input_2_wrap">
                        <div class="address_input_2_box">
                            <input class="address_input_2" name="memberAddr2" value="<c:out value="${memberInfo.memberAddr2 }"/>" disabled readonly="readonly">
                        </div>
                    </div>

                    <div class="address_input_3_wrap">
                        <div class="address_input_3_box">
                            <input class="address_input_3" name="memberAddr3" value="<c:out value="${memberInfo.memberAddr3 }"/>" disabled readonly="readonly">
                        </div>
                    </div>
                </div>

                <div class="btn_section">
                    <button id="cancelBtn" class="btn">회원 목록</button>
                    <button id="modifyBtn" class="btn enroll_btn">수정</button>
                </div>
            </div>
        </form>

        <form id="moveForm" action="/admin/memberManage" method="get">
            <input type="hidden" name="pageNum" value="${cri.pageNum}"> 
            <input type="hidden" name="amount" value="${cri.amount}"> 
            <input type="hidden" name="keyword" value="${cri.keyword}">
        </form>
    </div>
    
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	</script>
	
	<script>
	/* 목록 이동 버튼 */
    $("#cancelBtn").on("click", function(e){
       e.preventDefault();
       $("#moveForm").submit();   
    });   
    
    /* 수정 페이지 이동 */
    $("#modifyBtn").on("click", function(e){
       e.preventDefault();
       let addInput = '<input type="hidden" name="memberId" value="${memberInfo.memberId}">';
       $("#moveForm").append(addInput);
       $("#moveForm").attr("action", "/admin/memberModify");
       $("#moveForm").submit();
    }); 
	</script>

</body>
</html>