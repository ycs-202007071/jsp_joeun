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
            out.println("<script>alert('로그인 정보가 없습니다.'); window.close();</script>");
            return;
        }
        
        try {
            stmt = conn.createStatement();
            
            // 연체 상태 확인
            String overdueQuery = "SELECT overdue FROM users WHERE id = '" + id + "'";
            rs = stmt.executeQuery(overdueQuery);
            
            if (rs.next()) {
                String overdueStatus = rs.getString("overdue");
                if ("Y".equals(overdueStatus)) {
                    out.println("<script>alert('연체 기록이 있습니다. 관리자에게 문의해주세요.'); window.close();</script>");
                    return;
                }
            }
            
            // 현재 날짜와 시간 가져오기
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String nowStr = now.format(formatter);

            // SQL INSERT 쿼리문 작성
            String querytext = "INSERT INTO loans (bookNum, loanDate, id) VALUES ('" 
                + booknum + "', '" + nowStr + "', '" + id + "')";
            stmt.executeUpdate(querytext);
        
            // 대출 성공 메시지
            out.println("<script>");
            out.println("alert('대출이 되었습니다.');");
            out.println("window.close();");
            out.println("if (window.opener && typeof window.opener.fnReload === 'function') {");
            out.println("window.opener.fnReload();");
            out.println("}");
            out.println("</script>");
        
        } catch(SQLException ex) {
            out.println("<script>alert('SQLException: " + ex.getMessage() + "'); window.close();</script>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                out.println("<script>alert('SQLException in finally block: " + e.getMessage() + "'); window.close();</script>");
            }
        }
    %>
</body>
</html>
