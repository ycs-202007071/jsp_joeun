<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int sum(int a, int b){	
		return a + b;
		}
		void message(){
			System.out.print("안녕!");
		}
	%>

	<%
		int a = sum(2,3); //a = 5
		message();
	%>
</body>
</html>
<script>

</script>