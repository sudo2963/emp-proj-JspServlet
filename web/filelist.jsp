<%@ page import="java.io.File" %>
<%@ page import="javax.jnlp.DownloadService" %>
<%@ page import="com.qf.emp.utils.DownloadUtils" %><%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/10
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文件下载</title>
</head>
<body>
<table>
    <tr>
        <th>文件名</th>
        <th>操作</th>
    </tr>-
    <c:forEach items="${fileMap}" var="entry">
    <tr>
        <td>${entry.value}</td>
        <td><a href="${pageContext.request.contextPath}/Download?filename=${entry.key}"></a></td>
    </tr>
    </c:forEach>
</table>

</body>
</html>
