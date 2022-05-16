package com.qf.emp.controller;

import com.qf.emp.entity.EmpManager;
import com.qf.emp.service.EmpManagerService;
import com.qf.emp.service.impl.EmpManagerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "EmpManagerLoginController",value = {"/manager/EmpManagerLoginController"})
public class EmpManagerLoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.收参
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String inputVcode = request.getParameter("code");

        //2.校验验证码
        String codes = (String)request.getSession().getAttribute("code");
        if(!inputVcode.isEmpty() && inputVcode.equalsIgnoreCase(codes)){
            //调用业务逻辑实现登录
            EmpManagerService empManagerService = new EmpManagerServiceImpl();
            EmpManager empManager = empManagerService.login(username,password);
            if(empManager!=null){
                //登录成功
                //存储在session作用域
                HttpSession session = request.getSession();
                session.setAttribute("empManager",empManager);
                //跳转到查询所有的controller
               // response.sendRedirect(request.getContextPath()+"/manager/safe/ShowAllEmpController");
                response.sendRedirect(request.getContextPath()+"/emplist2.jsp");
            }else{
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
        }else{
            //验证码输入错误，跳转到登录页面
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
