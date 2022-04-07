<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.onul.product.model.ProductCategory" %>

<div id="createProductView" class="w80">
	<div class="pageTitle">상품 등록</div>
	<div class="formArea">
		<div class="form-group">
			<label for="productName" class="label">상품명</label>
			<input type="text" id="productName" class="productInput">
		</div>
		<div class="message d-none">필수 입력 항목입니다.</div>
		<div class="form-group">
			<label for="price" class="label">상품 가격</label>
			<input type="text" id="price" class="productInput" onlyNumber>
		</div>
		<div class="message d-none">필수 입력 항목입니다.</div>
		<div class="form-group">
			<label for="productCategory" class="label">상품 카테고리</label>
			<select id="productCategory" class="productInput">
				<c:forEach var="category" items="${ProductCategory.values()}">
					<option>${category.label}</option>
				</c:forEach>
				<!-- <option value="" selected>선택하세요.</option>	
				<option value="FURNITURE">가구</option>	
				<option value="FABRIC">패브릭</option>	
				<option value="LIGHT">조명</option>	
				<option value="HOMEAPPLIANCES">가전</option>	
				<option value="KITCHEN">주방용품</option>	
				<option value="DECO">데코/식물</option>	
				<option value="ORGANIZE">수납정리</option>	
				<option value="HOUSEHOLDGOODS">생활용품</option>	
				<option value="DRAWER">서랍/수납장</option>	
				<option value="DAILYNECESSITY">생필품</option> -->	
			</select>
		</div>
		<div class="message d-none">필수 입력 항목입니다.</div>
		
		<div class="form-group">
			<label for="delivery" class="label">배송비</label>
			<input type="text" id="delivery" class="productInput" onlyNumber>
		</div>
		<div class="message d-none">필수 입력 항목입니다.</div>
		
		<div class="form-group">
			<label for="origin" class="label">원산지</label>
			<input type="text" id="origin" class="productInput">
		</div>
		<div class="message d-none">필수 입력 항목입니다.</div>
		
		<div class="form-group">
			<label for="origin" class="d-block label">썸네일 등록</label>
			<input type="file" id="thumbnail" accept=".jpg, .jpeg, .gif, .png">
			<div class="coverImgBox img-center">
				<div class="photoBtn">
					<a href="#"> 
						<img alt="" src="/image/photo.png" width="64">
						<div>썸네일 올리기</div>
						<div class="redText"> 1000*1000px을 권장합니다.</div>
					</a>
				</div>
				<div class="img-center">
					<img src="" alt="미리보기 이미지" class="prevImg img d-none reselectBtn" height="100%">
				</div>
			</div>
		</div>
		<div class="message d-none">필수 입력 항목입니다.</div>
		
		<div class="form-group">
			<label for="subject" class="label">제목</label>
			<input type="text" id="subject" placeholder="미입력시 상품명으로 노출됩니다.">
		</div>
		
		<div class="form-group">
			<label for="origin" class="d-block label">상품 설명</label>
			<textarea id="content" rows="15" cols=""></textarea>
		</div>
		<div class="message d-none">필수 입력 항목입니다.</div>
		
		<div class="form-group">
			<label for="origin" class="d-block label">첨부파일</label>
		</div>
		<input type="file" id="file" accept=".jpg, .jpeg, .gif, .png" multiple="multiple">
		<span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
	  	<div class="fileListArea my-3" id="fileNameArea">
			<ul class="fileList"></ul>
		</div>
	</div>
</div>    

