import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
@MultipartConfig

@WebServlet(name = "ProductAddServlet")
public class ProductAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

                String ProductName = request.getParameter("product_name");
                String price = request.getParameter("price");
                String ProductDes = request.getParameter("product_description");
                String ProductCat = request.getParameter("product_category");

                Date d = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                String cur_time = sdf.format(d);

        InputStream inputStream = request.getPart("product_pic").getInputStream();

        Part filePart = request.getPart("product_pic");
        if(filePart != null)
        {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            inputStream = filePart.getInputStream();

        }

                HttpSession session = request.getSession();

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
        String sql = "insert into user.product(product_name, price, product_category, product_date, product_description,product_pic, user_id ) " + "values( ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement stm = conn.prepareStatement(sql);


        stm.setString(1, ProductName);
        stm.setString(2, price);
        stm.setString(3, ProductCat);
        stm.setString(4, cur_time);
        stm.setString(5, ProductDes);
        stm.setBlob(6, inputStream);
        stm.setString(7, (String)session.getAttribute("uid"));

        stm.execute();

        response.sendRedirect("Profile.jsp");
    }

    catch(Exception ex)
    {
        ex.printStackTrace();
    }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
