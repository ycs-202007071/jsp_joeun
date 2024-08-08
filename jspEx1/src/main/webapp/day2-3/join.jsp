<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 아이디, 패스워드, 이름 저장 -->
	<form action="join-insert.jsp" name="user">
	<div>
		아이디 : <input type="text" name="userId">
		<button type="button" onclick = "fnIdCheck()">중복체크</button>
	</div>
	<div>
		패스워드 : <input type="password" name="pwd">
	</div>
	<div>
		이름 : <input type="text" name="userName">
	</div>
	<div>
		전화번호 : <input type="text" name="Phone">
	</div>
	<div>
		<label><input type="radio" name="gender" value="M">남</label>
		<label><input type="radio" name="gender" value="F"> 여</label>
	</div>
		<button>form action 저장</button>
		<button type="button" onclick="fnSave()">함수를 이용한 저장</button>
		<button type="button" onclick="fnSubmit()">action 수정 후 Submit</button>
		<button type="button" onclick="fnInsert()">복습</button>
	</form>
</body>
</html>
<script>
	function fnSave(){
		var f = document.user;
		/* console.log(f.userId.value); */
		var param = "userId="+f.userId.value+"&pwd="+f.pwd.value+"&userName"+f.userName.value;
		location.href="join-insert.jsp?"+param;
	}
	
	function fnSubmit(){
		var f = document.user;
		f.action = "join-insert2.jsp";
		f.submit();
	}
	
	function fnInsert() {
		var f = document.user;
		f.action = "user-insert.jsp";
		f.submit();
	}
	function fnIdCheck(){
		var f = document.user;
		var param = "userId="+f.userId.value;
		location.href="id-check.jsp?"+param;
	}

</script>