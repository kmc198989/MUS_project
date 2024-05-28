<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="includes/header.jsp"%>

	<div class="wrapper">
		<div class="wrap">
			<div id="nav_section">
				<c:import url="/nav" />
			</div>
			<div class="content_area">
				<section class="main">
					<!-- 제품 상세 -->
					<div id="main_div">
						<div class="content_top">
							<div class="ct_left_area">
								<div class="image_wrap"
									data-clothid="${goodsInfo.imageList[0].clothId}"
									data-path="${goodsInfo.imageList[0].uploadPath}"
									data-uuid="${goodsInfo.imageList[0].uuid}"
									data-filename="${goodsInfo.imageList[0].fileName}">
									<img>
								</div>
							</div>
							<div class="ct_right_area">
								<div class="title">
									<h1>${goodsInfo.clothName}</h1>
								</div>
								<div class="brand">
									<span> ${goodsInfo.brandName} </span>
								</div>
								<div class="price">
									<div class="sale_price">
										정가 :
										<fmt:formatNumber value="${goodsInfo.clothPrice}"
											pattern="#,### 원" />
									</div>
									<div class="discount_price">
										판매가 : <span class="discount_price_number"><fmt:formatNumber
												value="${goodsInfo.clothPrice - (goodsInfo.clothPrice*goodsInfo.clothDiscount)}"
												pattern="#,### 원" /></span> [
										<fmt:formatNumber value="${goodsInfo.clothDiscount*100}"
											pattern="###" />
										%
										<fmt:formatNumber
											value="${goodsInfo.clothPrice*goodsInfo.clothDiscount}"
											pattern="#,### 원" />
										할인]
									</div>
								</div>
								<div class="button">
									<div class="button_quantity">
										주문수량 <input type="text" value="1"> <span>
											<button>+</button>
											<button>-</button>
										</span>
									</div>
									<div class="button_set">
										<a class="btn_cart">장바구니 담기</a> <a class="btn_buy">바로구매</a>
									</div>
								</div>
							</div>
						</div>
						<div class="content_middle">
							<div class="cloth_intro">
								<h1>goodsInfo.clothIntro 내용</h1>
								${goodsInfo.clothIntro}
							</div>
							<div class="cloth_content">
								<h1>goodsInfo.clothContents 내용</h1>
								${goodsInfo.clothContents }
							</div>
						</div>
						<div class="content_bottom">리뷰</div>
					</div>
				</section>
			</div>
		</div>
		<!-- Footer 영역 -->
		<section id="footer_section">
			<%@include file="includes/footer.jsp"%>
		</section>
	</div>
</body>
<script>
	/* 이미지 삽입 */
	const bobj = $(".image_wrap");

	if (bobj.data("clothid")) {
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");

		const fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_"
				+ fileName);

		bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
	} else {
		bobj.find("img").attr('src', '/resources/img/goodsNoImage.png');
	}
</script>
</html>
