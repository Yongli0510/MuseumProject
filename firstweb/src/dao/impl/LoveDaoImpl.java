package dao.impl;

import dao.DAO;
import entity.LoveItem;
import entity.User;

import java.util.List;

public class LoveDaoImpl extends DAO<LoveItem> {
    public List<LoveItem> getLoveList(User me){
        String sql = "SELECT * FROM loves WHERE userid = ? ORDER BY time DESC";
        return getForList(sql,me.getId());
    }
}
