<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="gnb" class="d-flex align-items-center h-100">
	<div class="ml10 font font40 mr-3">
		<a href="#">오늘의집</a>
	</div>
	<nav class="h-100">
		<ul id="mainMenu" class="nav">
			<li id="communityMenuBtn" class="nav-item">
				<a href="#" class="nav-link blue">커뮤니티</a>
				<ul id="communityMenu" class="subMenu">
					<li><a href="#" class="blue">홈</a></li>
					<li><a href="#" class="blue">사진</a></li>
					<li><a href="#" class="blue">집들이</a></li>
					<li><a href="#" class="blue">노하우</a></li>
				</ul>
			</li>	
			<li id="storeMenuBtn" class="nav-item">
				<a href="#" class="nav-link blue">스토어</a>
				<ul id="storeMenu" class="subMenu">
					<li><a href="#" class="blue">스토어홈</a></li>
					<li><a href="#" class="blue">카테고리</a></li>
					<li><a href="#" class="blue">베스트</a></li>
					<li><a href="#" class="blue">오늘의딜</a></li>
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
	<div class="signMenuArea d-flex">
		<div class="signInBtn font-gray-15 px-2"><a href="#">로그인</a></div>
		<div class="signUpBtn font-gray-15 px-2 borderSide"><a href="#">회원가입</a></div>
		<div class="customerCenterBtn font-gray-15 px-2"><a href="#">고객센터</a></div>
	</div>
	
	<%-- 로그인 후 --%>
	<!-- <div class="userBtn ml-3">
		<a href="#">
			<img src="" alt="님의 프로필 사진">
		</a>
	</div> -->
	
	<button type="button" id="createBtn" class="btn ml-3 mr10">
		<span>글쓰기</span>
		<svg class="moreIcon" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
			<path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path>
		</svg>
	</button>
</div>


<script>
$(document).ready(function() {
	// scroll down할때 메뉴 상단 고정
	let gnbHeight = $('#gnb').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > gnbHeight.top) {
			$('header').css('position', 'fixed');
			$('.subMenu').css('display', 'none');
			
			// 서브메뉴 hover
			$('#communityMenuBtn').mouseover(function() {
				$('#communityMenu').css({"display":"flex", "z-index":"100"});
			});
			$('#communityMenuBtn').mouseout(function() {
				$('#communityMenu').css({"display":"none", "z-index":"0"});
			});
			$('#storeMenuBtn').mouseover(function() {
				$('#storeMenu').css({"display":"flex", "z-index":"100"});
			});
			$('#storeMenuBtn').mouseout(function() {
				$('#storeMenu').css({"display":"none", "z-index":"0"});
			});
		} else {
			$('header').css('position', 'relative');
			$('.subMenu').css('display', 'flex');
		}
	});
	
	
});
</script>