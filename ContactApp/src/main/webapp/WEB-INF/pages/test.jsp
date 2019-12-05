<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<s:url var="url_jqlib" value="/js/jquery-3.4.1.min.js"/>
<script  src="${url_jqlib}"type="text/javascript"></script>
<script>
	$(document).ready(function(){
	//	alert('JQuery is ready and Integrated')
	$("#id_get_time").click(function(){
		//alert('Button Clicked');
		$.ajax({
			url : 'get_time',
			success : function(data){
				$("#id_time").html(data);
			}
		})
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<h1>Ajax Test Page</h1>
	<button id="id_get_time">Get Server Time</button>
	<p id="id_time"></p>
</body>
</html>