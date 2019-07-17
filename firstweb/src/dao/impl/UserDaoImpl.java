package dao.impl;

import dao.DAO;
import dao.UserDao;
import entity.User;

import java.sql.SQLException;

public class UserDaoImpl extends DAO<User> implements UserDao {
    @Override
    public User getUser(User user) {
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
        return get(sql,user.getName(),user.getPassword());
    }
}
