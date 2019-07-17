package jdbc;

import entity.User;

public class JdbcUtilTest {
    public static void main(String[] args) {
        User u = new UserDao().findUser(new User("ain","admin"));
        System.out.println();
    }
}
