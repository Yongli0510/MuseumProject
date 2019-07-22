package service;

import dao.impl.ExhibitDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Exhibit;
import entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserService {
    private UserDaoImpl userDao;

    public UserService(UserDaoImpl userDao){
        this.userDao = userDao;
    }

    public User log(String name, String pwd){

        User u = new User();
        u.setName(name);
        u.setPassword(pwd);

       return userDao.getUser(u);
    }

    public User getUser(String name){
        return userDao.getUser(name);
    }

    public User getUser(int id){
        return userDao.getUser(id);
    }

    public List<Exhibit> getList(User user){
        ExhibitDaoImpl exhibitDao = new ExhibitDaoImpl();

        int[] exs = userDao.getLoves(user);
        List<Exhibit> list = new ArrayList<>();
        for (int ex : exs) {
            list.add(exhibitDao.getExhibit(ex));
        }
        return list;
    }

}
