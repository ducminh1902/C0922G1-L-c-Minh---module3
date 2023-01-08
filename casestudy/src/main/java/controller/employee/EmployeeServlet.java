package controller.employee;

import model.customer.Customer;
import model.employee.Employee;
import service.employee.EmployeeService;
import service.employee.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet",urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "delete":
                delete(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.delete(id);
        showList(request,response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.display();
        request.setAttribute("listEmployee",employeeList);
        try {
            request.getRequestDispatcher("employee/listEmployee.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
