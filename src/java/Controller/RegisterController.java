/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.UserDAO;
import Model.User;
import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author baqua
 */
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();

        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        User user = new User(name, email, address, phone);
        Account account = new Account(username, pass, 2);

        if (userDAO.isAccountExist(username)) {
            request.setAttribute("result", "Tài khoản của bạn đã tồn tại, vui lòng thử lại");
        } else {
            userDAO.addUser(user, account);
            request.setAttribute("Result", "Bạn đã đăng ký thành công, vui lòng đăng nhập lại!!");
        }

        doGet(request, response);
    }

}
