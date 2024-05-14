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

				<div class="search_area">
					<div class="search_wrap">
						<form id="searchForm" action="/search" method="get">
							<div class="search_input">
								<select name="type">
									<option value="T" selected>책 제목</option>
									<option value="A">작가</option>
								</select> <input type="text" name="keyword">
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
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
					<div id="main_div">
						<h1>main 영역 입니다</h1>
						<h1>main 영역 입니다</h1>
						<h1>main 영역 입니다</h1>
						<h1>main 영역 입니다</h1>
						<h1>main 영역 입니다</h1>
						<h1>main 영역 입니다</h1>
						<h1>main 영역 입니다</h1>
						<h1>main 영역 입니다</h1>
					</div>
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
    $("#gnb_logout_button").click(function(){
        //alert("버튼 작동");
        $.ajax({
            type:"POST",
            url:"/member/logout.do",
            success:function(data){
                document.location.reload();     
            } 
        }); // ajax
    });
    
</script>
</body>
</html>