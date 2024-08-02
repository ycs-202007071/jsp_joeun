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
		String pw = request.getParameter("pwd");
		if(id.equals("test") && pw.equals("1234") ){
			/* out.println("로그인 성공"); */
			response.sendRedirect("main.jsp");
		}else{
			out.println("로그인 실패");
		}
	%>
	<div>client ip : <%= request.getRemoteAddr()%></div>
    <div>요청 uri : <%= request.getRequestURI()%></div>
    <div>메소드 : <%= request.getMethod()%></div>
    <div>서버포트 : <%= request.getServerPort()%></div>
    <div>쿼리문 : <%= request.getQueryString()%></div>

</body>
</html>