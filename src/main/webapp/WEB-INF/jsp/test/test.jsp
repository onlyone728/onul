<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
<h1>Hello World!!!</h1>
<table>
<tr>
	<td>이름</td>
	<td>아이디</td>
	<td>이메일</td>
</tr>
<c:forEach var="user" items="${user}">
<tr>
	<td>${user.name}</td>
	<td>${user.loginId}</td>
	<td>${user.email}</td>
</tr>
</c:forEach>
</table>

</body>
</html>