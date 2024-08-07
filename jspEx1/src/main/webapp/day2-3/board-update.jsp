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
	div {
		margin-top : 5px;
	}

}
	
</style>

</head>
<body>
<form action="board-update-result.jsp">
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
				<div>제목 : <input value="<%= rs.getString("title") %>" name="title"></div>
				<div>내용 : 
					<textarea cols="50" rows="10" name="contents"><%= rs.getString("contents") %></textarea>
				</div>
				<button type="submit">저장</button>
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
