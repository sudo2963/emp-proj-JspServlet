package com.qf.emp.dao;

import com.qf.emp.entity.Emp;
import com.qf.emp.entity.Page;

import java.util.List;

public interface EmpDao {
    /**
     * 分页
     * */
    public List<Emp> selectAll(Page page);

    /**
     * 查所有
     * */
    public List<Emp> selectAll();

    /**
     * 根据name查找
     * */
    public Emp selectByName(String name);

    public int delete(int id);

    public int update(Emp emp);
    public int insert(Emp emp);
    public Emp select(int id);
    public long selectCount();


}
