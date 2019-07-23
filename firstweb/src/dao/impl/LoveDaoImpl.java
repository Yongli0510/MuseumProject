package dao.impl;

import dao.DAO;
import entity.LoveItem;
import entity.User;

import java.sql.Date;
import java.util.List;

public class LoveDaoImpl extends DAO<LoveItem> {
    public List<LoveItem> getLoveList(User me) {
        String sql = "SELECT * FROM loves WHERE userid = ? ORDER BY time DESC";
        return getForList(sql, me.getId());
    }

    public List<LoveItem> getShowLoveList(User me) {
        String sql = "SELECT * FROM loves WHERE (userid = ? AND canSee = 1) ORDER BY time DESC";
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

    public void addLove(int userId, int artId, Date date){
        String sql = "INSERT INTO loves (userid, artid, time, canSee) VALUES (?, ?, ?,1);";
        update(sql,userId,artId,date);
    }

}
