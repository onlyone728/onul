<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="knowhowList" class="w80">
	<div class="categoryTabArea">
		<input type="button" class="all categoryTab btn" value="전체">
		<input type="button" class="constructionInfoTab categoryTab btn" value="시공정보">
		<input type="button" class="storageTab categoryTab btn" value="수납">
		<input type="button" class="decoTab categoryTab btn" value="꾸미기 팁">
		<input type="button" class="cleaningTab categoryTab btn" value="청소">
		<input type="button" class="diyTab categoryTab btn" value="DIY&리폼">
		<input type="button" class="lifeInfoTab categoryTab btn" value="생활정보">
		<input type="button" class="etcTab categoryTab btn" value="기타">
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
		if (category == '전체') {
			location.href = "/community/knowhow_view"
		} else {
			location.href = "/community/knowhow_view?category=" + category;
		}
	});
});
</script>