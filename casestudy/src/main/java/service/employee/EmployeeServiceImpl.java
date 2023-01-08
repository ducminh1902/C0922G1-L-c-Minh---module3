package service.employee;

import model.employee.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {


    private String URL ="jdbc:mysql://localhost:3306/furama_study1";
    private String Username = "root";
    private String Password ="codegym";


    private static String DISPLAY_EMPLOYEE = "select * from employee;";
    private static String DELETE_EMPLOYEE = " delete from employee where id = ?;\n";
    private static String ADD_EMPLOYEE = "insert into employee(`name`,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id,username) values(?,?,?,?,?,?,?,?,?,?,?);";

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
      Connection connection = getConnection();
        List<Employee> employeeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(DISPLAY_EMPLOYEE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                Double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String username = rs.getString("username");
                Employee employee = new Employee(id,name,dateOfBirth,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId,username);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void delete(int id) {
          Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(DELETE_EMPLOYEE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
//`name`,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id,username
    @Override
    public void add(Employee employee) {
           Connection connection =getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(ADD_EMPLOYEE);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getDateOfBirth());
            preparedStatement.setString(3,employee.getIdCard());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhoneNumber());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getPositionId());
            preparedStatement.setInt(9,employee.getEducationDegreeId());
            preparedStatement.setInt(10,employee.getDivisionId());
            preparedStatement.setString(11,employee.getUsername());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
