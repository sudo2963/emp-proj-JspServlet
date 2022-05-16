package com.qf.emp.entity;

/**
 * 初始化 Page p1 =new Page(1) //表示初始化一个第一页的分页对象 页大小为5 可以确定p1.getStratRows,用于sql limit启动行
 *
 *p1.setTotalCount(103)  表示设置总记录数为103  同时会计算出有多少页 p1.getTotalPages
 * **/
public class Page{
    private  Integer pageIndex;//页码
    private  Integer pageSize;//页大小 显示多少行数据
    private  Integer totalCounts;//数据的总行数
    private  Integer totalPages;//总页数
    private  Integer startRows;//起始行

    public Page(Integer pageIndex) {
       this(pageIndex,4);
    }

    public Page(Integer pageIndex, Integer pageSize) {
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.setStartRows((pageIndex-1)*pageSize);
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalCounts() {
        return totalCounts;
    }

    public void setTotalCount(Integer totalCounts) {

        this.totalCounts = totalCounts;
        this.totalPages = (totalCounts%pageSize==0)?totalCounts/pageSize:(totalCounts/pageSize)+1;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getStartRows() {
        return startRows;
    }

    public void setStartRows(Integer startRows) {
        this.startRows = startRows;
    }
}
