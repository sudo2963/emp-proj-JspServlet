package com.qf.emp.jsp;

import cn.dsna.util.images.ValidateCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(value = {"/createCode","/emp/createCode"})
public class ValidateCodeServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ValidateCode vc=new ValidateCode(200,30,4,3);
        String code= vc.getCode();  //生成验证码 ，在存储两份。一份在服务器，一分在浏览器
        req.getSession().setAttribute("code",code);
        vc.write(resp.getOutputStream());
    }
}
