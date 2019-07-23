package dao.impl;

import dao.DAO;
import dao.UserDao;
import entity.User;

public class UserDaoImpl extends DAO<User> implements UserDao {
    @Override
    public User getUser(User user) {
        String sql = "SELECT * FROM user WHERE name = ? AND password = ?";
        return get(sql, user.getName(), user.getPassword());
    }

    public User getUser(String name) {
        String sql = "SELECT * FROM user WHERE name = ?";
        return get(sql, name);
    }

    public User getUser(int id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        return get(sql, id);
    }

    public void updateMessage(int id, String name, String email, String sig) {
        String sql = "UPDATE user SET name = ?, email = ?, signature = ? WHERE (id = ?)";
        update(sql, name, email, sig, id);
    }

    public User checkName(String name){
        String sql = "SELECT * FROM user WHERE name = ?";
        return get(sql, name);
    }

}
