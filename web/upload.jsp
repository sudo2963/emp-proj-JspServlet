<%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/10
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="uploadController" enctype="multipart/form-data">

    <input type="file" name="file1">
    <input type="file" name="file2">
    <input type="file" name="file3">
    <input type="submit" value="提交">
</form>
</body>
</html>
