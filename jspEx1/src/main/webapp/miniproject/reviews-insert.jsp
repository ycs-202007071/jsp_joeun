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
	    // 세션에서 사용자 ID와 상태를 가져옵니다
	    String id = (String) session.getAttribute("id");
	    if (id == null) {
	        out.println("로그인이 필요합니다.");
	        return; // 페이지 처리를 종료합니다
	    }
		
	
		ResultSet rs = null;
		Statement stmt = null;
		String bookNum = request.getParameter("bookNum");
		String title = request.getParameter("title");
		String evaluation = request.getParameter("evaluation");
		String content = request.getParameter("content");
		
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"INSERT INTO REVIEWS VALUES ('" + bookNum + "','" + title + "', '" + id + "','" + evaluation +"','"+ content + "')";
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>
<script>
	alert("등록 되었습니다.");
	window.close();
	if (window.opener && typeof window.opener.fnReload === 'function') {
	    window.opener.fnReload();
	}
</script>