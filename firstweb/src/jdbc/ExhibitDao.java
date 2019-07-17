package jdbc;

import entity.Exhibit;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ExhibitDao {

    public Exhibit findExhibit(int id) {
        //sql语句
        String sql = "select * from exhibits where iditems='" + id + "'";
        //数据库连接，读取数据，循环遍历
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        JdbcUtil util = new JdbcUtil();
        try {
            con = util.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                Exhibit ex = new Exhibit();
                ex.setId(id);
                ex.setName(rs.getString("itemname"));
                ex.setYear(rs.getInt("year"));
                ex.setPlace(rs.getString("place"));
                ex.setAge(rs.getString("age"));
                ex.setHotDegree(rs.getInt("hotdegree"));
                ex.setDetail(rs.getString("detail"));
                ex.setPic(rs.getString("pic"));
                return ex;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.close(rs, st, con);
        }
        return null;
    }
}
