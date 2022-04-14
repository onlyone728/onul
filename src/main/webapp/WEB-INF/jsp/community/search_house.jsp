<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="searchView" class="w80">
	<div class="searchKeyword"><span class="redText">${keyword}</span> 집들이 검색 결과</div>
	<%-- 집들이 --%>
	<div class="postArea">
		<c:if test="${empty houseList}">
			<div class="noResult">검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty houseList}">
			<div class="gridBetween">
				<c:forEach var="house" items="${houseList}">
					<div class="column4">
						<div class="img-center box-radius-10 postImgBox bg-dark">
							<a href="/community/introduce_detail_view?postId=${house.house.id}">
								<img alt="" src="${house.house.coverImage}" class="img"  width="180">
							</a>
						</div>
						<div class="infoArea">
							<div class="postTitle">${house.house.subject}</div>
							<div class="writerInfo">
								<div class="postWritherImg">
									<a href="/user/${house.user.id}" class="img-center d-block">
										<img class="img" alt="" src="${house.user.profileImage}" height="100">
									</a>
								</div>
								
								<div class="writerNickName"><a href="/user/${house.user.id}">${house.house.nickName}</a></div>
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