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
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}

}
	
</style>

</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM TBL_USER "
					+ "WHERE userId = '" + id + "' "
					+ "AND pwd = '" + pwd + "'";
			rs = stmt.executeQuery(querytext);
			
			if(rs.next()){
				// 아이디 o, 패스워드 o
				if(rs.getInt("cnt") >= 5){
					// 5번 이상 실패
					out.println("5번이상 실패했으니까 관리자한테 문의하셈");
				} else {
					// 로그인 성공
					session.setAttribute("userId", rs.getString("userId"));
					session.setAttribute("status", rs.getString("status"));
					if(rs.getString("status").equals("A")){
						response.sendRedirect("user-list.jsp");
					}else{
					response.sendRedirect("board-list2.jsp");
						
					}
					querytext = 
							"UPDATE TBL_USER SET "
							+ "cnt = 0 "
							+ "WHERE userId = '" + id + "'";
					stmt.executeUpdate(querytext);
				}
			} else {
				// 아이디나 패스워가 다를 경우
				querytext = 
						"SELECT * FROM TBL_USER "
						+ "WHERE userId = '" + id + "'";
				rs = stmt.executeQuery(querytext);
				
				if(rs.next()){
					// 아이디는 o, 비밀번호는 x일 경우
					if(rs.getInt("cnt") >= 5){
						// 비밀번호 5번 이상 실패된 상황
						out.println("5번이상 실패했으니까 관리자한테 문의하셈");
					} else {
						// 비밀번호를 틀릴 경우 cnt값 1 증가
						out.println("비밀번호 확인하셈!!");
						querytext = 
								"UPDATE TBL_USER SET "
								+ "cnt = cnt + 1 "
								+ "WHERE userId = '" + id + "'";
						stmt.executeUpdate(querytext);
					}
				} else {
					// 없는 아이디로 로그인 시도
					out.println("아이디 확인하셈!!");
				}
				// 버튼추가 -> login.jsp로 이동
			}
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	<div>
		<button onclick="location.href='login.jsp'">로그인 페이지로 이동</button>
	</div>
</body>
</html>