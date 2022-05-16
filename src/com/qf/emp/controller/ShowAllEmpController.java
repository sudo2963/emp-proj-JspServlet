package com.qf.emp.controller;

import com.alibaba.fastjson.JSON;
import com.qf.emp.entity.Emp;
import com.qf.emp.entity.EmpResult;
import com.qf.emp.entity.Page;
import com.qf.emp.service.EmpService;
import com.qf.emp.service.impl.EmpServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowAllEmpController",value = {"/manager/safe/ShowAllEmpController"})
public class ShowAllEmpController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //权限验证存放在过滤器实现
        EmpService empService = new EmpServiceImpl();
        String p = request.getParameter("page");
        if (p==null){
            p ="1";
        }
        Page page =new Page(Integer.valueOf(p));
        List<Emp> emps = empService.showAllEmp(page);//增加按分页查询
        //page在经过业务模型处理完成之后，已经被修改。
        //也就是说，经过业务代码设置总的记录数后，这里也知道
//        request.setAttribute("page",page);
//        request.setAttribute("emps",emps);
//
        //支持ajax异步刷新
        EmpResult er = new EmpResult(200,"ok",page,emps);
        String json = JSON.toJSONString(er);
        //request.setAttribute("json",json);
        response.getWriter().println(json);
        //request.getRequestDispatcher("/emplist2.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
