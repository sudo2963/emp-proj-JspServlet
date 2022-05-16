package com.qf.emp.controller;

import com.qf.emp.entity.Emp;
import com.qf.emp.service.EmpService;
import com.qf.emp.service.impl.EmpServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "InsertEmpController",value = "/manager/safe/insertEmp")
public class InsertEmpController  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name =req.getParameter("name");
        Double salary =Double.valueOf(req.getParameter("salary"));
        Integer age =Integer.valueOf(req.getParameter("age"));

        Emp emp =new Emp(name,salary,age);

        EmpService empService =new EmpServiceImpl();
        empService.addEmp(emp);

        //resp.sendRedirect(req.getContextPath()+"/manager/safe/ShowAllEmpController");
        resp.sendRedirect(req.getContextPath()+"/emplist2.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
