package service;

import dao.impl.UserDaoImpl;
import entity.User;

import java.util.ArrayList;
import java.util.List;

public class FriendService {
    private UserDaoImpl ud;
    public FriendService(UserDaoImpl ud){
        this.ud = ud;
    }


    public List<User> getFriend(User user) {
        int[] exs = ud.getFriends(user);
        List<User> list = new ArrayList<>();
        for (int ex : exs) {
            list.add(ud.getUser(ex));
        }
        return list;
    }

    public List<User> getInvite(User user){
        int[] exs = ud.getInvite(user);
        List<User> list = new ArrayList<>();
        for (int ex : exs) {
            list.add(ud.getUser(ex));
        }
        return list;
    }

    public void addFriend(User user, int id){
        int[] exs = ud.getFriends(user);
        StringBuilder res = new StringBuilder();
        for (int ex : exs) {
            res.append(ex).append(",");
        }
        res.append(id);
        ud.updateFriend(user,res.toString());
    }

    public boolean isFriend(User user, int id){
        int[] exs = ud.getFriends(user);
        for (int ex : exs) {
            if (ex == id)
                return true;
        }
        return false;
    }

}
