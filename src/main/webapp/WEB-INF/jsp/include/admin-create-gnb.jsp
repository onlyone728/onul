<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="gnb" class="header">
	<div class="siteName">
		<a href="/admin/summary">오늘의집 관리자페이지</a>
	</div>
	
	<div class="d-flex">
		<a href="/admin/product_list_view" class="btn cancelBtn">취소</a>
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
});
</script>