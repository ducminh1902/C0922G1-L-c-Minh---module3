package controller;

import model.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
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
        int oldId = Integer.parseInt(request.getParameter("oldId"));
        String name =request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String describe=request.getParameter("describe");
        String brand = request.getParameter("brand");
        Product product = new Product(id,name,price,describe,brand);
        productService.update(oldId,product);
        showList(request,response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String brand = request.getParameter("brand");
        Product product = new Product(id,name,price,describe,brand);
        productService.add(product);
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

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findByID(id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("product/update.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product/add.jsp").forward(request,response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.display();
        request.setAttribute("listProduct",productList);
        try {
            request.getRequestDispatcher("product/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        showList(request,response);
    }
}
