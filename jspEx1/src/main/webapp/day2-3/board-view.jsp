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
<form action="board-delete.jsp" name="board">
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String boardNo = request.getParameter("boardNo");
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){
	%>	
				<input  type="hidden" 
						value="<%= rs.getString("boardNo") %>" 
						name="boardNo"> 
				<div>제목 : <%= rs.getString("title") %></div>
				<div>내용 : <%= rs.getString("contents") %></div>
				<button type="submit">삭제</button>
				<button type="button" onclick="fnUpdate()">수정</button>
	<%			
			} else {
				out.println("삭제된 게시글 입니다.");
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</form>
</body>
</html>
<script>

	function fnUpdate(){
		var form = document.board;
		form.action = "board-update.jsp";
		form.submit();
	}
</script>



