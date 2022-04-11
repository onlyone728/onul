<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="searchView" class="w80">
	<div class="searchKeyword"><span class="redText">${keyword}</span> 검색 결과</div>
	<%-- 사진 --%>
	<div class="postArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">사진</div>
			<c:if test="${fn:length(photoList) > 8}">
				<div class="moreBtn"><a href="/community/photo_view">더보기</a></div>
			</c:if>
		</div>
		<c:if test="${empty photoList}">
			<div class="noResult">검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty photoList}">
			<div class="gridBetween">
				<c:forEach var="photo" items="${photoList}" varStatus="status" end="7">
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
		</c:if>
	</div>	
	
	<%-- 집들이 --%>
	<div class="postArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">집들이</div>
			<c:if test="${fn:length(houseList) > 8}">
				<div class="moreBtn"><a href="/community/introduce_view">더보기</a></div>
			</c:if>
		</div>
		<c:if test="${empty photoList}">
			<div class="noResult">검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty photoList}">
			<div class="gridBetween">
				<c:forEach var="house" items="${houseList}" varStatus="status" end="7">
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
		</c:if>	
	</div>
	
	<%-- 노하우 --%>
	<div class="postArea">
		<div class="categoryIndexBox">
			<div class="categoryIndex">노하우</div>
			<c:if test="${fn:length(knowhowList) > 8}">
				<div class="moreBtn"><a href="/community/knowhow_view">더보기</a></div>
			</c:if>
		</div>
		<c:if test="${empty photoList}">
			<div class="noResult">검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty photoList}">
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
		</c:if>	
	</div>
	
</div>
<script>
$(document).ready(function() {
	$('#keyword').val('${keyword}');
});
</script>