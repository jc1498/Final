import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

@WebServlet(name = "DelProductServlet")
public class DelProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String Pid = request.getParameter("pid");

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
            Statement stm = conn.createStatement();
            String sql =("delete from user.product where product_id =" + Pid );
            stm.execute(sql);

            response.sendRedirect("Profile.jsp");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }



    }
}
