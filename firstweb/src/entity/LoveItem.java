package entity;

import java.sql.Date;

public class LoveItem {
    private int id;
    private int userid;
    private int artid;
    private Date time;
    private int canSee;

    public int getCanSee() {
        return canSee;
    }

    public void setCanSee(int canSee) {
        this.canSee = canSee;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getArtid() {
        return artid;
    }

    public void setArtid(int artid) {
        this.artid = artid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public LoveItem(int id, int userid, int artid, Date time) {
        this.id = id;
        this.userid = userid;
        this.artid = artid;
        this.time = time;
    }

    public LoveItem() {
    }
}
