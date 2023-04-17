package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Context.AccountDAO;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
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
public class AdminDashboard extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        if(session.getAttribute("username") == null || session == null){
            resp.sendRedirect("acess.jsp");
            return;
        }
        if (new AccountDAO().getRoleByUsername(session.getAttribute("username").toString()) == 1) {
            req.getRequestDispatcher("admin-dashboard.jsp").forward(req, resp);
        
        } else    
            req.getRequestDispatcher("acess.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);
    }
}
