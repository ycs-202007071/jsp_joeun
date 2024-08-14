<%@page import="java.awt.Checkbox"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp" flush="false" />
<title>회원 관리</title>
<style>
/* 기본 스타일 설정 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* 버튼 스타일 */
button {
    background-color: #333;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 10px 0;
    cursor: pointer;
    border-radius: 4px;
}

button:hover {
    background-color: #555;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px auto;
    background-color: #fff;
}

th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

th {
    background-color: #333;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}
</style>
</head>
<body>
<button onclick="location.href='home.jsp'">홈페이지로 이동</button>
<table>
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>권한</th>
        <th>비밀번호</th>
        <th>유저삭제</th>
    </tr>

    <%@include file="db.jsp"%>
    <%
        ResultSet rs = null;
        Statement stmt = null;
        
        try {
            stmt = conn.createStatement();
            String querytext = "SELECT * FROM users";
            rs = stmt.executeQuery(querytext);
            
            while (rs.next()) {
                String status = rs.getString("status").equals("A") ? "관리자" : "일반회원";
                int cnt = rs.getInt("cnt");
    %>
    <tr>
        <td><%= rs.getString("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= status %></td>
        <td>
            <% if (cnt >= 5) { %>
            <button onclick="fnReset('<%= rs.getString("id") %>')">초기화</button>
            <% } %>
        </td>
        <td>
            <% if (!status.equals("관리자")) { %>
            <button onclick="fnDelete('<%= rs.getString("id") %>')">유저삭제</button>
            <% } %>
        </td>
    </tr>
    <%
            }
        } catch (SQLException ex) {
            out.println("SQLException : " + ex.getMessage());
        }
    %>
</table>
<jsp:include page="bottom.jsp" flush="false" />
</body>
</html>
<script>
    function fnReset(id) {
        window.open("pwd-reset.jsp?id=" + id, "reset", "width=500,height=300");
    }

    function fnDelete(id) {
        window.open("user-Delect.jsp?id=" + id, "delete", "width=500,height=300");
    }

    function fnReload() {
        location.reload();
    }
</script>
