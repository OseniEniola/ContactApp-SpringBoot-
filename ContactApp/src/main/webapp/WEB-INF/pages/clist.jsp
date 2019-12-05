<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact List- Contact Application</title>
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
		<td height="350px" style="background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(243,243,243,0.43) 50%,rgba(237,237,237,0.42) 51%,rgba(249,249,249,0.05) 83%,rgba(255,255,255,0.05) 100%); /* Chrome10-25,Safari5.1-6 */">
			<%--Page Content Area --%>
		 <h1>Contact List</h1>
		 <c:if test="${param.act eq 'sv' }">
		 	<p>Contact Saved Succesfully</p>
		 </c:if>
		  <c:if test="${param.act eq 'del' }">
		 	<p>Contact Deleted Succesfully</p>
		 </c:if>
		 
		 <form align="right" action="<s:url value="/user/contact_search"/>">
		 	<input type="text" name="freetext" value="${param.freetext }" placeholder="Enter Text To Search"/>
		 	<button>Find</button>
		 </form>
		 <br>
		 
		 <form action="<s:url value="/user/bulk_cdelete"/>">
		 	<button>Delete Selected Records</button><br>
		 	<br>
			<center><table border="1" cellpadding="3" border-radius="1em">
				<tr>
					<th>Select</th>
					<th>CID</th>
					<th>NAME</th>
					<th>PHONE</th>
					<th>EMAIL</th>
					<th>ADDRESS</th>
					<th>REMARK</th>
					<th>ACTION </th>
					
					<c:if test="${empty contactList }">
						<tr>
							<td colspan="8" class="error">No Records Present</td>
						</tr>
					</c:if>
				</tr>
				<c:forEach var="c" items="${contactList }" varStatus="st">
					<tr>
						<td align="center"><input type="checkbox" name="cid" value="${c.contactId }"/></td>
						<td>${c.contactId }</td>
						<td>${c.name }</td>
						<td>${c.phone }</td>
						<td>${c.email }</td>
						<td>${c.address }</td>
						<td>${c.remark }</td>
						<s:url var="url_del" value="/user/del_contact">
							<s:param name="cid" value="${c.contactId }"></s:param>
						</s:url>
						<s:url var="url_edit" value="/user/edit_contact">
							<s:param name="cid" value="${c.contactId }"></s:param>
						</s:url>
						<td><a href="${url_edit }">EDIT</a>|<a href="${url_del }">DELETE</a> </td>
					</tr>
				</c:forEach>
			</table></center>
			</form>	
	
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