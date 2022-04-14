<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<div class="userCardArea">
	<div class="userCard">
		<div class="userImg img-center bg-dark">
			<c:if test="${empty user.user.profileImage}">
				<img class="img" alt="" src="/image/avatar.webp" width="100%">
			</c:if>
			<c:if test="${not empty user.user.profileImage}">
				<img class="img" alt="" src="${user.user.profileImage}" width="100%">
			</c:if>
		</div>
		<div class="userNickNameArea">${user.user.nickName}</div>
		<div class="followInfoArea">
			<div class="followInfo" style="border-right: 1px solid #424242">팔로워 <a href="/user/${user.user.id}/follower"><b>${user.followedCount}</b></a></div>
			<div class="followInfo">  팔로잉 <a href="/user/${user.user.id}/following"><b>${user.followCount}</b></a></div>
		</div>
		<div class="btnArea">
			<c:choose>
				<c:when test="${userId == user.user.id}">
					<button type="button" class="btn settingBtn">설정</button>
				</c:when>
				<c:when test="${userId != user.user.id || user.follow == false}">
					<button type="button" class="btn followBtn" data-user-id="${user.user.id}">팔로우</button>
				</c:when>
				<c:when test="${userId != user.user.id || user.follow == true}">
					<button type="button" class="btn followBtn" data-user-id="${user.user.id}">팔로우 취소</button>
				</c:when>
			</c:choose>
		</div>
		<c:if test="false">
			<div class="otherInfoArea">
				<div class="likeInfo">
					<svg width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" d="M22.971 7.638c-.548-5.17-7.119-7.135-10.57-2.488a.5.5 0 0 1-.802 0C8.148.503 1.577 2.469 1.029 7.625.642 12.451 3.897 17.183 12 21.436c8.104-4.252 11.36-8.984 10.972-13.798zm.996-.093c.428 5.319-3.137 10.446-11.738 14.899a.5.5 0 0 1-.46 0C3.169 17.99-.395 12.864.034 7.532.656 1.67 7.904-.683 12 4.052 16.096-.683 23.344 1.67 23.967 7.545z"></path></svg>
					<div class="label">좋아요</div>
					<div class="count">0</div>
				</div>
			</div>	
		</c:if>
		<c:if test="true">
			<div class="introInfo">
				${user.user.introduce}
			</div>
		</c:if>	
	</div>
</div>

<script>
$(document).ready(function() {
	$('.settingBtn').on('click', function() {
		location.href = "/user/${userId}/update"
	});
});
</script>