<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="../resources/css/admin/sellerEnroll.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
   
   <script
   src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
</head>
</head>
<body>

<%@include file="../includes/admin/header.jsp"%>
<div class="admin_content_wrap">
    <div class="admin_content_main">
        <form action="/admin/sellerEnroll.do" method="post" id="enrollForm">
            <div class="form_section">
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="sellerCompany">상호</label>
                    </div>
                    <div class="form_section_content">
                        <input name="sellerCompany"> 
                  		<span id="warn_sellerCompany">상호를 입력 해주세요</span>
                    </div>
                </div>
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="brandName">브랜드 이름</label>
                    </div>
                    <div class="form_section_content">
                        <input name="brandName"> 
                  		<span id="warn_brandName">브랜드 이름을 입력 해주세요</span>
                    </div>
                </div>
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="brandCEO">대표자 이름</label>
                    </div>
                    <div class="form_section_content">
                        <input name="brandCEO"> 
                  		<span id="warn_brandCEO">대표자 이름을 입력 해주세요</span>
                    </div>
                </div>
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="busineseNum">사업자 번호</label>
                    </div>
                    <div class="form_section_content">
                        <input name="busineseNum"> 
                  		<span id="warn_busineseNum">사업자 번호를 입력 해주세요</span>
                    </div>
                </div>
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="report">통신판매업신고</label>
                    </div>
                    <div class="form_section_content">
                        <input name="report"> 
                  		<span id="warn_report">통신판매업신고를 입력 해주세요</span>
                    </div>
                </div>
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="tel">회사 번호</label>
                    </div>
                    <div class="form_section_content">
                        <input name="tel"> 
                  		<span id="warn_tel">회사 번호를 입력 해주세요</span>
                    </div>
                </div>
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="email">E-mail</label>
                    </div>
                    <div class="form_section_content">
                        <input name="email"> 
                  		<span id="warn_email">E-mail을 입력 해주세요</span>
                    </div>
                </div>
                
                <div class="form_row">
                    <div class="form_section_title">
                        <label for="address">영업소재지</label>
                    </div>
                    <div class="form_section_content">
                        <input name="address" type="text"> 
                        <span id="warn_address">엽엉소재지를 입력 해주세요.</span>
                    </div>
                </div>
               
            </div>
            <div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div>
        </form>
    </div>
</div>

   <script>
      /* 등록 버튼 */
      $("#enrollBtn").click(function() {
         /* 검사 통과 유무 변수 */
         let companyCheck = false; // 상호
         let nameCheck = false; // 브랜드 이름
         let ceoCheck = false; // 대표 이름
         let busineseCheck = false; // 사업자 번호
         let reportCheck = false; // 통신판매업신고
         let telCheck = false; // 회사 번호
         let emailCheck = false; // 회사 이메일
         let addressCheck = false; // 회사 주소

         /* 입력값 변수 */
         let sellerCompany = $('input[name=sellerCompany]').val();
         let brandName = $('input[name=brandName]').val(); 
         let brandCEO = $('input[name=brandCEO]').val();
         let busineseNum = $('input[name=busineseNum]').val();
         let report = $('input[name=report]').val();
         let tel = $('input[name=tel]').val();
         let email = $('input[name=email]').val();
         let address = $('input[name=address]').val();
         
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

         /* 최종 검사 */
         if (companyCheck && nameCheck && ceoCheck && busineseCheck && reportCheck && telCheck && emailCheck && addressCheck) {
            $("#enrollForm").submit();
         } else {
            return;
         }

      });

      /* 취소 버튼 */
      $("#cancelBtn").click(function(){
      	location.href="/admin/sellerManage"
      });
      
   </script>
</body>
</html>