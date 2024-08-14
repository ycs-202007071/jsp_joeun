<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h3 {
            margin: 0;
            text-align: center;
            
            
        }
        hr {
            border: 1px solid #ccc;
            margin: 10px 0;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }
        li {
            float: left;
        }
        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        li a:hover {
            background-color: #111;
        }
       
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown:hover .dropbtn {
            background-color: #111;
        }
    </style>
    <title>도서관</title>
</head>
<body>
    <h3><a href="home.jsp"><img src="img/logo.png" height="80" alt="도서관 로고" /></a></h3>
    <hr>
    <ul>
        <li class="dropdown">
            <a href="book.jsp" class="dropbtn">국내도서</a>
            <div class="dropdown-content">
                <!-- 여기에 드롭다운 내용 추가 가능 -->
            </div>
        </li>
        <li class="dropdown">
            <a href="foreignBooks.jsp" class="dropbtn">외국도서</a>
            <div class="dropdown-content">
                <!-- 여기에 드롭다운 내용 추가 가능 -->
            </div>
        </li>
        <li class="dropdown">
            <a href="searchByTitle.jsp" class="dropbtn">책 검색</a>
            <div class="dropdown-content">
                <!-- 여기에 드롭다운 내용 추가 가능 -->
            </div>
        </li>
        <li class="dropdown">
            <a href="#" class="dropbtn">마이페이지</a>
            <div class="dropdown-content">
                <a href="myPage.jsp">프로필 수정</a>
                <a href="loanHistory.jsp">대출 한 책</a>
            </div>
        </li>
        <%
            HttpSession sess = request.getSession(false); // 세션 객체를 가져옵니다.
            boolean loggedIn = (sess != null && session.getAttribute("id") != null); // 로그인 상태 확인
        %>
        <li class="dropdown">
            <%
                if (loggedIn) {
                    // 로그인된 상태일 때
            %>
                    <a href="logout.jsp" class="dropbtn">로그아웃</a>
            <%
                } else {
                    // 로그인되지 않은 상태일 때
            %>
                    <a href="login.jsp" class="dropbtn">로그인</a>
            <%
                }
            %>
        </li>
    </ul>
</body>
</html>
