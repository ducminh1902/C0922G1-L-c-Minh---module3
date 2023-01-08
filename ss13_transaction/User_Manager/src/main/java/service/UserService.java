package service;

import dao.IUserRepository;
import dao.UserRepository;
import model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService  implements IUserService{
    IUserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        this.userRepository.insertUser(user);
    }

    @Override
    public void insertUserStored(User user) throws SQLException {
       this.userRepository.insertUserStored(user);
    }

    @Override
    public User selectUser(int id) {
       return this.userRepository.selectUser(id);
    }

    @Override
    public List<User> sort() {
     return    this.userRepository.sort();
    }

    @Override
    public List<User> findbycountry(String country) {
        return this.userRepository.findbycountry(country);
    }

    @Override
    public List<User> selectAllUsers() {
       return this.userRepository.selectAllUsers();
    }

    @Override
    public List<User> selectAllUsersStored() {
        return this.userRepository.selectAllUsersStored();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return this.userRepository.deleteUser(id);
    }

    @Override
    public void deleteUserStored(int id) throws SQLException {
      this.userRepository.deleteUserStored(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return this.userRepository.updateUser(user);
    }

    @Override
    public void updateUserStored(User user) throws SQLException {
       this.userRepository.updateUserStored(user);
    }

    @Override
    public User getUserByID(int id) {
        return this.userRepository.getUserByID(id);
    }

    @Override
    public void insertUserById(User user) throws SQLException {
        this.userRepository.insertUser(user);
    }
}
