package jdbc;

import entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDao {

    public User findUser(User user) {
        //sql语句
        String sql = "select * from user where username='" + user.getName() + "' and password='" + user.getPassword() + "'";
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
                User u = new User();
                u.setId(rs.getInt("userid"));
                u.setName(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.close(rs, st, con);
        }
        return null;
    }

}
