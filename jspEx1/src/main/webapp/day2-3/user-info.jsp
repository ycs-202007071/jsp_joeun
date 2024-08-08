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
		String userId = request.getParameter("userId");
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_USER WHERE USERID = '" + userId + "'";
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){
				%>
				<div><%= rs.getString("userId") %></div>
				<div><%= rs.getString("name") %></div>
				<div><%= rs.getString("status") %></div>
				<%
				
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>