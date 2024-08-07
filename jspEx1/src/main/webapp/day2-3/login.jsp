<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%
		/* session.removeAttribute("userId"); */ /* 하나씩 제거 */
		session.invalidate();	/* 모두 한번에 제거 */
		out.println(session.getAttribute("userId"));
	%> --%>
	<form action="login_result.jsp">
		<div>
			<label>아이디 : <input type="text" name="id"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>	
		<input type="submit" value="로그인!">
	</form>
</body>
</html>





