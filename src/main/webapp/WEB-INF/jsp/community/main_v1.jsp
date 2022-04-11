<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="communityMain" class="w80">
	<%-- 배너 영역 --%>
	<div class="bannerArea">
		<div class="mainBanner relative">
			<div class="w-100 h-100">
				<a href="/community/introduce_detail_view?postId=${mainPost.house.id}" class="img-center d-block bg-dark">
					<img class="img" alt="이미지" src="${mainPost.house.coverImage}" height="100%">
				</a>	
			</div>
			<div class="infoArea absolute">
				<div class="bannerTitle"><a href="#">${mainPost.house.subject}</a></div>
				<div class="d-flex">
					<div class="postWritherImg border-1-white img-center m-0 mr-2">
						<a href="/user/${mainPost.user.id}" class="d-flex">
							<img alt="" src="${mainPost.user.profileImage}" class="h-img" width="100">
						</a>
					</div>
					<div class="text-white font15 textShadow2">${mainPost.user.nickName}</div>
				</div>
			</div>
		</div>
		<div class="smallBanner">
			<div class="w-100 h-100">
				<a href="/community/knowhow_detail_view?postId=${subPost.knowhow.id}" class="img-center d-block bg-dark">
					<img class="h-img" alt="" src="${subPost.knowhow.coverImage}" height="100%">
				</a>
			</div>
		</div>
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
			<div class="moreBtn"><a href="/community/introduce_view">더보기</a></div>
		</div>
		<div class="gridBetween">
			<c:forEach var="house" items="${houseList}" varStatus="status" end="3">
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
			<div class="moreBtn"><a href="/community/knowhow_view">더보기</a></div>
		</div>
		<div class="gridBetween">
			<c:forEach var="knowhow" items="${knowhowList}" varStatus="status" end="3">
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
			<div class="moreBtn"><a href="/community/photo_view">더보기</a></div>
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