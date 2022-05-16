<%--
  Created by IntelliJ IDEA.
  User: sudo
  Date: 2022/5/9
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="score" value="80"/>
${score}

page:${pageScope.score}
request:${requestScope.score}

<br>
if 标签 <c:if test="${score>60}">及格</c:if>

<%
    String[] names = new String[]{"jason","ammy","kylin"};
    pageContext.setAttribute("names",names);
%>

<br>

foreach标签  item从四个作用域中读取数据，var将集合中的元素放到pageContext作用域
<table>
<%--    ${names} 等同于 <% request.getAttribute("names") %>--%>
    <%--遍历 begin 开始位置  end 结束位置 step 遍历间距 varStatus 将遍历中的当前行放到pageContext作用域--%>
    <tr><td>当前值</td><td>当前下标</td><td>遍历跳数</td><td>开始下标</td><td>count</td><td>curr</td><td>end</td><td>是否为第一个</td><td>是否为走后一个</td></tr>
    <c:forEach var="name" items="${names}"  begin="0" end="2" step="1" varStatus="st">
        <c:if test="${st.index%2==0}">
            <tr>
                <font color="red">
                    <td>${pageScope.name} </td>
                    <td>${st.index}</td>
                    <td>${st.step}</td>
                    <td>${st.begin}</td>
                    <td> ${st.count}</td>
                    <td>${st.current}</td>
                    <td>${st.end}</td>
                    <td> ${st.first}</td>
                    <td> ${st.last}</td>
                </font>
            </tr>
        </c:if>
        <c:if test="${st.index%2==1}">
            <tr>

                <font color="#d2691e">
                    <td>${pageScope.name} </td>
                    <td>${st.index}</td>
                    <td>${st.step}</td>
                    <td>${st.begin}</td>
                    <td> ${st.count}</td>
                    <td>${st.current}</td>
                    <td>${st.end}</td>
                    <td> ${st.first}</td>
                    <td> ${st.last}</td>
                </font>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
