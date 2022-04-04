<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="nav">
	<ul class="mainMyMenu">
		<li class="profileTab"><a href="/user/${userId}" class="blue">프로필</a>
			<ul class="subMyMenu">
				<li><a href="/user/${userId}" class="blue">모두보기</a></li>
				<li><a href="/user/${userId}/photo" class="profileMenu blue" data-menu="photo">사진</a></li>
				<li><a href="/user/${userId}/introduce" class="profileMenu blue" data-menu="introduceHouse">집들이</a></li>
				<li><a href="/user/${userId}/knowhow" class="profileMenu blue" data-menu="knowhow">노하우</a></li>
			</ul>
		</li>
		<li class="myShoppintab"><a href="" class="blue">나의 쇼핑</a>
			<ul class="myShoppingMenu subMyMenu">
				<li class=""><a href="" class="blue">주문내역조회</a></li>
				<li class=""><a href="" class="blue">상품문의내역</a></li>
			</ul>
		</li>
		<li class="configTab"><a href="/user/${userId}/update" class="blue">설정</a>
			<ul class="configMenu subMyMenu">
				<li class=""><a href="/user/${userId}/update" class="blue">회원정보수정</a></li>
				<li class=""><a href="/user/${userId}/edit-password" class="blue">비밀번호변경</a></li>
			</ul>
		</li>
	</ul>
</div>

<script>
$(document).ready(function() {
	/* $('.profileMenu').on('click', function(e) {
		e.preventDefault();
		let profileMenu = $(this).data('menu');
		console.log(profileMenu);
	}); */
});
</script>