package dao.impl;

import dao.DAO;
import entity.LoveItem;
import entity.User;

import java.util.List;

public class LoveDaoImpl extends DAO<LoveItem> {
    public List<LoveItem> getLoveList(User me) {
        String sql = "SELECT * FROM loves WHERE userid = ? ORDER BY time DESC";
        return getForList(sql, me.getId());
    }

    public void updatePublicLevel(int userId, int artId, int canSee){
        String sql = "UPDATE loves SET canSee = ? WHERE (userid = ? AND artid = ?)";
        update(sql,canSee,userId,artId);
    }

    public void deleteLove(int userId, int artId){
        String sql = "DELETE FROM loves WHERE (userid = ? AND artid = ?)";
        update(sql,userId,artId);
    }

}
