<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
	
<div class="postHistoryArea">
	<div class="categoryLabel">
		사진 <span class="blueText ml-1">${fn:length(user.photoList)}</span>
	</div>
	<c:if test="${empty user.photoList}">
		<div class="emptyArea">
			<c:if test="${userId == user.user.id}">
				<a class="d-block w-100 h-100" href="/post/photo_create_view">+
					첫번째 사진을 올려보세요.</a>
			</c:if>
			<c:if test="${userId != user.user.id}">
				<div>사진이 없습니다.</div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${not empty user.photoList}">
		<div class="notEmptyArea">
			<c:forEach var="post" items="${user.photoList}">
				<div class="postArea">
					<a href="/community/photo_detail_view?postId=${post.photo.id}"
						class="img-center d-block bg-dark"> <img class="img" alt=""
						src="${post.photo.imagePath}" width="100%">
					</a>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>
<div class="postHistoryArea">
	<div class="categoryLabel">
		집들이 <span class="blueText ml-1">${fn:length(user.houseList)}</span>
	</div>
	<c:if test="${empty user.houseList}">
		<div class="emptyArea">
			<c:if test="${userId == user.user.id}">
				<div>
					<a href="/post/introduce_create_view">+ 첫번째 사진을 올려보세요.</a>
				</div>
			</c:if>
			<c:if test="${userId != user.user.id}">
				<div>사진이 없습니다.</div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${not empty user.houseList}">
		<div class="notEmptyArea">
			<c:forEach var="post" items="${user.houseList}">
				<div class="houseArea">
					<a href="/community/introduce_detail_view?postId=${post.house.id}"
						class="img-center d-block bg-dark"> <img class="img" alt=""
						src="${post.house.coverImage}" width="100%">
					</a>
					<div class="infoArea">
						<div class="title">
							<a href="/community/introduce_detail_view?postId=${post.house.id}">
								${post.house.subject} </a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>

<div class="postHistoryArea">
	<div class="categoryLabel">
		노하우 <span class="blueText ml-1">${fn:length(user.knowhowList)}</span>
	</div>
	<c:if test="${empty user.knowhowList}">
		<div class="emptyArea">
			<c:if test="${userId == user.user.id}">
				<div>
					<a href="/post/knowhow_create_view">+ 첫번째 사진을 올려보세요.</a>
				</div>
			</c:if>
			<c:if test="${userId != user.user.id}">
				<div>사진이 없습니다.</div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${not empty user.knowhowList}">
		<div class="notEmptyArea">
			<c:forEach var="post" items="${user.knowhowList}">
				<div class="houseArea">
					<a href="/community/introduce_detail_view?postId=${post.knowhow.id}"
						class="img-center d-block bg-dark"> <img class="img" alt=""
						src="${post.knowhow.coverImage}" width="100%">
					</a>
					<div class="infoArea">
						<div class="title">
							<a href="/community/introduce_detail_view?postId=${post.knowhow.id}">
								${post.knowhow.subject} </a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>

<script>
$(document).ready(function() {
	
});
</script>