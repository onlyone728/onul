<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<div id="list" class="w80">
	<div class="gridBetween">
		<c:forEach var="post" items="${postList}">
			<div class="photoCard column4 relative">
				<div class="writerInfoArea">
						<div class="writerImg bg-dark">
							<a href="#" class="d-block img-center">
								<img alt="" src="${post.user.profileImage}" class="img" height="100%">
							</a>
						</div>
						<div>		
							<div class="d-flex">	
								<a href="#">
									<div class="writerNickName">${post.user.nickName}</div>
								</a>
								<c:if test="${userId != post.user.id && post.follow == false}">
									<div> · </div>
									<div class="followBtnArea">
										<a class="followBtn" href="#" data-user-id="${post.user.id}">팔로우</a>
									</div>
								</c:if>
							</div>
							<div class="introduce">자기소개</div>	
						</div>	
				</div>
				
				<div class="dealImgBox box-radius-5">
					<a href="/community/photo_detail_view?postId=${post.photo.id}" class="d-block img-center bg-dark">
						<img alt="" src="${post.photo.imagePath}" class="img" width="100%">
					</a>	
				</div>
				
				<div class="btnArea">
					<div>
						<a class="likeBtn" href="#" data-post-id="${post.photo.id}" data-post-type="${post.photo.postType}">
							<c:if test="${post.filledLike == false}">
								<svg class="icon icon--stroke" aria-label="좋아요" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
							</c:if>
							<c:if test="${post.filledLike == true}">
								<svg class="icon icon--stroke" aria-label="좋아요" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
							</c:if>
						</a>	
					</div>
					<div class="scrapBtn">
						<a href="#">
							<svg class="icon icon--stroke" aria-label="스크랩" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>
						</a>	
					</div>
					<div class="commentViewBtn">
						<a href="/community/photo_detail_view?postId=${post.photo.id}">
							<svg class="icon" aria-label="댓글 달기" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" fill-rule="nonzero" d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z"></path></svg>
						</a>	
					</div>
				</div>
				
				<div class="contentArea">${post.photo.content}</div>
				
				<div class="commentArea">
					<c:forEach var="comment" items="${post.commentList}" varStatus="status" end="0">
						<div class="commentWriterImg bg-dark">
							<a href="#" class="d-block img-center"><img class="img" src="${comment.profileImage}" height="100%"></a>
						</div>
						<div class="commentId">${comment.nickName}</div>
						<div class="comment">${comment.content}</div>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script>
$(document).ready(function() {
	// follow
	$('.followBtn').on('click', function(e) {
		e.preventDefault();
		let followId = $(this).data('user-id');
		
		$.ajax({
			type: "GET"
			, url: "/follow/create"
			, data: {"followId": followId}
			, success: function(data) {
				if (data.result == "success") {
					alert(data.message);
					location.reload();
				} else {
					alert(data.errorMessage);
					location.reload();
				}
			}
			, error: function(e) {
				alert("팔로우에 실패하였습니다. 관리자에게 문의하세요.");
				location.reload();
			}
		});
	});
	
	// like
	$('.likeBtn').on('click', function(e) {
		e.preventDefault();
		let postId = $(this).data('post-id');
		let postType = $(this).data('post-type');
		
		$.ajax({
			type: "GET"
			, url: "/like"
			, data: {"postId": postId, "postType": postType}
			, success: function(data) {
				if (data.result == "success") {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("좋아요에 실패하였습니다.");
			}
		});
	});	
});
</script>