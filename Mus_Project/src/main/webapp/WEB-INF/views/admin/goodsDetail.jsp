<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}
</style>
</head>
<body>
	<%@include file="../includes/admin/header.jsp"%>
<div class="admin_content_wrap">
    <div class="admin_content_main">
           <div class="form_section">
               <div class="form_row">
                   <div class="form_section_title">
                       <label for="clothName">상품명</label>
                   </div>
                   <div class="form_section_content">
                       <input name="clothName" value="<c:out value="${goodsInfo.clothName}"/>" disabled>
                   </div>
               </div>
               <div class="form_row">
                   <div class="form_section_title">
                       <label for="publeYear">입고일</label>
                   </div>
                   <div class="form_section_content">
                       <input value="<fmt:formatDate value='${goodsInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
                   </div>
               </div>
               <div class="form_row">
			   		<div class="form_section_title">
						<label>최근 수정 날짜</label>
					</div>
					<div class="form_section_content">
						<input value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
					</div>
               </div>
               <div class="form_row">
               		<div class="form_section_title">
						<label>판매자</label>
					</div>
					<div class="form_section_content">
						<input id="brandName_input" readonly="readonly" value="${goodsInfo.brandName }" disabled>
					</div>
               </div>
               <div class="form_row">
               		<div class="form_section_title">
						<label>출판일</label>
					</div>
					<div class="form_section_content">
						<input name="publeYear" autocomplete="off" readonly="readonly" value="<c:out value="${goodsInfo.publeYear}"/>" disabled>
					</div>
               </div>
               <div class="form_row">
                   <div class="form_section_title">
                       <label for="category">카테고리</label>
                   </div>
                   <div class="form_section_content">
                       <div class="cate_wrap">
                           <span>상분류</span> 
                           <select class="cate1" disabled>
                               <option value="none">----</option>
                           </select>
                       </div>
                       <div class="cate_wrap">
                           <span>하분류</span> 
                           <select name="cateCode" class="cate2" disabled>
                               <option value="none">----</option>
                           </select>
                       </div>
                   </div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="clothPrice"
							value="<c:out value="${goodsInfo.clothPrice}"/>" disabled>
					</div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="clothStock"
							value="<c:out value="${goodsInfo.clothStock}"/>" disabled>
					</div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content">
						<input id="discount_interface" maxlength="2" disabled>
					</div>
               </div>
               
               <div class="form_row">
                    <div class="form_section_title">
						<label>상품 소개</label>
					</div>
					<div class="form_section_content bit">
						<textarea name="clothIntro" id="clothIntro_textarea" disabled>${goodsInfo.clothIntro}</textarea>
					</div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>상품 내용</label>
					</div>
					<div class="form_section_content bct">
						<textarea name="clothContents" id="clothContents_textarea" disabled>${goodsInfo.clothContents}</textarea>
					</div>
               </div>
               <div class="form_row">
                    <div class="form_section_title">
						<label>상품 이미지</label>
					</div>
					<div class="form_section_content">
						
						<div id="uploadReslut"></div>
					</div>
               </div>
           </div>
           <div class="btn_section">
			<button id="cancelBtn" class="btn">상품 목록</button>
			<button id="modifyBtn" class="btn enroll_btn">수정</button>
		</div>
        
        <form id="moveForm" action="/admin/goodsManage" method="get">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" name="amount" value="${cri.amount}">
			<input type="hidden" name="keyword" value="${cri.keyword}">
		</form>
    </div>
