package dao;

import entity.User;

import java.sql.SQLException;

public interface UserDao {
    public User getUser(User user);
}
