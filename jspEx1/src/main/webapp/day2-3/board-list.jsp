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
	
</style>

</head>
<body>
	
	<%@include file="db.jsp"%>
	
	<%
	ResultSet rs = null;
	Statement stmt = null;
	try{
		stmt = conn.createStatement();
		String querytext = "SELECT * FROM TBL_BOARD";
		rs = stmt.executeQuery(querytext);
		out.println("<table>");
		out.println("<tr>");
		out.println("<th> 번호 </th>");
		out.println("<th> 제목 </th>");
		out.println("<th> 작성자 </th>");
		out.println("<th> 조회수 </th>");
		out.println("<th> 작성일 </th>");
		out.println("</tr>");
		
		
		
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>" + rs.getString("boardNo") + "</td>");
		out.println("<td>" + rs.getString("title") + "</td>");
		out.println("<td>" + rs.getString("userId") + "</td>");
		out.println("<td>" + rs.getString("cnt") +"</td>");
		out.println("<td>" + rs.getString("cdatetime") +"</td>");
		out.println("</tr>");
	}
	
	out.println("</table>");

	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>

</body>
</html>