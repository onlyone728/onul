<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="myKnowhowList">
	<c:forEach var="post" items="${user.knowhowList}">
		<div class="knowhowCard">
			<div class="postImgBox">
				<a href="/community/knowhow_detail_view?postId=${post.knowhow.id}" class="d-block img-center bg-dark">
					<img class="img" alt="" src="${post.knowhow.coverImage}" width="100%">
				</a>
			</div>
			<div class="postInfoArea">
				<div class="postTitle"><a href="/community/knowhow_detail_view?postId=${post.knowhow.id}">${post.knowhow.subject}</a></div>
				<div class="writerNic">${post.user.nickName}</div>
				<div>조회수 ${post.knowhow.hit}회</div>
			</div>
		</div>
	</c:forEach>
</div>