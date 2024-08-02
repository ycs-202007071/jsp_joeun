<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form action = "join_result.jsp" method="get">
		<div>
			아이디 : <input type="text" name="userId">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<div>
			이름 : <input type="text" name="userName">
		</div>
		<div>
			<label>
			<input type="radio" value="M" name="gender">남자</label>
			<label>
			<input type="radio" value="F" name="gender">여자</label>
		</div>
		<!-- <button type="submit">회원가입</button> -->
		<input type="submit" value="회원가입">
	</form>
</body>
</html>