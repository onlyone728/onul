<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="productDetailView">
	<div class="topArea">
		<div class="imgArea img-center bg-dark">
			<img alt="상품 썸네일" src="" class="img">
		</div>
		<div class="infoArea">
			<div class="storeName">storeName</div>
			<div class="productName">productName</div>
			<div class="pointArea"></div>
			<div class="price">10,000원</div>
			<div class="delivery">배송비 3,000원</div>
			<%-- 옵션 영역 --%>
			<div class="productOptionArea">
				<div class="countInputArea">
					<select id="productCount">
						<c:forEach begin="1" end="9" step="1" var="num">
							<option value="${num}">${num}</option>
						</c:forEach>
						<option class="optionItem" value="over10">10++</option>	
					</select>
					<span class="optionIcon">
						<svg class="icon" width="10" height="10" preserveAspectRatio="xMidYMid meet" style="fill: currentcolor;"><path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path></svg>
					</span>
				</div>
			</div>
			
			<div class="d-flex justify-content-between">
				<button type="button" class="btn btn-block basketBtn" data-user-id="${userId}">장바구니</button>
				<button type="button" class="btn btn-block checkoutBtn" data-user-id="${userId}">구매하기</button>
			</div>
		</div>
	</div>
	<div class="navArea">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="#">상품정보</a></li>
			<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
			<li class="nav-item"><a class="nav-link" href="#">문의</a></li>
			<li class="nav-item"><a class="nav-link" href="#">배송/환불</a></li>
		</ul>
	</div>
	<div class="bottomArea">
		<div class="left"></div>
		<div class="right"></div>
	</div>
</div>

<script>
$(document).ready(function() {
	/* 화살표 함수 */
	const label = document.querySelector('.optionIcon');
	const options = document.querySelectorAll('.optionItem');

	// 클릭한 옵션의 텍스트를 라벨 안에 넣음
	const handleSelect = (item) => {
	  label.parentNode.classList.remove('active');
	  label.innerHTML = item.textContent;
	}
	// 옵션 클릭시 클릭한 옵션을 넘김
	options.forEach(option => {
		option.addEventListener('click', () => handleSelect(option))
	})

	// 라벨을 클릭시 옵션 목록이 열림/닫힘
	label.addEventListener('click', () => {
	  if(label.parentNode.classList.contains('active')) {
	  	label.parentNode.classList.remove('active');
	  } else {
	  	label.parentNode.classList.add('active');
	  }
	})
});
</script>