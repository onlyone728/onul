<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
<div id="detailIntroduce">
	<div id="coverImg" class="img-center bg-info">
		<img alt="커버 이미지" src="${post.knowhow.coverImage}" class="img" width="100%">
	</div>
	<div class="w50">
		<div class="categoryIndexBox2 ">
			<div class="categoryIndex mb-2">노하우 / ${post.knowhow.category}</div>
			<div class="d-flex justify-content-between">
				<div class="postTitle">${post.knowhow.subject}</div>
				<c:if test="${post.user.id == userId}">
					<div class="editPostArea">
						<button type="button" class="editBtn btn" data-post-id="${post.knowhow.id}" data-user-id="${userId}">수정하기</button>
						<button type="button" class="delBtn btn" data-post-id="${post.knowhow.id}" data-user-id="${userId}">삭제하기</button>
					</div>
				</c:if>
			</div>
		</div>
		<div class="userInfoArea">
			<div class="userArea">
				<div class="userImg">
					<a href="/user/${post.user.id}" class="d-block img-center">
						<img alt="user의 프로필 이미지" class="img" src="${post.user.profileImage}" height="100%">
					</a>
				</div>
				<div class="userInfo">
					<div class="userNickName"><a href="/user/${post.user.id}">${post.user.nickName}</a></div>
					<div class="createdAt">
						<fmt:formatDate value="${post.knowhow.createdAt}" pattern="yyyy년 MM월 dd일"/>
					</div>
				</div>
			</div>
			<div class="btnArea">
				<c:choose>
					<c:when test="${post.filledLike == false}">
						<button class="likeBtn btn mr-2" data-post-id="${post.knowhow.id}">+ 좋아요</button>
					</c:when>
					<c:when test="${post.filledLike == true}">
						<button class="likeBtn btn mr-2" data-post-id="${post.knowhow.id}">- 좋아요</button>
					</c:when>
				</c:choose>	
				<c:if test="${userId != post.knowhow.userId && post.follow == false}">
					<button class="followBtn btn" data-user-id="${post.user.id}">+ 팔로우</button>
				</c:if>
				<c:if test="${post.follow == true}">
					<button class="followBtn btn" data-user-id="${post.user.id}">- 팔로우</button>
				</c:if>
			</div>
		</div>
		
		
		<div class="postContent">
			<div class="postTextArea">
				<div class="postText">${post.knowhow.content}</div>
			</div>
			<c:if test="${not empty post.fileList}">
				<div class="postImgArea">
					<c:forEach var="file" items="${post.fileList}">
						<div class="filesImage">
							<img alt="" src="${file.imagePath}" width="100%">
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
		
		
		<div class="count">
			<div class="mr-1">조회수 ${post.knowhow.hit}</div>
			<div class="mr-1">· 팔로우 ${post.followCount}</div>
			<div class="mr-1">· 좋아요 ${post.likeCount}</div>
			<div>· 댓글 ${post.commentCount}</div>
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
					<a href="" class="commentBtn disabledBtn" data-post-id="${post.knowhow.id}">등록</a>
				</div>
			</c:if>	
			
			<div class="commentList">
				<c:forEach var="comment" items="${post.commentList}">
				<div class="comment-box">
					<div class="userImg img-center">
						<c:choose>
							<c:when test="${empty comment.profileImage}">
								<img class="img" alt="작성자 프로필 이미지 없음" src="/image/avatar.webp" height="30">
							</c:when>	
							<c:when test="${not empty comment.profileImage}">
								<img class="img bg-dark" alt="${comment.nickName}님의 프로필 이미지" src="${comment.profileImage}" height="30">
							</c:when>
						</c:choose>
					</div>
					<div class="comment-writer-id">${comment.nickName}</div>
					<div class="writed-comment">${comment.content}</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	let postType = "knowhow";
	// follow
	$('.followBtn').on('click', function() {
		let followId = $(this).data('user-id');
		
		$.ajax({
			type: "GET"
			, url: "/follow/create"
			, data: {"followId": followId}
			, success: function(data) {
				if (data.result == "success") {
					alert("팔로우를 추가하였습니다.");
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
	$('.likeBtn').on('click', function() {
		let postId = $(this).data('post-id');
		
		$.ajax({
			type: "GET"
			, url: "/like"
			, data: {"postId": postId, "postType": postType}
			, success: function(data) {
				if (data.result == "success") {
					alert(data.message);
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
	
	// 댓글입력 등록 버튼 활성화
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
		let comment = $('#commentText').val();
		let postId = $(this).data('post-id');
		
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
});
</script>