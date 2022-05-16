<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.qf.emp.entity.Emp" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/9
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<table>--%>
<%--    <tr>--%>
<%--        <td>编号</td>--%>
<%--        <td>姓名</td>--%>
<%--        <td>工资</td>--%>
<%--        <td>年龄</td>--%>
<%--        <td colspan="2">操作</td>--%>

<%--        <input type="button" name="update" value="修改"/>--%>
<%--    </tr>--%>
<%--</table>--%>
<%--<%--%>
<%--    List<Emp> empList = (List<Emp>) request.getAttribute("emp");--%>
<%--    for (Emp e:empList) {--%>
<%--        out.print("<tr>");--%>
<%--        out.print("<td>"+e.getId()+"</td>");--%>
<%--        out.print("<td>"+e.getName()+"</td>");--%>
<%--        out.print("<td>"+e.getSalary()+"</td>");--%>
<%--        out.print("<td>"+e.getAge()+"</td>");--%>
<%--        out.print("<td> <input type=\"button\" name=\"delete\" value=\"删除\"/></td>");--%>
<%--        out.print("<td> <input type=\"button\" name=\"update\" value=\"修改\"/></td>");--%>
<%--        out.print("</tr>");--%>
<%--    }--%>
<%--%>--%>


<!--基于EL+JSTL语法-->
<table width="50%">
    <tr bgcolor="#6495ed">
            <td>编号</td>
            <td>姓名</td>
            <td>工资</td>
            <td>年龄</td>
            <td colspan="2">操作</td>
    </tr>

    <c:forEach items="${requestScope.emps}" var="emp" varStatus="st">
        <tr <c:if test="${st.index%2==0}">bgcolor="#f5deb3" </c:if> >
            <td>${emp.id}</td>
            <td>${emp.name}</td>
            <td>${emp.salary}</td>
            <td>${emp.age}</td>
            <td><a href='<c:url context="${pageContext.request.contextPath}" value="/manager/safe/removeEmpController?id=${emp.id}"/>'>删除</a></td>
            <td><a href='<c:url context="${pageContext.request.contextPath}" value="/manager/safe/removeEmpController?id=${emp.id}"/>'>修改</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
