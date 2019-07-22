package service;

import dao.impl.FriendDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Friend;
import entity.User;

import java.util.ArrayList;
import java.util.List;

public class FriendService {
    private UserDaoImpl ud;
    private FriendDaoImpl fd;

    public FriendService(FriendDaoImpl fd) {
        this.fd = fd;
    }

    public FriendService(UserDaoImpl ud){
        this.ud = ud;
    }

    public FriendService(UserDaoImpl ud, FriendDaoImpl fd) {
        this.ud = ud;
        this.fd = fd;
    }

    public List<User> getFriend(int uid){
        List<Friend> list = fd.getFriends(uid);
        List<User> res = new ArrayList<>();
        for (Friend friend : list) {
            res.add(ud.getUser(friend.getFid()));
        }
        return res;
    }

    public void delFriend(int uid, int fid){
        fd.delFriend(uid,fid);
        fd.delFriend(fid,uid);
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
