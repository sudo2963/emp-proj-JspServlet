<%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/9
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
测试pageContext / requset
<%pageContext.setAttribute("name","sudo"); %>
<%session.setAttribute("name","andy"); %>
</body>
</html>
