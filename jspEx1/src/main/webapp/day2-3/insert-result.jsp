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
	<%@include file="db.jsp"%>
	<%
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String userId = (String) session.getAttribute("userId");
		ResultSet rs = null;
		Statement stmt = null;	
		try{
			stmt = conn.createStatement();
			String query = "INSERT INTO TBL_BOARD VALUES" 
					+ "("
					+ "NULL, '" + title + "', '" + contents 
					+ "', 0, '" + userId  + "', 'number', now(), now()" 	
					+ ")";
			stmt.executeUpdate(query);
			System.out.println("쿼리문 : " + query);
			response.sendRedirect("board-list.jsp");

		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>