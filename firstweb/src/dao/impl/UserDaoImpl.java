package dao.impl;

import dao.DAO;
import dao.UserDao;
import entity.User;

import java.util.List;

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

    public void delUser(int id){
        String sql = "UPDATE user SET name = '账户已注销 ', password = '0000000' WHERE (id = ?);";
        update(sql,id);
    }

    public void updateMessage(int id, String name, String email, String sig) {
        String sql = "UPDATE user SET name = ?, email = ?, signature = ? WHERE (id = ?)";
        update(sql, name, email, sig, id);
    }

    public User checkName(String name){
        String sql = "SELECT * FROM user WHERE name = ?";
        return get(sql, name);
    }

    public List<User> searchUser(String name) {
        String sql = "select * from user where name like ? ";
        return getForList(sql,"%" + name + "%");
    }

    public void addUser(String name, String password,int permission, String email, String signature){
        String sql = "INSERT INTO user (name, password, permission, email, signature) VALUES (?,?,?,?,?)";
        update(sql,name,password,permission,email,signature);
    }

    public void updatePermission(int level, int id){
        String sql = "UPDATE user SET permission = ? WHERE (id = ?)";
        update(sql,level,id);
    }

}
