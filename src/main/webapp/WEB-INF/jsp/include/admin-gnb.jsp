<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header">
	<div class="siteName"><a href="/admin/summary">오늘의집 판매자 페이지</a></div>
	<div class="gnb">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="#">판매현황</a></li>
			<li class="nav-item"><a class="nav-link" href="/admin/product_list_view">상품</a></li>
			<li class="nav-item"><a class="nav-link" href="#">고객관리</a></li>
		</ul>
	</div>
	<div class="storeImg">
		<a href="#storeMenu" id="storeInfoBtn" class="img-center d-block bg-dark">
			<c:if test="${not empty storeImage}">
				<img class="img" src="${storeImage}" alt="${storeName}의 이미지" height="100%">
			</c:if> 
			<c:if test="${empty storeImage}">
				<img alt="" src="/image/avatar.webp" width="100%">
			</c:if>	
		</a>
	</div>
	<div id="storeMenu" class="d-none">
		<ul>
			<li><a href="#">스토어정보</a></li>
			<li><a href="/admin">로그아웃</a></li>
		</ul>
	</div>
</div>

<script>
$(document).ready(function() {
	// user 버튼 클릭
	$(document).on('click', '#storeInfoBtn', function (e){
		e.preventDefault();
		let target = $(this).attr('href');
		$(target).removeClass('d-none');
	});
	// 외부영역 클릭 시 팝업 닫기
	$(document).mouseup(function(e){
		let LayerPopup = $('#storeMenu');
		if(LayerPopup.has(e.target).length === 0){
			LayerPopup.addClass('d-none');
		};
	});
});
</script>