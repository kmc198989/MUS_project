<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
    
<style type="text/css">
    .top_gnb_area {
        color: white;
        background-color: black;
    }

    .top_gnb_area .list a {
        color: white;
        text-decoration: none;
    }

    .top_gnb_area .list a:visited {
        color: white;
    }

    .top_gnb_area .list a:hover {
        color: white;
    }

    .top_gnb_area .list a:active {
        color: white;
    }
    .admin_list_01, 
    .admin_list_02, .admin_list_03, 
    .admin_list_04, .admin_list_05, .admin_list_06{
    	font-family: "Dongle", sans-serif;
	    font-weight: 400;
	    font-style: normal;
    }
</style>


    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->	
            <div class="top_gnb_area" >
                <ul class="list">
                    <li><a href="/main">메인 페이지</a></li>
                    <li><a href="/member/logout.do">로그아웃</a></li>
                    <li>고객센터</li>			
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>Manager Page</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
	              <ul>
	                  <li >
	                      <a class="admin_list_01" href="/admin/goodsEnroll">상품 등록</a>
	                  </li>
	                  <li>
	                      <a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
	                  </li>
	                  <lI>
	                      <a class="admin_list_03" href="/admin/sellerEnroll">판매자 등록</a>                            
	                  </lI>
	                  <lI>
	                      <a class="admin_list_04" href="/admin/sellerManage">판매자 관리</a>
	                  </lI>
	                  <lI>
	                      <a class="admin_list_05" href="/admin/memberManage">회원 관리</a>                            
	                  </lI>  
	                  <li>
	                      <a class="admin_list_06" href="/admin/orderList">주문 현황</a>                            
	                  </li>                                                                                         
	              </ul>
                </div>