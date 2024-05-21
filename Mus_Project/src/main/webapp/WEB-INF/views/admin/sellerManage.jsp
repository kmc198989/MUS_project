<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/sellerManage.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

</head>
</head>
<body>
 
               <%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>판매자 관리</span></div>
                    <div class="seller_table_wrap">
                       <!-- 게시물 O -->
                       <c:if test="${listCheck != 'empty' }">
                          <table class="seller_table">
                             <thead>
                                <tr>
                                   <td class="th_column_1">판매자 번호</td>
                                   <td class="th_column_2">상호 / 대표자</td>
                                   <td class="th_column_3">브랜드</td>
                                   <td class="th_column_4">사업자번호</td>
                                   <td class="th_column_5">통신판매업신고</td>
                                   <td class="th_column_6">연락처</td>
                                   <td class="th_column_7">E-mail</td>
                                   <td class="th_column_8">영업소재지</td>
                                </tr>
                             </thead>
                             <c:forEach items="${list }" var="list">
                             <tr>
                                <td><c:out value="${list.sellerId }"></c:out></td>
                                <td><c:out value="${list.sellerCompany } / ${list.brandCEO }"></c:out></td>
                                <td>
                                   <a class="move" href='<c:out value="${list.sellerId }"/>'>
                                      <c:out value="${list.brandName }"></c:out>
                                   </a>
                                </td>
                                <td><c:out value="${list.busineseNum }"></c:out></td>
                                <td><c:out value="${list.report }"></c:out></td>
                                <td><c:out value="${list.tel }"></c:out></td>
                                <td><c:out value="${list.email }"></c:out></td>
                                <td><c:out value="${list.address }"></c:out></td>
                             </tr>
                             </c:forEach>
                          </table>
                       </c:if>
                       
                       <!-- 게시물 x -->
                       <c:if test="${listCheck == 'empty' }">
                          <div class="table_empty">
                             등록된 판매자가 없습니다.
                          </div>
                       </c:if>
                    </div>
                    
                    <!-- 검색 영역 -->
                    <div class="search_wrap">
                       <form id="searchForm" action="/admin/sellerManage" method="get">
                          <div class="search_input">
                             <input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                             <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                             <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                             <button class='btn search_btn'>검 색</button>
                          </div>
                       </form>
                    </div>
                    
                    <!-- 페이지 이동 인터페이스 영역 -->
                    <div class="pageMaker_wrap" >
                    
                       <ul class="pageMaker">
                       
                          <!-- 이전 버튼 -->
                          <c:if test="${pageMaker.prev}">
                             <li class="pageMaker_btn prev">
                                <a href="${pageMaker.pageStart - 1}">이전</a>
                             </li>
                          </c:if>
                          
                          <!-- 페이지 번호 -->
                          <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
                             <li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
                                <a href="${num}">${num}</a>
                             </li>
                          </c:forEach>
                          
                          <!-- 다음 버튼 -->
                          <c:if test="${pageMaker.next}">
                             <li class="pageMaker_btn next">
                                <a href="${pageMaker.pageEnd + 1 }">다음</a>
                             </li>
                          </c:if>
                          
                       </ul>
                       
                    </div>
                   
                   <form id="moveForm" action="/admin/sellerManage" method="get">
                  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
               </form>
                   
                </div>
                
 <script type="text/javascript">
 $(document).ready(function(){
   let result = '<c:out value="${enroll_result}"/>';
   let mresult = '<c:out value="${modify_result}"/>';
   
   checkResult(result);
   checkmResult(mresult);
   
   function checkResult(result){
      if(result == ''){
         return;
      }
      
      alert("판매자'${enroll_result}' 을 등록하였습니다.")
   }
   
   function checkmResult(mresult){
      if(mresult === '1'){
         alert("판매자 정보 수정을 완료하였습니다.");
      }else if(mresult === '0'){
         alert("판매자 정보 수정을 하지 못하였습니다.");
      }
   }
   
   /* 삭제 결과 경고창 */
   let delete_result = '${delete_result}';
   
   if (delete_result == 1) {
      alert("삭제 완료");
   } else if(delete_result == 2){
      alert("헤당 판매자 데이터를 사용하고 있는 데이터가 있어서 삭제 할 수 없습니다.")
   }
 });
 
 let moveForm = $('#moveForm');
 let searchForm = $('#searchForm');
 
 /* 페이지 이동 버튼 */
 $(".pageMaker_btn a").on("click", function(e){
   e.preventDefault();
   moveForm.find("input[name='pageNum']").val($(this).attr("href"));
   moveForm.submit();
 });
 
 /* 작거 검색 버튼 동작 */
 $("#searchForm button").on("click", function(e){
   e.preventDefault();
   
   /* 검색 키워드 유효성 검사 */
   if(!searchForm.find("input[name='keyword']").val()){
      alert("키워드를 입력하십시오");
      return false;
   }
   
   searchForm.find("input[name='pageNum']").val("1");
   
   searchForm.submit();
 });
 
 $(".move").on("click", function(e){
   e.preventDefault();
   
   moveForm.append("<input type='hidden' name='sellerId' value='"+ $(this).attr("href") + "'>");
   moveForm.attr("action", "/admin/sellerDetail");
   moveForm.submit();
 });
 </script>
</body>
</html>