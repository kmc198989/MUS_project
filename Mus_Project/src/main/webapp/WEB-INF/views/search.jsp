<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="../resources/css/includes/nav.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
</head>
<body>
	<%@include file="includes/header.jsp"%>

	<div class="wrapper">
				<section class="main">
						<c:import url="/nav" />
						<div id="main_div" class="main_div">
							<div class="main_op">
								<c:import url="/searchtool" />
							</div>
							<%@include file="includes/footer.jsp"%>
						</div>
				</section>
	</div>
	<!-- Footer 영역 -->
			
	


</body>
</html>