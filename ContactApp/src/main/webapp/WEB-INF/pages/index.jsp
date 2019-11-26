<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login- Contact Application</title>
<s:url var="url_css" value="/css/style.css"/>
<link href="${url_css}" rel="stylesheet" type="text/css">

</head>
<s:url var="url_bg" value="/images/landscape.jpg"/>
<body background="${url_bg}" filter="alpha(opacity=70)">
	<table border="1" width="80%" align="center" >
	<tr>
		<td height="100px" style="background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(243,243,243,0.43) 50%,rgba(237,237,237,0.42) 51%,rgba(249,249,249,0.05) 83%,rgba(255,255,255,0.05) 100%); /* Chrome10-25,Safari5.1-6 */">
			<%-- Header --%>
			<jsp:include page="/WEB-INF/include/header.jsp"/>
		</td>
	</tr>
	<tr>
		<td height="25px">
			<%-- Menu --%>
			<jsp:include page="/WEB-INF/include/menu.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td height="350px"style="background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(243,243,243,0.43) 50%,rgba(237,237,237,0.42) 51%,rgba(249,249,249,0.05) 83%,rgba(255,255,255,0.05) 100%); /* Chrome10-25,Safari5.1-6 */">
			<%--Page Content Area --%>
			<center><h1>User Login</h1></center>
			<c:if test="${err!= null}">
				<p class="erro">${err}</p>
			</c:if>
			<c:if test="${ex!= null}">
				<p class="erro">${ex}</p>
			</c:if>
			<c:if test="${param.act == 'lo'}">
				<p class="success">Logged Out Successfully! Thanks for Using Contact Application</p>
			</c:if>
			<c:if test="${param.act == 'reg'}">
				<p class="success">User Registered Successfully!</p>
			</c:if>
			
			<s:url var="url_login" value="/login"/>
	 	<center><f:form action="${url_login }" modelAttribute="command">
	 		<table border="1">
	 			<tr>
	 				<td>Username</td>
	 				<td><f:input path="loginName"/></td>
	 			</tr>
	 			<tr>
	 		 		<td>Password</td>
	 				<td><f:password path="password"/></td>
	 			</tr>
	 			<tr>  
	 				<td colspan="2" align="center">
	 					<button>Login</button><br>
	 					<s:url var="url_reg" value="/reg_form"/>
	 					<a href="${url_reg }">New User Registration</a>
	 				</td>
	 			</tr>
	 		</table>
			</f:form></center>
		</td>
	</tr>
	<tr>
		<td height="25px" style="background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(243,243,243,0.43) 50%,rgba(237,237,237,0.42) 51%,rgba(249,249,249,0.05) 83%,rgba(255,255,255,0.05) 100%); /* Chrome10-25,Safari5.1-6 */">
			<%--Footer --%>
			<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
		</td>
	</tr>
	</table>
</body>
</html>