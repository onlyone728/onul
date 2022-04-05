<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="w80 adminSignUp">
	<div class="font font40 text-center mb-5">오늘의집 입점신청</div>
	
	<div class="infoArea">
		<label class="infoLabel">로그인 정보</label>
		<div class="d-flex">
			<label for="loginId" class="titleLabel">아이디<span class="redText">*</span></label>
			<div>
				<input type="text" id="loginId" class="line-1">
				<div>
					<span id="is_duplicated_id" class="confirm-msg d-none redText">중복된 아이디입니다.</span>
					<span id="is_available_id" class="confirm-msg d-none text-success">사용가능한 아이디입니다.</span>
					<span id="none_id" class="confirm-msg redText d-none">아이디를 입력해주세요.</span>
				</div>
			</div>
		</div>
		
		<div class="d-flex mt-2">
			<label for="password" class="titleLabel">비밀번호<span class="redText">*</span></label>
			<div>
				<input type="password" id="password" class="line-1">
				<div>
					<span id="pwEmpty" class="confirm-msg redText d-none">비밀번호를 입력해주세요.</span>
					<span id="pwUnder8" class="confirm-msg redText d-none">비밀번호를 8자 이상 입력해주세요.</span>
					<span id="pwBlank" class="confirm-msg redText d-none">비밀번호는 공백 없이 입력해주세요.</span>
					<span id="pwMix" class="confirm-msg redText d-none">숫자와 영문자를 혼용하여야 합니다.</span>
					<span id="pwSameChar" class="confirm-msg redText d-none">같은 문자를 4번 이상 사용하실 수 없습니다.</span>
				</div>
			</div>
		</div>
		<div class="d-flex mt-2">
			<label for="confirm-password" class="titleLabel">비밀번호 확인<span class="redText">*</span></label>
			<div>
				<input type="password" id="confirm-password" class="line-1">
				<div>
					<span id="pw-check" class="confirm-msg redText d-none">비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="infoArea">
		<label class="infoLabel">스토어 정보</label>
		<div class="d-flex">
			<label for="storeName" class="titleLabel">스토어 이름<span class="redText">*</span></label>
			<input type="text" id="storeName" class="line-1" placeholder="오늘의집">
		</div>
		<div class="d-flex">
			<label for="storeImage" class="titleLabel">스토어 대표사진</label>
			<input type="file" id="file" class="d-none" accept=".jpg, .jpeg, .gif, .png">
			<div class="d-flex">
				<button type="button" class="btn imgBtn">사진 선택</button>
				<div class="ml-2" id="fileName"></div>
			</div>
		</div>
		<div class="d-flex mt-2">
			<label for="businessNumber1" class="titleLabel">사업자등록번호<span class="redText">*</span></label>
			<div class="d-flex">
				<input type="text" id="businessNumber1" placeholder="123" maxlength="3" onlyNumber>
				<span class="ml-1"  style="width:15px; line-height: 40px;">-</span>
				<input type="text" id="businessNumber2" placeholder="45" maxlength="2" onlyNumber>
				<span class="ml-1" style="width:15px; line-height: 40px;">-</span>
				<input type="text" id="businessNumber3" placeholder="67890" maxlength="5" onlyNumber>
			</div>
		</div>
	</div>
	
	<div class="infoArea">
		<label class="infoLabel">담당자 정보</label>
		<div class="d-flex">
			<label for="name" class="titleLabel">담당자 이름<span class="redText">*</span></label>
			<input type="text" id="name" class="line-1" placeholder="홍길동">
		</div>
		<div class="d-flex mt-2">
			<label for="phoneNumber" class="titleLabel">전화번호<span class="redText">*</span></label>
			<div class="d-flex">
				<input type="text" id="phoneNumber1" placeholder="010" maxlength="3" onlyNumber>
				<span class="ml-1" style="width:15px; line-height: 40px;">-</span>
				<input type="text" id="phoneNumber2" placeholder="1234" maxlength="4" onlyNumber>
				<span class="ml-1" style="width:15px; line-height: 40px;">-</span>
				<input type="text" id="phoneNumber3" placeholder="5678" maxlength="4" onlyNumber>
			</div>
		</div>
		<div class="d-flex mt-2">
			<label for="email" class="titleLabel">이메일<span class="redText">*</span></label>
			<input type="text" id="email" class="line-1" placeholder="gildong@company.com">
		</div>
	</div>
	
	<div class="infoArea">
		<label class="infoLabel">개인정보 수집 및 이용 동의</label>
		<table class="table text-center">
			<thead>
				<tr>
					<th>목적</th>
					<th>항목</th>
					<th>보유기간</th>
				</tr>	
			</thead>
			<tbody>
				<tr>
					<td>판매자 식별, 입점 검토, 공지사항의 전달</td>
					<td>담당자의 이름/전화번호/이메일</td>
					<td>입점 처리기간이 종료되는 시점</td>
				</tr>
			</tbody>
		</table>
		<div class="agreementBox">
			<div class="agree">
				<label class="d-flex justify-content-center" for="terms">
					<div class="agree-checkbox l-5">
						<input type="checkbox" name="terms" id="terms">
						<span class="cbc"></span>
					</div>
					<div class="checkLabel2">입점신청을 위한 개인정보 수집 및 이용에 동의<span class="blueText "> (필수)</span></div>
				</label>
			</div>
		</div>
	</div>	
	<div class="d-flex justify-content-center">
		<button type="button" id="storeJoinBtn" class="btn">입점신청 완료</button>
	</div>
