/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.BillDAO;
import Context.CartDAO;
import Context.OrderDAO;
import Context.ProductDAO;
import Context.MemoryDAO;
import Context.UserDAO;
import Model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author vuman
 */
public class BillController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        BillDAO bd = new BillDAO();
        OrderDAO od = new OrderDAO();
        CartDAO cd = new CartDAO();
        MemoryDAO sd = new MemoryDAO();
        ProductDAO pd = new ProductDAO();
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        String check = request.getParameter("address");
        String address = "";
        HttpSession session = request.getSession();

        String username = session.getAttribute("username").toString();
        int userId = ud.getUserInforByUsername(username).getId();

        if (check.equals("new")) {
            String tinh = request.getParameter("tinh");
            String thanhpho = request.getParameter("thanh-pho");
            String quan = request.getParameter("quan");
            String diachi = request.getParameter("dia-chi");
            address = diachi + ", " + quan + ", " + thanhpho + ", " + tinh;
        } else {
            address = ud.getUserInforByUsername(username).getAddress();
        }

        try {
            bd.addBill(userId, date, address);

            ArrayList<Cart> cartList = cd.getCartListByUserId(userId);

            for (Cart cart : cartList) {
                od.addOrder(cart.getProductId(), cart.getQuantity(), cart.getQuantity() * pd.getProductByProductId(cart.getProductId()).getPrice(), userId);
            }

            for (Cart cart : cartList) {
                sd.deleteSizeAfterBuy(cart.getProductId(), cart.getSize(), cart.getQuantity());
            }

            cd.deleteCartAfterBuy(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("bill");
    }
}
