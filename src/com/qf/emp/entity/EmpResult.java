package com.qf.emp.entity;

import java.util.List;

public class EmpResult {
    private  int code ;
    private  String msg;
    private  Page page;
    private  List<Emp> emps;

    public EmpResult(int code, String msg, Page page, List<Emp> emps) {
        this.code = code;
        this.msg = msg;
        this.page = page;
        this.emps = emps;
    }

    public EmpResult() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public List<Emp> getEmps() {
        return emps;
    }

    public void setEmps(List<Emp> emps) {
        this.emps = emps;
    }
}
