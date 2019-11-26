 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

 <s:url var="url_logout" value="/logout"></s:url>
 <c:if test="${sessionScope.userid==null}">
 <%--User is not yet Logged in: Guest Menu --%>
  <s:url var="url_reg" value="/reg_form"></s:url>
 <a href="#">Home</a>|
<a href="#">Login</a>|
<a href="${url_reg }">Register</a>|
<a href="#">About</a>|
<a href="#">Help</a>
 </c:if>
 
 <c:if test="${sessionScope.userid !=null && sessionScope.role==1}">
 <%--Admin is yet Logged in: Admin Menu --%>
 <a href="#">Home</a>|
<a href="#">User List</a>| 
<a href="${url_logout}">Logout</a>
 </c:if>
  
  <c:if test="${sessionScope.userid !=null && sessionScope.role==2}"> 
 <%--General User is yet Logged in: General User Menu --%>
  <s:url var="url_cform" value="/user/contact_form"></s:url>
    <s:url var="url_home" value="/users/dashboard"></s:url>
  <s:url var="url_clist" value="/user/clist"></s:url>
 <a href="${url_home }">Home</a>|
<a href="${url_cform }">Add Contact</a>|
<a href="${url_clist }">Contact List</a>|
<a href="${url_logout }">Logout</a>
 </c:if>
 