</div>

   <script>
   
      $(document).ready(function(){
         
         /* 할인율 값 삽입 */
         let clothDiscount = '<c:out value="${goodsInfo.clothDiscount}"/>' * 100;
         $("#discount_interface").attr("value", clothDiscount);
         
         
         /* 상품 소개 */
         ClassicEditor
            .create(document.querySelector('#clothIntro_textarea'))
            .then(editor => {
               console.log(editor);
               editor.isReadOnly = true;
            })
            .catch(error=>{
               console.error(error);
            });

         /* 상품 목차 */   
         ClassicEditor
         .create(document.querySelector('#clothContents_textarea'))
         .then(editor => {
            console.log(editor);
            editor.isReadOnly = true;
         })
         .catch(error=>{
            console.error(error);
         });      
         

         /* 카테고리 */
         let cateList = JSON.parse('${cateList}');

         let cate1Array = new Array();
         let cate2Array = new Array();
         let cate1Obj = new Object();
         let cate2Obj = new Object();
         
         let cateSelect1 = $(".cate1");      
         let cateSelect2 = $(".cate2");

         /* 카테고리 배열 초기화 메서드 */
         function makeCateArray(obj,array,cateList, tier){
            for(let i = 0; i < cateList.length; i++){
               if(cateList[i].tier === tier){
                  obj = new Object();
                  
                  obj.cateName = cateList[i].cateName;
                  obj.cateCode = cateList[i].cateCode;
                  obj.cateParent = cateList[i].cateParent;
                  
                  array.push(obj);            
                  
               }
            }
         }   

         /* 배열 초기화 */
         makeCateArray(cate1Obj,cate1Array,cateList,1);
         makeCateArray(cate2Obj,cate2Array,cateList,2);
         
         let targetCate1 = '';
         let targetCate2 = '${goodsInfo.cateCode}';

         /* 하분류 */
         for(let i = 0; i < cate2Array.length; i++){
            if(targetCate2 === cate2Array[i].cateCode){
               targetCate2 = cate2Array[i];   
            }
            console.log('targetCate2.cateName : ' + targetCate2.cateName);

         }// for      
         
         console.log('targetCate2 : ' + targetCate2);
         console.log('targetCate2.cateName : ' + targetCate2.cateName);
         console.log('targetCate2.cateCode : ' + targetCate2.cateCode);
         console.log('targetCate2.cateParent : ' + targetCate2.cateParent);
         
         for(let i = 0; i < cate2Array.length; i++){
            if(targetCate2.cateParent === cate2Array[i].cateParent){
               cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
            }
            // console.log('cate2Array[i].cateParent' + cate2Array[i].cateParent);
         }      
         
         $(".cate2 option").each(function(i,obj){
            if(targetCate2.cateCode === obj.value){
               $(obj).attr("selected", "selected");
            }
         });            
         
         
         /* 상분류 */
         for(let i = 0; i < cate1Array.length; i++){
            cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
         }   
         
         $(".cate1 option").each(function(i,obj){
            if(targetCate2.cateParent === obj.value){
               $(obj).attr("selected", "selected");
            }
         });

         /* 이미지 정보 호출 */
         let clothId = '<c:out value="${goodsInfo.clothId}"/>';
         let uploadReslut = $("#uploadReslut");         
         
         $.getJSON("/getAttachList", {clothId : clothId}, function(arr){   
            
            if(arr.length === 0){   
               
               let str = "";
               str += "<div id='result_card'>";
               str += "<img src='/resources/img/goodsNoImage.png'>";
               str += "</div>";
               
               uploadReslut.html(str);                  
               
               return;
            }            
            
            let str = "";
            let obj = arr[0];   
            
            let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
            str += "<div id='result_card'";
            str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
            str += ">";
            str += "<img src='/display?fileName=" + fileCallPath +"'>";
            str += "</div>";      
            
            uploadReslut.html(str);                  
            
         });               
         
         
      }); // $(document).ready
   
      /* 목록 이동 버튼 */
      $("#cancelBtn").on("click", function(e){
         e.preventDefault();
         $("#moveForm").submit();   
      });   
      
      /* 수정 페이지 이동 */
      $("#modifyBtn").on("click", function(e){
         e.preventDefault();
         let addInput = '<input type="hidden" name="clothId" value="${goodsInfo.clothId}">';
         $("#moveForm").append(addInput);
         $("#moveForm").attr("action", "/admin/goodsModify");
         $("#moveForm").submit();
      });         
      
   </script>
</body>
</html>