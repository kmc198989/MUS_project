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
	<%@include file="includes/header.jsp"%>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<c:if test="${member == null}">
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>
					</c:if>
					<c:if test="${member != null}">
						<c:if test="${member.adminCk == 1 }">
							<li><a href="/admin/main">관리자 페이지</a></li>
						</c:if>
						<li><a id="gnb_logout_button">로그아웃</a></li>
						<li>마이룸</li>
						<li>장바구니</li>
					</c:if>
					<li>고객센터</li>
				</ul>
			</div>

			<div class="top_area">
				<!-- 로고 영역 -->
				<div class="logo_area">
					<a href="/main"><img src="resources/img/logo.png"></a>
				</div>

				<div class="login_area">
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${member == null}">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join"></a></span>
					</c:if>

					<!-- 로그인한 상태 -->
					<c:if test="${member !=null}">
						<div class="login_success_area">
							<span>회원 : ${member.memberName}</span> <span>충전금액 : <fmt:formatNumber
									value="${member.money}" pattern="\#,###.##" /></span> <span>포인트
								: <fmt:formatNumber value="${member.point }" pattern="#,###" />
							</span> <a href="/member/logout.do">로그아웃</a>
						</div>
					</c:if>

				</div>
				<div class="clearfix"></div>
			</div>

			<div class="content_area">
				<section class="main">
					<div id="nav_section">
						<%@include file="includes/nav.jsp"%>
					</div>


					<ul id="main_div">
					<c:if test="${listcheck != 'empty'}">
					
						<c:forEach items="${list}" var="list">					
						<li class="li_box" data-no="2289283">
							<!-- 상단 좌측 라벨 -->
							<div class="icon_new">${list.clothDiscount}</div> <!-- 상단 우측 라벨 -->
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
								<div class="list_img">
									<a class="img-block" name="goods_link"
										href="#"
										title="쿤스트하우스 코튼 볼캡 / 네이비"> <img class="lazyload lazy"
										alt="두마로(DUMARO) 쿤스트하우스 코튼 볼캡 / 네이비"
										data-original="https://image.msscdn.net/images/goods_img/20220103/2289283/2289283_4_125.jpg"
										src="https://image.msscdn.net/images/goods_img/20220103/2289283/2289283_4_125.jpg"
										style="display: block;">
									</a>
								</div>
								<div class="article_info">
									<p class="item_title">
										<a href="#">${list.brandName}</a>
									</p>
									<p class="list_info">
										<a name="goods_link"
											href="//www.musinsa.com/app/goods/2289283"
											title="${list.clothName}"> <strong class="txt_reserve">6/7
												배송</strong> ${list.clothName}
										</a>
									</p>
									<p class="price">
										<del>39,900원</del>
										${list.clothPrice}원
									</p>
									<p class="mu-icon mu-icon-coupon">
										<span class="txt_discount_price">-1,995원</span>
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
						
					</ul>

				</section>
			</div>
			<!-- Footer 영역 -->
			<section id="footer_section">
				<%@include file="includes/footer.jsp"%>
			</section>
			<!-- class="footer_nav" -->

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