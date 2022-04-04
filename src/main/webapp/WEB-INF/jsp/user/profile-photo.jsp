<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="myPhotoList">
	<div class="photoCard">
		<div class="imageArea">
			<a class="img-center d-block">
				<img alt="" src="">
			</a>
		</div>
		
		<div class="infoArea d-flex justify-content-between align-items-center">
			<div class="d-flex align-items-center">
				<svg class="icon icon--stroke" aria-label="좋아요" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
				<div class="w-100" style="font-size: 15px; max-width: 20px;">00</div>
			</div>
			
			<div class="scrapBtn d-flex align-items-center">
				<svg class="icon icon--stroke" aria-label="스크랩" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>
				<div class="w-100" style="font-size: 15px; max-width: 20px;">00</div>
			</div>
			<div class="commentViewBtn d-flex align-items-center">
				<a href="/community/photo_detail_view?postId=">
					<svg class="icon" aria-label="댓글 달기" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" fill-rule="nonzero" d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z"></path></svg>
				</a>
				<div class="w-100" style="font-size: 15px; max-width: 20px;">00</div>
			</div>
		</div>
		
		<div class="contentArea">
			afjlajdflajfljdalfj;adljflajflja;flafjlajdflajfljdalfj;adljflajflja;flafjlajdflajfljdalfj;adljflajflja;flafjlajdflajfljdalfj;adljflajflja;fl
		</div>
		
		<div class="commentArea">
			<div class="commentWriterImg bg-dark">
				<a href="#" class="d-block img-center"><img class="img" src="" height="100%"></a>
			</div>
			<div class="commentId">{comment.nickName}</div>
			<div class="comment">{comment.content}</div>
		</div>
	</div>
</div>

