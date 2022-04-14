<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="searchView" class="w80">
	<div class="searchKeyword"><span class="redText">${keyword}</span> 사진 검색 결과</div>
	<%-- 사진 --%>
	<div class="postArea">
		<c:if test="${empty photoList}">
			<div class="noResult">검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${not empty photoList}">
			<div class="gridBetween">
				<c:forEach var="photo" items="${photoList}">
					<div class="photoCard column4 relative">
						<div class="dealImgBox box-radius-5">
							<a href="/community/photo_detail_view?postId=${photo.photo.id}" class="d-block img-center bg-dark">
								<img alt="" src="${photo.photo.imagePath}" class="img" width="269">
							</a>	
						</div>
						<div class="infoArea absolute">
							<a href="/user/${photo.user.id}" class="d-flex">
								<div class="postWritherImg border-1-white img-center m-0 mr-2">
									<img alt="" src="${photo.user.profileImage}" class="img" height="100">
								</div>
								<div class="text-white font15 textShadow2"><b>${photo.user.nickName}</b></div>
							</a>
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