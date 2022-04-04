<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="photoDetail" class="w80">
	<div class="postArea">
		<div class="photoArea">
			<img alt="${photoView.photo.nickName}님의 사진" src="${photoView.photo.imagePath}" class="w-100">
		</div>
		<div class="contentArea">${photoView.photo.content}</div>
		<div class="photoInfo">
			<div class="count">
				<div class="mr-1">조회수 ${photoView.photo.hit}</div>
				<div>· 댓글 ${photoView.commentCount}</div>
			</div>
			<div class="commentArea">
				<c:if test="${not empty userId}">
					<div class="inputComment">
						<div class="userImg img-center">
							<c:if test="${empty userProfileImage}">
								<img class="img" alt="유저 프로필 이미지 없음" src="/image/avatar.webp" height="30">
							</c:if>
							<c:if test="${not empty userProfileImage}">
								<img class="img" alt="${userNickName}님의 프로필 이미지" src="${userProfileImage}" height="30">
							</c:if>
						</div>
						<div class="commentPlace">칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)</div> 
						<input type="text" id="commentText" class="comment box-radius-5">
						<a href="" class="commentBtn disabledBtn" data-post-id="${photoView.photo.id}">등록</a>
					</div>
				</c:if>	
				
				<div class="commentList">
					<c:forEach var="comment" items="${photoView.commentList}">
					<div class="comment-box">
						<div class="userImg img-center">
							<a href="/user/${post.user.id}" class="img-center d-block">
							<c:choose>
								<c:when test="${empty comment.profileImage}">
									<img class="img" alt="작성자 프로필 이미지 없음" src="/image/avatar.webp" height="30">
								</c:when>	
								<c:when test="${not empty comment.profileImage}">
									<img class="img" alt="${comment.nickName}님의 프로필 이미지" src="${comment.profileImage}" height="30">
								</c:when>
							</c:choose>
							</a>
						</div>
						<div class="comment-writer-id">${comment.nickName}</div>
						<div class="writed-comment">${comment.content}</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<div class="userArea">
		<div class="likeArea">
			<div class="like">
				<button type="button" class="likeBtn btn" data-post-id="${photoView.photo.id}" data-post-type="${photoView.photo.postType}">
					<c:choose>
						<c:when test="${photoView.filledLike == false}">
							<svg width="24" height="24" fill="none" stroke="#757575" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" class="css-pctok2 ek5sxnq1"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
						</c:when>
						<c:when test="${photoView.filledLike == true}">
							<svg width="24" height="24" fill="#757575" stroke="#757575" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" class="css-pctok2 ek5sxnq1"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
						</c:when>
					</c:choose>
					<div class="likeCount">${photoView.likeCount}</div>
				</button>
			</div>
			
			<%-- 글 수정 --%>
			<c:if test="${userId == photoView.user.id}">
				<div class="editPostArea">
					<button type="button" class="editBtn btn" data-post-id="${photoView.photo.id}" data-user-id="${userId}">수정하기</button>
					<button type="button" class="delBtn btn" data-post-id="${photoView.photo.id}" data-user-id="${userId}">삭제하기</button>
				</div>
			</c:if>
			
			<%-- 작성자 정보 --%>
			<div class="userInfoArea">
				<div class="d-flex">
					<div class="userImg">
						<a href="/user/${photoView.user.id}" class="d-block img-center">
							<c:if test="${empty photoView.user.profileImage}">
								<img height="50" class="img" alt="프로필사진 없음" src="/image/avatar.webp">
							</c:if>
							<c:if test="${not empty photoView.user.profileImage}">
								<img height="50" class="img" alt="${photoView.user.nickName}님의 프로필사진" src="${photoView.user.profileImage}">
							</c:if>
						</a>
					</div>
					<div class="userInfo">
						<div class="userNickName"><a href="/user/${photoView.user.id}">${photoView.user.nickName}</a></div>
						<div class="userIntro">${photoView.user.introduce}</div>
					</div>
				</div>
				<c:if test="${userId != photoView.photo.userId && photoView.follow == false}">
					<button type="button" class="followBtn btn" data-user-id="${photoView.user.id}">팔로우</button>
				</c:if>
			</div>
			
			<%-- 작성자 포스트 --%>
			<div class="writerPostArea">
				<c:forEach var="photo" items="${photoView.photoList}" varStatus="status" end="3">
					<div class="writerPost">
						<div class="square">
							<a class="img-center d-block bg-dark"
								href="/community/photo_detail_view?postId=${photo.id}"> 
								<img height="160" class="img" alt="" src="${photo.imagePath}">
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
</div>

<script>
$(document).ready(function() {
	// userArea fixed 
	let gnbHeight = $('#gnb').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > gnbHeight.top) {
			$('.userArea').css('top', '100px');
		} else {
			$('.userArea').css('top', '150px');
		}
	});
	
	// follow
	$('.followBtn').on('click', function() {
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
	
	// comment 
	$('.commentPlace').on('click', function(){
		$('#commentText').focus();
	});
	$('.comment').focus(function() {
		$('.commentPlace').css('visibility', 'hidden');
	});
	$('.comment').focusout(function() {
		let comment = $('.comment').val();
		if (comment.length < 1) {
			$('.commentPlace').css('visibility', 'visible');
		}
	});
	
	// 댓글입력 등 버튼 활성화
	$('.comment').on('propertychange change keyup paste input', function() {
		let comment = $(this).val();
		if (comment.length > 0) {
			$(this).next('.commentBtn').removeClass('disabledBtn');
		} else {
			$(this).next('.commentBtn').addClass('disabledBtn');
		}
	});
	
	// 댓글 입력
	$('.commentBtn').on('click', function(e) {
		e.preventDefault();
		let comment = $('.comment').val();
		let postId = $(this).data('post-id');
		let postType = "photo";
		
		$.ajax({
			type: "POST"
			, url: "/comment/create"
			, data: {"postType":postType, "postId":postId, "comment": comment}
			, success: function(data) {
				if (data.result == "success") {
					location.reload();
				} else {
					alert(data.errorMessage);
					location.reload();
				}
			}
			, error: function(e) {
				alert("댓글 저장에 실패하였습니다.");
			}
		});
	});
	
	// 수정하기
	$('.editBtn').on('click', function() {
		let postId = $(this).data('post-id');
		let writerId = $(this).data('user-id');
		let userId = ${userId};
		
		if (writerId != userId) {
			alert("잘못된 접근입니다.");
			return;
		}
		location.href = "/post/photo_update_view?postId=" + postId;
	});
	
	// 삭제하기
	$('.delBtn').on('click', function() {
		let postId = $(this).data('post-id');
		
		let choice = confirm("삭제하시겠습니까?");
		if (choice) {
			$.ajax({
				type: "DELETE"
				, url: "/post/phote_delete"
				, data: {"postId":postId}
				, success: function(data) {
					if (data.result == "success") {
						alert("사진이 삭제되었습니다.");
						location.href = "/community/photo_view";
					} else {
						alert(data.message);
					}
				}
				, error: function(e) {
					alert("삭제에 실패하였습니다.");
				}
			});		
		}
	});
});
</script>