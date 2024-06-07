<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>main</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="../resources/css/includes/nav.css">
<link rel="stylesheet" href="../resources/css/includes/swiper.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


</head>
<body>
	<%@include file="includes/header.jsp"%>

	<div class="wrapper">
		<section class="main">
			<c:import url="/nav" />			
			<div id="main_div" class="main_div">
			
				<!-- swiper -->
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="/resources/img/swiper/swiper10.png" alt="Image 1">
						</div>
						<div class="swiper-slide">
							<img src="/resources/img/swiper/swiper10.png" alt="Image 2">
						</div>
						<div class="swiper-slide">
							<img src="/resources/img/swiper/swiper10.png" alt="Image 3">
						</div>
						<div class="swiper-slide">
							<img src="/resources/img/swiper/swiper10.png" alt="Image 4">
						</div>
						
						<!-- 필요한 만큼 추가 -->
					</div>					
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
					<!-- Add Navigation -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>




				<div class="main_op">
					<c:import url="/searchtool" />
				</div>
				<%@include file="includes/footer.jsp"%>
			</div>
		</section>
	</div>
	<!-- Footer 영역 -->




</body>
<script>
  var swiper = new Swiper('.swiper-container', {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
          delay: 2500,
          disableOnInteraction: false,
      },
      pagination: {
          el: '.swiper-pagination',
          clickable: true,
      },
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
      },
  });
</script>
</html>