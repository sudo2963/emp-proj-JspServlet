<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!--默认情况上base基于当前请求的目录-->
	<%
		String baseDir = request.getContextPath()+"/";
		pageContext.setAttribute("baseDir",baseDir);
	%>
	<base href="${baseDir}">
<title>login</title>
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
					</p>
				</div>
				<div id="topheader">
					<h1 id="title">
						<a href="#">main</a>
					</h1>
				</div>
				<div id="navigation"></div>
			</div>
			<div id="content">
				<p id="whereami"></p>
				<h1>login</h1>
				<form action="manager/EmpManagerLoginController" method="post">
					<table cellpadding="0" cellspacing="0" border="0"
						class="form_table">
						<tr>
							<td valign="middle" align="right">username:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="username" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">password:</td>
							<td valign="middle" align="left"><input type="password"
								class="inputgri" name="password" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">Code:</td>
							<td valign="middle" align="left"><input type="text"class="inputgri" name="code" /></td>
							<td> <img src="createCode" /></td>
						</tr>
					</table>
					<p>
						<input type="submit" class="button" value="Submit &raquo;" />
					</p>
				</form>
			</div>
		</div>
		<div id="footer">
			<div id="footer_bg">ABC@126.com</div>
		</div>
	</div>
</body>
</html>
