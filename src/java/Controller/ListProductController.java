/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.AccountDAO;
import Context.ProductDAO;
import Context.UserDAO;
import Context.MemoryDAO;
import Model.Memory;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Loki
 */
public class ListProductController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getSession().getAttribute("username").toString();

        if (new AccountDAO().getRoleByUsername(username) == 1) {
            super.service(req, resp);
        } else {
            resp.getWriter().print("<h1>Access denied</h1>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList data = new ProductDAO().getAllproductsEx();
        ArrayList<Memory>memory=new MemoryDAO().getAllMemoryByProductId(1);
        final int pageSize = 5;
        final int pageCount = (int)Math.ceil(data.size() / (double)pageSize);
        
        int currentPage = 1;
        if(request.getParameter("page") != null){
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("products", data.subList(pageSize * (currentPage - 1), Math.min(pageSize * currentPage, data.size() - 1)));
        request.setAttribute("pageCount", pageCount);
        request.getRequestDispatcher("list-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        new ProductDAO().deleteProductByID(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("list-product");
    }
}
