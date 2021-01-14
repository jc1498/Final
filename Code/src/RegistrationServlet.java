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

@WebServlet(name = "RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String studentID = request.getParameter("studentID");
        String Password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String location = request.getParameter("location");
        String name = request.getParameter("name");


        InputStream InputStream = request.getPart("image").getInputStream();

        Part filePart = request.getPart("image");
        if(filePart != null)
        {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            InputStream = filePart.getInputStream();

        }


        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "123456");
            String sql = "insert into user.users(id, username, password, gender, email, mobile, location, image, name) " + "values( ?, ?, ?, ?, ?, ?, ?, ?,?)";

            PreparedStatement stm = conn.prepareStatement(sql);


            stm.setString(1, studentID);
            stm.setString(2, username);
            stm.setString(3, Password);
            stm.setString(4, gender);
            stm.setString(5, email);
            stm.setString(6, mobile);
            stm.setString(7, location);
            stm.setBlob(8, InputStream);
            stm.setString(9, name);

            stm.execute();

            response.sendRedirect("Login.jsp");
        }

        catch(Exception ex)
        {
            ex.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
