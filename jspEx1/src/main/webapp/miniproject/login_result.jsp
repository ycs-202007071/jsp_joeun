<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 처리</title>
    <style>
        table, th, tr, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }
    </style>
</head>
<body>
<jsp:include page = "header.jsp" flush ="false" />

    <%@ include file="db.jsp" %>
    <%
        ResultSet rs = null;
        Statement stmt = null;
        
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        
        try {
            stmt = conn.createStatement();
            String querytext = 
                    "SELECT * FROM users "
                    + "WHERE id = '" + id + "' "
                    + "AND pwd = '" + pwd + "'";
            rs = stmt.executeQuery(querytext);
            
            if (rs.next()) {
                // 아이디 o, 패스워드 o
                if (rs.getInt("cnt") >= 5) {
                    // 5번 이상 실패
                    out.println("5번 이상 실패. 관리자에게 문의하세요.");
                } else {
                    // 로그인 성공
                    HttpSession sess = request.getSession();
                    sess.setAttribute("id", rs.getString("id"));
                    sess.setAttribute("status", rs.getString("status"));
                    if (rs.getString("status").equals("A")) {
                        response.sendRedirect("user-list.jsp");
                    } else {
                        response.sendRedirect("home.jsp");
                    }
                    
                    // Reset the failed login counter
                    querytext = 
                            "UPDATE users SET "
                            + "cnt = 0 "
                            + "WHERE id = '" + id + "'";
                    stmt.executeUpdate(querytext);
                }
            } else {
                // 아이디나 패스워드가 다를 경우
                querytext = 
                        "SELECT * FROM users "
                        + "WHERE id = '" + id + "'";
                rs = stmt.executeQuery(querytext);
                
                if (rs.next()) {
                    // 아이디는 o, 비밀번호는 x일 경우
                    if (rs.getInt("cnt") >= 5) {
                        // 비밀번호 5번 이상 실패된 상황
                        out.println("5번 이상 실패. 관리자에게 문의하세요.");
                    } else {
                        // 비밀번호를 틀릴 경우 cnt값 1 증가
                        out.println("비밀번호가 틀렸습니다.");
                        querytext = 
                                "UPDATE users SET "
                                + "cnt = cnt + 1 "
                                + "WHERE id = '" + id + "'";
                        stmt.executeUpdate(querytext);
                    }
                } else {
                    // 없는 아이디로 로그인 시도
                    out.println("아이디 확인이 필요합니다.");
                }
            }
        
        } catch (SQLException ex) {
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
    <div>
        <button onclick="location.href='login.jsp'">로그인 페이지로 이동</button>
    </div>
    	<jsp:include page = "bottom.jsp" flush ="false" />
</body>
</html>
