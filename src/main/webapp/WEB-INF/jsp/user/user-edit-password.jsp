<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<div id="myInfoUpdate" class="w500">
	<div class="title">비밀번호 변경</div>
	
	<div class="signUpInput form-group mb-3">
		<label for="password">비밀번호</label>
		<small class="d-block mb-2 text-secondary">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</small>
		<input type="password" id="password" class="form-control" placeholder="비밀번호">
		<span id="pwEmpty" class="confirm-msg redText d-none">비밀번호를 입력해주세요.</span>
		<span id="pwUnder8" class="confirm-msg redText d-none">비밀번호를 8자 이상 입력해주세요.</span>
		<span id="pwBlank" class="confirm-msg redText d-none">비밀번호는 공백 없이 입력해주세요.</span>
		<span id="pwMix" class="confirm-msg redText d-none">숫자와 영문자를 혼용하여야 합니다.</span>
		<span id="pwSameChar" class="confirm-msg redText d-none">같은 문자를 4번 이상 사용하실 수 없습니다.</span>
	</div>
	
	<div class="signUpInput form-group mb-3">
		<label for="confirm-password">비밀번호 확인</label>
		<input type="password" id="confirm-password" class="form-control" placeholder="비밀번호 확인">
		<span id="pw-check" class="confirm-msg redText d-none">비밀번호가 일치하지 않습니다.</span>
	</div>
	
	<button type="button" id="updateBtn" class="btn btn-block" data-user-id="${userId}">비밀번호 변경</button>
</div>    

<script>
$(document).ready(function() {
	let id = $(updateBtn).data('user-id');
	if (id != ${user.user.id}) {
		alert("잘못된 접근입니다.");
		location.href = "/user/" + ${user.user.id};
		return;
	}
	
	// 비밀번호 
	$("#password").on('change', function(){
	    let password = $('#password').val();
		if (password.length < 1) {
	    	$('#pwEmpty').removeClass('d-none');
			$('#pwUnder8').addClass('d-none');
			$('#pwBlank').addClass('d-none');
			$('#pwMix').addClass('d-none');
			$('#pwSameChar').addClass('d-none');
			$('#pwContainId').addClass('d-none');
	        $('#password').val('').focus();
	        return false;
	    }
	    
		if (password.length < 8) {
	    	$('#pwEmpty').addClass('d-none');
			$('#pwUnder8').removeClass('d-none');
			$('#pwBlank').addClass('d-none');
			$('#pwMix').addClass('d-none');
			$('#pwSameChar').addClass('d-none');
			$('#pwContainId').addClass('d-none');
	        $('#password').val('').focus();
	        return false;
	    }
		
	    let checkNumber = password.search(/[0-9]/g);
	    let checkEnglish = password.search(/[a-z]/ig);
	    
	    if (checkNumber < 0 || checkEnglish < 0) {
	    	$('#pwEmpty').addClass('d-none');
			$('#pwUnder8').addClass('d-none');
			$('#pwBlank').addClass('d-none');
			$('#pwMix').removeClass('d-none');
			$('#pwSameChar').addClass('d-none');
	        $('#password').val('').focus();
	        return false;
	    }
	    if (/(\w)\1\1\1/.test(password)) {
	    	$('#pwEmpty').addClass('d-none');
			$('#pwUnder8').addClass('d-none');
			$('#pwBlank').addClass('d-none');
			$('#pwMix').addClass('d-none');
			$('#pwSameChar').removeClass('d-none');
	        $('#password').val('').focus();
	        return false;
	    }
	    $('#pwEmpty').addClass('d-none');
		$('#pwUnder8').addClass('d-none');
		$('#pwBlank').addClass('d-none');
		$('#pwMix').addClass('d-none');
		$('#pwSameChar').addClass('d-none');
	    
	    return true;
	});
	
	
	// 비밀번호 중복 확인
	$('#confirm-password').on('change', function() {
		let confirmPw = $('#confirm-password').val();
		let pw = $('#password').val();
		
		if (pw != confirmPw) {
			$('#pw-check').removeClass('d-none');
			$('#confirm-password').val('').focus();
			return;
		} else {
			$('#pw-check').addClass('d-none');
		}
	});
	
	// 비밀번호 저장
	$('#updateBtn').on('click', function() {
		let password = $('#password').val().trim();
		let id = $(this).data('user-id');
		
		$.ajax({
			type: "PUT"
			, url: "/user/edit_password"
			, data: {"password":password, "id":id}
			, success: function(data) {
				if (data.result == "success") {
					alert("비밀번호가 변경되었습니다.");
					location.href = "/user/" + id;
				} else {
					alert(data.errorMessage);
					location.reload();
				}
			}
			, error: function(e){
				alert("비밀번호 변경에 실패하였습니다.");
				location.reload();
			}
		});
	});
});
</script>