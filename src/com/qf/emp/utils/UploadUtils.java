package com.qf.emp.utils;

import java.io.File;
import java.util.UUID;
/**
 * 设置上传级目录
 * **/
public class UploadUtils {
    public  static  String NewFileName(String fileName){
        return UUID.randomUUID().toString().replace("-","")+"_"+fileName;
    }

    public  static  String NeWFilePath(String bassPath,String fileName){
        int hascode =fileName.hashCode();
        int path1 =hascode&15; //与运算 0-15 二级
        int path2 = (hascode>>4)&15; //与运算0~15 二级
        String dir =bassPath+"\\"+path1+"\\"+path2;
        File file =new File(dir);
        if(!file.exists()){//不存在则新建
            file.mkdirs();
        }
        return  dir; //返回新路径
    }
}
