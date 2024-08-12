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
        <caption>이달의 책</caption>
        <tr>
            <td><a href="#"><img src="./기타사진/그림자포스터/미아.png" width="200" height="275" /></a></td>
            <td><a href="#"><img src="./기타사진/그림자포스터/사찬.png" width="200" height="270" /></a></td>
            <td><a href="#"><img src="./기타사진/그림자포스터/이보통.png" width="200" height="280" /></a></td>
            <td><a href="#"><img src="./기타사진/그림자포스터/언.png" width="200" height="270" /></a></td>
            <td><a href="#"><img src="./기타사진/그림자포스터/해적.png" width="200" height="270" /></a></td>
            <td><img src="./기타사진/그림자포스터/록키.png" width="200" height="270" /></td>
        </tr>
        <tr>
            <td><img src="./기타사진/그림자포스터/킹아더.png" width="200" height="270" /></td>
            <td><img src="./기타사진/그림자포스터/윤동주.png" width="200" height="270" /></td>
            <td><img src="./기타사진/그림자포스터/도리안.png" width="200" height="280" /></td>
            <td><img src="./기타사진/그림자포스터/더데빌.png" width="200" height="275" /></td>
            <td><img src="./기타사진/그림자포스터/니진.png" width="200" height="270" /></td>
            <td><img src="./기타사진/그림자포스터/구큐.png" width="200" height="270" /></td>
        </tr>
    </table>
</div>

<jsp:include page="bottom.jsp" flush="false" />

</body>
</html>
