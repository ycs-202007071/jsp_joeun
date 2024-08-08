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
	
	<%	ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		
		stmt = conn.createStatement();
		String query = "INSERT INTO tbl_user" 
				+ " VALUES ('" + id + "', '" + pwd +"', '" +name + "','0','N','C')";
		System.out.println(query);
		stmt.executeUpdate(query);
		
		
		
		
		/* if(id.equals("test") && pwd.equals("1234")) {
			out.print("성공");
		}else{
			out.print("실패");
		}  */
	%>
	
		
		
		
	
	
	
</body>
</html>