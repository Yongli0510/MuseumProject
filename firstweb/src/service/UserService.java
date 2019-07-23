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

    public void addUser(String name, String password,int permission, String email, String signature){
        userDao.addUser(name,password,permission,email,signature);
    }

    public User getUser(int id){
        return userDao.getUser(id);
    }

    public void updateMessage(int id,String name, String email, String sig){
        userDao.updateMessage(id,name,email,sig);
    }

    public boolean checkPwd(int id, String pwd){
        return getUser(id).getPassword().equals(pwd);
    }

    public boolean checkName(int id, String name){
        User user = userDao.checkName(name);
        return user == null || user.getId() == id;
    }

    public List<User> searchUser(String name){
        return userDao.searchUser(name);
    }

    public void updatePermission(int level, int uid){
        userDao.updatePermission(level,uid);
    }


    public void delUser(int id){
        userDao.delUser(id);
    }
}
