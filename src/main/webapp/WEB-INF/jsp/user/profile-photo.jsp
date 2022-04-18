<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="myPhotoList">
	<c:if test="${not empty user.photoList}">
	<c:forEach var="post" items="${user.photoList}">
	<div class="photoCard">
		<div class="imageArea">
			<a href="/community/photo_detail_view?postId=${post.photo.id}" class="img-center d-block bg-dark">
				<img class="img" alt="" src="${post.photo.imagePath}" height="100%">
			</a>
		</div>
		
		<div class="contentArea">
			${post.photo.content}
		</div>
		
		<div class="commentArea">
			<c:forEach var="comment" items="${post.commentList}" varStatus="status" end="0">
			<div class="commentWriterImg bg-dark">
				<a href="#" class="d-block img-center"><img class="img" src="${comment.user.profileImage}" height="100%"></a>
			</div>
			<div class="commentId">${comment.user.nickName}</div>
			<div class="comment">${comment.comment.content}</div>
			</c:forEach>
		</div>
	</div>
	</c:forEach>
	</c:if>
</div>

