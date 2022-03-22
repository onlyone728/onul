<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w360">
	<div class="font font40 text-center mb-3">
		<a href="/community">오늘의집</a>
	</div>
	<div class="signUpInput form-group mb-2">
		<label for="loginId">아이디</label>
		<input type="text" id="loginId" class="form-control" placeholder="아이디">
		<span id="is_duplicated_id" class="confirm-msg d-none redText">중복된 아이디입니다.</span>
		<span id="is_available_id" class="confirm-msg d-none text-success">사용가능한 아이디입니다.</span>
		<span id="none_id" class="confirm-msg redText d-none">아이디를 입력해주세요.</span>
	</div>
	
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
	
	<div class="signUpInput form-group mb-3">
		<label for="nickName">닉네임</label>
		<small class="d-block mb-2 text-secondary">다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</small>
		<input type="text" id="nickName" class="form-control" placeholder="별명(2~15자)">
		<span id="is_duplicated_nickname" class="confirm-msg redText d-none">중복된 닉네임입니다.</span>
		<span id="available_nickname" class="confirm-msg text-success d-none">사용가능한 닉네임입니다.</span>
		<span id="length_nickname" class="confirm-msg redText d-none">2자 이상 15자 이하로 입력해주세요.</span>
		<span id="empty_nickname" class="confirm-msg redText d-none">닉네임을 입력해주세요.</span>
	</div>
	
	<div class="signUpInput form-group mb-3">
		<label for="name">이름</label>
		<input type="text" id="name" class="form-control" placeholder="이름">
	</div>
	<div class="signUpInput form-group mb-3">
		<label for="email">이메일</label>
		<div class="d-flex">
			<input type="text" id="email" class="form-control" placeholder="이메일 주소">
			<div class="mx-1">@</div>
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
	
	<div class="signUpInput form-group mb-3">
		<label for="profileImage">프로필 사진</label>
		<input type="file" id="profileImage" class="form-control" accept=".jpg, .jpeg, .gif, .png">
	</div>
	
	<div class="signUpInput form-group">
		<label for="agreement">약관동의</label>
		<div class="border-1-gray agreementBox">
			<div class="allAgree">
				<label class="d-flex">
					<div class="agree-checkbox">
						<input type="checkbox" name="terms" id="selectAll">
						<span class="cb"></span>
					</div>
					<div class="checkLabel">전체동의</div>
				</label>
			</div>
			
			<div class="agree">
				<label class="d-flex">
					<div class="agree-checkbox">
						<input type="checkbox" name="terms" id="over14">
						<span class="cb"></span>
					</div>
					<div class="checkLabel">만 14세 이상입니다.<small class="blueText ">(필수)</small></div>
				</label>
			</div>
			
			<div class="agree">
				<label class="d-flex">
					<div class="agree-checkbox">
						<input type="checkbox" name="terms" id="usepolicy">
						<span class="cb"></span>
					</div>
					<div class="checkLabel"><a href="#">이용 약관</a><small class="blueText ">(필수)</small></div>
				</label>
			</div>
			
			<div class="agree">
				<label class="d-flex">
					<div class="agree-checkbox">
						<input type="checkbox" name="terms" id="privacy">
						<span class="cb"></span>
					</div>
					<div class="checkLabel"><a href="#">개인정보수집 및 이용동의</a><small class="blueText ">(필수)</small></div>
				</label>
			</div>
			
			<div class="agree">
				<label class="d-flex">
					<div class="agree-checkbox">
						<input type="checkbox" name="terms" id="adAgree">
						<span class="cb"></span>
					</div>
					<div class="checkLabel">이벤트, 프로모션 알림 메일 및 SMS 수신<small class="grayText ">(선택)</small></div>
				</label>
			</div>
		</div>
	</div>
	
	<!-- 가입버튼 -->
	<button type="button" id="signUpBtn" class="btn btn-block">회원가입하기</button>
	
	<div class="text-center goToSignIn">
		<span>이미 아이디가 있으신가요?</span>
		<a href="/user/sign_in_view">로그인</a>
	</div>
</div>

