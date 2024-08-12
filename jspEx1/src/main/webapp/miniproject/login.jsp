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
/* 로그인 페이지 스타일 */
/* 기본 스타일 설정 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* 폼 스타일 */
form {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 폼 요소 스타일 */
div {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    background-color: #333;
    color: white;
    border: none;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px 0;
    cursor: pointer;
    border-radius: 4px;
    width: 100%;
}


input[type="reset"] {
    background-color: #ddd;
    border: 1px solid #ccc;
    color: #333;
    cursor: pointer;
}

input[type="reset"]:hover {
    background-color: #bbb;
}

.button {
    background-color: #333;
    color: white;
    border: none;
    padding: 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
    width: 100%;
    text-align: center;
}
.button:hover {
    background-color: #555;
}
a.button {
    background-color: #333;
    color: white;
    border: none;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px 0;
    cursor: pointer;
    border-radius: 4px;
    width: 570px; /* 너비를 자동으로 조정 */
    text-align: center;
}



input[type="submit"]:hover {
    background-color: #555;
}</style>

</head>
<body>
<jsp:include page = "header.jsp" flush ="false" />
<form action="login_result.jsp">
		<div>
			<label>아이디 : <input type="text" name="id"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>	
		<input type="submit" class="button" value="로그인!">
		<label>회원이 아니시라면?</label>
		<a href="join.jsp" class="button">회원가입</a>
	</form>
<jsp:include page = "bottom.jsp" flush ="false" />
</body>
</html>
