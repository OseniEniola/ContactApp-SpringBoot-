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
			<h1>User Registration</h1>
			<c:if test="${err!= null}">
				<p class="erro">${err}</p>
			</c:if>
			
			<s:url var="url_reg" value="/register"/>
	 		<f:form action="${url_reg }" modelAttribute="command">
	 		<table border="1">
	 		<tr>
	 				<td>Name</td>
	 				<td><f:input path="user.name"/></td>
	 			</tr>
	 			<tr>
	 				<td>Phone</td>
	 				<td><f:input path="user.phone"/></td>
	 			</tr>
	 			<tr>
	 				<td>Email</td>
	 				<td><f:input path="user.email"/></td>
	 			</tr>
	 			<tr>
	 				<td>Address</td>
	 				<td><f:textarea path="user.address"/></td>
	 			</tr>
	 			
	 			<tr>
	 				<td>Username</td>
	 				<td><f:input path="user.loginName"/></td>
	 			</tr>
	 			<tr>
	 		  		<td>Password</td>
	 				<td><f:password path="user.password"/></td>
	 			</tr>
	 			<tr>  
	 				<td colspan="2" align="center">
	 					<button>Submit</button><br>
	 				</td>
	 			</tr>
	 		</table>
			</f:form>
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