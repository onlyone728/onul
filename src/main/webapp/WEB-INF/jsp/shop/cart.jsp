<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="cartView">
	<div class="w80 d-flex">
		<div class="left">
			<div class="allcheck">
				<label class="d-flex">
					<div class="checkbox">
						<input type="checkbox" name="cart" id="selectAll">
						<span class="cb"></span>
					</div>
					<div class="checkLabel">모두선택</div>
				</label>
			</div>
			
			<%-- 스토어별 선택 상품 카드 --%>
			<div class="cartCard">
				<div class="storeName">storeName 배송</div>
				
				<div class="productInfoArea">
					<div class="check">
						<label class="d-flex">
							<div class="checkbox">
								<input type="checkbox" name="cart">
								<span class="cb"></span>
							</div>
						</label>
					</div>	
						
					<div class="productInfo">
						<div class="d-flex">
							<div class="productImgArea">
								<a href="#" class="d-block img-center bg-dark">
									<img class="img" alt="상품 이미지" src="" height="100%">
								</a>
							</div>
							<div class="info">
								<div class="productName">어쩌구</div>
								<div class="deliveryInfo">무료배송 | 업체배송</div>
							</div>
						</div>
						<div class="price">10,000원</div>
					</div>
				</div>
				
				<div class="deliveryFee">배송비 무료</div>
			</div>
		</div>

		<div class="right">
			<div class="billCard">
				<table class="billTable">
					<tr>
						<th>총 상품금액</th>
						<td>10,000원</td>
					</tr>
					<tr>
						<th>총 배송비</th>
						<td>+ 3,000원</td>
					</tr>
					<tr>
						<th>총 할인금액</th>
						<td>- 1,000원</td>
					</tr>
					<tr>
						<th style="font-weight: 700;">결제금액</th>
						<td class="finalPrice">12,000원</td>
					</tr>
				</table>
			</div>
			
			<button type="button" class="orderBtn">구매하기</button>
		</div>		
	</div>
</div>

<script>
$(document).ready(function(){
	// billCard가 footer로 떨어지는것 방지
	$(window).scroll(function() {
		$('.right').css('margin-top', Math.max(0, 0-$(this).scrollTop()));
	});
});
</script>
