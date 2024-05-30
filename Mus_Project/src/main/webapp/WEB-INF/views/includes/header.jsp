<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/includes/header.css">
</head>
<body>
	<div class="header_div">
			<!-- 로고 영역 -->
		<div class="logo_area">
			<a href="/main"><img src="/resources/img/MAINLOGO.png"></a>
		</div>
		<div class="search">
			<form id="searchForm" action="/search" method="get">
				<div class="search_input">
					<input class="searchbar" type="text" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}" default=""/>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum}" default="1"/>'>
					<input type="hidden" name="amount"
						value='<c:out value="${pageMaker.cri.amount}" default="100"/>'>
					<button class='btn search_btn'>검 색</button>
				</div>
			</form>
		</div>


		<div class="top_gnb_area">
			<ul class="list">
				<c:if test="${member == null}">
					<li><a href="/member/login">로그인</a></li>
				</c:if>
				<c:if test="${member != null}">
    			<c:if test="${fn:contains(member.toString(), 'adminCk')}">
						<c:if test="${member.adminCk == 1 }">
							<li><a href="/admin/main">관리자 페이지</a></li>
						</c:if>
					</c:if>
					<li><a id="gnb_logout_button" href="/main">로그아웃</a></li>
					<li><a href="/member/mypage">마이룸</a></li>
					<li><a href="/cart/${member.memberId}">장바구니</a></li>
				</c:if>
				
				<li>고객센터</li>
			</ul>
		</div>


	</div>

<script>
    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(e) {
        e.preventDefault(); // 링크 기본 동작 방지
        $.ajax({
            type : "POST",
            url : "/member/logout.do",
            success : function(data) {
                if (data === "success") {
                    window.location.href = "/main"; // 로그아웃 후 메인 페이지로 리다이렉션
                } else {
                    alert("로그아웃 실패");
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("AJAX 에러: ", textStatus, errorThrown);
                alert("로그아웃 요청에 실패했습니다.");
            }
        }); // ajax
    });
</script>
</body>
</html>
