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
@WebServlet(name="preUpdateEmp",value = "/manager/safe/preUpdateEmp")
public class PreUpdateEmp  extends HttpServlet {
    private EmpService empService =new EmpServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));  //需要修改emp的id
        Emp emp =empService.showEmp(id);
        if(emp !=null){
            req.setAttribute("emp",emp);
            req.getRequestDispatcher("/updateEmp.jsp").forward(req,resp);
        }else{
            resp.getWriter().println("没有该用户:"+id);
        }
    }
}
