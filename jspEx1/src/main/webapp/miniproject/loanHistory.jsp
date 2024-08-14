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
                    String[] bookNumbers = {"book001","book002","book003","book004","book005","book011", "book012", "book013", "book014", "book015"};
                    stmt = conn.createStatement();

                    %>
                    <table border="1">
                        <caption>이달의 책</caption>
                        <%
                        for (String bookNum : bookNumbers) {
                            String querytext = "SELECT * FROM books WHERE bookNum = '" + bookNum + "'";
                            rs = stmt.executeQuery(querytext);

                            if (rs.next()) {
                                String status = rs.getString("sortation").equals("K") ? "국내도서" : "외국도서";
                                String bookName = rs.getString("bookName");
                                String writer = rs.getString("writer");
                                String publisher = rs.getString("publisher");
                                String imageUrl = bookNum.equals("book015") ? "./img/bookimg/침묵을 배우는 시간.PNG" :
                                				  bookNum.equals("book011") ? "./img/bookimg/당신이 누군가 죽였다.PNG" :
                                                  bookNum.equals("book012") ? "./img/bookimg/저속노화 식사법.PNG" :
                                                  bookNum.equals("book013") ? "./img/bookimg/비 그친 오후의 헌책방.PNG" :
                                                  bookNum.equals("book014") ? "./img/bookimg/불안세대.PNG" :
                                                  "./img/bookimg/대모험.jpg";

                                // Check if the book is loaned
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
                                        <% } %>
                                    </td>
                                </tr>
                                <%
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
                        if (rsLoan != null) rsLoan.close();
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
</script>
