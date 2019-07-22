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
        String sql = "SELECT iditems id,itemname name,year,place,age,detail,hotdegree hotDegree,pic FROM exhibit WHERE iditems = ?";
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
        String sql = "select iditems id,itemname name,year,place,age,detail,hotdegree hotDegree,pic from exhibit order by " + orderType + " desc";
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
        String sql = "update museum_pj.exhibit set hotdegree = hotdegree + 1 where iditems = ?";
        update(sql,id);
    }

    @Override
    public List<Exhibit> searchExhibits(String[] searchItems) {
        String sql = "select iditems id,itemname name,year,place,age,detail,hotdegree hotDegree,pic from exhibit " +
                     "where itemname like ? and detail like ? and place like ? " +
                     "order by hotdegree desc";
        return getForList(sql,"%" + searchItems[0] + "%","%" + searchItems[1] + "%","%" + searchItems[2] + "%");
    }

    public void updateExhibit(int id,String name,String detail,String place,String age,String year,String pic){
        String sql = "update museum_pj.exhibit set itemname=? , detail=? , place=? , age=? , year=? , pic=? where iditems=?";
        update(sql,name,detail,place,age,year,pic,id);
    }

    public void addExhibit(String name,String detail,String place,String age,String year,String pic){
        String sql = "insert into museum_pj.exhibit (itemname,detail,place,age,year,pic,hotdegree) values (?,?,?,?,?,?,?)";
        update(sql,name,detail,place,age,year,pic,0);
    }

    public void deleteExhibit(int id){
        String sql = "delete from museum_pj.exhibit where iditems=?";
        update(sql,id);
    }
}
