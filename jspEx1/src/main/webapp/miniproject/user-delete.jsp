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
		String id = request.getParameter("id");
		
		try{
			stmt = conn.createStatement();
			String querytext = "DELETE FROM reviews WHERE id = '" + id + "'";
			stmt.executeUpdate(querytext);
			stmt = conn.createStatement();
			querytext = "DELETE FROM loans WHERE id = '" + id + "'";
			stmt.executeUpdate(querytext);
			stmt = conn.createStatement();
			querytext = "DELETE FROM USERS WHERE id = '" + id + "'";
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
	alert("삭제 되었습니다.");
	window.close();
	window.opener.fnReload();
</script>