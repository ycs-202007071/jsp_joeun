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
		String stuNo = request.getParameter("stuNo");
		ResultSet rs = null; //결과
		Statement stmt = null; //쿼리 호출할 객체
		
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from student where STU_NO=" + stuNo);
	
			if (rs.next() == true) {
				out.println(rs.getString("STU_NO") + "\t" + rs.getString("STU_NAME") + "\t"+ rs.getString("STU_DEPT") + "\t" + rs.getString("STU_GENDER") + "<br>"); 
			}else{
				out.println("해당 학생이 존재하지 않습니다.");
			}
	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>