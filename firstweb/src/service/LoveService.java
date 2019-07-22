package service;

import dao.impl.ExhibitDaoImpl;
import dao.impl.UserDaoImpl;
import entity.Exhibit;
import entity.User;

import java.util.ArrayList;
import java.util.List;

public class LoveService {

    UserDaoImpl userDao;

    public LoveService(UserDaoImpl userDao){
        this.userDao = userDao;
    }

}
