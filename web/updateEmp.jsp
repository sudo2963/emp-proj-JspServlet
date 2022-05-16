<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!--默认情况上base基于当前请求的目录-->
	<%
		String baseDir=request.getContextPath() + "/";
		pageContext.setAttribute("baseDir",baseDir);
	%>
	<base href="${baseDir}">
	<title>update Emp</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css"
		  href="css/style.css" />
</head>

<body>
<div id="wrap">
	<div id="top_content">
		<div id="header">
			<div id="rightheader">
				<p>
					<%=new SimpleDateFormat("yyyy/MM/dd").format(new Date())%>
					<br />
				</p>
			</div>
			<div id="topheader">
				<h1 id="title">
					<a href="#">Main</a>
				</h1>
			</div>
			<div id="navigation">
			</div>
		</div>
		<div id="content">
			<p id="whereami">
			</p>
			<h1>
				update Emp info:
			</h1>
			<form action="manager/safe/UpdateEmpController" method="post">
				<table cellpadding="0" cellspacing="0" border="0"
					   class="form_table">
					<tr>
						<td valign="middle" align="right">
							id:
						</td>
						<td valign="middle" align="left">
							${emp.id}
							<input type="hidden" name="id" value="${emp.id}">
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							name:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="name" value="${emp.name}"/>
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							salary:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="salary" value="${emp.salary}"/>
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							age:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="age" value="${emp.age}"/>
						</td>
					</tr>
				</table>
				<p>
					<input type="submit" class="button" value="Confirm" />
				</p>
			</form>
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
