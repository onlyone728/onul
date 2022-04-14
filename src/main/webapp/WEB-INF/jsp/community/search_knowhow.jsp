<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="searchView" class="w80">
	<div class="searchKeyword"><span class="redText">${keyword}</span> 노하우 검색 결과</div>
	<%-- 노하우 --%>
	<div class="postArea">
		<c:if test="${empty knowhowList}">
			<div class="noResult">검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty knowhowList}">
			<div class="gridBetween">
				<c:forEach var="knowhow" items="${knowhowList}">
					<div class="column4">
						<div class="box-radius-10 postImgBox bg-dark">
							<a class="img-center d-block d-box" href="/community/knowhow_detail_view?postId=${knowhow.knowhow.id}">
								<img alt="" src="${knowhow.knowhow.coverImage}" class="img"  width="100%">
							</a>
						</div>
						<div class="infoArea">
							<div class="postTitle">${knowhow.knowhow.subject}</div>
							<div class="writerInfo">
								<div class="postWritherImg">
									<a href="/user/${knowhow.user.id}" class="img-center d-block">
										<img class="img" alt="" src="${knowhow.user.profileImage}" height="100">
									</a>
								</div>
								<div class="writerNickName">
									<a href="/user/${knowhow.user.id}">${knowhow.user.nickName}</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>	
	</div>
</div>
<script>
$(document).ready(function() {
	$('#keyword').val('${keyword}');
});
</script>