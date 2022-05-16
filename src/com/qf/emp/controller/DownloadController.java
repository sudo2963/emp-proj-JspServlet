package com.qf.emp.controller;

import com.qf.emp.utils.UploadUtils;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

public class DownloadController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.获得下载文件名
        String fileName=req.getParameter("filename");
        //设置响应头，告诉浏览器如何处理流，附件下载I
        resp.setHeader("content-disposition","attachment;filename="+ URLEncoder.encode(fileName,"utf-8"));
        //2,在服务器上找到该文件的realpath
        String fileRealPath =  UploadUtils.NeWFilePath(req.getServletContext().getRealPath("/WEB-INF/upload"),fileName);
        resp.getWriter().println(fileRealPath);
        //3.提供下载使用Outputstream输出
        FileInputStream fis = new FileInputStream(fileRealPath+ File.separator +fileName);
        ServletOutputStream os = resp.getOutputStream();
        byte[] buf=new byte[1024*4];
        int len=0;
        while((len=fis.read(buf))!=-1) {
            os.write(buf, 0, len);
            os.close();
            fis.close();
            System.out.println(fileName);
        }
        resp.getWriter().println("下载成功");
    }
}
