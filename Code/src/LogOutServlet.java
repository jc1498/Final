import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogOutServlet")
public class LogOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try
        {
            HttpSession session = request.getSession(false);
            if(session != null){
                session.removeAttribute("username");

                RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage.jsp");
                dispatcher.forward(request, response);

            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
