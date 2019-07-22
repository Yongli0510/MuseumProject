package dao.impl;

import dao.DAO;
import dao.UserDao;
import entity.User;

import java.util.ArrayList;
import java.util.Arrays;
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

    public void updateFriend(User user, String friends) {
        User u = getUser(user);
        String sql = "UPDATE `museum_pj`.`user` SET `friends` = '?' WHERE (`id` = '?')";
        update(sql, friends, u.getId());
    }

    public int[] getFriends(User user) {
        User u = getUser(user.getName());
        String str = u.getFriends();

        List<String> friends = new ArrayList<>(Arrays.asList(str.split(",")));
        return friends.stream().mapToInt(Integer::valueOf).toArray();
    }

    public int[] getLoves(User user) {
        User u = getUser(user);
        String str = u.getLoves();

        List<String> loves = new ArrayList<>(Arrays.asList(str.split(",")));
        return loves.stream().mapToInt(Integer::valueOf).toArray();
    }

    public int[] getInvite(User user) {
        User u = getUser(user);
        String str = u.getInvite();

        List<String> invites = new ArrayList<>(Arrays.asList(str.split(",")));
        return invites.stream().mapToInt(Integer::valueOf).toArray();
    }

}
