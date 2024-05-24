<%@page import="com.mus.model.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/css/search.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

<div>
	<ul class="main_div">
		<c:if test="${listcheck != 'empty'}">

			<c:forEach items="${list}" var="list">
				<li class="li_box" data-no="${list.clothId}">
					<!-- 상단 좌측 라벨 -->
					<div class="icon_new">
						<fmt:formatNumber value="${list.clothDiscount}" type="number"
							maxFractionDigits="0" />
						%
					</div> <!-- 상단 우측 라벨 -->
					<div class="box-icon-right">
						<span class="icon-reverse icon-box-limited">한정 판매</span>
					</div>
					<div class="icon_group">
						<ul>
							<li class="icon_man sight_out" title="남성">남성</li>
							<li class="icon_woman sight_out" title="여성">여성</li>
						</ul>
					</div>
					<div class="li_inner">
						<div class="list_img" id="product_image_${list.clothId}">
							<div id="uploadResult_${list.clothId}"></div>							
						</div>
						</div>
						<div class="article_info">
							<p class="item_title">
								<a href="#">${list.brandName}</a>
							</p>
							<p class="list_info">
								<a name="goods_link" href="//www.musinsa.com/app/goods/2289283"
									title="${list.clothName}"> <strong class="txt_reserve">6/7
										배송</strong> ${list.clothName}
								</a>
							</p>
							<p class="price">
								<del>${list.clothPrice}원</del>
								${list.finalPrice}원
							</p>

							<p class="mu-icon mu-icon-coupon">
								<span class="txt_discount_price">-${list.discountedPrice}원</span>
							</p>
							<p class="membership"
								onclick="viewMemberPrice('sPrice_2289283', '2289283', '0');">
								MEMBERSHIP PRICE<span class="fr">▼</span>
							</p>
							<div class="member_price" style="display: none; z-index: 9999;"
								id="sPrice_2289283">
								<p>
									무신사 회원가<span class="fr"><a href="#"
										onclick="viewMemberPrice('sPrice_2289283', '2289283', '0');return false;">X</a></span>
								</p>
								<ul>
									<li style="border-bottom: 1px solid #ddd;" class="pertinent">
										<span>&gt; </span> 비회원 <span class="txt_price_member">19,950원</span>
									</li>
								</ul>
							</div>
							<p class="point">
								<span class="img-score"><span class="bar"
									style="width: 95%"></span></span> <span class="count">3,041</span>
							</p>

							<p class="txt_cnt_like" data-goodsno="2289283"
								data-gtm-vis-first-on-screen11584968_1136="1736"
								data-gtm-vis-total-visible-time11584968_1136="100"
								data-gtm-vis-has-fired11584968_1136="1"
								data-gtm-vis-first-on-screen11584968_147="1893"
								data-gtm-vis-total-visible-time11584968_147="2500"
								data-gtm-vis-first-on-screen11584968_1453="1893"
								data-gtm-vis-total-visible-time11584968_1453="2500"
								data-gtm-vis-has-fired11584968_147="1"
								data-gtm-vis-has-fired11584968_1453="1">
								<img
									src="//image.msscdn.net/skin/musinsa/images/icon_like_small_on.png"
									alt="좋아요"> 15,778
							</p>
						</div>
					</div>
				</li>

			</c:forEach>
		</c:if>
		<!-- 게시물 x -->
		<c:if test="${listcheck == 'empty'}">
			<div class="table_empty">검색결과가 없습니다.</div>
		</c:if>
	</ul>
	</div>
<!-- 페이지 이동 인터페이스 -->
	<div class="pageMaker_wrap">
		<ul class="pageMaker">

			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="pageMaker_btn prev"><a
					href="${pageMaker.pageStart -1}">이전</a></li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart }"
				end="${pageMaker.pageEnd }" var="num">
				<li
					class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageMaker_btn next"><a
					href="${pageMaker.pageEnd + 1 }">다음</a></li>
			</c:if>
		</ul>
	</div>

	<form id="moveForm" action="/search" method="get">
		<input type="hidden" name="pageNum"	value="${pageMaker.cri.pageNum}"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="cateCode" value="<c:out value="${pageMaker.cri.cateCode}"/>">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
	</form>

<script>
/* 페이지 이동 버튼 */
const moveForm = $('#moveForm');

$(".pageMaker_btn a").on("click", function(e) {

	e.preventDefault();

	moveForm.find("input[name='pageNum']").val($(this).attr("href"));

	moveForm.submit();

});

$(document).ready(function() {
	$("li[data-no]").each(function() {
		const productId = $(this).attr("data-no");
		const imageContainer = $('#uploadResult_'+productId);

		// console.log('Loading image for product ID:' + productId);
		
		$.getJSON(`/getAttachList`, { clothId: productId }, function(arr) {
			let str = "";
			if (arr.length === 0) {
				str += "<div id='result_card'><img src='/resources/img/goodsNoImage.png'></div>";
			} else {
				let obj = arr[0];
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				str += "<div id='result_card'";
				str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'>";
				str += "<img src='/display?fileName=" + fileCallPath + "'>";
				str += "</div>";
			}
			imageContainer.html(str);
		});
	});
});
</script>
</body>



</html>