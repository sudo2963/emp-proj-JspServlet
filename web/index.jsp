<%@ page import="com.qf.emp.entity.Emp" %>
  Created by IntelliJ IDEA.
  User: ly
  Date: 2022/5/9
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  <%--绑定~创建对象 实例化--%>
  <jsp:useBean id="user" class="com.qf.emp.entity.Emp"/>
  <jsp:setProperty name="user" property="name" value="sudo" />
  <jsp:getProperty name="user" property="name"/>
  <br/>
  <%
    Emp emp= new Emp();
    emp.setName("Andy");
    out.print(emp);
  %>
<%-- forwaro 转发 --%>
<%--  <jsp:forward page="a.jsp"/>--%>
  <%
    request.getRequestDispatcher("login.jsp").forward(request,response);
  %>

<%--  <jsp:forward page="a.jsp">--%>
<%--    <jsp:param name="sex" value="man"/>--%>
<%--  </jsp:forward>--%>
  </body>
</html>
