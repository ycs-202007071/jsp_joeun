<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "header.jsp" flush ="false" />

	<%@include file="db.jsp"%>
	
	<%	ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		
		
		stmt = conn.createStatement();
		String query = "INSERT INTO users (id, pwd, name, nickname, phone, addr, email, overdue, status, cnt) " 
                + "VALUES ('" + id + "', '" + pwd + "', '" + name + "', '" + nickname + "', '" + phone + "', '" + addr + "', '" + email + "', 'N', 'C', '0')";
		System.out.println(query);
		stmt.executeUpdate(query);
		
		
		
	%>
	
		<div><%= name %>님 어서오세요!</div>
		
		
		
	
	<jsp:include page = "bottom.jsp" flush ="false" />
	
</body>
</html>