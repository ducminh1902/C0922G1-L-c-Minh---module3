package service;

import model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentServiceImpl implements StudentService {


    private String URL ="jdbc:mysql://localhost:3306/student_1";
    private String Username = "root";
    private String Password ="codegym";

    private static String DISPLAY_STUDENT = "select * from student";
    private static String ADD_STUDENT = "insert into student(id,name,class) value(?,?,?);";
    private static String UPDATE_CUSTOMER = "";
    private static String DELETE_STUDENT = "delete from student where id = ?;";
    private static String FIND_STUDENT = "select * from student where name like \"?\";";
    private static String CONSTRAIN = "set SQL_SAFE_UPDATES = 0;";

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
    public List<Student> display() {
        Connection connection = getConnection();
        List<Student> studentList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(DISPLAY_STUDENT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String className = rs.getString("class");
                Student student = new Student(id,name,className);
                studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return studentList;
    }

    @Override
    public void add(Student student) {
         Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(ADD_STUDENT);
            preparedStatement.setInt(1,student.getId());
            preparedStatement.setString(2,student.getName());
            preparedStatement.setString(3,student.getClassName());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public void delete(int id) {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareCall(CONSTRAIN);
            preparedStatement.executeUpdate();
            preparedStatement = connection.prepareCall(DELETE_STUDENT);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

 
}
