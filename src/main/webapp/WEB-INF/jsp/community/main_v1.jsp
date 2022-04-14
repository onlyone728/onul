<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<div id="communityMain" class="w80">
	<%-- 배너 영역 --%>
	<div class="bannerArea">
		<c:forEach var="main" items="${houseList}" varStatus="status" end="0">
			<div class="mainBanner relative">
				<div class="w-100 h-100">
					<a href="/community/introduce_detail_view?postId=${main.house.id}" class="img-center d-block bg-dark">
						<img class="img" alt="이미지" src="${main.house.coverImage}" height="100%">
					</a>	
				</div>
				<div class="infoArea absolute">
					<div class="bannerTitle"><a href="#">${main.house.subject}</a></div>
					<div class="d-flex">
						<div class="postWritherImg border-1-white img-center m-0 mr-2">
							<a href="/user/${main.user.id}" class="d-flex">
								<img alt="" src="${main.user.profileImage}" class="h-img" width="100">
							</a>
						</div>
						<div class="text-white font15 textShadow2">${main.user.nickName}</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<c:forEach var="sub" items="${knowhowList}" varStatus="status" end="0">
			<div class="smallBanner">
				<div class="w-100 h-100">
					<a href="/community/knowhow_detail_view?postId=${sub.knowhow.id}" class="img-center d-block bg-dark">
						<img class="h-img" alt="" src="${sub.knowhow.coverImage}" height="100%">
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<%-- 아이콘 메뉴 영역 --%>
	<div class="iconArea">
		<div class="iconMenu">
			<div class="iconMenu">
				<a href="/community/introduce_view" class="d-block img-center">
					<img class="h-img" alt="" src="/image/icon_area.webp" height="80">
				</a>
			</div>
			<div class="iconText">N평집들이</div>
		</div>
		<div class="iconMenu">
			<div class="iconMenu">
				<a href="/community/photo_view" class="d-block img-center">
					<img class="h-img" alt="" src="/image/icon_place.webp" height="80">
				</a>
			</div>
			<div class="iconText">공간별사진</div>
		</div>
	</div>
	
	<%-- 오늘의 스토리 --%>
	<div class="postArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">오늘의 스토리</div>
			<c:if test="${fn:length(houseList) > 4}">
				<div class="moreBtn"><a href="/community/introduce_view">더보기</a></div>
			</c:if>
		</div>
		<div class="gridBetween">
			<c:forEach var="house" items="${houseList}" varStatus="status" begin="1" end="4">
				<div class="column4">
					<div class="img-center box-radius-10 postImgBox bg-dark">
						<a href="/community/introduce_detail_view?postId=${house.house.id}">
							<img alt="" src="${house.house.coverImage}" class="img"  width="180">
						</a>
					</div>
						<div class="infoArea">
							<div class="postTitle">${house.house.subject}</div>
							<div class="writerInfo">
								<div class="postWritherImg">
									<a href="/user/${house.user.id}" class="img-center d-block">
										<img class="img" alt="" src="${house.user.profileImage}" height="100">
									</a>
								</div>
								
								<div class="writerNickName"><a href="/user/${house.user.id}">${house.house.nickName}</a></div>
							</div>
						</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<%-- 오늘의 노하우 --%>
	<div class="postArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">오늘의 노하우</div>
			<c:if test="${fn:length(knowhowList) > 4}">
				<div class="moreBtn"><a href="/community/knowhow_view">더보기</a></div>
			</c:if>
		</div>
		<div class="gridBetween">
			<c:forEach var="knowhow" items="${knowhowList}" varStatus="status" begin="1" end="4">
				<div class="column4">
					<div class="box-radius-10 postImgBox bg-dark">
						<a class="img-center d-block d-box" href="/community/knowhow_detail_view?postId=${knowhow.knowhow.id}">
							<img alt="" src="${knowhow.knowhow.coverImage}" class="img"  width="100%">
						</a>
					</div>
					<div class="infoArea">
						<div class="postTitle">${knowhow.knowhow.subject}</div>
						<div class="writerInfo">
							<div class="postWritherImg">
								<a href="/user/${knowhow.user.id}" class="img-center d-block">
									<img class="img" alt="" src="${knowhow.user.profileImage}" height="100">
								</a>
							</div>
							<div class="writerNickName">
								<a href="/user/${knowhow.user.id}">${knowhow.user.nickName}</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<%-- 오늘의 인기사진 영역 --%>
	<div class="postArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">오늘의 인기 사진</div>
			<c:if test="${fn:length(photoList) > 4}">
				<div class="moreBtn"><a href="/community/photo_view">더보기</a></div>
			</c:if>	
		</div>
		<div class="gridBetween">
			<c:forEach var="photo" items="${photoList}" varStatus="status" end="3">
				<div class="photoCard column4 relative">
					<div class="dealImgBox box-radius-5">
						<a href="/community/photo_detail_view?postId=${photo.photo.id}" class="d-block img-center bg-dark">
							<img alt="" src="${photo.photo.imagePath}" class="img" width="269">
						</a>	
					</div>
					<div class="infoArea absolute">
						<a href="/user/${photo.user.id}" class="d-flex">
							<div class="postWritherImg border-1-white img-center m-0 mr-2">
								<img alt="" src="${photo.user.profileImage}" class="img" height="100">
							</div>
							<div class="text-white font15 textShadow2"><b>${photo.user.nickName}</b></div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>	
</div>
<script>
$(document).ready(function() {
	
});
</script>