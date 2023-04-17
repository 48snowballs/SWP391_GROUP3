/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.BrandDAO;
import Context.CartDAO;
import Context.ProductDAO;
import Context.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 *
 * @author vuman
 */
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        CartDAO cd = new CartDAO();
        ProductDAO pd = new ProductDAO();
        BrandDAO bd = new BrandDAO();
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        if (username != null) {
            int userId = ud.getUserInforByUsername(username).getId();
            request.setAttribute("cart", cd.getCartListByUserId(userId));
        } else {
            request.setAttribute("cart", null);
        }

        request.setAttribute("brandList", bd.getAllBrands());
        request.setAttribute("productList", pd.getAllproducts());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

}
