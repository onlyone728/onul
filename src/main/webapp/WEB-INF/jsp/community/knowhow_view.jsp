<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.onul.knowhowPost.model.Category" %>

<div id="knowhowList" class="w80">
	<div class="categoryTabArea">
		<button type="button" class="categoryTab btn" value="ALL">ALL</button>
		<c:forEach var="category" items="${Category.values()}">
			<button type="button" class="categoryTab btn" value="${category}">${category.label}</button>
		</c:forEach>
	</div>
	<div class="gridBetween">
		<c:forEach var="post" items="${postList}">
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
</div>

<script>
$(document).ready(function() {
	$('.categoryTab').on('click', function() {
		let category = $(this).val();
		if (category == 'ALL') {
			location.href = "/community/knowhow_view"
		} else {
			location.href = "/community/knowhow_view?category=" + category;
		}
	});
});
</script>