</div>

<script>
$(document).ready(function() {
	// input 숫자만
	$('input[onlyNumber]').on('keyup', function () {
	    $(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	// 사진 선택
	$('.imgBtn').on('click', function() {
		$('#file').click();
	});
	
	$('#file').on('change', function(e) {
		let fileName = e.target.files[0].name; // ex) image.png
		//alert(fileName);
		let extension = fileName.split('.');
	
		// 확장자 유효성 확인
		if (extension.length < 2 || 
				(extension[extension.length - 1] != 'gif'
					&& extension[extension.length - 1] != 'jpeg'
					&& extension[extension.length - 1] != 'jpg'
					&& extension[extension.length - 1] != 'png')) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val(''); // 비워주어야 한다.
			$('#fileName').text(''); // 파일 이름도 비워줌
			return;
		}
		
		$('#fileName').text(fileName);
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
			, url: "/store/is_duplicated_id"
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
				return;
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
	$('#storeJoinBtn').on('click', function() {
		// loginId validation
		let loginId = $('#loginId').val().trim();
		if (loginId == '') {
			alert("아이디를 입력해주세요.");
			$('#loginId').focus();
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
			$('#password').val('');
			$('#password').focus();
			return;
		}
		if ($('#pw-check').hasClass('d-none') == false){
			alert("비밀번호 확인을 해주세요.");
			$('#confirm-password').val('');
			$('#confirm-password').focus();
			return;
		}
		
		// storeName
		let storeName = $('#storeName').val().trim();
		if (storeName == '') {
			alert("스토어 이름을 입력해주세요.");
			$('#storeName').val('');
			$('#storeName').focus();
			return;
		}
		
		// businessNumber
		let bn1 = $('#businessNumber1').val().trim(); 
		let bn2 = $('#businessNumber2').val().trim(); 
		let bn3 = $('#businessNumber3').val().trim(); 
		let businessNumber =  bn1 + bn2 + bn3;
		if (businessNumber.length < 10) {
			alert('사업자등록번호를 확인해주세요.');
			$('businessNumber1').focus();
			return;
		}
		
		// name validation
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력해주세요.");
			return;
		}
		
		// phoneNumber
		let pn1 = $('#phoneNumber1').val().trim();
		let pn2 = $('#phoneNumber2').val().trim();
		let pn3 = $('#phoneNumber3').val().trim();
		let phoneNumber = pn1 + pn2 + pn3;
		
		// email validation
		let email = $('#email').val().trim();
		
		if (email == '') {
			alert("이메일주소를 입력해주세요.");
			return;
		} else if (email.indexOf('@') == -1) {
			alert('이메일 형식이 잘못되었습니다.');
			$('#email').val('');
			$('#email').focus();
			return;
		}
		
		// 프로필 이미지
		// 파일이 업로드 된 경우 확장자 체크
		let file = $('#file').val();
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#fileName').val('');	// 선택된 파일을 비운다.
				return;
			}
		}
		
		// 이용약관
		if ($('#terms').is(':checked') == false) {
			alert("약관에 동의해주세요.");
			return;
		}
		
		// 폼태그 만들기
		let formData = new FormData();
		formData.append('loginId', loginId);
		formData.append('password', password);
		formData.append('storeName', storeName);
		formData.append('businessNumber', businessNumber);
		formData.append('name', name);
		formData.append('phoneNumber', phoneNumber);
		formData.append('email', email);
		formData.append('file', $('#file')[0].files[0]);
		
		// AJAX
		$.ajax({
			type: "POST"
			, url: "/store/sign_up"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false 
			, success: function(data) {
				if (data.result == "success") {
					alert("회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
					location.href = "/admin"
				} else {
					alert(result.errorMessage);
					location.href = "/admin"
				}
			}
			, error: function(e) {
				alert("회원가입에 실패했습니다. 관리자에게 문의해 주세요.");
			}
		});
	});
	
});
</script>