<script>
$(document).ready(function() {
	// input 숫자만
	$('input[onlyNumber]').on('keyup', function () {
	    $(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	// productName
	$('#productName').focusout(function() {
		let productName = $(this).val().trim();
		if (productName == '') {
			$(this).removeClass('productInput');
			$(this).addClass('border-1-red');
			$(this).parent().next('.message').removeClass('d-none');
			return;
		} else {
			$(this).addClass('productInput');
			$(this).removeClass('border-1-red');
			$(this).parent().next('.message').addClass('d-none');
		}
	});
	
	// price
	$('#price').focusout(function() {
		let price = $('#price').val().trim();
		if (price == '') {
			$(this).removeClass('productInput');
			$(this).addClass('border-1-red');
			$(this).parent().next('.message').removeClass('d-none');
		} else {
			$(this).addClass('productInput');
			$(this).removeClass('border-1-red');
			$(this).parent().next('.message').addClass('d-none');
		}
	}); 
	
	// delivery
	$('#delivery').focusout(function() {
		let delivery = $('#delivery').val().trim();
		if (delivery == '') {
			$(this).addClass('border-1-red');
			$(this).removeClass('productInput');
			$(this).parent().next('.message').removeClass('d-none');
		} else {
			$(this).addClass('productInput');
			$(this).removeClass('border-1-red');
			$(this).parent().next('.message').addClass('d-none');
		}
	}); 
	
	// productCategory
	$('#productCategory').focusout(function() {
		let productCategory = $(this).val();
		if (productCategory == '') {
			$(this).removeClass('productInput');
			$(this).addClass('border-1-red');
			$(this).parent().next('.message').removeClass('d-none');
		} else {
			$(this).addClass('productInput');
			$(this).removeClass('border-1-red');
			$(this).parent().next('.message').addClass('d-none');
		}
	});
	
	// origin
	$('#origin').focusout(function() {
		let origin = $(this).val();
		if (origin == '') {
			$(this).removeClass('productInput');
			$(this).addClass('border-1-red');
			$(this).parent().next('.message').removeClass('d-none');
		} else {
			$(this).addClass('productInput');
			$(this).removeClass('border-1-red');
			$(this).parent().next('.message').addClass('d-none');
		}
	});
	
	// 썸네일 등록
	$('.photoBtn').on('click', function(e) {
		e.preventDefault(); 
		$('#thumbnail').click();
	});
	
	$('.reselectBtn').on('click', function(e) {
		e.preventDefault();
		$('#thumbnail').click();
	});
	
	$("#thumbnail").on('change', function() {
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
				$('.fileList').append('<li class="fileName mb-1">' + file.name + '</li>');
			}     	
	    }
	});
	
	// saveBtn click
	$('.saveBtn').on('click', function() {
		let productName = $('#productName').val().trim(); 
		if (productName == '') {
			alert('상품명을 입력해주세요.');
			return;
		}
		let price = $('#price').val().trim();
		if (price == '') {
			alert('가격을 입력해주세요.');
			return;
		}
		let delivery = $('#delivery').val().trim();
		if (delivery == '') {
			alert('배송비를 입력해주세요.');
			return;
		}
		let productCategory = $('#productCategory').val();
		if (productCategory == '') {
			alert('카테고리를 선택해주세요.');
			return;
		}
		let origin = $('#origin').val();
		if (origin == '') {
			alert('원산지를 입력해주세요.');
			return;
		}
		let thumbnail = $('#thumbnail').val();
		if (thumbnail == '') {
			alert('썸네일을 업로드해주세요.');
			return;
		} else if (thumbnail != '') {
			let ext = thumbnail.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#file').val('');	// 선택된 파일을 비운다.
				return;
			}
		}
		let subject = $('#subject').val();
		let content = $('#content').val();
		if (content == '') {
			alert('상품설명을 입력해주세요.');
			return;
		}
		
		let formData = new FormData();
		formData.append('productName', productName);
		formData.append('price', price);
		formData.append('delivery', delivery);
		formData.append('productCategory', productCategory);
		formData.append('origin', origin);
		formData.append('thumbnailFile', $('#thumbnail')[0].files[0]);
		formData.append('subject', subject);
		formData.append('content', content);
		for(let i = 0; i < inputFileList.length; i++){
			// 이미지 값
			formData.append('images', inputFileList[i]);
		}
		
		$.ajax({
			type: "POST"
			, url: "/admin/product_create"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.result == "success") {
					alert("상품이 등록되었습니다.");
					location.href = "/admin/product_list_view";
				} else {
					alert(data.errorMessage);
					location.href = "/admin/product_list_view";
				}
			}
		});
	});
	
});
</script>