<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    table, th, tr, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
    }
    a:visited, a:link {
        color: black;
        text-decoration: none;
        font-weight: bold;
    }
</style>

</head>
<body>
    <div><button onclick="location.href='login.jsp'">로그아웃</button></div>
    <%@ include file="db2.jsp" %>
    <sql:query var="result" dataSource="${dataSource}">
        SELECT B.boardNo, title, B.cnt, cdatetime, NAME, commentCnt
        FROM tbl_board B
        INNER JOIN tbl_user U ON B.userId = U.userId
        LEFT JOIN (
            SELECT COUNT(*) AS commentCnt, boardNo
            FROM tbl_comment
            GROUP BY boardNo
        ) C ON B.boardNo = C.boardNo
    </sql:query>

    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td>${row.boardNo}</td>
                <td>
                    <a href="#" onclick="fnView('${row.boardNo}')">
                        ${row.title} <c:if test="${row.commentCnt != null}">(${row.commentCnt})</c:if>
                       <%--  ${row.title} <c:if test="${not empty row.commentCnt}">(${row.commentCnt})</c:if>  위와 같은 내용! else는 없다!--%>
                    </a>
                </td>
                <td>${row.NAME}</td>
                <td>${row.cnt}</td>
                <td>${row.cdatetime}</td>
            </tr>
        </c:forEach>
    </table>

    <button onclick="location.href='insert.jsp'">글쓰기</button>

</body>
</html>

<script>
    function fnView(boardNo){
        location.href="board-view.jsp?boardNo="+boardNo;
    }
</script>