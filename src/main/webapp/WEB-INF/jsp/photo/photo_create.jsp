<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="photoCreate" class="w70">
	<div class="d-flex justify-content-between">
		<div class="PhotoImgArea box-radius-5">
			<img src="" alt="미리보기 이미지" class="prevImg d-none reselectBtn" height="420">
			<div class="photoBtn">
				<a href="#"> 
					<img alt="" src="/images/photo.png" width="64">
					<div class="">사진 올리기</div>
				</a>
			</div>
			<input type="file" id="file" class="d-none" accept=".jpg, .jpeg, .gif, .png">
		</div>
		<div class="contentArea">
			<textarea rows="15" id="content" class="border-1-gray"></textarea>
			<div class="btnArea ">
				<a href="/community" class="btn cancelBtn">취소</a>
				<button class="btn createBtn">올리기</button>
			</div>
		</div>
	</div>

</div>

<script>
	$(document).ready(function() {
		$('.photoBtn').on('click', function(e) {
			e.preventDefault(); // a 기본 기능 중단 (위로 올라가는 현상 방지)
			$('#file').click(); // input file을 클릭한 것과 같은 효과
		});
		
		$('.reselectBtn').on('click', function(e) {
			e.preventDefault(); // a 기본 기능 중단 (위로 올라가는 현상 방지)
			$('#file').click(); // input file을 클릭한 것과 같은 효과
		});
		
		$("#file").on('change', function() {
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
		
		// 사용자가 파일 업로드를 했을 때, 유효성 확인 및 업로드 된 파일 이름 노출
		$('#file').on('change', function(e) {
			let fileName = e.target.files[0].name;
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
		
		// 글 올리기
		$('.createBtn').on('click', function() {
			let content = $('#content').val();
			let file = $('#file').val();
			
			if (file == '') {
				alert("이미지 파일을 업로드해주세요.");
				return;
			} else {
				let ext = file.split('.').pop().toLowerCase();
				if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
					alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
					$('#file').val('');	// 선택된 파일을 비운다.
					return;
				}
			}
			
			if (content == '') {
				alert("내용을 입력해주세요.");
				return;
			}
			
			// form 
			let formData = new FormData();
			formData.append('postType', 'photo');
			formData.append('content', content);
			formData.append('file', $('#file')[0].files[0]);
			
			// ajax
			$.ajax({
				type: "POST"
				, url: "/post/photo_create"
				, data: formData
				, enctype: "multipart/form-data"
				, processData: false
				, contentType: false
				, success: function(data) {
					if (data.result == "success") {
						alert("사진이 등록되었습니다.");
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("사진 올리기에 실패하였습니다. 관리자에게 문의해주세요.");
					location.reload();
				}
			});
		});
	});
</script>