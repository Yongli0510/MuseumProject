package dao.impl;

import dao.DAO;
import entity.Email;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class EmailDaoImpl extends DAO<Email> {
    public List<Email> getReceivedEmail(int userId){
        String sql = "select * from email where resId=? order by isRead";
        return getForList(sql,userId);
    }

    public List<Email> getSentEmail(int userId){
        String sql = "select * from email where sendId=? order by time desc";
        return getForList(sql,userId);
    }

    public void addEmailRecord(int sendId,int resId,String content){
        String sql = "insert into email (sendId,resId,isRead,content,time) values (?,?,?,?,?)";
        update(sql,sendId,resId,0,content,new Timestamp(new Date().getTime()));
    }

    public void changeReadStatus(int id){
        String sql = "update email set isRead = 1-isRead where id = ?";
        update(sql,id);
    }

    public void deleteEmail(int id){
        String sql = "delete from email where id = ?";
        update(sql,id);
    }
}
