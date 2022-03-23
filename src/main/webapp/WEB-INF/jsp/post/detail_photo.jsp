<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="photoDetail" class="w80">
	<div class="postArea">
		<div class="photoArea">
			<img alt="${photo.nickName}님의 사진" src="${photo.imgPath}" class="w-100">
		</div>
		<div class="contentArea"></div>
		<div class="photoInfo">
			<div class="count">
				<div class="mr-1">조회수 10</div>
				<div>· 댓글 5</div>
			</div>
			<div class="commentArea">
				<div class="inputComment">
					<div class="userImg">
						<c:if test="${is null userInfo.profileImage}">
							<img alt="유저 프로필 이미지 없음" src="/images/avatar.webp" height="30">
						</c:if>
					</div>
					<div class="commentPlace">칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다:)</div> 
					<input type="text" id="commentText" class="comment box-radius-5">
					<a href="" class="commentBtn disabledBtn">등록</a>
				</div>
				
				<div class="commentList">
					<div class="comment-box">
						<div class="userImg">
							<img alt="작성자 프로필 이미지 없음" src="/images/avatar.webp" height="30">
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
				<button href="#" class="likeBtn btn">
					<svg width="24" height="24" fill="none" stroke="#757575" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" class="css-pctok2 ek5sxnq1"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
					<div class="likeCount">16</div>
				</button>
			</div>
			
			<%-- 작성자 정보 --%>
			<div class="userInfoArea">
				<div class="d-flex">
					<div class="userImg">
						<a href="#" class="d-block img-center"><img height="50" class="img" alt="작성자 프로필사진" src="https://cdn.pixabay.com/photo/2021/02/23/09/26/cat-6042858_1280.jpg"></a>
					</div>
					<div class="userInfo">
						<div class="userNickName">작성자 닉네임</div>
						<div class="userIntro">작성자 소개글</div>
					</div>
				</div>
				<button type="button" class="followBtn btn">팔로우</button>
			</div>
			
			<%-- 작성자 포스트 --%>
			<div class="writerPostArea">
				<div class="writerPost">
					<div class="square">
						<a class="img-center d-block" href="#">
							<img height="160" class="img" alt="" src="https://cdn.pixabay.com/photo/2020/05/08/16/06/dog-5146351_1280.jpg">
						</a>
					</div>
				</div>
				
				<div class="writerPost">
					<div class="square">
						<a class="img-center d-block" href="#">
							<img height="160" class="img" alt="" src="https://cdn.pixabay.com/photo/2020/05/08/16/06/dog-5146351_1280.jpg">
						</a>
					</div>
				</div>
				
				<div class="writerPost">
					<div class="square">
						<a class="img-center d-block" href="#">
							<img height="160" class="img" alt="" src="https://cdn.pixabay.com/photo/2020/05/08/16/06/dog-5146351_1280.jpg">
						</a>
					</div>
				</div>
				
				<div class="writerPost">
					<div class="square">
						<a class="img-center d-block" href="#">
							<img height="160" class="img" alt="" src="https://cdn.pixabay.com/photo/2020/05/08/16/06/dog-5146351_1280.jpg">
						</a>
					</div>
				</div>
				
				
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