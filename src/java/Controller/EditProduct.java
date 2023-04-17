/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.AccountDAO;
import Context.BrandDAO;
import Context.ProductDAO;
import Context.CategoryDAO;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Loki
 */
public class EditProduct extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = new ProductDAO();
        BrandDAO brandDAO = new BrandDAO();
        CategoryDAO categoryDAO=new CategoryDAO();
        request.setAttribute("brands", brandDAO.getAllBrands());
        request.setAttribute("product", productDAO.getProductByProductId(id));
        request.setAttribute("category",categoryDAO.getAllCategory());
        request.getRequestDispatcher("edit-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        String image = request.getParameter("image");
        int brandId = Integer.parseInt(request.getParameter("brand"));
        
        String color=request.getParameter("color");
        int categoryId=Integer.parseInt(request.getParameter("category"));
        ProductDAO productDAO = new ProductDAO();
        productDAO.editProduct(new Product(id, name, description, price, image,brandId, color, categoryId));
        response.sendRedirect("list-product");
    }
}
