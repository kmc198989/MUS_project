<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/sellerModify.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<%@include file="../includes/admin/header.jsp" %>
<div class="admin_content_wrap">
		<div class="admin_content_main">
			<form id="modifyForm" action="/admin/sellerModify" method="post">
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
	                        <label for="sellerCompany"">상호</label>
	                    </div>
	                    <div class="form_section_content">
	                        <input name="sellerCompany" value="<c:out value='${sellerInfo.sellerCompany }'></c:out>" >
       						<span id="warn_sellerCompany">상호를 입력 해주세요.</span>
	                    </div>
	                </div>
	                <div class="form_row">
	                    <div class="form_section_title">
	                        <label for="brandName">브랜드 이름</label>
	                    </div>
	                    <div class="form_section_content">
	                        <input name="brandName" value="<c:out value='${sellerInfo.brandName }'></c:out>" >
       						<span id="warn_brandName">브랜드 이름을 입력 해주세요.</span>
	                    </div>
	                </div>
	                <div class="form_row">
	                    <div class="form_section_title">
	                        <label for="brandCEO">대표 이름</label>
	                    </div>
	                    <div class="form_section_content">
	                        <input name="brandCEO" value="<c:out value='${sellerInfo.brandCEO }'></c:out>" >
       						<span id="warn_brandCEO">대표 이름을 입력 해주세요.</span>
	                    </div>
	                </div>
	                <div class="form_row">
	                    <div class="form_section_title">
	                        <label for="busineseNum">사업자 번호</label>
	                    </div>
	                    <div class="form_section_content">
	                        <input name="busineseNum" value="<c:out value='${sellerInfo.busineseNum }'></c:out>" >
       						<span id="warn_busineseNum">사업자 번호를 입력 해주세요.</span>
	                    </div>
	                </div>
	                <div class="form_row">
	                    <div class="form_section_title">
	                        <label for="report">통신판매업신고</label>
	                    </div>
	                    <div class="form_section_content">
	                        <input name="report" value="<c:out value='${sellerInfo.report }'></c:out>" >
       						<span id="warn_report">통신판매업신고를 입력 해주세요.</span>
	                    </div>
	                </div>
	                <div class="form_row">
	                    <div class="form_section_title">
	                        <label for="tel">회사 번호</label>
	                    </div>
	                    <div class="form_section_content">
	                        <input name="tel" value="<c:out value='${sellerInfo.tel }'></c:out>" >
       						<span id="warn_tel">번호를 입력 해주세요.</span>
	                    </div>
	                </div>
	                
	                <div class="form_row">
	                    <div class="form_section_title">
	                        <label for="email">E-mail</label>
	                    </div>
	                    <div class="form_section_content">
	                        <input name="email" value="<c:out value='${sellerInfo.email }'></c:out>" >
       						<span id="warn_email">이메일을 입력 해주세요.</span>
	                    </div>
	                </div>
	                <div class="form_row">
	                    <div class="form_section_title">
	                        <label for="clothContents">영업소재지</label>
	                    </div>
	                    <div class="form_section_content">
	                        <div class="form_section_content">
		       				<input name="address" value="<c:out value='${sellerInfo.address }'></c:out>" >
		       				<span id="warn_address">엽엉소재지를 입력 해주세요.</span>
	                    </div>
	                </div>
	            </div>
				<input type="hidden" name='clothId' value="${goodsInfo.clothId}">
				</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취소</button>
         		<button id="modifyBtn" class="btn modify_btn">수 정</button>
         		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
			</div>
		</div>
	</div>
   
   <form id="moveForm" method="get">
   	<input type="hidden" name="sellerId" value='<c:out value="${sellerInfo.sellerId }"/>'>
   	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
   	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
   	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
   </form>

<script>
let moveForm = $("#moveForm");
let modifyForm = $("#modifyForm");

// 작가 상세 페이지 이동 버튼
$("#cancelBtn").on("click", function(e) {
	e.preventDefault();
	
	moveForm.attr("action", "/admin/sellerManage");
	moveForm.submit();
});

// 삭제 버튼
$("#deleteBtn").on("click", function(e) {
	e.preventDefault();
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="sellerId" value="${sellerInfo.sellerId}">');
	moveForm.attr("action", "/admin/sellerDelete");
	moveForm.attr("method", "post");
	moveForm.submit();
});

// 작가 수정 버튼 작동 및 유효성 검사
$("#modifyBtn").on("click", function(e) {
	/* 검사 통과 유무 변수 */
    let companyCheck = false; // 상호
    let nameCheck = false; // 브랜드 이름
    let ceoCheck = false; // 대표 이름
    let busineseCheck = false; // 사업자 번호
    let reportCheck = false; // 통신판매업신고
    let telCheck = false; // 회사 번호
    let emailCheck = false; // 회사 이메일
    let addressCheck = false; // 회사 주소
	
	e.preventDefault();
	
	/* 입력값 변수 */
    let sellerCompany = $(".form_section_content input[name='sellerCompany']").val();
    let brandName = $(".form_section_content input[name='brandName']").val(); 
    let brandCEO = $(".form_section_content input[name='brandCEO']").val();
    let busineseNum = $(".form_section_content input[name='busineseNum']").val();
    let report = $(".form_section_content input[name='report']").val();
    let tel = $(".form_section_content input[name='tel']").val();
    let email = $(".form_section_content input[name='email']").val();
    let address = $(".form_section_content input[name='address']").val();
    /* 공란 경고 span태그 */
    let wSellerCompany = $('#warn_sellerCompany');
    let wBrandName = $('#warn_brandName');
    let wBrandCEO = $('#warn_brandCEO');
    let wBusineseNum = $('#warn_busineseNum');
    let wReport = $('#warn_report');
    let wTel = $('#warn_tel');
    let wEmail= $('#warn_email');
    let wAddress= $('#warn_address');

    /* 작기 이름 공란 체크 */
    if (sellerCompany === '') {
       wSellerCompany.css('display', 'block');
       companyCheck = false;
    } else{
       wSellerCompany.css('display', 'block');
       companyCheck = true;
    }
    
    if (brandName === '') {
       wBrandName.css('display', 'block');
       nameCheck = false;
    } else {
       wBrandName.css('display', 'none');
       nameCheck = true;
    }

    if (brandCEO === '') {
       wBrandCEO.css('display', 'block');
       ceoCheck = false;
    } else {
       wBrandCEO.css('display', 'none');
       ceoCheck = true;
    }
    
    if (busineseNum === '') {
       wBusineseNum.css('display', 'block');
       busineseCheck = false;
    } else {
       wBusineseNum.css('display', 'block');
       busineseCheck = true;
    }
    
    if (report === '') {
       wReport.css('display', 'block');
       reportCheck = false;
    } else {
       wReport.css('display', 'none');
       reportCheck = true;
    }
    
    if (tel === '') {
       wTel.css('display', 'block');
       telCheck = false;
    } else {
       wTel.css('display', 'none');
       telCheck = true;
    }
    
    if (email === '') {
       wEmail.css('display', 'block');
       emailCheck = false;
    } else {
       wEmail.css('display', 'none');
       emailCheck = true;
    }
    if (address === '') {
       wAddress.css('display', 'block');
       addressCheck = false;
    } else {
       wAddress.css('display', 'none');
       addressCheck = true;
    }

	
	if(companyCheck && nameCheck && ceoCheck && busineseCheck && reportCheck && telCheck && emailCheck && addressCheck) {
		modifyForm.submit();
	}else {
		return false;
	}
});
</script>
</body>
</html>