package entity;

public class Exhibit {
    private int id;
    private String name;
    private int year;
    private String place;
    private String age;
    private String detail;
    private int hotDegree;
    private String pic;


    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Exhibit(){

    }

    public Exhibit(int id, String name, int year, String place, String age, String detail, int hotDegree) {
        this.id = id;
        this.name = name;
        this.year = year;
        this.place = place;
        this.age = age;
        this.detail = detail;
        this.hotDegree = hotDegree;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getHotDegree() {
        return hotDegree;
    }

    public void setHotDegree(int hotDegree) {
        this.hotDegree = hotDegree;
    }
}
