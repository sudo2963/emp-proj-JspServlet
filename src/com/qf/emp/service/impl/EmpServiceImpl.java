package com.qf.emp.service.impl;

import com.qf.emp.dao.EmpDao;
import com.qf.emp.dao.impl.EmpDaoImpl;
import com.qf.emp.entity.Emp;
import com.qf.emp.entity.Page;
import com.qf.emp.service.EmpService;
import com.qf.emp.utils.DBUtils;

import java.util.ArrayList;
import java.util.List;

public class EmpServiceImpl implements EmpService {
    private EmpDao empDao = new EmpDaoImpl();
    @Override
    public List<Emp> showAllEmp() {
        List<Emp> emps = new ArrayList<>();
        Page page =new Page(1,4);
        try {
            //DBUtils.beginTransaction();
            List<Emp> temps = empDao.selectAll();
            if(temps!=null){
                emps = temps;
            }
            //DBUtils.commitTransaction();
        } catch (Exception e) {
           // DBUtils.rollbackTransaction();
            e.printStackTrace();
        }
        return emps;
    }

    @Override
    public List<Emp> showAllEmp(Page page) {
        List<Emp> emps = new ArrayList<>();
        try {
            //DBUtils.beginTransaction();
            long totalCount = empDao.selectCount();
            page.setTotalCount((int)totalCount);
            List<Emp> temp = empDao.selectAll(page);
            if(temp!=null){
                emps =temp;
            }
            //DBUtils.commitTransaction();
        } catch (Exception e) {
            //DBUtils.rollbackTransaction();
            e.printStackTrace();
        }
        return emps;
    }

    @Override
    public int removeEmp(int id) {
        int result = 0;
        try {
            DBUtils.beginTransaction();
            result = empDao.delete(id);
            DBUtils.commitTransaction();
        } catch (Exception e) {
            DBUtils.rollbackTransaction();
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int modify(Emp emp) {
        int result = 0;
        try {
            DBUtils.beginTransaction();
            result = empDao.update(emp);
            DBUtils.commitTransaction();
        } catch (Exception e) {
            DBUtils.rollbackTransaction();
            e.printStackTrace();
        }
        return result ;
    }

    @Override
    public int addEmp(Emp emp) {
        int result = 0;
        try {
            DBUtils.beginTransaction();
            result = empDao.insert(emp);
            DBUtils.commitTransaction();
        } catch (Exception e) {
            DBUtils.rollbackTransaction();
            e.printStackTrace();
        }
        return result ;
    }

    @Override
    public Emp showEmp(int id) {
        Emp emp = null;
        try {
            //DBUtils.beginTransaction();
            emp = empDao.select(id);
            //DBUtils.commitTransaction();
        } catch (Exception e) {
           // DBUtils.rollbackTransaction();
            e.printStackTrace();
        }
        return emp;
    }

    @Override
    public boolean checkName(String name) {
        Emp emp = null;
        try {
            //DBUtils.beginTransaction();
            emp = empDao.selectByName(name);
           // DBUtils.commitTransaction();
            return emp!=null?true:false;
        } catch (Exception e) {
           // DBUtils.rollbackTransaction();
            e.printStackTrace();
        }
        return false;
    }

}
