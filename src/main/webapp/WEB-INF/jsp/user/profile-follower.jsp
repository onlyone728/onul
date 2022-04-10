<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="followListView" class="w80">
	<div class="pageTitle">팔로워</div>
	<ul id="followList">
		<c:forEach var="follower" items="${user.followerList}">
			<li class="followArea">
				<div class="d-flex">
					<div class="imgBox">
						<a href="#" class="img-center d-block bg-dark">
							<img alt="" src="${follower.user.profileImage}" class="img" width="100%">
						</a>
					</div>
					<div class="ml-3">
						<div class="nickName">${follower.user.nickName}</div>
						<div class="introduce">${follower.user.introduce}</div>
					</div>
				</div>
				<c:if test="${user.follow == false}">
					<button type="button" class="btn followBtn">팔로우</button>
				</c:if>
			</li>
		</c:forEach>
	</ul>
</div>
