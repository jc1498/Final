import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "HTMLFilter")
public class HTMLFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        String productName = req.getParameter("product_name");
        String ProductCat = req.getParameter("product_category");
        String ProductDes = req.getParameter("product_description");
        String ProductPrice = req.getParameter("price");

        if(productName.contains("<") || productName.contains(">"))
        {
            resp.getWriter().println("Illegal chars");
        }


        else if (ProductCat.contains("<") || ProductCat.contains(">"))
        {
            resp.getWriter().println("Illegal chars");
        }
        else if (ProductDes.contains("<") || ProductDes.contains(">"))
        {
            resp.getWriter().println("Illegal chars");
        }
        else if (ProductPrice.contains("<") || ProductPrice.contains(">"))
        {
            resp.getWriter().println("Illegal chars");
        }

        else
        {
            chain.doFilter(req, resp);
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
