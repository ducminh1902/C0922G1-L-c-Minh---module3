package dao;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "codegym";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String FIND_BY_COUNTRY = "select * from users where country like ?;";
    private static final String SORT_LIST = "select * from users order by name;";
    public UserRepository() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> sort() {
        List<User> userList = new ArrayList<>();
        User user = null;
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_LIST);
          ResultSet resultSet = preparedStatement.executeQuery();
          while (resultSet.next()){
              int id = resultSet.getInt("id");
              String name = resultSet.getString("name");
              String email = resultSet.getString("email");
              String country = resultSet.getString("country");
              user = new User(id,name,email,country);
              userList.add(user);
          }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> findbycountry(String country) {
        List<User> userArrayList = new ArrayList<>();
        User user = null;
        try(Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_COUNTRY);) {
            preparedStatement.setString(1,"%"+country+"%");
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
          while (rs.next()){
              int id = rs.getInt("id");
              String name = rs.getString("name");
              String email = rs.getString("email");
              String countryz = rs.getString("country");
              user = new User(id, name, email, countryz);
              userArrayList.add(user);
          }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userArrayList;
    }

    public List<User> selectAllUsers() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public void insertUserStored(User user) throws SQLException {
        Connection connection = getConnection();
        String query = "{CALL insert_user(?,?,?)}";

        CallableStatement callableStatement = null;
        callableStatement = connection.prepareCall(query);
        callableStatement.setString(1,user.getName());
        callableStatement.setString(2,user.getEmail());
        callableStatement.setString(3,user.getCountry());

        callableStatement.executeUpdate();

    };

    @Override
    public List<User> selectAllUsersStored() {
         User user = null;
         String query = "{CALL display_users()}";
         List<User> userList = new ArrayList<>();
         Connection connection = getConnection();

        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(query);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id,name,email,country);
                userList.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return userList;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public void deleteUserStored(int id) throws SQLException {
        Connection connection = getConnection();
        String query = "{CALL delete_user(?)}";

        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setInt(1,id);
        callableStatement.executeUpdate();
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public void updateUserStored(User user) throws SQLException {
        Connection connection = getConnection();
        String query = "{CALL update_user(?,?,?,?)}";
        CallableStatement callableStatement = connection.prepareCall(query);
        callableStatement.setString(1,user.getName());
        callableStatement.setString(2,user.getEmail());
        callableStatement.setString(3,user.getCountry());
        callableStatement.setInt(4,user.getId());
        callableStatement.executeUpdate();
    }

    @Override
    public User getUserByID(int id) {
        User user = null;
        String query = "{CALL get_user_by_id(?)}";

        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             CallableStatement callableStatement = connection.prepareCall(query)) {

            callableStatement.setInt(1, id);

            // Step 3: Execute the query or update query
            ResultSet rs = callableStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public void insertUserById(User user) throws SQLException {
        String query = "{CALL insert_user(?,?,?)}";

        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}