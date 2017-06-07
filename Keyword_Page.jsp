<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse Keyword</title>
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
	<sql:setDataSource var="jbdc" driver="org.postgresql.Driver"
		url="jdbc:postgresql://neuromancer.icts.uiowa.edu/institutional_repository"
		user="team_a" password="arctic1992" />
		
	<h3>Keyword Search: <%=request.getParameter("k_name") %></h3>

	<sql:query var="key_search" dataSource="${jbdc}">
	select pmid, title from medline.article where pmid in (select pmid from medline.keyword where keyword='<%=request.getParameter("k_name") %>') limit 50;
	</sql:query>

	<h4>Publications with Searched Keyword</h4>
	<c:forEach items="${key_search.rows}" var="result">
		<a href="Article_Page.jsp?pmid=${result.pmid}">${result.pmid}</a>
		<c:out value=" : ${result.title}" />
		<br />
	</c:forEach>

</body>
</html>