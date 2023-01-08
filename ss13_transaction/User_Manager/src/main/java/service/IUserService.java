package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;

    public void insertUserStored(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> sort();

    public List<User> findbycountry(String country);

    public List<User> selectAllUsers();


    List<User> selectAllUsersStored();

    public boolean deleteUser(int id) throws SQLException;

    public void deleteUserStored(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public void updateUserStored(User user) throws SQLException;

    User getUserByID(int id);

    void insertUserById(User user)throws SQLException;

}
