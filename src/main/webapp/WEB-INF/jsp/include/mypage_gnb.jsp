<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<div class="nav">
	<ul class="mainMyMenu">
		<li class="profileTab"><a href="/user/${user.user.id}" class="blue">프로필</a>
			<ul class="subMyMenu">
				<c:if test="${userId == user.user.id}">
					<li><a href="/user/${userId}" class="blue">모두보기</a></li>
					<li><a href="/user/${userId}/photo" class="profileMenu blue" data-menu="photo">사진</a></li>
					<li><a href="/user/${userId}/introduce" class="profileMenu blue" data-menu="introduceHouse">집들이</a></li>
					<li><a href="/user/${userId}/knowhow" class="profileMenu blue" data-menu="knowhow">노하우</a></li>
				</c:if>
				<c:if test="${userId != user.user.id}">
					<li><a href="/user/${user.user.id}" class="blue">모두보기</a></li>
					<li><a href="/user/${user.user.id}/photo" class="profileMenu blue" data-menu="photo">사진</a></li>
					<li><a href="/user/${user.user.id}/introduce" class="profileMenu blue" data-menu="introduceHouse">집들이</a></li>
					<li><a href="/user/${user.user.id}/knowhow" class="profileMenu blue" data-menu="knowhow">노하우</a></li>
				</c:if>
			</ul>
		</li>
		<c:if test="${userId == user.user.id}">
			<li class="myShoppintab"><a href="" class="blue">나의 쇼핑</a>
				<ul class="myShoppingMenu subMyMenu">
					<li class=""><a href="" class="blue">주문내역조회</a></li>
					<li class=""><a href="" class="blue">상품문의내역</a></li>
				</ul>
			</li>
			<li class="configTab"><a href="/user/${user.user.id}/update" class="blue">설정</a>
				<ul class="configMenu subMyMenu">
					<li class=""><a href="/user/${user.user.id}/update" class="blue">회원정보수정</a></li>
					<li class=""><a href="/user/${user.user.id}/edit-password" class="blue">비밀번호변경</a></li>
				</ul>
			</li>
		</c:if>
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