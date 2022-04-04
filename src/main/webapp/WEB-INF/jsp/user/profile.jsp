<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="myPage">
	<jsp:include page="../include/mypage_gnb.jsp" />
	<div class="w80 myPageContents">
		<jsp:include page="../include/profile-user.jsp" />
		
		<div class="contentArea">
			<jsp:include page="${menuPath}.jsp" />
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	
});
</script>