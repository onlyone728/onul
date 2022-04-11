<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	  

<div id="introduceList" class="w80">
	<c:forEach var="post" items="${houseList}">
	<div class="introduceCard">
		<div class="imgArea">
			<a href="/community/introduce_detail_view?postId=${post.house.id}" class="img-center d-block bg-dark">
				<img alt="" src="${post.house.coverImage}" class="img" width="100%">
			</a>
		</div>
		<div class="infoArea">
			<div class="title">
				<a href="/community/introduce_detail_view?postId=${post.house.id}">${post.house.subject}</a>
			</div>
			<div class="writerInfoArea">
				<div class="imgArea">
					<a href="/user/${post.user.id}" class="d-block img-center bg-dark">
						<img alt="" class="h-img" src="${post.user.profileImage}" width="100%">
					</a>
				</div>
				<div class="writerNick"><a href="/user/${post.user.id}">${post.house.nickName}</a></div>
			</div>
			<div class="postInfo">조회수 ${post.house.hit}회 · 댓글수 ${fn:length(post.commentList)}</div>
		</div>
	</div>
	</c:forEach>
</div>

    
    