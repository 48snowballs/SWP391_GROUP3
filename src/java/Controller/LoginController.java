package Controller;


import Context.AccountDAO;
import Context.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author baqua
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        // Nhận thông tin từ View
        String username = request.getParameter("account");
        String password = request.getParameter("password");

        // nhờ model xử lý 
        if (userDAO.checkLogin(username, password)) {
            // save into session
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(1800);
            session.setAttribute("username", username);
            session.setAttribute("name", userDAO.getUserInforByUsername(username).getName());
            session.setAttribute("role", new AccountDAO().getRoleByUsername(username));

            response.sendRedirect(".");
        } else {
            if (userDAO.isAccountExist(username)) {
                // account ton tai nhung pass sai
                request.setAttribute("result", "Wrong password, please try again!");
            } else {
                // that bai
                request.setAttribute("result", "Login Failed, your account does not exist!!");
            }
            doGet(request, response);
        }
    }

}
