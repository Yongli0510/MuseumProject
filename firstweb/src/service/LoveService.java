package service;

import dao.impl.ExhibitDaoImpl;
import dao.impl.LoveDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Exhibit;
import entity.LoveItem;
import entity.User;

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

    public Exhibit getLoveOne(int id){
        return exhibitDao.getExhibit(id);
    }

}
