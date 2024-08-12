<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>

</head>
<body>
	<%@include file="db.jsp"%>
	<%
	ResultSet rs = null;
	Statement stmt = null;
	String id = request.getParameter("userId");
	
	try {
	
		stmt = conn.createStatement();
		String query = "SELECT * FROM users WHERE id='" + id + "'";
		rs = stmt.executeQuery(query);
			if (rs.next()) {
				out.println("중복된 아이디입니다.");
			} else {
				out.println("사용가능합니다.");
			
		}
	} catch (SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	
	%>

</body>
</html>