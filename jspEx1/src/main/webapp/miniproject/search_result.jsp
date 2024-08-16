<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색 결과</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        button {
            background-color: #00A79D; /* Green background */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth transition */
        }

        .content {
            flex: 1;
            overflow-y: auto;
        }

        table {
            table-layout: auto;
            width: 100%;
            border-spacing: 20px;
            border: 1px solid #ddd;
        }

        td {
            text-align: center;
            border: 1px dotted white;
        }

        span {
            font-size: 14px;
            background-color: white;
            color: black;
        }

        caption {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />
<%@include file="db.jsp"%>
<%
    String bookName = request.getParameter("bookName");
    ResultSet rs = null; // 결과
    Statement stmt = null; // 쿼리 호출할 객체
    ResultSet rsLoan = null; // 대출 상태 결과

    try {
        // 책 이름으로 검색
        String searchQuery = "SELECT * FROM books WHERE bookName LIKE ?";
        PreparedStatement pstmt = conn.prepareStatement(searchQuery);
        pstmt.setString(1, "%" + bookName + "%");
        rs = pstmt.executeQuery();

        // 검색된 결과가 있는지 확인
        boolean resultsFound = false;
%>

        <table border="1">
            <caption>검색한 책</caption>
            <tbody>
            <%
            while (rs.next()) {
                String bookNum = rs.getString("bookNum");
                String status = rs.getString("sortation").equals("K") ? "국내도서" : "외국도서";
                    String bookName2 = rs.getString("bookName");
                    String writer = rs.getString("writer");
                    String publisher = rs.getString("publisher");
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
                                      "./img/bookimg/대모험.jpg";

                    // 대출 상태 확인
                    String loanQuery = "SELECT * FROM loans WHERE bookNum = ?";
                    pstmt = conn.prepareStatement(loanQuery);
                    pstmt.setString(1, bookNum);
                    rsLoan = pstmt.executeQuery();
                    boolean isLoaned = rsLoan.next(); // 대출 여부 확인
                    resultsFound = true;
            %>
                    <tr>
                        <td>
                            <a href="#" data-value="bookNum" onclick="fnReviews('<%= bookNum %>'); return false;">
                                <img src="<%= imageUrl %>" width="200" height="275" />
                            </a>
                        </td>
                        <td>
                           <a href="#" data-value="bookNum" onclick="fnReviews('<%= bookNum %>'); return false;">
                                <span class="status"><%= status %></span><br>
                                <span><%= bookName2 %></span><br>
                                <span><%= writer %> | <%= publisher %></span>
                            </a>
                        </td>
                        <td>
                            <% if (!isLoaned) { %>
                                <button onclick="fnLoan('<%= bookNum %>')">대출</button>
                            <% } else { %>
                                <span class="loaned">누군가가 대출한 책입니다.</span>
                            <% } %>
                        </td>
                    </tr>
                    <%
                }
            
            if (!resultsFound) {
                out.println("<tr><td colspan='3'>해당 책이 존재하지 않습니다.</td></tr>");
            }
            %>
            </tbody>
        </table>
<%
    } catch(SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (rsLoan != null) rsLoan.close();
        } catch (SQLException e) {
            out.println("SQLException in finally block: " + e.getMessage());
        }
    }
%>
<jsp:include page="bottom.jsp" flush="false" />
</body>
</html>

<script>
function fnLoan(bookNum) {
    window.open("loan.jsp?booknum=" + bookNum, "loan", "width=500,height=300");
}
function fnReviews(bookNum){
	location.href="reviews.jsp?bookNum="+bookNum;
}
</script>
