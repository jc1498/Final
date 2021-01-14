import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

@MultipartConfig

@WebServlet(name = "SellerImageDisplayServlet")
public class SellerImageDisplayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            byte[] imgData = null;
            Blob image = null;


            String uid = request.getParameter("Seller");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");

            Statement stm = conn.createStatement();

            ResultSet rs = stm.executeQuery("select image from user.users where id = '"+ uid + "'");

            rs.next();

            image = rs.getBlob("image");
            imgData = image.getBytes(1, (int)image.length());

            response.setContentType("image/jpg");
            OutputStream out = response.getOutputStream();

            out.write(imgData);
            out.flush();
            out.close();

        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
