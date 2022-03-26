<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="createHouse" class="w60">
	<div class="requiredArea">
		<button type="button" onclick="openClose()" class="openInputBtn border-1-gray box-radius-5">
			<div>필수 정보 입력</div>
			<div class="arrowIcon">
				<svg class="editor-top-section-expand-icon" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path></svg>
			</div>
		</button>
		<div id="requiredContents" class="requiredContents border-1-gray">
			<div class="required">
				<label for="type" class="requiredLabel">주거형태<span class="redText">*</span></label>
				<div class="requiredContent">
					<select id="type" class="form-control">
						<option value="" selected>선택해주세요.</option>
						<option value="본인 방">본인 방</option>
						<option value="원룸">원룸</option>
						<option value="오피스텔">오피스텔</option>
						<option value="빌라&연립">빌라&연립</option>
						<option value="아파트">아파트</option>
						<option value="연립주택">연립주택</option>
						<option value="협소주택">협소주택</option>
						<option value="상업공간">상업공간</option>
						<option value="사무공간">사무공간</option>
						<option value="기타">기타</option>
					</select>
					<span id="" class="confirm-msg redText d-none"><b>필수 입력 항목입니다.</b></span>
				</div>
			</div>
			
			<div class="required">
				<label for="area" class="requiredLabel">평수<span class="redText">*</span></label>
				<div class="requiredContent">
					<div class="d-flex">
						<input type="text" id="area" class="form-control" onlyNumber> 
						<span>평형</span>
					</div>
					<span class="confirm-msg redText d-none"><b>필수 입력 항목입니다.</b></span>
				</div>
			</div>
			
			<div class="required">
				<label for="familyType" class="requiredLabel">가족형태<span class="redText">*</span></label>
				<div class="requiredContent">
					<select id="familyType" class="form-control">
						<option value="" selected>선택해주세요.</option>
						<option value="싱글라이프">싱글라이프</option>
						<option value="신혼,부부가 사는 집">신혼/부부가 사는 집</option>
						<option value="자녀가 있는 집">자녀가 있는 집</option>
						<option value="부모님과 함께 사는 집">부모님과 함께 사는 집</option>
						<option value="룸메이트와 함께 사는 집">룸메이트와 함께 사는 집</option>
						<option value="기타">기타</option>
					</select>
					<span id="" class="confirm-msg redText d-none"><b>필수 입력 항목입니다.</b></span>
				</div>
			</div>
			
			<div class="required">
				<label for="fieldOfWork" class="requiredLabel">작업분야<span class="redText">*</span></label>
				<div class="requiredContent">
					<select id="fieldOfWork" class="form-control">
						<option value="" selected>선택해주세요.</option>
						<option value="홈스타일링">홈스타일링</option>
						<option value="리모델링">리모델링</option>
						<option value="부분시공">부분시공 </option>
						<option value="건축">건축</option>
					</select>
					<span id="" class="confirm-msg redText d-none"><b>필수 입력 항목입니다.</b></span>
				</div>
			</div>
			
			<div class="required">
				<label for="worker" class="requiredLabel">작업자<span class="redText">*</span></label>
				<div class="requiredContent">
					<select id="worker" class="form-control">
						<option value="" selected>선택해주세요.</option>
						<option value="셀프·DIY">셀프·DIY</option>
						<option value="반셀프">반셀프</option>
						<option value="전문가">전문가</option>
					</select>
					<span id="" class="confirm-msg redText d-none"><b>필수 입력 항목입니다.</b></span>
				</div>
			</div>
		</div>
	</div>
	
	<%-- 커버 이미지 input --%>
	<div class="coverImgArea">
		<input type="file" id="coverImg" accept=".jpg, .jpeg, .gif, .png">
		<div class="coverImgBox img-center">
			<img src="" alt="미리보기 이미지" class="prevImg img d-none reselectBtn" width="500">
			<div class="photoBtn">
				<a href="#"> 
					<img alt="" src="/image/photo.png" width="64">
					<div>커버 사진 올리기</div>
				</a>
			</div>
		</div>
	</div>
	
	<div class="contentArea">
		<input type="text" id="subject" class="mb-2" placeholder="제목을 입력해주세요.">
		<span class="confirm-msg redText d-none"><b>필수 입력 항목입니다.</b></span>
		<textarea id="content" rows="15" placeholder="내용을 입력해주세요."></textarea>
	</div>
	
	<div class="fileArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">첨부파일</div>
		</div>
		<input type="file" id="file" accept=".jpg, .jpeg, .gif, .png" multiple="multiple">
		<span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
	  	<div class="fileListArea my-3" id="fileNameArea">
			<ul class="fileList">
				
			</ul>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 평형 숫자만 입력
	$('input[onlyNumber]').on('keyup', function () {
	    $(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	$('#type').focusout(function() {
		let type = $(this).val();
		if (type == '') {
			$(this).next('.confirm-msg').removeClass('d-none');
			$(this).addClass('border-1-red');
			return;
		} else {
			$(this).next('.confirm-msg').addClass('d-none');
			$(this).removeClass('border-1-red');
			return;
		}
	});
	$('#area').focusout(function() {
		let area = $(this).val();
		if (area == '') {
			$(this).parent().next('.confirm-msg').removeClass('d-none');
			$(this).addClass('border-1-red');
			return;
		} else {
			$(this).parent().next('.confirm-msg').addClass('d-none');
			$(this).removeClass('border-1-red');
			return;
		}
	});
	
	$('#familyType').focusout(function() {
		let familyType = $(this).val();
		if (familyType == '') {
			$(this).next('.confirm-msg').removeClass('d-none');
			$(this).addClass('border-1-red');
			return;
		} else {
			$(this).next('.confirm-msg').addClass('d-none');
			$(this).removeClass('border-1-red');
			return;
		}
	});
	
	$('#fieldOfWork').focusout(function() {
		let fieldOfWork = $(this).val();
		if (fieldOfWork == '') {
			$(this).next('.confirm-msg').removeClass('d-none');
			$(this).addClass('border-1-red');
			return;
		} else {
			$(this).next('.confirm-msg').addClass('d-none');
			$(this).removeClass('border-1-red');
			return;
		}
	});
	
	$('#worker').focusout(function() {
		let worker = $(this).val();
		if (worker == '') {
			$(this).next('.confirm-msg').removeClass('d-none');
			$(this).addClass('border-1-red');
			return;
		} else {
			$(this).next('.confirm-msg').addClass('d-none');
			$(this).removeClass('border-1-red');
			return;
		}
	});
	
	$('.photoBtn').on('click', function(e) {
		e.preventDefault(); 
		$('#coverImg').click();
	});
	
	$('.reselectBtn').on('click', function(e) {
		e.preventDefault();
		$('#coverImg').click();
	});
	
	$("#coverImg").on('change', function() {
		readURL(this);
	});
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			let reader = new FileReader();
			reader.onload = function(e) {
				$('.prevImg').removeClass('d-none');
				$('.prevImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
			$('.photoBtn').addClass('d-none');
		}
	}
	
	$('#subject').keydown(function() {
		let subject = $('#subject').val();
		if (subject == '') {
			$(this).next('.confirm-msg').removeClass('d-none');
			$(this).css('border-bottom', '1px solid rgb(255, 119, 119)');
			return;
		} else {
			$(this).next('.confirm-msg').addClass('d-none');
			$(this).css('border-bottom', '1px solid #d6d6d6');
			return;
		}
	});
	
	
	// file 선택
	let inputFileList = new Array();

	$('#file').change(function(e) {
	    let fileList = $(this)[0].files;  
	    let files = e.target.files;
	    let filesArr = Array.prototype.slice.call(files);
	    
	    filesArr.forEach(function(f){
	    	let reader = new FileReader();
	    	reader.onload = function(e){
	    		inputFileList.push(f);
	    	}
	    	reader.readAsDataURL(f);
	    })
	    
	    for(let i = 0; i < fileList.length; i++){
	        let file = fileList[i];
	        let ext = file.name.toLowerCase().split('.');
	        if (ext.length < 2 || 
					(ext[ext.length - 1] != 'gif'
							&& ext[ext.length - 1] != 'jpg'
							&& ext[ext.length - 1] != 'jpeg'
							&& ext[ext.length - 1] != 'png')) {	
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$(this).val('');	// 잘못된 파일 비워주기
				return;
			} else {
				$('.fileList').append('<li class="fileName mb-1">' + file.name + '<button class="delBtn btn">삭제하기</button></li>');
			}     	
	    }
	});
	
	// saveBtn
	$('.saveBtn').on('click', function() {
		// validation check
		let type = $('#type').val();
		if (type == '') {
			alert('주거형태를 선택해주세요.');
			return;
		}
		let area = $('#area').val().trim();
		if (area == '') {
			alert('평형정보를 입력해주세요.');
			return;
		}
		let familyType =  $('#familyType').val();
		if (familyType == '') {
			alert('가족형태를 선택해주세요.');
			return;
		}
		let fieldOfWork = $('#fieldOfWork').val();
		if (fieldOfWork == '') {
			alert('작업분야를 선택해주세요.');
			return;
		}
		let worker = $('#worker').val();
		if (worker == '') {
			alert('작업자를 선택해주세요.');
			return;
		}
		let coverImg = $('#coverImg').val();
		if (coverImg == '') {
			alert('커버이미지를 업로드해주세요.');
			return;
		} else if (coverImg != '') {
			let ext = coverImg.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#file').val('');	// 선택된 파일을 비운다.
				return;
			}
		}
		let subject = $('#subject').val();
		if (subject == '') {
			alert('제목을 입력해주세요.');
			return;
		}
		let content = $('#content').val();
		if (content == '') {
			alert('내용을 입력해주세요.');
			return;
		}
		let formData = new FormData();
		formData.append('postType', 'IntroduceHouse');
		formData.append('type', type);
		formData.append('area', area);
		formData.append('familyType', familyType);
		formData.append('fieldOfWork', fieldOfWork);
		formData.append('worker', worker);
		formData.append('coverImageFile', $('#coverImg')[0].files[0]);
		formData.append('subject', subject);
		formData.append('content', content);

		for(let i = 0; i < inputFileList.length; i++){
			// 이미지 값
			formData.append("images", inputFileList[i]);
		}
		
		// ajax
		$.ajax({
			type: "POST"
			, url: "/post/introduce_create"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.result == "success") {
					alert("글이 등록되었습니다.");
					location.href = "/community";
				} else {
					alert(data.errorMessage);
					location.href = "/community";
				}
			}
		});
	});
	
});
//openInputBtn click
function openClose() {
	let status = $('.requiredContents').css('display');
	if (status == 'none') {
		$('.arrowIcon').css('transform', 'rotate(180deg)');
		$('.openInputBtn').css({'border-radius':'5px 5px 0 0', 'border-bottom': '0'});
		$('.requiredContents').show();
	} else {
		$('.arrowIcon').css('transform', 'rotate(-180deg)');
		$('.openInputBtn').css({'border-radius':'5px', 'border': '1px solid #d6d6d6'});
		$('.requiredContents').hide();
	}  
}
</script>