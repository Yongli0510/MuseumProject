package entity;

import java.util.List;

public class Content<T> {
    private int uid;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    private List<T> list;
    private List<Boolean> bolList;

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public List<Boolean> getBolList() {
        return bolList;
    }

    public void setBolList(List<Boolean> bolList) {
        this.bolList = bolList;
    }

    public Content(List<T> list, List<Boolean> bolList) {
        this.list = list;
        this.bolList = bolList;
    }

    public Content() {
    }
}
