<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
</head>
<body>
    <%
        HttpSession sess = request.getSession(false); // 기존 세션 가져오기 (존재하지 않으면 null 반환)
        if (sess != null) {
        	sess.invalidate(); // 세션 무효화
            response.sendRedirect("login.jsp"); // 로그인 페이지로 리디렉션
        } else {
            out.println("세션이 존재하지 않습니다.");
        }
    %>
</body>
</html>
