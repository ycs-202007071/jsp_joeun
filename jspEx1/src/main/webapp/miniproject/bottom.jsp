<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관</title>
<style>
    html, body {
        margin: 0;
        padding: 0;
        height: 100%; /* 전체 높이 설정 */
    }
    .content {
        padding-bottom: 60px; /* 푸터 높이만큼의 여백 추가 */
    }
    .footer {
        background-color: #f1f1f1;
        color: #333;
        text-align: center;
        padding: 20px;
        position: fixed;
        bottom: 0;
        width: 100%;
        border-top: 1px solid #ccc;
        z-index: 1000; /* 푸터가 페이지 내용 위에 오도록 설정 */
    }
    .footer a {
        color: #007bff;
        text-decoration: none;
    }
    .footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="content">
        <!-- 여기에 페이지 내용이 들어갑니다. -->
    </div>

    <!-- 푸터 -->
    <div class="footer">
        book house <br> 
        14780 경기도 부천시 경인로 590 (괴안동 185-34) 도서관 대표전화 : (02)2610-0348 / FAX : (02)2610-0354
        <br>Copyright(c) 2024 by Library. All Rights Reserved.
    </div>
</body>
</html>
