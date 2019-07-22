package dao.impl;

import dao.DAO;
import entity.Friend;
import entity.User;

import java.util.List;

public class FriendDaoImpl extends DAO<Friend> {
    public List<Friend> getFriends(int uid){
        String sql = "SELECT * FROM friend WHERE uid= ?";
        return getForList(sql, uid);
    }

    public void delFriend(int uid, int fid){
        String sql = "DELETE FROM friend WHERE (uid = ? AND fid = ?)";
        update(sql,uid,fid);
    }

}
