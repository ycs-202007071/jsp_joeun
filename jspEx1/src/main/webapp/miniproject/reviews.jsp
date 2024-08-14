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
<jsp:include page="header.jsp" flush="false" />
<form name="reviews">
	<%@include file="db.jsp"%>	
	<%
	
		ResultSet rs = null;
		Statement stmt = null;
		String bookNum = request.getParameter("bookNum");
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM reviews JOIN books ON reviews.bookNum = books.bookNum WHERE books.BOOKNUM = " + "'"+bookNum+"'";
			System.out.print(querytext);
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){	
				String var =  rs.getString("id");
				
	%>	
				<input  type="hidden" 
						value="<%= rs.getString("bookNum") %>" 
						name="bookNum"> 
				<input  type="hidden" value="<%= rs.getString("id") %>" name="id"> 
				<div>제목 : <%= rs.getString("bookNum") %></div>
				<div>내용 : <%= rs.getString("bookName") %></div>
				<hr>
				<div>제목 : <input type="text" name="title" placeholder="제목" >
				<div>별점 : <input type="text" name="evaluation" placeholder="별점" >
				<div>내용 : <input type="text" name="content" placeholder="내용" >
				<button type="button" onclick = "fnInsert()">등록</button>
				</div>
				<hr>
			
				
	<% 	
	String querycomment = "SELECT * FROM reviews WHERE bookNum = " + bookNum;
		rs = stmt.executeQuery(querycomment);
	
		while(rs.next()){
			out.println("<div>");
			out.println(rs.getString("id"));
			out.println(rs.getString("Evaluation"));
			out.println(rs.getString("content"));
			out.println("</div>");
		}
		String sessinonId = (String)session.getAttribute("userId");
		String sessionStatus = (String)session.getAttribute("status");
		if(var.equals(sessinonId)|| sessionStatus.equals("A")){
	%>			
				
	<%			
		}}			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	
</form>
<jsp:include page="bottom.jsp" flush="false" />
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



