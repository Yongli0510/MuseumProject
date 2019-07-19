package service;

import dao.impl.ExhibitDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Exhibit;
import entity.User;

import java.util.ArrayList;
import java.util.List;

public class LoveService {

    /*根据用户，得到其收藏的藏品*/
    List<Exhibit> getList(User user){
        UserDaoImpl userDao = new UserDaoImpl();
        ExhibitDaoImpl exhibitDao = new ExhibitDaoImpl();

        int[] exs = userDao.getLoves(user);
        List<Exhibit> list = new ArrayList<>();
        for (int ex : exs) {
            list.add(exhibitDao.getExhibit(ex));
        }
        return list;
    }
}
