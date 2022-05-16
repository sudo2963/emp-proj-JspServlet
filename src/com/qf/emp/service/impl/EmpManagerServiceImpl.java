package com.qf.emp.service.impl;

import com.qf.emp.dao.EmpManagerDao;
import com.qf.emp.dao.impl.EmpManagerDaoImpl;
import com.qf.emp.entity.EmpManager;
import com.qf.emp.service.EmpManagerService;

public class EmpManagerServiceImpl implements EmpManagerService {
    private EmpManagerDao empManagerDao=new EmpManagerDaoImpl();
    @Override
    public EmpManager login(String n, String p) {
        return empManagerDao.select(n,p);
    }
}
