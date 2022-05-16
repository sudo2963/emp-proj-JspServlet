<%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/9
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<p>name=<%=pageContext.getAttribute("name")%></p>
<p>nameinrequest=<%= request.getAttribute("nameinrequest")%></p>
</body>
</html>
