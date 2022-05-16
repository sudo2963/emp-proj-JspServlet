<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/9
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  int [] array ={0,2,12,3,2};
  List<String> list = new ArrayList<>();
  list.add("sudo");
  list.add("Tom");
  list.add("Andy");

  Map<String, String> map= new HashMap<>();
  map.put("CN","中国");
  map.put("UA","美国");
  map.put("FK","法国");

  request.setAttribute("array",array);
  request.setAttribute("list",list);
  request.setAttribute("map",map);

%>

array[0] = ${requestScope.array[0]}<br/>
list[1] = ${requestScope.list.get(1)}<br/>
map[2] = ${requestScope.map["FK"]}<br/>
</body>
</html>
