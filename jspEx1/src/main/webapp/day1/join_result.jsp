<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("userId");
		String[] hobby = request.getParameterValues("hobby");/* 배열로 받을꺼면 Values를 붙여야함! */
		for(String h : hobby){
			out.println(h + "<br>");
		}
		
		out.println(id+"님 환영합니다!");
	%>
</body>
</html>