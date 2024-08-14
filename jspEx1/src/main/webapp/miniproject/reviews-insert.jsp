<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
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

}
	
</style>

</head>
<body>
	<%@include file="db.jsp"%>	
	
	<%
	
		ResultSet rs = null;
		Statement stmt = null;
		String bookNum = request.getParameter("bookNum");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String evaluation = request.getParameter("evaluation");
		String content = request.getParameter("content");
		
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"INSERT INTO TBL_COMMENT VALUES (" + bookNum + ",'" + title + "', '" + id + "','" + evaluation +"','"+ content + "')";
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>