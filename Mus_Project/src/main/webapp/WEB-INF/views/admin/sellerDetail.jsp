<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/sellerDetail.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<%@include file="../includes/admin/header.jsp"%>
<div class="admin_content_wrap">
    <div class="admin_content_main">
           <div class="form_section">
               <div class="form_row">
                   <div class="form_section_title">
                       <label for="sellerId">판매자 번호</label>
                   </div>
                   <div class="form_section_content">
                       <input class="input_block" name="sellerId" readonly="readonly" value="<c:out value='${sellerInfo.sellerId }'></c:out>">
                   </div>
               </div>
               <div class="form_row">
                   <div class="form_section_title">
                       <label for="sellerCompany">상호</label>
                   </div>
                   <div class="form_section_content">
                       <input class="input_block" name="sellerCompany" readonly="readonly" value="<c:out value='${sellerInfo.sellerCompany }'></c:out>">
                   </div>
               </div>
               <div class="form_row">
			   		<div class="form_section_title">
						<label>브랜드 이름</label>
					</div>
					<div class="form_section_content">
						<input class="input_block" name="brandName" readonly="readonly" value="<c:out value='${sellerInfo.brandName }'></c:out>">
					</div>
               </div>
               <div class="form_row">
               		<div class="form_section_title">
						<label>대표 이름</label>
					</div>
					<div class="form_section_content">
						<input class="input_block" name="brandCEO" readonly="readonly" value="<c:out value='${sellerInfo.brandCEO }'></c:out>">
					</div>
               </div>
               <div class="form_row">
               		<div class="form_section_title">
						<label>사업자 번호</label>
					</div>
					<div class="form_section_content">
						<input class="input_block" name="busineseNum" readonly="readonly" value="<c:out value='${sellerInfo.busineseNum }'></c:out>">
					</div>
               </div>
               <div class="form_row">
                   <div class="form_section_title">
                       <label for="report">통신판매업신고</label>
                   </div>
                   <div class="form_section_content">
                       <input class="input_block" name="report" readonly="readonly" value="<c:out value='${sellerInfo.report }'></c:out>">
                   </div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>회사 번호</label>
					</div>
					<div class="form_section_content">
						<input class="input_block" name="tel" readonly="readonly" value="<c:out value='${sellerInfo.tel }'></c:out>">
					</div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>E-mail</label>
					</div>
					<div class="form_section_content">
						<input class="input_block" name="email" readonly="readonly" value="<c:out value='${sellerInfo.email }'></c:out>">
					</div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>영업소재지</label>
					</div>
					<div class="form_section_content">
						<input class="input_block" name="address" readonly="readonly" value="<c:out value='${sellerInfo.address }'></c:out>">
					</div>
               </div>
           </div>
           <div class="btn_section">
				<button id="cancelBtn" class="btn">판매자 목록</button>
				<button id="modifyBtn" class="btn modify_btn">수 정</button>
			</div>
		</div>
	</div>
			

	<form id="moveForm" method="get">
		<input type="hidden" name="sellerId" value='<c:out value="${sellerInfo.sellerId }"/>'> 
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'> 
		<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	</form>

	<script>

	let moveForm = $("#moveForm");

	/* 판매자 관리 페이지 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=sellerId]").remove();
		moveForm.attr("action", "/admin/sellerManage")
		moveForm.submit();
		
	});
	
	/* 판매자 수정 페이지 이동 버튼 */
	$("#modifyBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/admin/sellerModify");
		moveForm.submit();
		
	});

</script>

</body>
</html>