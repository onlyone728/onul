<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="shopMain">
	<div class="mainBanner bg-info">
		<div class="img-center">
			<a href="#">
				<img class="h-img" src="">
			</a>
		</div>
	</div>
	<div class="w80">
		<%-- 오늘의딜 영역 --%>
		<div class="postArea">
			<div class="categoryIndexBox">
				<div class="categoryIndex">오늘의딜</div>
				<div class="redMoreBtn"><a href="#">더보기</a></div>
			</div>
			<div class="gridBetween">
				<c:forEach var="product" items="${productList}" varStatus="status" end="3">
					<div class="column4">
						<a href="#">
							<div class="dealImgBox img-center box-radius-5">
								<img alt="오늘의딜 이미지" src="${product.product.thumbNail}" class="img height="269">
							</div>
							<div class="infoArea">
								<div class="storeName">${product.store.storeName}</div>
								<c:if test="${empty product.product.subject}">
									<div class="dealTitle">${product.product.productName}</div>	
								</c:if>
								<c:if test="${not empty product.product.subject}">
									<div class="dealTitle">${product.product.subject}</div>	
								</c:if>
								<div>
									<!-- <span class="blueText discountRate">30%</span> -->
									<span class="price"><fmt:formatNumber value="${product.product.price}" pattern="#,###" />원</span>
								</div>
								<div>
									<svg class="icon" width="13" height="13" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#35C5F0" fill-rule="evenodd" d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path></svg>
									<strong class="font12">${product.pointAvg}</strong>
									<strong class="font12 text-secondary">리뷰 <fmt:formatNumber value="${fn:length(product.reviewList)}" pattern="#,###"/></strong>
								</div>
								<div class="delivaryInfoArea d-flex">
									<c:if test="${product.product.delivery == 0}">
										<div class="freeDelivary">무료배송</div>
									</c:if>
									<!-- <div class="specialPrice">특가</div> -->
								</div>
							</div>
						</a>
					</div>
				</c:forEach>	
				
			</div>
		</div>
		
		<%-- 아이콘 메뉴 --%>
		<div class="iconArea">
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/funiture.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">가구</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/fabric.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">패브릭</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/light.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">조명</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/tv.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">가전</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/kitchen.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">주방용품</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/deco.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">데코/식물</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/organize.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">수납정리</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/HouseholdGoods.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">생활용품</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/drawer.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">서랍/수납장</a></div>
			</div>
			<div class="iconItem">
				<a href="#" class="d-block img-center icon"><img class="h-img" alt="" src="/image/dailyNecessity.webp" height="80"></a>
				<div class="iconLabel"><a href="#" class="d-block">생필품</a></div>
			</div>
		</div>
		
		<%-- 인기상품 영역 --%>
		<div class="postArea">
			<div class="categoryIndexBox">
				<div class="categoryIndex">인기상품</div>
				<!-- <div class="redMoreBtn"><a href="#">더보기</a></div> -->
			</div>
			<div class="gridBetween">
				<c:forEach var="product" items="${productList}" varStatus="status" end="19">
					<div class="column4">
						<a href="#">
							<div class="dealImgBox img-center box-radius-5">
								<img alt="오늘의딜 이미지" src="${product.product.thumbNail}" class="img height="269">
							</div>
							<div class="infoArea">
								<div class="storeName">${product.store.storeName}</div>
								<c:if test="${empty product.product.subject}">
									<div class="dealTitle">${product.product.productName}</div>	
								</c:if>
								<c:if test="${not empty product.product.subject}">
									<div class="dealTitle">${product.product.subject}</div>	
								</c:if>
								<div>
									<!-- <span class="blueText discountRate">30%</span> -->
									<span class="price"><fmt:formatNumber value="${product.product.price}" pattern="#,###" />원</span>
								</div>
								<div>
									<svg class="icon" width="13" height="13" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="#35C5F0" fill-rule="evenodd" d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path></svg>
									<strong class="font12">${product.pointAvg}</strong>
									<strong class="font12 text-secondary">리뷰 <fmt:formatNumber value="${fn:length(product.reviewList)}" pattern="#,###"/></strong>
								</div>
								<div class="delivaryInfoArea d-flex">
									<c:if test="${product.product.delivery == 0}">
										<div class="freeDelivary">무료배송</div>
									</c:if>
									<!-- <div class="specialPrice">특가</div> -->
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>