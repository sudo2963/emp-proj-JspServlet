package com.qf.emp.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBUtils {
    public static  Properties props = new Properties();//储存数据库配置信息
    static DruidDataSource ds =new DruidDataSource();
    static {
        try {
            //加载Properties
            //InputStream in = DBUtils.class.getResourceAsStream("/db.properties");
            InputStream in = DBUtils.class.getResourceAsStream("/com/qf/emp/utils/database.properties");
            props.load(in);//相对于classpath根目录
            //Class.forName(props.getProperty("driver"));
            try {
                //更新为Druid连接池，不再手动加载驱动类
                ds=(DruidDataSource) DruidDataSourceFactory.createDataSource(props);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    static ThreadLocal<Connection> tconn = new ThreadLocal<Connection>();
    public static Connection getConnection() {
        //采用本地线程共享连接
        Connection conn = tconn.get();
        if(conn ==null) {
            try {
                //conn = DriverManager.getConnection
                //(props.getProperty("url"), props.getProperty("user"),props.getProperty("pwd"));
                //使用连接池获取
                conn = ds.getConnection();
                tconn.set(conn); //首次创建连接后 放到本地线程中  ，后续直接获得该线程变量中的连接
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        //每次创建一个新连接
		/*
		try {
			conn = DriverManager.getConnection
			(props.getProperty("url"), props.getProperty("user"),props.getProperty("pwd"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
        return conn;
    }
    public static void coloseAll(Connection conn,Statement st,ResultSet rs) {
        try {
            if(rs !=null) {
                rs.close();
            }
            if(st !=null) {
                st.close();
            }
            if(conn !=null) {
                conn.close();//归还连接池

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        tconn.remove();  //将conn移除
    }
    public static void coloseAll(Connection conn, PreparedStatement ps,ResultSet rs) {
        // TODO Auto-generated method stub
        try {
            if(rs !=null) {
                rs.close();
            }
            if(ps !=null) {
                ps.close();
            }
            if(conn !=null) {
                conn.close();
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }

    public static DataSource getDataSource() {
        return ds;
    }

    //关闭连接池
    public static void closePool(){
        coloseAll(getConnection(),null,null);  //归还连接
        ds.close(); //释放连接
    }

    //开启事务
    public static void  beginTransaction(){
        Connection connection=null;
        try {
            connection=getConnection();
            connection.setAutoCommit(false);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //提交事务
    public static void commitTransaction(){
        Connection connection=null;
        try {
            connection=getConnection();
            connection.commit();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //回滚事务
    public static void rollbackTransaction(){
        Connection connection=null;
        try {
            connection=getConnection();
            connection.rollback();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void begin(Connection conn) {
        try {
            if(conn !=null) {
                conn.setAutoCommit(false);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public static void commit(Connection conn) {
        try {
            conn.commit();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public static void rollback(Connection conn) {
        try {
            conn.rollback();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
