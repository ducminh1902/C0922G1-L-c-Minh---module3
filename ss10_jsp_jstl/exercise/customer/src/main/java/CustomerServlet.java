import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://khoinguonsangtao.vn/wp-content/uploads/2022/07/avatar-gau-cute.jpg"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           request.setAttribute("list",customerList);
           request.getRequestDispatcher("list.jsp").forward(request,response);
    }
}
