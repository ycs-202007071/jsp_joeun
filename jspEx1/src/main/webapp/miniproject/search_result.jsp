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
	<%
		String bookName = request.getParameter("bookName");
		ResultSet rs = null; //결과
		Statement stmt = null; //쿼리 호출할 객체
		
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from books where bookName like" + "'%" + bookName + "%'");
	
			if (rs.next() == true) {
				out.println(rs.getString("bookNum") + "\t" + rs.getString("bookName") + "\t"+ rs.getString("publisher") + "\t" + rs.getString("writer") + "<br>"); 
			}else{
				out.println("해당 책이 존재하지 않습니다.");
			}
	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	<jsp:include page = "bottom.jsp" flush ="false" />
</body>
</html>