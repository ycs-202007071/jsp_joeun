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
	overflow-y: auto; /* 스크롤 추가 */
	position: relative; /* 부모 요소의 위치를 상대적으로 설정 */
	padding-bottom: 70px; /* 푸터가 폼의 버튼을 가리지 않도록 여백 추가 */
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

input[type="text"], input[type="password"] {
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
	<jsp:include page="header.jsp" flush="false" />
	<!-- 아이디, 패스워드, 이름 저장 -->
	<form action="join-insert.jsp" name="user" onsubmit="return fnJoin()">
        <div>
            아이디 : <input type="text" id="id" name="id">
            <!-- ID 필드의 ID를 'id'로 설정 -->
            <button type="button" onclick="fnIdCheck()">중복체크</button>
        </div>
        <div id="idCheckResult"></div>
        <!-- 중복 확인 결과를 표시할 div 추가 -->
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
        <button type="submit">저장</button>
        <input type="reset" value="초기화">
    </form>
    <jsp:include page="bottom.jsp" flush="false" />
</body>
</html>
<script>
var check2 = false; // 중복 여부

function fnIdCheck(){
    var form = document.user;
    if(form.id.value === "" || form.id.value.length < 1){
        alert("아이디를 먼저 입력해주세요");
        form.id.focus();
    } else {
        // 중복 확인 창 열기
        window.open("id-check.jsp?id=" + encodeURIComponent(form.id.value), "check", "width=500,height=300");
    }
}

function fnJoin(){
    if(!check2){
        alert("아이디 중복체크를 하세요.");
        return false; // 폼 제출을 막음
    }
    // 추가 검증: 비밀번호와 비밀번호 확인이 일치하는지 검사
    var pwd = document.user.pwd.value;
    var pwdcheck = document.user.pwdcheck.value;
    if (pwd !== pwdcheck) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    return true; // 폼 제출 허용
}

function getReturn(val){
    check2 = (val === "Y");
    document.getElementById("idCheckResult").innerText = check2 ? "사용 가능한 아이디입니다." : "아이디가 이미 존재합니다.";
}
</script>