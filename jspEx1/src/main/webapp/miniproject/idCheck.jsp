<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="db.jsp" %>
<form name="check">
	<%
		String userId = request.getParameter("userId");
		
		ResultSet rs = null; 
		Statement stmt = null; 
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM TBL_USER WHERE userId = '" + userId + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				out.println("사용중인 아이디 입니다. 다른 아이디를 입력해주세요.");
		%>
				<input name="flg" value="N" hidden>
		<%
			} else {
				out.println("사용 가능한 아이디 입니다.");
		%>
				<input name="flg" value="Y" hidden>
		<%
			}
				
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</form>
</body>
</html>
<script>
	// 중복결과 있으면 N 아니면 Y 원래 페이지로 보내기
	function back(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
</script>