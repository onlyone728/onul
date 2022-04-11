<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<select id="type" name="type" class="form-control">
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
						<input type="text" id="area" class="form-control" onlyNumber value="${house.area}"> 
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
			<div class="img-center">
				<img src="${house.coverImage}" alt="미리보기 이미지" class="prevImg img reselectBtn" width="500">
			</div>
			<div class="photoBtn">
				<a href="#"> 
					<img alt="" src="/image/photo.png" width="64">
					<div>커버 사진 올리기</div>
				</a>
			</div>
		</div>
	</div>
	
	<div class="contentArea">
		<input type="text" id="subject" class="mb-2" placeholder="제목을 입력해주세요." value="${house.subject}">
		<span class="confirm-msg redText d-none"><b>필수 입력 항목입니다.</b></span>
		<textarea id="content" rows="15" placeholder="내용을 입력해주세요.">${house.content}</textarea>
	</div>
	
	<div class="fileArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">첨부파일</div>
		</div>
		<input type="file" id="file" onchange="addFile(this)" accept=".jpg, .jpeg, .gif, .png" multiple="multiple">
		<span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
	  	<div class="fileListArea my-3" id="fileNameArea">
	  		<c:forEach var="file" items="${fileList}" varStatus="status">
	  			<div id="file${status}" class="filebox">
	  				<div class="filesPrev">
	  					<img width="200px" src="${file.imagePath}">
  					</div>
  					<button type="button" class="fileDelBtn mt-2 btn btn-block" data-post-id="${house.id}" data-file-name="${file.imagePath}">삭제</button>
  				</div>
	  		</c:forEach>
	  	</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$("#type").val('${house.type}');
	$("#familyType").val('${house.familyType}');
	$("#fieldOfWork").val('${house.fieldOfWork}');
	$("#worker").val('${house.worker}');

	// fileDelBtn
	$('.fileDelBtn').on('click', function() {
		let result = confirm("선택하신 파일을 삭제하시겠습니까?");
		if (result) {
			let postType = 'introduceHouse';
			let postId = $(this).data('post-id');
			let imagePath = $(this).data('file-name');
			$(this).parent().addClass('d-none');
			
			$.ajax({
				type: "DELETE"
				, url: "/post/file-delete"
				, data: {"postType":postType, "postId":postId, "imagePath": imagePath}
				, success: function(data) {
					if(data.result) {
						alert("파일이 삭제되었습니다.");
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("파일 삭제에 실패했습니다. 관리자에게 문의하세요.");
					return;
				}
			});
		}
	});
	
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
		if (coverImg != '') {
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
		formData.append('postId', ${house.id});
		formData.append('postType', 'IntroduceHouse');
		formData.append('type', type);
		formData.append('area', area);
		formData.append('familyType', familyType);
		formData.append('fieldOfWork', fieldOfWork);
		formData.append('worker', worker);
		formData.append('coverImageFile', $('#coverImg')[0].files[0]);
		formData.append('subject', subject);
		formData.append('content', content);

		for (let i = 0; i < filesArr.length; i++) {
	        // 삭제되지 않은 파일만 폼데이터에 담기
	        if (!filesArr[i].is_delete) {
	            formData.append("images", filesArr[i]);
	        }
	    }
		
		// ajax
		$.ajax({
			type: "PUT"
			, url: "/post/update_introduce"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.result == "success") {
					alert("글이 수정되었습니다.");
					location.href = "/community/introduce_detail_view?postId=" + ${house.id};
				} else {
					alert(data.errorMessage);
					location.href = "/community/introduce_detail_view?postId=" + ${house.id};
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

//file 첨부 
let fileNo = 0;
let filesArr = new Array();

/* 첨부파일 추가 */
function addFile(obj){
    let maxFileCnt = 5;   // 첨부파일 최대 개수
    let attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    let remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    let curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    } else {
        for (const file of obj.files) {
            // 첨부파일 검증
            if (validation(file)) {
                // 파일 배열에 담기
                var reader = new FileReader();
                var fileUrl = '';
                reader.onload = function (e) {
                    filesArr.push(file);
                    fileUrl = e.target.result;
                    
	                // 목록 추가
	                let htmlData = '';
	                htmlData += '<div id="file' + fileNo + '" class="filebox">';
	                htmlData += '<div class="filesPrev"><img width="200px" src="' + fileUrl + '"></div>';
	                htmlData += '<button type="button" class="delete mt-2 btn btn-block" onclick="deleteFile(' + fileNo + ');">삭제</button>';
	                htmlData += '</div>';
	                $('#fileNameArea').append(htmlData);
	                fileNo++;
                };
                reader.readAsDataURL(file);

            } else {
                continue;
            }
        }
    }
    // 초기화
    document.querySelector('#file').value = "";
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    document.querySelector("#file" + num).remove();
    filesArr[num].is_delete = true;
}
</script>