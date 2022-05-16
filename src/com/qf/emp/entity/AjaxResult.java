package com.qf.emp.entity;

public class AjaxResult {
    private  int code;  //ajax状态码 200 true
    private  String msg;
    private  String date;

    public AjaxResult() {
    }

    public AjaxResult(int code, String msg, String date) {
        this.code = code;
        this.msg = msg;
        this.date = date;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
