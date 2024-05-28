<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/includes/nav.css">
<style>
.subcategories {
	display: none;
}
</style>
</head>
<body>
	<div class="nav_body">
		<div class="dropdown">
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

</script>


</body>
</html>
