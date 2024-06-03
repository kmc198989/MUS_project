<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<link rel="stylesheet" href="../resources/css/includes/nav.css">
<style>
.subcategories {
	display: none;
}
</style>
</head>
<body>
	<div id="nav_section" class="nav_section">
	<div class="nav_body">
		<div class="dropdown">
			<button type="button" class="flip">
				<svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" clip-rule="evenodd" d="M5 9.5H25V8.5H5V9.5ZM25 15.5H5V14.5H25V15.5ZM25 21.5H5V20.5H25V21.5Z" fill="black"></path>
				</svg>
			</button>
			<div class="dropdown-content">
				<c:forEach items="${cate}" var="cate1">
					<button class="dropbtn">${cate1.key.cateName}</button>
					<div class="subcategories">
						<a href="/search?cateCode=${cate1.key.cateCode}">전체(${cate1.key.count})</a>
						<ul class="ul_1">
						<c:forEach items="${cate1.value}" var="cate2">
							<a href="/search?cateCode=${cate2.cateCode}">${cate2.cateName}(${cate2.count})</a>
						</c:forEach></ul>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	</div>

<script>
//JavaScript to toggle subcategories when clicking on main category buttons
var buttons = document.querySelectorAll('.dropbtn');
buttons.forEach(function(button) {
    button.addEventListener('click', function() {
        var subcategories = this.nextElementSibling;
        var display = subcategories.style.display;
        if (display === 'none' || display === '') {
            subcategories.style.display = 'flex';
        } else {
            subcategories.style.display = 'none';
        }
    });
});

$(document).ready(function() {
	$(".flip").click(function() {
		$("#nav_section").toggleClass("nav_section_close");
		$("#main_div").toggleClass("main_div_close");

	});
});

</script>


</body>
</html>
