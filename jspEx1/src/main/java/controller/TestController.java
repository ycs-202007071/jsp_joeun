package controller;

//. TestController.java

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TestDAO;
import model.User;

@WebServlet("/qqq")//값이 주소다! qwer이면 qwer이 주소값이다. 일단 클래스는 서블릿 하나임!
public class TestController extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  TestDAO dao = new TestDAO();
		/*
		 * String name = dao.userDB(); request.setAttribute("name", name);
		 */
      
      
      request.getRequestDispatcher("/day5/zzz.jsp").forward(request, response);
  }
}
