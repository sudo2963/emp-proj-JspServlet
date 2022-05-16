package com.qf.emp.service;

import com.qf.emp.entity.Emp;
import com.qf.emp.entity.Page;

import java.util.List;

public interface EmpService {
    public List<Emp> showAllEmp();
    public List<Emp> showAllEmp(Page page);
    public int removeEmp(int id);

    public int modify(Emp emp);
    public int addEmp(Emp emp);

    public Emp showEmp(int id);

    public boolean checkName(String name);

}
