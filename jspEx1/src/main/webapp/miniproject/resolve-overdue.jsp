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
			String querytext = "UPDATE USERS SET OVERDUE = 'N' WHERE id = '" + id + "'";
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
	alert("연체 풀기 완료 되었습니다.");
	window.close();
	window.opener.fnReload();
</script>