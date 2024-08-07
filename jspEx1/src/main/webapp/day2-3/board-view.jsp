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
	.comment{
	width : 330px;
	height : 20px;
	padding : 5px;
	margin : 10px 0;
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
				String var =  rs.getString("userId");
				
	%>	
				<input  type="hidden" 
						value="<%= rs.getString("boardNo") %>" 
						name="boardNo"> 
				<input  type="hidden" value="<%= rs.getString("userId") %>" name="userId"> 
				<div>제목 : <%= rs.getString("title") %></div>
				<div>내용 : <%= rs.getString("contents") %></div>
				<button type="submit">삭제</button>
				<button type="button" onclick="fnUpdate()">수정</button>
				<hr>
				<div class = comment>댓글 : <input type="text" name="comment" placeholder="댓글 쓰셈" >
				<button type="button" onclick = "fnInsert()">등록</button>
				</div>
				<hr>
			
				
	<% 	
	String querycomment = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = " + boardNo;
		rs = stmt.executeQuery(querycomment);
	
		while(rs.next()){
			out.println("<div>");
			out.println(rs.getString("userId"));
			out.println(rs.getString("comment"));
			out.println("</div>");
		}
		String sessinonId = (String)session.getAttribute("userId");
		String sessionStatus = (String)session.getAttribute("status");
		if(var.equals(sessinonId)|| sessionStatus.equals("A")){
	%>			
				
	<%			
		}} else {
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
	function fnInsert(){
		var form = document.board;
		form.action = "comment-insert.jsp";
		form.submit();
	}
</script>



