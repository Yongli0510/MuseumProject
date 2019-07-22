package entity;

public class Friend {
    private int id;
    private int uid;
    private int fid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public Friend(int id, int uid, int fid) {
        this.id = id;
        this.uid = uid;
        this.fid = fid;
    }

    public Friend() {
    }
}
