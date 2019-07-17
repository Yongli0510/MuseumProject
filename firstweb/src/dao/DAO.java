package dao;

import jdbc.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class DAO<T> {

    private QueryRunner queryRunner = new QueryRunner();
    private Class<T> clazz;

    public DAO(){
        Type superClass = getClass().getGenericSuperclass();
        if(superClass instanceof ParameterizedType){
            ParameterizedType parameterizedType =  (ParameterizedType)superClass;
            Type [] typeArgs = parameterizedType.getActualTypeArguments();
            if(typeArgs != null && typeArgs.length > 0){
                if(typeArgs[0] instanceof Class){
                    clazz = (Class<T>)typeArgs[0];
                }
            }
        }
    }

    public void update(String sql, Object ... args) {
        JdbcUtil jdbcUtil = new JdbcUtil();
        Connection connection = null;

        try {
            connection = jdbcUtil.getConnection();
            queryRunner.update(connection,sql,args);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            jdbcUtil.releaseConnection(connection);
        }
    }

    public T get(String sql, Object ... args) {
        JdbcUtil jdbcUtil = new JdbcUtil();
        Connection connection = null;

        try {
            connection = jdbcUtil.getConnection();
            return queryRunner.query(connection,sql,new BeanHandler<>(clazz),args);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            jdbcUtil.releaseConnection(connection);
        }

        return null;
    }

    public List<T> getForList(String sql, Object ... args) {
        JdbcUtil jdbcUtil = new JdbcUtil();
        Connection connection = null;

        try {
            connection = jdbcUtil.getConnection();
            return queryRunner.query(connection,sql,new BeanListHandler<>(clazz),args);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            jdbcUtil.releaseConnection(connection);
        }

        return null;
    }

    public <E> E getForValue(String sql, Object ... args){
        JdbcUtil jdbcUtil = new JdbcUtil();
        Connection connection = null;

        try {
            connection = jdbcUtil.getConnection();
            return (E) queryRunner.query(connection,sql,new ScalarHandler(),args);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            jdbcUtil.releaseConnection(connection);
        }
        return null;
    }
}
