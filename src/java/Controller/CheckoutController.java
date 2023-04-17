/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.BrandDAO;
import Context.CartDAO;
import Context.ProductDAO;
import Context.UserDAO;
import Model.Cart;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        CartDAO cd = new CartDAO();
        ProductDAO pd = new ProductDAO();
        BrandDAO bd = new BrandDAO();

        HttpSession session = request.getSession();

        String username = session.getAttribute("username").toString();
        int userId = ud.getUserInforByUsername(username).getId();
        ArrayList<Cart> cart = cd.getCartListByUserId(userId);
        ArrayList<Product> productList = pd.getAllproducts();
        int sum = 0;
        for (Cart c : cart) {
            for (Product p : productList) {
                if (c.getProductId() == p.getProductId()) {
                    sum += (p.getPrice() * c.getQuantity());
                }
            }
        }

        String str = String.valueOf(sum);
        String tmp = "";
        for (int i = str.length() - 1; i >= 0; i--) {
            tmp += str.charAt(i);
        }
        String s = "";
        for (int i = 0; i < tmp.length(); i++) {
            if (i % 3 == 0 && i != 0) {
                s += ".";
            }
            s += tmp.charAt(i);
        }
        str = "";
        for (int i = s.length() - 1; i >= 0; i--) {
            str += s.charAt(i);
        }

        request.setAttribute("sum", str);
        request.setAttribute("brandList", bd.getAllBrands());
        request.setAttribute("productList", productList);
        request.setAttribute("cart", cart);
        request.setAttribute("infor", ud.getUserInforByUsername(username));
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        CartDAO cd = new CartDAO();

        HttpSession session = request.getSession();

        String username = session.getAttribute("username").toString();
        int userId = ud.getUserInforByUsername(username).getId();

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String size = request.getParameter("size");
        cd.addCart(userId, productId, quantity, size);

        response.sendRedirect("checkout");
    }

}
