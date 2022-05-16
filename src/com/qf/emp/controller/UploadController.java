package com.qf.emp.controller;

import com.qf.emp.utils.UploadUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name="uploadController",value = "/uploadController")
@MultipartConfig(maxFileSize = 1024*1024*10)
public class UploadController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置乱码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        //通过getPart方法获取文件组件
        //Part file1 =req.getPart("file1");
        Collection<Part> parts = req.getParts();
        for (Part part:parts) {
            String newFileName = UploadUtils.NewFileName(part.getSubmittedFileName());
            String appRealPath =this.getServletContext().getRealPath("/WEB-INF/upload");
            String savePath = UploadUtils.NeWFilePath(appRealPath,newFileName);
            part.write(savePath+File.separator+newFileName);
            resp.getWriter().println("上传成功！"+newFileName);
        }
        //resp.getWriter().println("上传成功！");

        /**
         * 单个上传
         * \*/
//        //获取上传文件保存路径（真实路径）
//        String uploadPath = req.getServletContext().getRealPath("/WEB-INF/upload"");
//        System.out.println(uploadPath);
//        //创建文件对象
//        File file = new File(uploadPath);
//        //如果文件夹不存在，就新建
//        if(!file.exists()){
//            file.mkdirs();
//        }
//        //如果上传的文件不是空，进行保存
//        if(file1!=null){
//            file1.write(uploadPath+File.separator+file1.getSubmittedFileName());
//        }
//        resp.getWriter().println("上传成功！"+file1.getSubmittedFileName());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
