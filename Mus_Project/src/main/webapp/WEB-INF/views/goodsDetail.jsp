<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome clothMall</title>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="includes/header.jsp"%>

	<div class="wrapper">
		<div class="wrap">
			<!-- 왼쪽 메뉴 영역 -->
			<div>
				<div class="leftmain">
					<div id="nav_section">
						<c:import url="/nav" />
					</div>

				</div>
			</div>


			<div class="content_area">
				<header>
					<!--             
               <a href="https://www.musinsa.com/brands/dumaro"
                  class="product-detail__sc-11xq7v-0 imNKjW">
                  <p class="product-detail__sc-11xq7v-1 cCbuKE">
                     <p class="brandBanner"
                     style="BACKGROUND: url(// image.msscdn.net/ display/ images/ 2021/ 12/ 29/ 0474af21b5694138a3a121cb864b0ebe .png">
                        <img alt="" src="//image.msscdn.net/display/images/2021/12/29/312b4dc59fca47eba103ba4130681018.png">
                     </p>
                  </p>
               </a>
                -->
				</header>

				<div class="product-detail topcate">
					<div class="product-detail catename">
						<a href="/search?cateCode=${goodsInfo.cateCode}"
							class="product-detail name1">${goodsInfo.cateName}</a> <span
							class="product-detail inDeCo">&nbsp;>&nbsp;</span>
						<p class="product-detail clothname">${goodsInfo.clothName}</p>
						<a href="/search?keyword=${goodsInfo.brandName}"
							class="product-detail name1">(${goodsInfo.brandName})</a>
					</div>
				</div>

				<div class="brandnamebar">
					<h3>${goodsInfo.clothName }</h3>
				</div>

				<div class="lrmain">
					<div class="left">
						<div class="sumneil">
							<div class="image_wrap"
								data-clothid="${goodsInfo.imageList[0].clothId}"
								data-path="${goodsInfo.imageList[0].uploadPath}"
								data-uuid="${goodsInfo.imageList[0].uuid}"
								data-filename="${goodsInfo.imageList[0].fileName}">
								<img>
							</div>
						</div>
						<div class="goods-detail line"></div>
					</div>
					<div class="right">
						<div class="liness"></div>
						<div class="product-info-section">
							<h4 class="productheader">
								<strong class="stinfo">Product Info</strong>
							</h4>
							<ul class="productul">
								<li class="proli">
									<div class="prodiv">
										<span>브랜드 :</span>
									</div>
									<div class="prodiv2">${goodsInfo.brandName}</div>
								</li>
								<li class="proli">
									<div class="prodiv">
										<span>제품명 :</span>
									</div>
									<div class="prodiv2">${goodsInfo.clothName}</div>
								</li>
								<li class="proli">
									<div class="prodiv">
										<span>카테고리 :</span>
									</div>
									<div class="prodiv2">${goodsInfo.cateName}</div>
								</li>
								<li class="proli">
									<div class="sale_price prodiv">
										<span>정가 :</span>
									</div>
									<div class="prodiv2">
										<span class="textwow"> <fmt:formatNumber
												value="${goodsInfo.clothPrice}" pattern="#,### 원" /></span>
									</div>
								</li>
								<li class="proli">
									<div class="price-info info prodiv">
										<span>판매가 :</span>
									</div>
									<div class="price-info info prodiv2">
										<span class="discount_price_number"><fmt:formatNumber
												value="${goodsInfo.clothPrice - (goodsInfo.clothPrice*goodsInfo.clothDiscount)}"
												pattern="#,### 원" /></span> [<span class="wow"> <fmt:formatNumber
												value="${goodsInfo.clothDiscount*100}" pattern="###" /> % <fmt:formatNumber
												value="${goodsInfo.clothPrice*goodsInfo.clothDiscount}"
												pattern="#,### 원" /> 할인
										</span>]
									</div>
								</li>
								<li class="proli">
									<div class="price-info info prodiv">
										<span>적립 포인트 : </span>
									</div>
									<div class="price-info info prodiv2">
										<span class="point_span"></span>원
									</div>
								</li>
							</ul>
						</div>

						<div class="button info">
							<div class="button_quantity">
								주문수량 <input type="text" class="quantity_input" value="1">
								<span>
									<button class="plus_btn">+</button>
									<button class="minus_btn">-</button>
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
				<div class="content_bottom">
					<div class="reply_subject">
						<h2>리뷰</h2>
					</div>

					<c:if test="${member != null}">
						<div class="reply_button_wrap">
							<button>리뷰 쓰기</button>
						</div>
					</c:if>

					<div class="reply_not_div"></div>
					<ul class="reply_content_ul">


					</ul>
					<div class="repy_pageInfo_div">
						<ul class="pageMaker">

						</ul>
					</div>

				</div>

				<section id="footer_section">
					<%@include file="includes/footer.jsp"%>
				</section>
			</div>

		</div>
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

   // 수량 버튼 조작
   let quantity = $(".quantity_input").val();
   $(".plus_btn").on("click", function() {
      $(".quantity_input").val(++quantity);
   });
   $(".minus_btn").on("click", function() {
      if (quantity > 1) {
         $(".quantity_input").val(--quantity);
      }
   });

   // 서버로 전송할 데이터
   const form = {
      memberId : '${member.memberId}',
      clothId : '${goodsInfo.clothId}',
      clothCount : ''
   }

   $(".btn_cart").on("click", function(e) {
      form.clothCount = $(".quantity_input").val();
      $.ajax({
         url : '/cart/add',
         type : 'POST',
         data : form,
         success : function(result) {
            cartAlert(result);
         }
      })
   });

   function cartAlert(result) {
      if (result == '0') {
         alert("장바구니에 추가를 하지 못하였습니다.");
      } else if (result == '1') {
         alert("장바구니에 추가되었습니다.");
      } else if (result == '2') {
         alert("장바구니에 이미 추가되어져 있습니다.");
      } else if (result == '5') {
         alert("로그인이 필요합니다.");
      }
   }
   
   /* 포인트 삽입 */
   let salePrice = "${goodsInfo.clothPrice - (goodsInfo.clothPrice*goodsInfo.clothDiscount)}"
   let point = salePrice*0.05;
   point = Math.floor(point);
   $(".point_span").text(point);
   
   /* 리뷰 리스트 출력 */
   const clothId = '${goodsInfo.clothId}';   

   $.getJSON("/reply/list", {clothId : clothId}, function(obj){
      
      if(obj.list.length === 0){
         $(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
         $(".reply_content_ul").html('');
         $(".pageMaker").html('');
      } else{
         
      }
      
   });
   
   /* 리뷰쓰기 */
   $(".reply_button_wrap").on("click", function(e){
      
      e.preventDefault();         

      const memberId = '${member.memberId}';
      const clothId = '${goodsInfo.clothId}';
      
      $.ajax({
         data : {
            clothId : clothId,
            memberId : memberId
         },
         url : '/reply/check',
         type : 'POST',
         success : function(result){
            if(result === '1'){
               alert("이미 등록된 리뷰가 존재 합니다.")
            } else if(result === '0'){
               let popUrl = "/replyEnroll/" + memberId + "?clothId=" + clothId;
               console.log(popUrl);
               let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
               
               window.open(popUrl,"리뷰 쓰기",popOption);                     
            }
         }
      });
      
      
      
   /*
      let popUrl = "/replyEnroll/" + memberId + "?clothId=" + clothId;
      console.log(popUrl);
      let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
      
      window.open(popUrl,"리뷰 쓰기",popOption);
   */
   
  	/* 리뷰 수정 버튼 */
 	 $(document).on('click', '.update_reply_btn', function(e){
 			
 			e.preventDefault();
 			let replyId = $(this).attr("href");		 
 			let popUrl = "/replyUpdate?replyId=" + replyId + "&clothId=" + '${goodsInfo.clothId}' + "&memberId=" + '${member.memberId}';	
 			let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"	
 			
 			window.open(popUrl,"리뷰 수정",popOption);			
 		 
 	 });
   
   });
   
</script>



</html>