<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<c:forEach items="${cate1.value}" var="cate2">
							<a href="search?cateCode=${cate2.cateCode}">${cate2.cateName}</a>
						</c:forEach>
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
            subcategories.style.display = 'block';
        } else {
            subcategories.style.display = 'none';
        }
    });
});

</script>


</body>
</html>
