package service;

import dao.impl.UserDaoImpl;
import entity.User;

public class UserService {

    public User log(String name, String pwd){
        UserDaoImpl userDao = new UserDaoImpl();

        User u = new User();
        u.setName(name);
        u.setPassword(pwd);

       return userDao.getUser(u);
    }

}
