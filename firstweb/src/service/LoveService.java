package service;

import dao.impl.ExhibitDaoImpl;
import dao.impl.LoveDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Exhibit;
import entity.LoveItem;
import entity.User;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class LoveService {

    LoveDaoImpl loveDao;
    ExhibitDaoImpl exhibitDao;


    public LoveService(LoveDaoImpl loveDao, ExhibitDaoImpl exhibitDao) {
        this.loveDao = loveDao;
        this.exhibitDao = exhibitDao;
    }

    public List<LoveItem> getLoves(User me){
        return loveDao.getLoveList(me);
    }

    public List<LoveItem> getShowLoves(User me){
        return loveDao.getShowLoveList(me);
    }

    public Exhibit getLoveOne(int id){
        return exhibitDao.getExhibit(id);
    }

    public void updatePublicLevel(int userId, int artId, int canSee){
        loveDao.updatePublicLevel(userId,artId,canSee);
    }

    public void delLove(int userId, int artId){
        loveDao.deleteLove(userId,artId);
    }

    public void addLove(int userId,int artId){
        long time = System.currentTimeMillis();
        Date date = new Date(time);
        loveDao.addLove(userId,artId,date);
    }

    public boolean isLove(int userId, int artId){
        return loveDao.isLove(userId,artId) != null;
    }
}
