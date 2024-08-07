<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		margin-top : 5px;
	}
</style>
</head>
<body>
	<form action="insert-result.jsp" name="board">
		<div>
			<label>제목 : <input type="text" name="title"></label>
		</div>
		<div>
			<label>내용 : <textarea cols="50" rows="10" name="contents"></textarea></label>
		</div>
		<div>
			<button type="button" onclick="fnCheck()">저장</button>
			<!-- <input type="button"> -->
		</div>
	</form>
</body>
</html>
<script>
	function fnCheck(){
		var form = document.board;
		if(form.title.value == ""){
			alert("제목을 입력해주세요.");
			form.title.focus();
			return;
		}	
		if(form.contents.value == ""){
			alert("내용을 입력해주세요.");
			form.contents.focus();
			return;
		}
		
		alert("저장되었습니다.");
		form.submit();
		
	}
</script>






