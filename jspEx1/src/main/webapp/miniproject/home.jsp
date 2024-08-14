<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관</title>
<style>
table {
    table-layout: auto; 
    width: 80%;
    border-spacing: 20px 20px;
    border: 0px solid white;
}

header, footer {
    background-color: #f1f1f1;
    padding: 10px;
    text-align: center;
}
td {
    text-align: center;
    border: 0px dotted white;
}

tr:first-child {
    background: blank;
}

.c {
    vertical-align: top;
}
caption {
    font-size: 24px; /* 캡션 글자 크기 */
    font-weight: bold; /* 캡션 글자 두께 */
    color: #333; /* 캡션 글자 색상 */
    margin-bottom: 10px; /* 캡션과 테이블 사이의 여백 */
    text-align: center; /* 캡션 중앙 정렬 */
}
</style>
</head>
<body>

<jsp:include page="header.jsp" flush="false" />

<div style="height: auto;">
    <table border="1">
        <caption>새로 들어온 책</caption>
        <tr>
            <td><a href="#"><img src="./img/bookimg/당신이 누군가 죽였다.PNG" width="200" height="275" /></a></td>
            <td><a href="#"><img src="./img/bookimg/더 좋은 문장을 쓰고 싶은 당신을 위한 필사책.PNG" width="200" height="270" /></a></td>
            <td><a href="#"><img src="./img/bookimg/불안세대.PNG" width="200" height="280" /></a></td>
            <td><a href="#"><img src="./img/bookimg/대모험.jpg" width="200" height="270" /></a></td>
        </tr>
        <tr>
            <td><a href="#"><img src="./img/Engbook/Foster.PNG" width="200" height="275" /></a></td>
            <td><a href="#"><img src="./img/Engbook/Holes.PNG"" width="200" height="270" /></a></td>
            <td><a href="#"><img src="./img/Engbook/wonder.PNG" width="200" height="280" /></a></td>
 
        </tr>
    </table>
</div>

<jsp:include page="bottom.jsp" flush="false" />

</body>
</html>
