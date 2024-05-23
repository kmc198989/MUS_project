<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
</head>
<body>
	<%@include file="includes/header.jsp"%>

	<div class="wrapper">
		<div class="wrap">
			<div class="content_area">
				<section class="main">
					<div id="nav_section">
						<c:import url="/nav" />
					</div>
					<div id="main_div">
						<c:import url="/searchtool" />
					</div>		
				</section>				
			</div>
			<!-- Footer 영역 -->
			<section id="footer_section">
				<%@include file="includes/footer.jsp"%>
			</section>

		</div>
	</div>


</body>
</html>