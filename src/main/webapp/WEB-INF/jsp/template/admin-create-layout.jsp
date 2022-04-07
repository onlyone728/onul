<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의집 판매자 페이지</title>

<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-zoom/1.6.1/jquery.zoom.min.js" integrity="sha512-xhvWWTTHpLC+d+TEOSX2N0V4Se1989D03qp9ByRsiQsYcdKmQhQ8fsSTX3KLlzs0jF4dPmq0nIzvEc3jdYqKkw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet" type="text/css" href="/css/admin_style.css">
</head>
<body>
	<header>
		<jsp:include page="../include/admin-create-gnb.jsp" />
	</header>
	<section class="contents">
		<jsp:include page="../${viewPath}.jsp"></jsp:include>
	</section>
	<footer>
		<jsp:include page="../include/footer.jsp" />
	</footer>
</body>
</html>