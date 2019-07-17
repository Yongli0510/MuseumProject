package dao.impl;

import dao.DAO;
import dao.ExhibitDao;
import entity.Exhibit;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExhibitDaoImpl extends DAO<Exhibit> implements ExhibitDao {

    @Override
    public Exhibit getExhibit(int id) {
        String sql = "SELECT * FROM exhibits WHERE iditems = ?";
        return get(sql,id);
    }

    @Override
    public List<Exhibit> getHottestExhibits(int number) {
        return getList(number,"hotdegree");
    }

    @Override
    public List<Exhibit> getLatestExhibits(int number) {
        return getList(number,"year");
    }

    private List<Exhibit> getList(int number,String orderType){
        String sql = "select iditems id,itemname name,year,place,age,detail,hotdegree hotDegree,pic from exhibits order by " + orderType + " desc";
        List<Exhibit> resultSet = getForList(sql);
        List<Exhibit> returnSet = new ArrayList<>();
        if(number <= resultSet.size()){
            for(int i = 0; i < number; i++){
                returnSet.add(resultSet.get(i));
            }
        }
        return returnSet;
    }
}
