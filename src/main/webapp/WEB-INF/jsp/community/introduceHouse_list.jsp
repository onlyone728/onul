<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<div id="introduceList" class="w80">
	<c:forEach var="post" items="${houseList}">
	<div class="introduceCard">
		<div class="imgArea">
			<a href="/community/introduce_detail_view?postId=${post.house.id}" class="img-center d-block">
				<img alt="" src="${post.house.coverImage}" class="img" width="100%">
			</a>
		</div>
		<div class="infoArea">
			<div class="title">
				<a href="/community/introduce_detail_view?postId=${post.house.id}">${post.house.subject}</a>
			</div>
			<div class="writerInfoArea">
				<div class="imgArea">
					<a href="#" class="d-block img-center bg-dark">
						<img alt="" class="h-img" src="${post.user.profileImage}" width="100%">
					</a>
				</div>
				<div class="writerNick">${post.house.nickName}</div>
			</div>
			<div class="postInfo">조회수 ${post.house.hit}회</div>
		</div>
	</div>
	</c:forEach>
</div>

    
    