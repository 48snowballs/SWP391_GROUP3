/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Context.BrandDAO;
import Context.ProductDAO;
import Model.Brand;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/**
 *
 * @author Loki
 */
public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String[] brands = request.getParameterValues("brand");
        String from = request.getParameter("from");
        String to = request.getParameter("to");

        ArrayList<Product> products = new ProductDAO().getAllproducts();

        // filter by brands
        HashSet<Integer> brandIDs = new HashSet();

        ArrayList<Brand> obrands = new BrandDAO().getAllBrands();

        if (brands != null && brands.length > 0) {
            for (String brand : brands) {
                brandIDs.add(Integer.parseInt(brand));
            }
        } else {
            for (Brand brand : obrands) {
                brandIDs.add(brand.getBrandId());
            }
        }

        // filter by from
        int ifrom = 0;
        if (from != null && !from.isEmpty()) {
            ifrom = Integer.parseInt(from);
        }

        // filter by from
        int ito = Integer.MAX_VALUE;
        if (to != null && !to.isEmpty()) {
            ito = Integer.parseInt(to);
        }

        // filter by name
        if (name != null && !name.isEmpty()) {
            name = name.toLowerCase();
        } else {
            name = "";
        }

        for (Iterator<Product> it = products.iterator(); it.hasNext();) {
            Product product = it.next();

            if (!product.getName().toLowerCase().contains(name)
                    || ifrom > product.getPrice()
                    || product.getPrice() > ito
                    || !brandIDs.contains(product.getBrandId())) {
                it.remove();
            }
        }

        request.setAttribute("name", name);
        request.setAttribute("brandIDs", brandIDs);
        request.setAttribute("from", from);
        request.setAttribute("to", to);

        request.setAttribute("products", products);

        request.setAttribute("brands", obrands);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
