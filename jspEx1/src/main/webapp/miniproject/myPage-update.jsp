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
	<% request.setCharacterEncoding("UTF-8");%>
	
	<%	ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		
		stmt = conn.createStatement();
	        stmt = conn.createStatement();
	        String query = "UPDATE users SET "
	                + "pwd = '" + pwd + "', "
	                + "name = '" + name + "', "
	                + "nickname = '" + nickname + "', "
	                + "phone = '" + phone + "', "
	                + "addr = '" + addr + "', "
	                + "email = '" + email + "' "
	                + "WHERE id = '" + id + "'";
	        
	    System.out.println(query); // 디버깅용 출력
		stmt.executeUpdate(query);
		
		
		
	%>
		
	
	<jsp:include page = "bottom.jsp" flush ="false" />
	
</body>
</html>
<script>
    alert("수정 되었습니다.");
    window.close();
    if (window.opener && typeof window.opener.fnReload === 'function') {
        window.opener.fnReload();
    }
</script>