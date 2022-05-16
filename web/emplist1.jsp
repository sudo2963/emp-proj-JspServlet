<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%
			String baseDir = request.getContextPath()+"/";
			pageContext.setAttribute("baseDir",baseDir);
		%>
		<base href="${pageScope.baseDir}">
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/style.css" />
	</head>
	<body>
		<div id="wrap">
			<div id="top_content"> 
				<div id="header">
					<div id="rightheader">
						<p>
							<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %> <br />
							<br />
						</p>
					</div>
					<div id="topheader">
						<h1 id="title">
							<a href="#">main</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						Welcome!
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								Salary
							</td>
							<td>
								Age
							</td>
							<td>
								Operation
							</td>
						</tr>
						<c:forEach items="${emps}" var="emp" >
							<tr class="<c:choose>
								<c:when test="${emp.id%2==0}"> row2</c:when>
								<c:otherwise> row1</c:otherwise>
							</c:choose>">
								<td>
									${emp.id}
								</td>
								<td>
									${emp.name}
								</td>
								<td>
									${emp.salary}
								</td>
								<td>
									${emp.age}
								</td>
								<td>
									<a href="manager/safe/removeEmpController?id=${emp.id}">delete emp</a>&nbsp;
									<a href="manager/safe/preUpdateEmp?id=${emp.id}">update emp</a>
								</td>
							</tr>
						</c:forEach>
						<tr><td colspan="5">
<%--							<a href="manager/safe/ShowAllEmpController?page=1">首页</a>--%>
<%--							<c:if test="${requestScope.page.pageIndex >1}">--%>
<%--								<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.pageIndex-1}">上一页</a>--%>
<%--							</c:if>--%>


<%--							<c:if test="${requestScope.page.pageIndex < requestScope.page.totalPages}">--%>
<%--								<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.pageIndex+1}">下一页</a>--%>
<%--							</c:if>--%>

<%--							<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.totalPages}">尾页</a>--%>

							<a href="manager/safe/ShowAllEmpController?page=1">首页</a>

							<c:if test="${requestScope.page.pageIndex > 1}">
								<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.pageIndex-1}">上一页</a>
							</c:if>

							<c:if test="${requestScope.page.pageIndex < requestScope.page.totalPages}">
								<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.pageIndex+1}" >下一页</a>
							</c:if>

							<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.totalPages}" >尾页</a>

							<input name="skip" type="number" aria-valuemin="1" minlength="1" maxlength="${requestScope.page.totalPages}"/><a href="/manager/safe/ShowAllEmpController?">跳转</a>
						</td></tr>
					</table>

					<p>
						<input type="button" class="button" value="Add Employee" onclick="location='addEmp.jsp'"/>
					</p>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
				ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>
