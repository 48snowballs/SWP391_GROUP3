/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.UserDAO;
import Model.User;
import Utils.SendEmail;
import Utils.UserCode;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author baqua
 */
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();

        SendEmail sm = new SendEmail();
        
        // get the 6-digit code
        String code = sm.getRandom();
        
        // create new user using all information
        UserCode userCode = new UserCode(username, email, code);

        // check if the email is correct or not
        User user = userDAO.getUserInforByUsername(username);
        if (user != null && user.getEmail().equals(email)) {
            // check if the email send successfully
            if (sm.sendEmail(userCode)) {
                session.setAttribute("username-verify", username);
                session.setAttribute("authcode", userCode);
                response.sendRedirect("verify-forgot-password.jsp");
                return;
            }
        } else {
            request.setAttribute("result", "Tài khoản của bạn hoặc email của bạn đã sai, vui lòng thử lại");
        }
        doGet(request, response);
    }
}
