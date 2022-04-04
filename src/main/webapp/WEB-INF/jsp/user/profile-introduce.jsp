<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="myHouseList">
	<c:forEach var="post" items="${user.houseList}">
	<div class="introduceCard">
		<div class="imgArea">
			<a href="/community/introduce_detail_view?postId=${post.house.id}" class="img-center d-block">
				<img alt="" src="${post.house.coverImage}" class="img" width="100%">
			</a>
		</div>
		<div class="infoArea">
			<div class="title">
				<a href="/community/introduce_detail_view?postId=${post.house.id}">${post.house.subject}</a>
			</div>
			<div class="postInfo">조회수 ${post.house.hit}회</div>
		</div>
	</div>
	</c:forEach>
</div>