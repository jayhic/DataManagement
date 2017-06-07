<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Co-Authors</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<h1>Team_A Database Project:</h1>

	<ul>
		<li><a  href="index.jsp">Home</a></li>
		<c:if test="${empty sessionScope.USER}">
		  <li style="float:right"><a href="login.jsp">Login</a></li>
		  <li style="float:right"><a href="Register.jsp">Register</a></li>
		</c:if>
		<c:if test="${not empty sessionScope.USER}">
		  <li style="float:right"><a href="logout.jsp">Logout</a></li>
		  <li> <a href="profile_page.jsp">Profile</a></li>
		</c:if>

	</ul>
		<h3><%=request.getParameter("fore_name")%>
		<%=request.getParameter("last_name")%>'s Co-Authors
	</h3>
		<sql:setDataSource var="jbdc" driver="org.postgresql.Driver"
		url="jdbc:postgresql://neuromancer.icts.uiowa.edu/institutional_repository"
		user="team_a" password="arctic1992" />
		
	<sql:query var="co_aut" dataSource="${jbdc}">
	select distinct(last_name),fore_name from medline.author where seqnum!=1 and pmid in (select pmid from medline.author where last_name='<%=request.getParameter("last_name")%>' and fore_name='<%=request.getParameter("fore_name")%>');
	</sql:query>
	
<c:forEach items="${co_aut.rows}" var="result">
	<a
		href="Author_Page.jsp?fore_name=${result.fore_name}&last_name=${result.last_name}">${result.last_name},
		${result.fore_name}</a>
	<br />
</c:forEach>
	
</body>
</html>