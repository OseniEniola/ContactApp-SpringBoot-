<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard- Contact Application</title>
<s:url var="url_css" value="/css/style.css"/>
<link href="${url_css}" rel="stylesheet" type="text/css">
<s:url var="url_jqlib" value="/js/jquery-3.4.1.min.js"/>
<script  src="${url_jqlib}"type="text/javascript"></script>

<script>
function changeStatus(uid,lstatus){
	  // alert(userId+","logingStatus)
	  $.ajax({
		  url: 'change_status',
		  data: {userId:uid, loginStatus:lstatus},
		  success: function (data){
			  alert(data);
		  }
		 
	  });
}
</script>
</head>
<s:url var="url_bg" value="/images/landscape.jpg"/>
<body background="${url_bg}" filter="alpha(opacity=70)">
	<table border="1" width="80%" align="center" >
	<tr>
		<td height="100px" style="background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(243,243,243,0.43) 50%,rgba(237,237,237,0.42) 51%,rgba(249,249,249,0.05) 83%,rgba(255,255,255,0.05) 100%); /* Chrome10-25,Safari5.1-6 */">			<%-- Header --%>
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
			<h1>User List</h1>
				<table border="1">
				<tr>
					<th>SR</th>
					<th>USER</th>
					<th>NAME</th>
					<th>PHONE</th>
					<th>EMAIL</th>
					<th>ADDRESS</th>
					<th>USERNAME</th>
					<th>STATUS</th>
				</tr>
				<c:forEach var="u" items="${userslist}" varStatus="st">
					<tr>
					<td>${st.count}</td>
					<td>${ u.userId}</td>
					<td>${u.name }</td>
					<td>${u.phone }</td>
					<td>${u.email }</td>
					<td>${u.address }</td>
					<td>${u.loginName }</td>
					<td>
						<select id="id_${u.userId }" onChange="changeStatus(${u.userId }, $(this).val())">
							<option value="1">Active</option>
							<option value="2">Block</option>
							
						</select>
						<script>
							$('#id_${u.userId}').val(${u.loginStatus});
						</script>
					</td>
				</tr>
				</c:forEach>
				</table>
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