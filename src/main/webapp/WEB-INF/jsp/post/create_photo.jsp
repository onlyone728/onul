<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.onul.photo.model.Space" %>	

<div id="photoCreate" class="w70">
	<div class="d-flex justify-content-between">
		<div class="photoImgArea box-radius-5">
			<div class="d-none prevImg img-center">
				<img src="" alt="미리보기 이미지" class="img reselectBtn" height="420">
			</div>
			<div class="photoBtn">
				<a href="#"> 
					<img alt="" src="/image/photo.png" width="64">
					<div>사진 올리기</div>
				</a>
			</div>
			<input type="file" id="file" class="d-none" accept=".jpg, .jpeg, .gif, .png">
		</div>
		<div class="contentArea">
			<div class="requiredContent">
				<select id="space">
					<option value="" selected disabled>선택하세요.</option>
					<c:forEach var="space" items="${Space.values()}">
						<option value="${space}">${space.label}</option>
					</c:forEach>
				</select>
				<div class="confirm-msg redText my-2 d-none">필수 입력항목입니다.</div>
			</div>
			<textarea rows="15" id="content" class="box-radius-5 border-1-gray"></textarea>
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
					$('.prevImg').children().attr('src', e.target.result);
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
		
		// space validation
		$('#space').focusout(function() {
			let space = $(this).val();
			if (space == '') {
				$(this).next('.confirm-msg').removeClass('d-none');
			} else {
				$(this).next('.confirm-msg').addClass('d-none');
			}
		});
		
		// 글 올리기
		$('.saveBtn').on('click', function() {
			let content = $('#content').val();
			let file = $('#file').val();
			let space = $('#space').val();
			
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
			
			if (space == '') {
				alert("공간을 선택해주세요.");
				return;
			}
			
			if (content == '') {
				alert("내용을 입력해주세요.");
				return;
			}
			
			// form 
			let formData = new FormData();
			formData.append('postType', 'photo');
			formData.append('space', space);
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
						location.href = "/community/photo_detail_view?postId=" + data.postId;
					} else {
						alert(data.errorMessage);
						location.href = "/user/sign_in_view";
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