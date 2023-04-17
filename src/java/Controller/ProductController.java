/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.BrandDAO;
import Context.CartDAO;
import Context.ProductDAO;
import Context.MemoryDAO;
import Context.UserDAO;
import Model.Cart;
import Model.Product;
import Model.User;
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
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        MemoryDAO sd = new MemoryDAO();
        ProductDAO pd = new ProductDAO();
        CartDAO cd = new CartDAO();
        BrandDAO bd=new BrandDAO();
        HttpSession session = request.getSession();
        ArrayList<Cart> list = null;

        int productId = Integer.parseInt(request.getParameter("productid"));
        if (session.getAttribute("username") != null) {
            String username = session.getAttribute("username").toString();
            User u = ud.getUserInforByUsername(username);
            list = cd.getCartListByUserId(u.getId());
        }

        if (list != null) {
            request.setAttribute("cart", list);
        }
        
        Product p = pd.getProductByProductId(productId);
        request.setAttribute("brandDes",bd.getDescription(p.getBrandId()));
        request.setAttribute("size", sd.getAllMemoryByProductId(productId));
        request.setAttribute("brandName", new BrandDAO().getBrandByID(p.getBrandId()).getBrandName());
        request.setAttribute("product", p);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
}
