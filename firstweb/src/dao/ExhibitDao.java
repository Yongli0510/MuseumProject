package dao;

import entity.Exhibit;

import java.sql.SQLException;
import java.util.List;

public interface ExhibitDao {

    public Exhibit getExhibit(int id);

    public List<Exhibit> getHottestExhibits(int number);//得到热门的艺术品列表（number代表要获得几个）

    public List<Exhibit> getLatestExhibits(int number);//得到最新发布的艺术品列表（number代表要获得几个）
}
