<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* 전반적인 스타일 설정 */
/* 전반적인 스타일 설정 */
.content {
    min-height: calc(100vh - 80px); /* 푸터 높이(예: 80px)를 뺀 최소 높이 설정 */
    padding-bottom: 60px; /* 푸터 높이만큼의 여백 추가 */
    max-width: 1200px; /* 최대 너비 설정 */
    margin: 0 auto; /* 중앙 정렬 */
    padding: 0 20px; /* 좌우 여백 추가 */
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

header, footer {
    background: #333;
    color: #fff;
    padding: 10px 0;
    text-align: center;
}

header h1, footer p {
    margin: 0;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 10px;
    text-align: left;
}

th {
    background: #333;
    color: #fff;
}

/* 폼 스타일 */
form {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px; /* 폼 안쪽 여백 추가 */
}

form div {
    margin-bottom: 10px;
}

input[type="text"], input[type="hidden"], textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
}

button {
    background: #333;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 4px;
    font-size: 16px;
}

button:hover {
    background: #555;
}

/* 기타 스타일 */
hr {
    margin: 20px 0;
    border: 0;
    border-top: 1px solid #ddd;
}

.comment {
    width: 100%;
    height: 100px;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
    background: #fafafa;
}

textarea {
    width: 100%;
    height: 100px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background: #fafafa;
}

	
</style>

</head>
<body>
<jsp:include page="header.jsp" flush="false" />

