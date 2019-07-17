package jdbc;

import java.sql.*;

public class JdbcUtil {
    private final static String URL = "jdbc:mysql://47.102.158.139:3306/museum_pj?serverTimezone=UTC"; //若没有改动，默认端口3306
    private final static String USER = "admin"; // 安装mysql时的用户名
    private final static String PASSWORD = "123123"; //安装mysql时的密码

    public JdbcUtil() {
        try {
            // 反射
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // 得到连接
    public Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // 关闭结果集、语句和连接
    public void releaseConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}