<script>
$(document).ready(function() {
	// 체크박스 전체 선택 기능
	$("#selectAll").click(function() {
		if ($("#selectAll").is(":checked")) {
			$("input[name=terms]").prop("checked", true);
		} else {
			$("input[name=terms]").prop("checked", false);
		}
	});

	$("input[name=terms]").click(function() {
		let total = $("input[name=terms]").length;
		let checked = $("input[name=terms]:checked").length;

		if (total != checked) {
			$("#selectAll").prop("checked", false);
		} else {
			$("#selectAll").prop("checked", true); 
		}
	});
	
	// 아이디 중복 확인
	$('#loginId').focusout(function() {
		let loginId = $('#loginId').val().trim();
		
		if (loginId == '') {
			$('#none_id').removeClass('d-none');
			$('#is_available_id').addClass('d-none');
			$('#is_duplicated_id').addClass('d-none');
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/user/is_duplicated_id"
			, data: {"loginId": loginId}
			, success: function(data) {
				if (data.result == true) {
					// 중복일 때
					$('#is_duplicated_id').removeClass('d-none');
					$('#is_available_id').addClass('d-none');
					$('#none_id').addClass('d-none');
					$('#loginId').val('').focus();
					return;
				} else if (data.result == false){
					$('#is_duplicated_id').addClass('d-none');
					$('#none_id').addClass('d-none');
					$('#is_available_id').removeClass('d-none');
					return;
				} 
			}
			, error: function(e) {
				alert("관리자에게 문의하세요.");
			}
		});
	});	
		
		
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
	
	// 닉네임 중복 확인
	$('#nickName').on('change', function() {
		let nickName = $('#nickName').val();
		
		if (nickName == '') {
			$('#empty_nickname').removeClass('d-none');
			$('#length_nickname').addClass('d-none');
			$('#available_nickname').addClass('d-none');
			$('#is_duplicated_nickname').addClass('d-none');
			$('#nickName').val('').focus();
			return;
		} else if (nickName.length < 2 || nickName.length > 15) {
			$('#empty_nickname').addClass('d-none');
			$('#length_nickname').removeClass('d-none');
			$('#available_nickname').addClass('d-none');
			$('#is_duplicated_nickname').addClass('d-none');
			$('#nickName').val('').focus();
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/user/is_duplicated_nickname"
			, data: {"nickName" : nickName}
			, success: function(data) {
				if (data.result == true) {	// 중복일때
					$('#empty_nickname').addClass('d-none');
					$('#length_nickname').addClass('d-none');
					$('#available_nickname').addClass('d-none');
					$('#is_duplicated_nickname').removeClass('d-none');
					$('#nickName').val('').focus();
					return;
				} else if (data.result == false) {	// 중복이 아닐때
					$('#empty_nickname').addClass('d-none');
					$('#length_nickname').addClass('d-none');
					$('#available_nickname').removeClass('d-none');
					$('#is_duplicated_nickname').addClass('d-none');
					return;
				}
			}
			, error: function(e) {
				alert("관리자에게 문의하세요.");
			}
		});
	});
	
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
	
	
	// 회원가입
	$('#signUpBtn').on('click', function() {
		// loginId validation
		let loginId = $('#loginId').val().trim();
		if (loginId == '') {
			alert("아이디를 입력해주세요.");
			return;
		}
		if ($('#is_available_id').hasClass('d-none')) {
			alert("아이디를 확인해주세요.");
			return;
		}
		
		// password validation
		let password = $('#password').val().trim();
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if ($('#pw-check').hasClass('d-none') == false){
			alert("비밀번호 확인을 해주세요.");
			return;
		}
		
		// nickName validation
		let nickName = $('#nickName').val();
		if (nickName == '') {
			alert("닉네임을 입력해주세요.");
			return;
		}
		if ($('#available_nickname').hasClass('d-none')) {
			alert("닉네임을 확인해주세요.");
			return;
		}
		
		// name validation
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력해주세요.");
			return;
		}
		
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
		
		// 이용약관
		if ($('#over14').is(':checked') == false) {
			alert("약관에 동의해주세요.");
			return;
		}
		if ($('#usepolicy').is(':checked') == false) {
			alert("약관에 동의해주세요.");
			return;
		}
		if ($('#privacy').is(':checked') == false) {
			alert("약관에 동의해주세요.");
			return;
		}
		
		let adAgree = $('#adAgree').is(':checked');
		
		// 폼태그 만들기
		let formData = new FormData();
		formData.append('loginId', loginId);
		formData.append('password', password);
		formData.append('nickName', nickName);
		formData.append('name', name);
		formData.append('email', email);
		formData.append('adAgree', adAgree);
		
		// input class 값 
		var fileInput = $('#profileImage');
		// fileInput 개수를 구한다.
		for (var i = 0; i < fileInput.length; i++) {
			if (fileInput[i].files.length > 0) {
				for (var j = 0; j < fileInput[i].files.length; j++) {
					console.log(" fileInput[i].files[j] :::"+ fileInput[i].files[j]);
					
					// formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.  
					formData.append('file', $('#profileImage')[i].files[j]);
				}
			}
		}
		
		// AJAX
		$.ajax({
			type: "POST"
			, url: "/user/sign_up"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false 
			, success: function(data) {
				if (data.result == "success") {
					alert("회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
					location.href = "/user/sign_in_view"
				} else {
					alert(result.errorMessage);
					location.href = "/user/sign_up_view"
				}
			}
			, error: function(e) {
				alert("회원가입에 실패했습니다. 관리자에게 문의해 주세요.");
			}
		});
	});
	
});
</script>