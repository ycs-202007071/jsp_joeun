<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    table, th, tr, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
    }
    a:visited, a:link {
        color: black;
        text-decoration: none;
        font-weight: bold;
    }
</style>
</head>
<body>
<form action="login_result.jsp">
		<div>
			<label>아이디 : <input type="text" name="id"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>	
		<input type="submit" value="로그인!">
	</form>

</body>
</html>
