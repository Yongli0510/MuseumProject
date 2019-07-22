package dao.impl;

import dao.DAO;
import dao.UserDao;
import entity.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class UserDaoImpl extends DAO<User> implements UserDao {
    @Override
    public User getUser(User user) {
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
        return get(sql,user.getName(),user.getPassword());
    }

    public int[] getLoves(User user){
        User u = getUser(user);
        String str = u.getLoves();

        List<String> loves = new ArrayList<>(Arrays.asList(str.split(",")));
        return loves.stream().mapToInt(Integer::valueOf).toArray();
    }
}
