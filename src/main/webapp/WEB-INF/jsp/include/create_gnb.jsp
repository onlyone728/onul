<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="gnb" class="createGnb w80 d-flex align-items-center justify-content-between h-100">
	<div class="font font40 mr-3">
		<a href="/community">오늘의집</a>
	</div>
	
	<div class="d-flex">
		<a href="#" class="btn cancelBtn">취소</a>
		<button type="button" class="btn saveBtn">올리기</button>
	</div>
</div>


<script>
$(document).ready(function() {
	// scroll down할때 메뉴 상단 고정
	let gnbHeight = $('#gnb').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > gnbHeight.top) {
			$('header').css('position', 'fixed');
		} else {
			$('header').css('position', 'relative');
		}	
	});
	$('.cancelBtn').on('click', function(e) {
		e.preventDefault();
		let result = confirm('작성을 취소하시겠습니까?');
		if(result) {
			location.href = "/community";
		}
	});
});
</script>