<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="header.jsp" flush="false" />
    <title>회원 관리</title>
    <style>
        /* 기본 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* 버튼 스타일 */
        button {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #555;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
         .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a {
            padding: 10px 15px;
            margin: 0 5px;
            text-decoration: none;
            background-color: #333;
            color: white;
            border-radius: 4px;
        }

        .pagination a.active {
            background-color: #555;
        }

        .pagination a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <button onclick="location.href='home.jsp'">홈페이지로 이동</button>
    <table>
        <tr>
            <th>ID</th>
            <th>BookNum</th>
            <th>대출일</th>
            <th>반납</th>
        </tr>

        <%@ include file="db.jsp" %>
        <%
			// 페이징 설정
			int pageSize = 10; // 화면에 보여주고 싶은 게시글 개수
			int currentPage = 1; // 현재 페이지 번호
		
			// 페이지 누른 번호로 현재페이지 변경
			if (request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
		
			// 현재 페이지에 따라 어디까지 보여줄지 오프셋 지정
			int offset = (currentPage - 1) * pageSize;
		
			ResultSet rs = null;
			Statement stmt = null;
            try {
                stmt = conn.createStatement();
            	// 전체 게시물 수를 구하는 쿼리 
        		// 하단에 몇번까지 출력할지 정하기 위해)
        		// ex) 10개씩 출력할건데 전체 게시글이 35개일 경우
        		//     1~4번까지 하단에 출력
        		String countQuery = "SELECT COUNT(*) AS total FROM loans";
        		ResultSet coun_rs = stmt.executeQuery(countQuery);
        		int total = 0;
        		if (coun_rs.next()) {
        			total = coun_rs.getInt("total");
        		}
        		coun_rs.close();

        		// 페이지 수 계산
        		// 35개일 경우 3.5를 올림해야 4페이지까지 되기 때문에 아래처럼...
        		int totalPages = (int) Math.ceil((double) total / pageSize);
        		
        		// 페이징 쿼리
        		String querytext = 
        				  "SELECT * "
        				+ "FROM loans "
        				+ "ORDER BY ID DESC "
        				+ "LIMIT " + pageSize + " OFFSET " + offset;

        		rs = stmt.executeQuery(querytext);
                while (rs.next()) {
            	%>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("booknum") %></td>
            <td><%= rs.getString("loanDate") %></td>   
            <td>
                <button onclick="fnReturn('<%= rs.getString("booknum") %>')">강제반납</button>
            </td>
        </tr>
        
        
        <%
                }
                %><div class="pagination">
        		<%
        		if (currentPage > 1) {
        			int prevPage = currentPage - 1;
        			out.print("<a href=?page=" + prevPage + ">이전</a>");
        		}
        		for (int i = 1; i <= totalPages; i++) {
        			if (i == currentPage) {
        				out.print("<a href=?page=" + i + " class=active>" + i + "</a>");
        			} else {
        				out.print("<a href=?page=" + i + ">" + i + "</a>");
        			}
        		}
        		if (currentPage < totalPages) {
        			int nextPage = currentPage + 1;
        			out.print("<a href=?page=" + nextPage + ">다음</a>");
        		}
        		%>
        	</div>
        	<%
            } catch (SQLException ex) {
                out.println("SQLException : " + ex.getMessage());
            }
        %>
    </table>
    <jsp:include page="bottom.jsp" flush="false" />
</body>
</html>

<script>
	function fnReturn(booknum) {
	    window.open("return.jsp?booknum=" + encodeURIComponent(booknum), "return", "width=500,height=300");
	}
</script>
