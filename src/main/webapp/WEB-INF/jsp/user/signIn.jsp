<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w300 loginBox h-100 d-flex align-items-center">
	<div class="signInArea w-100">
		<div class="font font40 text-center">
			<a href="/community">오늘의집</a>
		</div>
		<form id="loginForm" method="post" action="/user/sign_in">
			<input type="text" id="loginId" name="loginId" class="form-control font-size" placeholder="아이디">
			<input type="password" id="password" name="password" class="form-control font-size" placeholder="비밀번호">
			<button type="submit" id="login-btn" class="btn btn-block">로그인</button>
			<hr>
			<a href="/user/sign_up_view" id="join-btn" class="btn btn-block">회원가입</a>
		</form>
	</div>
</div>

<script>
$(document).ready(function() {
	// 로그인
	$('#loginForm').on('submit', function(e) {
		e.preventDefault();
		
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		
		// validate
		if (loginId == '') {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		// ajax 호출
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.result == 'success') {
			    location.href = "/community";    // 메인페이지로 
			} else {
				alert(data.errorMessage);
			}
		});
	});
});
</script>