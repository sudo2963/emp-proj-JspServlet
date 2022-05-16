package com.qf.emp.dao.impl;

import com.qf.emp.dao.EmpManagerDao;
import com.qf.emp.entity.EmpManager;
import com.qf.emp.utils.DBUtils;

import java.sql.*;

public class EmpManagerDaoImpl  implements EmpManagerDao {


    @Override
    public EmpManager select(String u, String p) {

        Connection connection = DBUtils.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;

        try {
            ps=connection.prepareStatement("select * from empmanager where username=? and password=?");
            ps.setString(1,u);
            ps.setString(2,p);
            rs=ps.executeQuery();
            if(rs.next())
                return new EmpManager(rs.getString(1),rs.getString(2));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtils.coloseAll(connection,ps,rs);
        }
        return null;
    }
}
