/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.BrandDAO;
import Context.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author vuman
 */
public class BrandController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO p = new ProductDAO();
        String brand = request.getParameter("brand");

        if (new BrandDAO().getBrandByName(brand) == null) {
            response.sendError(404);
            return;
        }

        request.setAttribute("brandName", brand.substring(0, 1).toUpperCase() + brand.substring(1));
        request.setAttribute("list", p.getProductsByBrand(brand));
        request.getRequestDispatcher("brand.jsp").forward(request, response);
    }
}
