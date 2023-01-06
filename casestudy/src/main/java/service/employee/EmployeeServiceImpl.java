package service.employee;

import model.employee.Employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {


    private String URL ="jdbc:mysql://localhost:3306/furama_study1";
    private String Username = "root";
    private String Password ="codegym";


    private static String DISPLAY_CUSTOMER = "select * from customer;";

    private Connection getConnection(){
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL,Username,Password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return  connection;
    }


    @Override
    public List<Employee> display() {

        return null;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void add(Employee employee) {

    }
}
