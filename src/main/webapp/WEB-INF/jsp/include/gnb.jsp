<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="gnb" class="d-flex align-items-center h-100">
	<div class="ml10 font font40 mr-3">
		<a href="/community">오늘의집</a>
	</div>
	<nav class="h-100">
		<ul id="mainMenu" class="nav">
			<li id="communityMenuBtn" class="nav-item">
				<a href="/community" class="nav-link blue d-block">커뮤니티</a>
				<ul id="communityMenu" class="subMenu">
					<li><a href="/community" class="blue d-block">홈</a></li>
					<li><a href="/community/photo_view" class="blue d-block">사진</a></li>
					<li><a href="/community/introduce_view" class="blue d-block">집들이</a></li>
					<li><a href="/community/knowhow_view" class="blue d-block">노하우</a></li>
				</ul>
			</li>	
			<li id="storeMenuBtn" class="nav-item">
				<a href="/store" class="nav-link blue d-block">스토어</a>
				<ul id="storeMenu" class="subMenu">
					<li><a href="/store" class="blue d-block">스토어홈</a></li>
					<li><a href="#" class="blue d-block">카테고리</a></li>
					<li><a href="#" class="blue d-block">베스트</a></li>
					<li><a href="#" class="blue d-block">오늘의딜</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	
	<div class="searchBarArea form-group m-auto">
		<svg class="layout-navigation-search__input__icon" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" preserveAspectRatio="xMidYMid meet"><path d="M22 22l-5-5"></path><circle cx="11" cy="11" r="8"></circle></svg>
		<input type="text" id="keyword" class="inline-form form-control" placeholder="검색">
	</div>
	
	<div class="basket">
		<a href="#">
			<svg class="icon blue" width="24" height="24" viewBox="0 0 24 24" stroke="currentColor" fill="none" stroke-linejoin="round" stroke-width="2" preserveAspectRatio="xMidYMid meet">
				<path stroke-linecap="round" d="M4 5h18l-2.6 10.5a2 2 0 0 1-2 1.5H8.6a2 2 0 0 1-2-1.5L4 5zm4 15.5a1.5 1.5 0 1 1 3 0 1.5 1.5 0 1 1-3 0zm7 0a1.5 1.5 0 1 1 3 0 1.5 1.5 0 1 1-3 0z"></path>
				<path d="M1 2h3v3"></path>
			</svg>
		</a>
	</div>
	
	<%-- 로그인 전 --%>
	<c:choose>
		<c:when test="${empty userId}">
			<div class="signMenuArea d-flex">
				<div class="signInBtn font-gray-15 px-2 blue"><a href="/user/sign_in_view">로그인</a></div>
				<div class="signUpBtn font-gray-15 px-2 borderSide blue"><a href="/user/sign_up_view">회원가입</a></div>
				<div class="customerCenterBtn font-gray-15 px-2 blue"><a href="#">고객센터</a></div>
			</div>
		</c:when>
	
	<%-- 로그인 후 --%>
		<c:when test="${not empty userId}">
			<div class="ml-3 userBtnArea">
				<a href="#userMenu" class="d-block img-center bg-dark" id="userBtn">
					<c:if test="${not empty userProfileImage}">
						<img class="img" src="${userProfileImage}" alt="${userNickName}님의 프로필 사진" width="100%">
					</c:if>
					<c:if test="${empty userProfileImage}">
						<div class="w-100 h-100 bg-dark"></div>
					</c:if>
				</a>
			</div>
			<div id="userMenu" class="d-none">
				<ul>
					<li><a href="/user/${userId}" class="myPageeBtn">마이페이지</a></li>
					<li><a href="#" class="myShppingBtn">나의 쇼핑</a></li>
					<li><a href="#" class="userInfoBtn">회원 정보</a></li>
					<li><a href="/user/sign_out" class="logOutBtn">로그아웃</a></li>
				</ul>
			</div>
		</c:when>
	</c:choose>
	
	<a href="#writeMenu" id="createBtn" class="btn ml-3 mr10">
		<span>글쓰기</span>
		<svg class="moreIcon" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
			<path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path>
		</svg>
	</a>
	<div id="writeMenu" class="d-none">
		<ul>
			<li><a href="/post/photo_create_view" class="photoCreateBtn">사진올리기</a></li>
			<li><a href="/post/introduce_create_view" class="introduceCreateBtn">집들이 글쓰기</a></li>
			<li><a href="/post/knowhow_create_view" class="knowhowCreateBtn">노하우 글쓰기</a></li>
			<li><a href="#" class="reviewCreateBtn">상품 리뷰 쓰기</a></li>
		</ul>
	</div>
</div>


<script>
$(document).ready(function() {
	// scroll down할때 메뉴 상단 고정
	let gnbHeight = $('#gnb').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > gnbHeight.top) {
			$('header').css('position', 'fixed');
			$('.subMenu').css('display', 'none');
			
			$('header').mouseover(function() {
				$('.subMenu').css('display', 'flex');
			});
			// 서브메뉴 hover
			$('#communityMenuBtn').mouseover(function() {
				$('#communityMenu').css({"display":"flex", "z-index":"100"});
			});
			$('#communityMenuBtn').mouseout(function() {
				$('#communityMenu').css({"z-index":"0"});
			});
			$('#storeMenuBtn').mouseover(function() {
				$('#storeMenu').css({"display":"flex", "z-index":"100"});
			});
			$('#storeMenuBtn').mouseout(function() {
				$('#storeMenu').css({"z-index":"0"});
			});
		} else {
			$('header').css('position', 'relative');
			$('.subMenu').css('display', 'flex');
		}
	});
	
	// user 버튼 클릭
	$(document).on('click', '#userBtn', function (e){
		e.preventDefault();
		let target = $(this).attr('href');
		$(target).removeClass('d-none');
	});
	// 외부영역 클릭 시 팝업 닫기
	$(document).mouseup(function(e){
		let LayerPopup = $('#userMenu');
		if(LayerPopup.has(e.target).length === 0){
			LayerPopup.addClass('d-none');
		};
	});	
	
	// 글쓰기 버튼 클릭
	$(document).on('click', '#createBtn', function (e){
		e.preventDefault();
		let target = $(this).attr('href');
		$(target).removeClass('d-none');
	});
	// 외부영역 클릭 시 팝업 닫기
	$(document).mouseup(function(e){
		let LayerPopup = $('#writeMenu');
		if(LayerPopup.has(e.target).length === 0){
			LayerPopup.addClass('d-none');
		};
	});	
	
});
</script>