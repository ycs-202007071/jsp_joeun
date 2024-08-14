<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        /* 기존 CSS 스타일 유지 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            position: relative;
            padding-bottom: 70px;
        }
        div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
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
    <div class="container">
        <form action="myPage-update.jsp" method="post">
            <% 
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String id = (String) session.getAttribute("id");
                if (id == null) {
                    // 로그인하지 않은 경우 처리
                    out.println("<p>로그인 상태가 아닙니다. 로그인 해 주세요.</p>");
                    response.sendRedirect("login.jsp");
                    return;
                }

                try {
                    // 데이터베이스 연결
                    Class.forName("com.mysql.jdbc.Driver");
                    String db_url = "jdbc:mysql://localhost:3306/sample";
                    String db_id = "root";
                    String db_pw = "test1234";
                    conn = DriverManager.getConnection(db_url, db_id, db_pw);
                    
                    // 사용자 정보 조회 쿼리
                    String query = "SELECT * FROM users WHERE id = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, id);
                    rs = pstmt.executeQuery();
                    
                    // 사용자 정보가 존재하는 경우 필드에 값 설정
                    if (rs.next()) {
                        String pwd = rs.getString("pwd");
                        String name = rs.getString("name");
                        String nickname = rs.getString("nickname");
                        String phone = rs.getString("phone");
                        String addr = rs.getString("addr");
                        String email = rs.getString("email");
            %>
            <div>
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id" value="<%= id %>" readonly>
            </div>
            <div>
                <label for="pwd">패스워드:</label>
                <input type="password" id="pwd" name="pwd" value="<%= pwd %>">
            </div>
            <div>
                <label for="pwdcheck">패스워드 확인:</label>
                <input type="password" id="pwdcheck" name="pwdcheck">
            </div>
            <div>
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="<%= name %>">
            </div>
            <div>
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname" name="nickname" value="<%= nickname %>">
            </div>
            <div>
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="phone" value="<%= phone %>">
            </div>
            <div>
                <label for="addr">주소:</label>
                <input type="text" id="addr" name="addr" value="<%= addr %>">
            </div>
            <div>
                <label for="email">이메일:</label>
                <input type="text" id="email" name="email" value="<%= email %>">
            </div>
            <button type="submit">저장</button>
            <input type="reset" value="초기화">
            <% 
                    } else {
                        out.println("<p>사용자 정보를 가져오는 데 실패했습니다.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>오류 발생: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </form>
    </div>
    <jsp:include page="bottom.jsp" flush="false" />
</body>
</html>
<script>
function fnLoan(bookNum) {
    window.open("myPage-update.jsp?id=" + id, "update", "width=500,height=300");
}
</script>