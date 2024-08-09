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

	<%
		Connection conn;
		Class.forName("com.mysql.jdbc.Driver");
		String db_url = "jdbc:mysql://localhost:3306/sample";
		String db_id = "root";
		String db_pw = "test1234";
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		System.out.println("DB 연결 완료");
	%>

</body>
</html>