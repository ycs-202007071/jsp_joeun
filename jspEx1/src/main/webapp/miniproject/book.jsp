<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서관</title>
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
    <div class="container">
        <header>
            <jsp:include page="header.jsp" flush="false" />
        </header>
        <div class="content">
            <%@ include file="db.jsp" %>
            <%
                Statement stmt = null;
                ResultSet rs = null;
                ResultSet rsLoan = null;
                try {
                    // 책 번호를 동적으로 가져오기
                    String queryTest = "SELECT bookNum FROM BOOKS";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(queryTest);
                    
                    // 책 번호를 저장할 ArrayList
                    List<String> bookNumbersList = new ArrayList<>();
                    
                    while (rs.next()) {
                        bookNumbersList.add(rs.getString("bookNum"));
                    }

                    %>
                    <table border="1">
                        <caption>국내도서</caption>
                        <%
                        for (String bookNum : bookNumbersList) {
                            String querytext = "SELECT * FROM books WHERE bookNum = '" + bookNum + "'";
                            rs = stmt.executeQuery(querytext);

                            if (rs.next()) {
                                String status = rs.getString("sortation").equals("K") ? "국내도서" : "외국도서";
                                
                                if ("국내도서".equals(status)) {
                                    String bookName = rs.getString("bookName");
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
                                                   bookNum.equals("book018") ? "./img/Engbook/Foster.PNG":
                                                   bookNum.equals("book019") ? "./img/bookimg/더 좋은 문장을 쓰고 싶은 당신을 위한 필사책.PNG":
                                                     "./img/bookimg/대모험.jpg";
                                   
                                    String loanQuery = "SELECT * FROM loans WHERE bookNum = '" + bookNum + "'";
                                    rsLoan = stmt.executeQuery(loanQuery);
                                    boolean isLoaned = rsLoan.next(); // Check if there's a loan record
                                    %>
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <img src="<%= imageUrl %>" width="200" height="275" />
                                            </a>
                                        </td>
                                        <td>
                                            <a href="#">
                                                <span><%= status %></span><br>
                                                <span><%= bookName %></span><br>
                                                <span><%= writer %> | <%= publisher %></span>
                                            </a>
                                        </td>
                                         <td>
                                            <% if (!isLoaned) { %>
                                                <button onclick="fnLoan('<%= bookNum %>')">대출</button>
                                            <% }else{ %>
                                            	<div>누군가가 대출한 책입니다.</div>
                                            <%} %>
                                        </td>
                                    </tr>
                                    <%
                                }
                            } else {
                                out.println("<tr><td colspan='3'>No data available for " + bookNum + "</td></tr>");
                            }
                        }
                        %>
                    </table>
                    <%
                } catch (SQLException ex) {
                    out.println("SQLException: " + ex.getMessage());
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                    } catch (SQLException e) {
                        out.println("SQLException in finally block: " + e.getMessage());
                    }
                }
            %>
        </div>
        <footer>
            <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
</body>
</html>
<script>
function fnLoan(bookNum) {
    window.open("loan.jsp?booknum=" + bookNum, "loan", "width=500,height=300");
}
function fnReviews(bookNum){
	location.href="review.jsp?bookNum="+bookNum;
}
</script>
