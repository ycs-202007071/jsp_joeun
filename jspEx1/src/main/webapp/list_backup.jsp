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
		ResultSet rs = null; //결과
		Statement stmt = null; //쿼리 호출할 객체
		
		try{
			stmt = conn.createStatement();
			/* String querytext = "select * from student"; */
			rs = stmt.executeQuery("select * from student");
	
			while (rs.next()) {
				out.println(rs.getString("stu_name") + "\t" + rs.getString("stu_no") + "<br>"); 
			}
	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>