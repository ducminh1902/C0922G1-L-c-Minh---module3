package controller.customer;

import model.customer.Customer;
import service.customer.CustomerService;
import service.customer.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                add(request,response);
                break;
            case "update":
                update(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int customerTypeId = Integer.parseInt(request.getParameter("newCustomerTypeId"));
        String name = request.getParameter("newName");
        String dateOfBirth = request.getParameter("newDateOfBirth");
        Boolean gender = Boolean.parseBoolean(request.getParameter("newGender"));
        String idCard = request.getParameter("newIdCard");
        String phoneNumber = request.getParameter("newPhoneNumber");
        String email = request.getParameter("newEmail");
        String address = request.getParameter("newAddress");
        Customer customer = new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address);
        customerService.update(customer);
        showList(request,response);

    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
//        int id = Integer.parseInt(request.getParameter("id"));
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        Boolean gender = Boolean.valueOf(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(customerTypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address);
        customerService.add(customer);
        showList(request,response);
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
           case "add":
               showForm(request,response);
               break;
           case "update":
               showFormUpdate(request,response);
               break;
           default:
               showList(request,response);
               break;
       }
    }



    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer existCustomer = customerService.findBYId(id);
        request.setAttribute("customer",existCustomer);
//        request.getRequestDispatcher("customer/updateCustomer.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/updateCustomer.jsp");
        dispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.display();
        request.setAttribute("listCustomer",customerList);
        try {
            request.getRequestDispatcher("customer/listCustomer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("customer/addCustomer.jsp").forward(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.delete(id);
        showList(request,response);
    }
}
