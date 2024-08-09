// UserController.java (Controller)
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

@WebServlet("/userList")
public class UserController extends HttpServlet {
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	System.out.println("test");
            // 모든 사용자 정보를 가져옴
            List<User> userList = userDAO.listAllUsers();

            // request 객체에 사용자 목록 저장
            request.setAttribute("userList", userList);

            // JSP 페이지로 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("day5/user-list.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}