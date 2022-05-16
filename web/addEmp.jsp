<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%
			String baseDir = request.getContextPath()+"/";
			pageContext.setAttribute("baseDir",baseDir);
		%>
		<base href="${pageScope.baseDir}">
		<title>add Emp</title>
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
								<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %> <br />
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
						add Emp info:
					</h1>
					<form action="manager/safe/insertEmp" method="post" onsubmit="return checkSubmit()">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" id="uname" name="name" onblur="checkEmp()" />
								</td>
								<td valign="middle" align="left">
									<span id="nameMsg" style="color: red"></span>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									salary:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="salary" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									age:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="age" />
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
	<script>
		var namecheck =false;

		function checkSubmit() {
			alert(namecheck);
			if(namecheck){
				return true;
			}else {
				return false;
			}
		}
		
		function checkEmp(){
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange =function(){
				if(xmlhttp.readyState==4 && xmlhttp.status==200){
					//请求响应正常 ，并正常返回
					var result=xmlhttp.responseText;
					var resultJSONObject = JSON.parse(result);
					if(resultJSONObject.msg=="该用户名可用"){
						document.getElementById("nameMsg").style.color="green";
					}
					document.getElementById("nameMsg").innerText=resultJSONObject.msg;

					namecheck=resultJSONObject.code==200?true:false;

				}
			}
			xmlhttp.open("GET","manager/safe/EmpVaildateController?username="+document.getElementById("uname").value,true);
			xmlhttp.send();
		}
	</script>
</html>
