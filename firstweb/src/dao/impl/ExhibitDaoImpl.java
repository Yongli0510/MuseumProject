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
        String sql = "SELECT iditems id,itemname name,year,place,age,detail,hotdegree hotDegree,pic FROM exhibits WHERE iditems = ?";
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

    private List<Exhibit> getList(int number, String orderType){
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

    @Override
    public void updateHotDegree(int id) {
        String sql = "update museum_pj.exhibits set hotdegree = hotdegree + 1 where iditems = ?";
        update(sql,id);
    }

    @Override
    public List<Exhibit> searchExhibits(String[] searchItems) {
        String sql = "select iditems id,itemname name,year,place,age,detail,hotdegree hotDegree,pic from exhibits " +
                     "where itemname like ? and detail like ? and place like ? " +
                     "order by hotdegree desc";
        return getForList(sql,"%" + searchItems[0] + "%","%" + searchItems[1] + "%","%" + searchItems[2] + "%");
    }

}
