<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="photoDetail" class="w80">
	<div class="postArea">
		<div class="photoArea">
			<img alt="${photo.nickName}님의 사진" src="${photo.imagePath}" class="w-100">
		</div>
		<div class="contentArea">${photo.content}</div>
		<div class="photoInfo">
			<div class="count">
				<div class="mr-1">조회수 ${photo.hit}</div>
				<div>· 댓글 5</div>
			</div>
			<div class="commentArea">
				<div class="inputComment">
					<div class="userImg img-center">
						<c:if test="${empty userInfo.profileImage}">
							<img class="img" alt="유저 프로필 이미지 없음" src="/image/avatar.webp" height="30">
						</c:if>
						<c:if test="${not empty userInfo.profileImage}">
							<img class="img" alt="${userInfo.nickName}님의 프로필 이미지" src="${userInfo.profileImage}" height="30">
						</c:if>
					</div>
					<div class="commentPlace">칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)</div> 
					<input type="text" id="commentText" class="comment box-radius-5">
					<a href="" class="commentBtn disabledBtn">등록</a>
				</div>
				
				<div class="commentList">
					<div class="comment-box">
						<div class="userImg">
							<img alt="작성자 프로필 이미지 없음" src="/image/avatar.webp" height="30">
						</div>
						<div class="comment-writer-id">작성자 아이디</div>
						<div class="writed-comment">코멘트 내용</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="userArea">
		<div class="likeArea">
			<div class="like">
				<button type="button" class="likeBtn btn" data-post-id="${photo.id}" data-post-type="${photo.postType}">
					<svg width="24" height="24" fill="none" stroke="#757575" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" class="css-pctok2 ek5sxnq1"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
					<div class="likeCount">${like}</div>
				</button>
			</div>
			
			<%-- 작성자 정보 --%>
			<div class="userInfoArea">
				<div class="d-flex">
					<div class="userImg">
						<a href="#" class="d-block img-center">
							<c:if test="${empty userInfo.profileImage}">
								<img height="50" class="img" alt="프로필사진 없음" src="/image/avatar.webp">
							</c:if>
							<c:if test="${not empty userInfo.profileImage}">
								<img height="50" class="img" alt="${userInfo.nickName}님의 프로필사진" src="${userInfo.profileImage}">
							</c:if>
						</a>
					</div>
					<div class="userInfo">
						<div class="userNickName">${userInfo.nickName}</div>
						<div class="userIntro">${userInfo.introduce}</div>
					</div>
				</div>
				<button type="button" class="followBtn btn">팔로우</button>
			</div>
			
			<%-- 작성자 포스트 --%>
			<div class="writerPostArea">
				<c:forEach var="photo" items="${photoList}">
					<div class="writerPost">
						<div class="square">
							<a class="img-center d-block bg-dark"
								href="/community/photo_detail_view?postId=${photo.id}"> <img
								height="160" class="img" alt="" src="${photo.imagePath}">
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
	
	// like
	// href="/like/${photo.postType}/${photo.id}" 
	$('.likeBtn').on('click', function() {
		let postId = $(this).data('post-id');
		let postType = $(this).data('post-type');
		console.log(postId);
		console.log(postType);
		
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
});
</script>