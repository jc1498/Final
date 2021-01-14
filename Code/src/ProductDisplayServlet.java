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

@WebServlet(name = "ProductDisplayServlet")
public class ProductDisplayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            byte[] ImgData = null;
            Blob Image = null;

            String productID = request.getParameter("product_id");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");

            Statement stm = conn.createStatement();

            ResultSet rs = stm.executeQuery("select product_pic from user.product where product_id = '"+ productID + "'");
            rs.next();



            Image = rs.getBlob("product_pic");
            ImgData = Image.getBytes(1, (int)Image.length());

            response.setContentType("product_pic/jpg");
            OutputStream out = response.getOutputStream();

            out.write(ImgData);
            out.flush();
            out.close();

        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
