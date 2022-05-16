package com.qf.emp.dao.impl;

import com.qf.emp.dao.EmpDao;
import com.qf.emp.entity.Emp;
import com.qf.emp.entity.Page;
import com.qf.emp.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class EmpDaoImpl implements EmpDao {
    private QueryRunner queryRunner = new QueryRunner();
    @Override
    public List<Emp> selectAll() {
        try {
            List<Emp> emps = queryRunner.query(DBUtils.getConnection(),"select * from emp;",new BeanListHandler<Emp>(Emp.class));
            return  emps;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Emp selectByName(String name) {
        try {
            Emp emp = (Emp) queryRunner.query(DBUtils.getConnection(),"select * from emp where name =?;",new BeanHandler<Emp>(Emp.class),name);
            return  emp;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Emp> selectAll(Page page) {

        try {
            List<Emp> emps = queryRunner.query(DBUtils.getConnection(),"select * from emp limit ?,?;",
                    new BeanListHandler<Emp>(Emp.class),page.getStartRows(),page.getPageSize());
            return  emps;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int delete(int id) {
        try {
            int result = queryRunner.update(DBUtils.getConnection(),"delete from emp where id = ?;",id);
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int update(Emp emp) {
        try {
            int result = queryRunner.update(DBUtils.getConnection(),"update emp set name=?,salary=?,age=? where id = ?",emp.getName(),emp.getSalary(),emp.getAge(),emp.getId());
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int insert(Emp emp) {
        try {
            queryRunner.update(DBUtils.getConnection(),"insert into emp(name,salary,age) values(?,?,?)",emp.getName(),emp.getSalary(),emp.getAge());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Emp select(int id) {
        try {
            Emp emp = queryRunner.query(DBUtils.getConnection(),"select * from emp where id=?;",new BeanHandler<Emp>(Emp.class),id);
            return emp;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public long selectCount() {
        try {
            return  queryRunner.query(DBUtils.getConnection(),"select count(1) from emp;",new ScalarHandler<>());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


}
