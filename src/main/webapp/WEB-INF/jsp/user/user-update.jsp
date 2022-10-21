<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="myInfoUpdate" class="w500">
	<div class="title">회원정보수정</div>
	
	<%-- 이메일 --%>
	<div class="signUpInput form-group mb-3">
		<label for="email">이메일</label>
		<div class="d-flex">
			<input type="text" id="email" class="form-control" placeholder="이메일 주소">
			<div class="mx-1 mt-1">@</div>
			<select class="form-control" id="emailDomain" name="emailDomain">
				<option value="" selected>선택하기</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="outlook.com">outlook.com</option>
				<option value="icloud.com">icloud.com</option>
				<option value="etcEmail">직접입력</option>
			</select>
			<input type="text" id="etcDomain" class="form-control d-none">
		</div>
	</div>
	
	<%-- 프로필 사진 --%>
	<div class="signUpInput form-group mb-3">
		<label for="profileImage">프로필 사진</label>
		<input type="file" id="profileImage" class="form-control" accept=".jpg, .jpeg, .gif, .png">
	</div>
	
	<%-- 한줄 소개 --%>
	<div class="signUpInput form-group mb-3">
		<label for="introduceMySelf">한줄소개</label>
		<input type="text" id="introduceMySelf" class="form-control" placeholder="자기소개">
	</div>
	
	<button type="button" id="updateBtn" data-user-id="${userId}" class="btn btn-block">회원정보수정</button>
</div>

<script>
$(document).ready(function() {
	let id = $(updateBtn).data('user-id');
	if (id != ${user.user.id}) {
		alert("잘못된 접근입니다.");
		location.href = "/user/" + ${user.user.id};
		return;
	}
	
	let email = '${user.user.email}';
	let emailArr = email.split('@');
	$('#email').val(emailArr[0]);
	$('#emailDomain').val(emailArr[1]);
	$('#introduceMySelf').val('${user.user.introduce}');
	
	
	// 이메일 주소
	$('#emailDomain').change(function() {
		// 직접입력
		if ($('#emailDomain').val() == 'etcEmail') {
			$('#emailDomain').addClass('d-none');
			$('#etcDomain').removeClass('d-none');
			$('#etcDomain').val('').focus();
			return;
		} else {
			$('#emailDomain').removeClass('d-none');
			$('#etcDomain').addClass('d-none');
		}
	});
	
	// 사용자가 파일 업로드를 했을 때, 유효성 확인 및 업로드 된 파일 이름 노출
	$('#profileImage').on('change', function(e) {
		let fileName = e.target.files[0].name;
		// alert(fileName);
		
		fileName = fileName.toLowerCase();
		let extension = fileName.split('.');
		
		// 확장자 유효성 확인
		if (extension.length < 2 || 
				(extension[extension.length - 1] != 'gif'
						&& extension[extension.length - 1] != 'jpg'
						&& extension[extension.length - 1] != 'jpeg'
						&& extension[extension.length - 1] != 'png')) {	
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val('');	// 잘못된 파일 비워주기
			return;
		}
	});
	
	
	// 정보수정
	$('#updateBtn').on('click', function() {
		// email validation
		let emailId = $('#email').val().trim();
		let emailDomain = $("#emailDomain option:selected").val();
		
		if (emailId == '') {
			alert("이메일주소를 입력해주세요.");
			return;
		}
		if (emailDomain == 'etcEmail') {
			emailDomain = $('#etcDomain').val().trim();
		}
		if (emailDomain == '') {
			alert("이메일주소를 선택해주세요.");
			return;
		}
		
		let email = emailId + '@' + emailDomain;
		
		// 프로필 이미지
		// 파일이 업로드 된 경우 확장자 체크
		let file = $('#profileImage').val();
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#file').val('');	// 선택된 파일을 비운다.
				return;
			}
		}
		
		// 자기소개
		let introduce = $('#introduceMySelf').val();
		
		
		// 폼태그 만들기
		let formData = new FormData();
		formData.append('id', ${userId});
		formData.append('loginId', "${userLoginId}");
		formData.append('email', email);
		formData.append('introduce', introduce);
		formData.append('file', $('#profileImage')[0].files[0]);
		
		// AJAX
		$.ajax({
			type: "PUT"
			, url: "/user/update"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false 
			, success: function(data) {
				if (data.result == "success") {
					alert("회원정보수정이 완료되었습니다.");
					location.href = "/user/${userId}"
				} else {
					alert(result.errorMessage);
					location.reload();
				}
			}
			, error: function(e) {
				alert("회원정보수정에 실패했습니다. 관리자에게 문의해 주세요.");
			}
		});
	});
	
});
</script>