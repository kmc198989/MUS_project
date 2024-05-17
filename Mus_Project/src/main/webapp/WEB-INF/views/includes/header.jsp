<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/includes/header.css">
</head>
<body>
	<div class="header_div">
		<a href="#">logo</a>
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
		<button type="button">로그인</button>
	</div>
</body>
</html>
