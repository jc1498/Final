//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    public LoginServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
            PreparedStatement stm  = conn.prepareStatement("select * from users where username = ? and password = ? ");

            stm.setString(1, username);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            if (rs.next())
            {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("uid", rs.getString("id"));
                response.sendRedirect("Home.jsp");
            }
            else {
                response.getWriter().println("<h1> Failed, Please Try Again <h1>");
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
