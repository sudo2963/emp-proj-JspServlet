package com.qf.emp.controller;

import com.alibaba.fastjson.JSON;
import com.qf.emp.entity.AjaxResult;
import com.qf.emp.service.EmpService;
import com.qf.emp.service.impl.EmpServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/manager/safe/EmpVaildateController")
public class EmpVaildateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String empname = req.getParameter("username");
        AjaxResult ar =new AjaxResult();
        if(empname!=null&&!empname.equals("")){
            EmpService empService =new EmpServiceImpl();
            if (empService.checkName(empname)){
               // resp.getWriter().println("该用户已存在");
                ar.setCode(201);
                ar.setMsg("用户名已注册");
                ar.setDate(empname);
            }else{
               // resp.getWriter().println("该用户名可用");
                ar.setCode(200);
                ar.setMsg("该用户可用");
                ar.setDate(empname);
            }
        }else {
            //resp.getWriter().println("请输入用户名");
            ar.setCode(203);
            ar.setMsg("请输入用户名");
            ar.setDate(empname);
        }
        resp.getWriter().println(JSON.toJSONString(ar));
    }
}
