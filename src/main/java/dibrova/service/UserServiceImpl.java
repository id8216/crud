package dibrova.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import dibrova.dao.UserDao;
import dibrova.model.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> getUserByName(String name) {
        return this.userDao.getUserByName(name);
    }

    @Override
    @Transactional
    public List<User> getUserByAdmin() {
        return this.userDao.getUserByAdmin();
    }

    @Override
    @Transactional
    public List<List<User>> listUsers() {
        return this.userDao.listUsers();
    }
}
