package entity;

import java.sql.Timestamp;

public class Email {
    private int id;
    private int sendId;
    private int resId;
    private int isRead;
    private String content;
    private Timestamp time;

    public Email() {
    }

    public Email(int id, int sendId, int resId, int isRead, String content, Timestamp time) {
        this.id = id;
        this.sendId = sendId;
        this.resId = resId;
        this.isRead = isRead;
        this.content = content;
        this.time = time;
    }

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

    public int getIsRead() {
        return isRead;
    }

    public void setIsRead(int isRead) {
        this.isRead = isRead;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
