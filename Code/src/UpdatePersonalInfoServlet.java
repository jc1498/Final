import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
@MultipartConfig

@WebServlet(name = "UpdatePersonalServlet")
public class UpdatePersonalInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String location = request.getParameter("location");
        String mobile = request.getParameter("mobile");


        InputStream inputStream = request.getPart("image").getInputStream();

        Part filePart = request.getPart("image");
        if(filePart != null)
        {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            inputStream = filePart.getInputStream();

        }

        HttpSession session = request.getSession();

        String uid = (String) session.getAttribute("uid");

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
            String sql = "Update user.users\n" +
                    "Set name = ?, email = ? , location = ?, mobile = ? , image = ? \n" +
                    "where id = '" + uid + "'";

            PreparedStatement Statement = conn.prepareStatement(sql);

            Statement.setString(1, name);
            Statement.setString(2, email);
            Statement.setString(3, location);
            Statement.setString(4, mobile);
            Statement.setBlob(5, inputStream);



            Statement.execute();


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
