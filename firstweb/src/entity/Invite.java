package entity;

public class Invite {
    private int id;
    private int sendId;
    private int resId;
    private int agree;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSendId() {
        return sendId;
    }

    public void setSendId(int sendId) {
        this.sendId = sendId;
    }

    public int getResId() {
        return resId;
    }

    public void setResId(int resId) {
        this.resId = resId;
    }

    public int getAgree() {
        return agree;
    }

    public void setAgree(int agree) {
        this.agree = agree;
    }

    public Invite(int id, int sendId, int resId, int agree) {
        this.id = id;
        this.sendId = sendId;
        this.resId = resId;
        this.agree = agree;
    }

    public Invite() {
    }
}
