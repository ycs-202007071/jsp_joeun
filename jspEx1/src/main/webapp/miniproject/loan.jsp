<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>대출 기록 추가</title>
    <style>
        table, th, tr, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }
    </style>
</head>
<body>
    <%@ include file="db.jsp" %>  
    <%
        ResultSet rs = null;
        Statement stmt = null;
        String booknum = request.getParameter("booknum");
        
        // 세션에서 사용자 ID 가져오기
        String id = (String) session.getAttribute("id");
        
        if (id == null) {
            out.println("로그인 정보가 없습니다.");
            return;
        }
        
        try {
            stmt = conn.createStatement();
            
            // 현재 날짜와 시간 가져오기
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String nowStr = now.format(formatter);

            // SQL INSERT 쿼리문 작성
            String querytext = "INSERT INTO loans (bookNum, loanDate, id) VALUES ('" 
                + booknum + "', '" + nowStr + "', '" + id + "')";
            System.out.println(querytext);
            stmt.executeUpdate(querytext);
        
        } catch(SQLException ex) {
            out.println("SQLException: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                out.println("SQLException in finally block: " + e.getMessage());
            }
        }
    %>
</body>
</html>
<script>
    alert("대출이 되었습니다.");
    window.close();
    if (window.opener && typeof window.opener.fnReload === 'function') {
        window.opener.fnReload();
    }
</script>
