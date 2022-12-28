package service.customer;

import model.customer.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class  CustomerServiceImpl implements CustomerService {

    private String URL ="jdbc:mysql://localhost:3306/furama_study1";
    private String Username = "root";
    private String Password ="codegym";

    private static String DISPLAY_CUSTOMER = "select * from customer;";
    private static String ADD_CUSTOMER = "";
    private static String UPDATE_CUSTOMER = "";
    private static String DELETE_CUSTOMER = "";
    private static String FIND_BY_ID = "";

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
    public List<Customer> display() {
        Connection connection = getConnection();
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(DISPLAY_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                int customertypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String gender = rs.getString("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                Customer customer = new Customer(id,customertypeId,name,dateOfBirth,gender,idCard,phoneNumber,email,address);
                customerList.add(customer);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void add(Customer customer) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(Customer customer) {

    }
}
