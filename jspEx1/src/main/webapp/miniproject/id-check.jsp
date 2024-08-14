<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%
    String id = request.getParameter("id");
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    boolean isAvailable = false;

    try {
        String sql = "SELECT 1 FROM users WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            isAvailable = false; // 아이디가 이미 존재함
        } else {
            isAvailable = true; // 아이디가 사용 가능함
        }
    } catch (SQLException e) {
        out.println(e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<script>
    // 중복 확인 결과를 부모 창으로 전달
    function sendResult() {
        window.opener.getReturn("<%= isAvailable ? "Y" : "N" %>");
        window.close();
    }
    sendResult(); // 페이지 로드 시 호출
</script>
