<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="followListView" class="w80">
	<div class="pageTitle">팔로잉</div>
	<ul id="followList">
		<c:forEach var="follower" items="${user.followingList}">
			<li class="followArea">
				<div class="d-flex">
					<div class="imgBox">
						<a href="#" class="img-center d-block bg-dark">
							<img alt="" src="${follower.follower.profileImage}" class="img" width="100%">
						</a>
					</div>
					<div class="ml-3">
						<div class="nickName">${follower.follower.nickName}</div>
						<div class="introduce">${follower.follower.introduce}</div>
					</div>
				</div>
				<c:if test="${user.follow == false}">
					<button type="button" class="btn followBtn">팔로우</button>
				</c:if>	
			</li>
		</c:forEach>
	</ul>
</div>
