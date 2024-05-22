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
			<a href="/main"><img src="resources/img/MAINLOGO.png"></a>
		</div>
		<div class="search">
			<form id="searchForm" action="/search" method="get">
				<div class="search_input">
					<input class="searchbar" type="text" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}" default=""/>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum}" default="1"/>'>
					<input type="hidden" name="amount"
						value='<c:out value="${pageMaker.cri.amount}" default="10"/>'>
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
					<li>마이룸</li>
					<li>장바구니</li>
				</c:if>
				<li>고객센터</li>
			</ul>
		</div>


	</div>

	<script>
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					document.location.reload();
				}
			}); // ajax
		});
	</script>
</body>
</html>
