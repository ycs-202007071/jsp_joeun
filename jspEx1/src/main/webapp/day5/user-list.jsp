<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}
	
</style>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="user" items="${userList}">
			<tr>
				<td>${user.userId}</td>
				<td>${user.name}</td>
				<td>${user.status}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
​