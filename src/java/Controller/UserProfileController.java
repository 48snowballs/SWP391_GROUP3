/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.AccountDAO;
import Context.BillDAO;
import Context.OrderDAO;
import Context.UserDAO;
import Context.ProductDAO;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author baqua
 */
public class UserProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getSession().getAttribute("username").toString();
        
        request.setAttribute("products", new ProductDAO().getAllproducts());
        request.setAttribute("orders", new OrderDAO().getAllOrders());
        request.setAttribute("u", new UserDAO().getUserInforByUsername(username));
        request.setAttribute("bills", new BillDAO().getAllBillsByUsername(username));
        request.getRequestDispatcher("user-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getSession().getAttribute("username").toString();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        String pass = request.getParameter("pass");
        String oldpass = request.getParameter("oldpass");

        String action = request.getParameter("action");

        int userid = new UserDAO().getUserInforByUsername(username).getId();
        switch (action) {
            case "edit": {
                new UserDAO().updateUser(new User(userid, name, email, address, phone));
                break;
            }
            case "change-password": {
                if (pass.equals(oldpass)) {
                    new AccountDAO().updatePassword(username, pass);
                }
                break;
            }
            default:
                throw new AssertionError();
        }

        response.sendRedirect("user-profile");
    }
}
