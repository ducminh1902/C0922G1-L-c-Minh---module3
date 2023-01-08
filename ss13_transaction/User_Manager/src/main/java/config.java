import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "config",value = "/*")
public class config implements Filter {

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
       req.setCharacterEncoding("UTF-8");
        chain.doFilter(req, resp);
    }


}
