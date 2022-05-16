<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
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
		<script src="js/jquery-3.4.1.min.js"></script>
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
					<table class="table" id="emp_tab" >
						<tr class="table_header" id="tb_head">
							<td>ID</td><td>Name</td><td>Salary</td><td>Age</td><td>Operation</td>
						</tr>
					</table>
					<table class="table" id="show_td">

					</table>
<%--						<c:forEach items="${emps}" var="emp" >--%>
<%--							<tr class="<c:choose>--%>
<%--								<c:when test="${emp.id%2==0}"> row2</c:when>--%>
<%--								<c:otherwise> row1</c:otherwise>--%>
<%--							</c:choose>">--%>
<%--								<td>--%>
<%--									${emp.id}--%>
<%--								</td>--%>
<%--								<td>--%>
<%--									${emp.name}--%>
<%--								</td>--%>
<%--								<td>--%>
<%--									${emp.salary}--%>
<%--								</td>--%>
<%--								<td>--%>
<%--									${emp.age}--%>
<%--								</td>--%>
<%--								<td>--%>
<%--									<a href="manager/safe/removeEmpController?id=${emp.id}">delete emp</a>&nbsp;--%>
<%--									<a href="manager/safe/preUpdateEmp?id=${emp.id}">update emp</a>--%>
<%--								</td>--%>
<%--							</tr>--%>
<%--						</c:forEach>--%>
<%--						<tr><td colspan="5">--%>

<%--							<a href="manager/safe/ShowAllEmpController?page=1">首页</a>--%>

<%--							<c:if test="${requestScope.page.pageIndex > 1}">--%>
<%--								<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.pageIndex-1}">上一页</a>--%>
<%--							</c:if>--%>

<%--							<c:if test="${requestScope.page.pageIndex < requestScope.page.totalPages}">--%>
<%--								<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.pageIndex+1}" >下一页</a>--%>
<%--							</c:if>--%>

<%--							<a href="manager/safe/ShowAllEmpController?page=${requestScope.page.totalPages}" >尾页</a>--%>

<%--							<input name="skip" type="number" aria-valuemin="1" minlength="1" maxlength="${requestScope.page.totalPages}"/><a href="/manager/safe/ShowAllEmpController?">跳转</a>--%>
<%--						</td></tr>--%>

					</table>
					<p>
						<input type="button" class="button" value="首页" onclick="pageFirst()"/>
						<input type="button" class="button" value="上一页" onclick="pageUp()"/>
						<input type="button" class="button" value="下一页" onclick="pageDown()"/>
						<input type="button" class="button" value="尾页" onclick="pageLast()"/>
					<p>
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
		<script>
			var pagenow =1 //当前页面
			var pagetotal= null;
			window.onload=function (ev) {
				doGet()
			}
			function  doGet(){
				$.get("manager/safe/ShowAllEmpController?page="+pagenow,function (data){
					alert(data);
					var reslut = JSON.parse(data);
					if (reslut==200){
						var page= reslut.page;
						pagetotal=page.totalPages;
						var emps =reslut.emps;
						$(".empitem").remove();
						for (var i=0;i<emps.length; i++){
							var trclass=emps[i].id%2==0?"row1":"row2";
							$("#emp_tab").append("<tr class='"+trclass+" empitem'>"+
									"<td>"+emps[i].id+"</td>"+
									"<td>"+emps[i].name+"</td>"+
									"<td>"+emps[i].salary+"</td>"+
									"<td>"+emps[i].age+"</td>"+
									"<td>" +
									"<a href='manager/safe/removeEmpController?id="+emps[i].id+"'>delete emp</a>&nbsp;"+
									"<a href='manager/safe/preUpdateEmp?id="+emps[i].id+"'>update emp</a></td>"+
									"</tr>");
						}
					}
				});
			}

			function doGetOld(){
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange=function (){
					if(xmlhttp.readyState==4 && xmlhttp.status==200){
						//显示操作
						var reslut = JSON.parse(xmlhttp.responseText);
						var page= reslut.page;
						pagetotal=page.totalPages;
						var emps =reslut.emps;
						$(".empitem").remove();
						for (var i=0;i<emps.length; i++){
							var trclass=emps[i].id%2==0?"row1":"row2";
							$("#emp_tab").append("<tr class='"+trclass+" empitem'>"+
									"<td>"+emps[i].id+"</td>"+
									"<td>"+emps[i].name+"</td>"+
									"<td>"+emps[i].salary+"</td>"+
									"<td>"+emps[i].age+"</td>"+
									"<td>" +
									"<a href='manager/safe/removeEmpController?id="+emps[i].id+"'>delete emp</a>&nbsp;"+
									"<a href='manager/safe/preUpdateEmp?id="+emps[i].id+"'>update emp</a></td>"+
									"</tr>");
							// document.getElementById("show_td").innerHTML+="<tr class='"+trclass+"'>"+
							// 		"<td>"+emps[i].id+"</td>"+
							// 		"<td>"+emps[i].name+"</td>"+
							// 		"<td>"+emps[i].salary+"</td>"+
							// 		"<td>"+emps[i].age+"</td>"+
							// 		"<td>" +
							// 		"<a href='manager/safe/removeEmpController?id="+emps[i].id+"'>delete emp</a>&nbsp;"+
							// 		"<a href='manager/safe/preUpdateEmp?id="+emps[i].id+"'>update emp</a></td>"+
							// 		"</tr>"
						}

					}
				}
				xmlhttp.open("GET","manager/safe/ShowAllEmpController?page="+pagenow,true);
				xmlhttp.send();
			}
			function pageFirst(){
				pagenow=1;
				doGet();
			}
			function pageUp(){
				if (pagenow>1){
					pagenow--
					doGet();
				}
			}
			function pageDown(){
				if (pagenow<pagetotal){
					pagenow++
					doGet();
				}
			}
			function pageLast(){
				pagenow=pagetotal;
				doGet();
			}
		</script>
</html>
