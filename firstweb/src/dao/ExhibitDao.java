package dao;

import entity.Exhibit;

import java.sql.SQLException;
import java.util.List;

public interface ExhibitDao {

    Exhibit getExhibit(int id);

    List<Exhibit> getHottestExhibits(int number);//得到热门的展品列表（number代表要获得几个）

    List<Exhibit> getLatestExhibits(int number);//得到最新发布的展品列表（number代表要获得几个）

    void updateHotDegree(int id);//更新某个展品的热度（加一）

    List<Exhibit> searchExhibits(String[] searchItems); //搜索展品（根据名称、简介、馆藏地点中的一项或多项进行搜索）

    void updateExhibit(int id,String name,String detail,String place,String age,String year,String pic);//根据展品id更新展品

    void addExhibit(String name,String detail,String place,String age,String year,String pic);//增加展品

    void deleteExhibit(int id); //删除展品
}
