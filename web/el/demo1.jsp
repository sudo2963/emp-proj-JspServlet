<%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/9
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setAttribute("name","sudo");
    session.setAttribute("name","Andy");
%>

通过el表达式获取request范围内的数据 name=${requestScope.emp.name}
通过el表达式获取request范围内的数据 name=${requestScope.emp.name}
通过el表达式获取request范围内的数据 name=${requestScope.emp.name}
通过el表达式获取request范围内的数据 name=${requestScope.emp.name}
</body>
</html>