<form name="reviews">
    <%@include file="db.jsp"%>    
    <%
        HttpSession sess = request.getSession();
        String userId = (String) sess.getAttribute("id");
        ResultSet rs = null;
        Statement stmt = null;
        ResultSet rsLoan = null;
        String bookNum = request.getParameter("bookNum");
        
        try {
            stmt = conn.createStatement();
            String querytext = "SELECT * FROM books LEFT JOIN reviews ON reviews.bookNum = books.bookNum WHERE books.BOOKNUM = '" + bookNum + "'";
            String loanQuery = "SELECT * FROM loans WHERE bookNum = '" + bookNum + "'";
            rsLoan = stmt.executeQuery(loanQuery);
            boolean isLoaned = rsLoan.next(); // Check if there's a loan record
            rs = stmt.executeQuery(querytext);
            
            if (rs.next()) {
                String imageUrl = bookNum.equals("book002") ? "./img/bookimg/만일 내가 그때 내 말을 들어줬더라면.PNG" :
                      bookNum.equals("book003") ? "./img/bookimg/사랑과 결함.PNG" :
                      bookNum.equals("book004") ? "./img/bookimg/지도로 보아야 보인다.PNG" :
                      bookNum.equals("book005") ? "./img/bookimg/이중 하나는 거짓말.PNG" :
                      bookNum.equals("book006") ? "./img/Engbook/A Little Life.PNG" :
                      bookNum.equals("book007") ? "./img/Engbook/A Good Girl's Guide to Murder.PNG" :
                      bookNum.equals("book008") ? "./img/Engbook/The Little Prince.PNG" :
                      bookNum.equals("book009") ? "./img/Engbook/Crying in H Mart.PNG" :
                      bookNum.equals("book015") ? "./img/bookimg/침묵을 배우는 시간.PNG" :
                      bookNum.equals("book011") ? "./img/bookimg/당신이 누군가 죽였다.PNG" :
                      bookNum.equals("book012") ? "./img/bookimg/저속노화 식사법.PNG" :
                      bookNum.equals("book013") ? "./img/bookimg/비 그친 오후의 헌책방.PNG" :
                      bookNum.equals("book014") ? "./img/bookimg/불안세대.PNG" :
                      bookNum.equals("book016") ? "./img/Engbook/Holes.PNG" :
                      bookNum.equals("book017") ? "./img/Engbook/wonder.PNG" :
                      bookNum.equals("book018") ? "./img/Engbook/Foster.PNG" :
                      bookNum.equals("book019") ? "./img/bookimg/더 좋은 문장을 쓰고 싶은 당신을 위한 필사책.PNG" :
                    	  bookNum.equals("book010") ? "./img/Engbook/The Jungle Rules.jpg" :
                          	bookNum.equals("book001") ? "./img/bookimg/대모험.jpg" :
                                  "./img/bookimg/img.jpg";
    %>    
                <input type="hidden" value="<%= rs.getString("bookNum") %>" name="bookNum"> 
                <input type="hidden" name="id" value="<%= userId %>"> 
                <input type="hidden" name="reviewNo" value="<%= rs.getString("reviewNo") %>">
                <table>
                    <tr> <td>책 이미지 </td> <td> <img src="<%= imageUrl %>" width="200" height="275" /></td></tr>
                    <tr> <td>책번호 </td> <td> <%= rs.getString("bookNum") %></td></tr>
                    <tr> <td>제목 </td> <td> <%= rs.getString("bookName") %></td></tr>
                    <tr> <td>글쓴이 </td> <td> <%= rs.getString("writer") %></td></tr>
                    <tr> <td>출판사 </td> <td> <%= rs.getString("publisher") %></td></tr>
                     <tr> <td>대출 </td> <td> <% if (!isLoaned) { %>
                                                <button onclick="fnLoan('<%= bookNum %>')">대출</button>
                                            <% }else{ %>
                                            	<div>누군가가 대출한 책입니다.</div>
                                            <%} %></td></tr>
                </table>
                <hr>
                
                <% if (userId != null) { %>
                    <div>제목 : <input type="text" name="title" placeholder="제목" ></div>
                    <div>별점 : <input type="text" name="evaluation" placeholder="별점" ></div>
                    <div>내용 : <textarea name="content" placeholder="내용"></textarea></div>
                    <button type="button" onclick="fnInsert()">등록</button>
                <% } %>
                
                <hr>
                
                <table>
                    <tr>
                        <th>아이디</th>
                        <th>별점</th>
                        <th>제목</th>
                        <th>후기</th>
                    </tr>    

                    <%
                        String querycomment = "SELECT * FROM reviews WHERE bookNum = '" + bookNum + "'";
                        rs = stmt.executeQuery(querycomment);
                    %>

                    <% while (rs.next()) { %>
                        <tr>
                            <td><%= rs.getString("id") %></td>
                            <td><%= rs.getString("evaluation") %></td>
                            <td><%= rs.getString("title") %></td>
                            <td><%= rs.getString("content") %>
                                <% if (userId != null && (rs.getString("id").equals(userId) || userId.equals("admin"))) { %>
                                    <button type="button" onclick="fndelete('<%= rs.getString("reviewNo") %>')">삭제</button>
                                <% } %>
                            </td>
                        </tr>
                    <% } %>
                </table>
            <% } else {
                out.println("<p>해당 도서의 리뷰가 없습니다.</p>");
            } %>
        <% 
        } catch (SQLException ex) {
            out.println("SQLException: " + ex.getMessage());
        } 
        %>
    </form>
</body>
<jsp:include page="bottom.jsp" flush="false" />
</html>
<script>
function fnInsert() {
    // 폼 요소 가져오기
    var form = document.reviews;
    var bookNum = encodeURIComponent(form.bookNum.value);
    var title = encodeURIComponent(form.title.value);
    var id = encodeURIComponent(form.id.value);
    var evaluation = encodeURIComponent(form.evaluation.value);
    var content = encodeURIComponent(form.content.value);
    window.open("reviews-insert.jsp?bookNum=" + bookNum + "&title=" + title + "&id=" + id + "&evaluation=" + evaluation + "&content=" + content, "reviews", "width=500,height=300");
}
function fndelete(reviewNo) {
    window.open("reviews-delete.jsp?reviewNo=" + encodeURIComponent(reviewNo), "delete", "width=500,height=300");
}
function fnLoan(bookNum) {
    window.open("loan.jsp?booknum=" + bookNum, "loan", "width=500,height=300");
}
</script>



