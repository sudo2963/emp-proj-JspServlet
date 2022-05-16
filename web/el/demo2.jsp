<%@ page import="com.qf.emp.entity.Emp" %><%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/9
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Emp emp = new Emp();
    emp.setName("sudo");
    emp.setAge(22);
    request.setAttribute("emp",emp);
%>

name= ${requestScope.e.name}
age= ${requestScope.e.age}
</body>
</html>
