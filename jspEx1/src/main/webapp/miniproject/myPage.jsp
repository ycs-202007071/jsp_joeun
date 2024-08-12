<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
/* 기본 스타일 설정 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* 폼 스타일 */
form {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 폼 요소 스타일 */
div {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    background-color: #333;
    color: white;
    border: none;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px 0;
    cursor: pointer;
    border-radius: 4px;
    width: 100%;
}

button:hover {
    background-color: #555;
}

input[type="reset"] {
    background-color: #ddd;
    border: 1px solid #ccc;
    color: #333;
    cursor: pointer;
}

input[type="reset"]:hover {
    background-color: #bbb;
}
</style>
</head>
<body>
<jsp:include page = "header.jsp" flush ="false" />
	<!-- 아이디, 패스워드, 이름 저장 -->
	<form action="join-insert.jsp" name="user">
	<div>
		아이디 : <input type="text" name="id">
		<button type="button" onclick = "fnIdCheck()">중복체크</button>
	</div>
	<div>
		패스워드 : <input type="password" name="pwd">
	</div>
	<div>
		패스워드 확인 : <input type="password" name="pwdcheck">
	</div>
	<div>
		이름 : <input type="text" name="name">
	</div>
	<div>
		닉네임 : <input type="text" name="nickname">
	</div>
	<div>
		전화번호 : <input type="text" name="phone">
	</div>
	<div>
		주소 : <input type="text" name="addr">
	</div>
	<div>
		이메일 : <input type="text" name="email">
	</div>
		<button>저장</button>
		<input type="reset" value="초기화">
	</form>
	<jsp:include page = "bottom.jsp" flush ="false" />
</body>
</html>
<script>
function fnJoin(){
	var form = document.login;
	/* document.폼태그 name을 넣어줘서 가져오면 된다. */
	console.log(form.userId);
	if(form.userId.value == ""||form.userId.value == undefined){
		alert("아이디를 입력해주세요.");
		form.userId.focus();
		retune;
	}
	form.submit();

</script>