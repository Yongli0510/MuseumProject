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


    public boolean isFriend(int uid, int fid){
        return fd.isFriend(uid, fid) != null;
    }

    public void addFriend(int uid, int fid){
        fd.addFriend(uid,fid);
        fd.addFriend(fid,uid);
    }


}
