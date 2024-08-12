<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "header.jsp" flush ="false" />
<form action ="search_result.jsp" method = "get">

	<div>
		<label>책 제목 : <input type ="text" name="bookName"></label>
	</div>
	<input type = "submit" value="책 검색">
</form>
<jsp:include page = "bottom.jsp" flush ="false" />
</body>
</html>