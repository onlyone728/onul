<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="createknowhow" class="w60">
	<div class="requiredArea">
		<button type="button" onclick="openClose()" class="openInputBtn border-1-gray box-radius-5">
			<div>필수 정보 입력</div>
			<div class="arrowIcon">
				<svg class="editor-top-section-expand-icon" width="1em" height="1em" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" fill-rule="evenodd" d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path></svg>
			</div>
		</button>
		<div id="requiredContents" class="requiredContents border-1-gray">
			<div class="required">
				<label for="category" class="requiredLabel">카테고리<span class="redText">*</span></label>
				<div class="requiredContent">
					<select id="category" class="form-control">
						<option value="" selected>선택해주세요.</option>
						<option value="시공정보">시공정보</option>
						<option value="수납">수납</option>
						<option value="꾸미기 팁">꾸미기 팁</option>
						<option value="청소">청소</option>
						<option value="DIY&리폼">DIY&리폼</option>
						<option value="생활정보">생활정보</option>
						<option value="기타">기타</option>
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
	
	$('#category').focusout(function() {
		let category = $(this).val();
		if (category == '') {
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

	$('#file').on('change', function(e) {
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
		let category = $('#category').val();
		if (category == '') {
			alert('카테고리를 선택해주세요.');
			openClose();
			$('#category').focus();
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
		formData.append('postType', 'knowhow');
		formData.append('category', category);
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
			, url: "/post/knowhow_create"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.result == "success") {
					alert("글이 등록되었습니다.");
					location.href = "/community/knowhow_detail_view?postId=" + data.postId;
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