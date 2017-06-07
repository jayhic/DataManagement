<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Team_A!</title>
</head>
<body>

	<h1>Team_A Database Project:</h1>

	<ul>
		<li><a class="active" href="index.jsp">Home</a></li>

		<c:if test="${empty sessionScope.USER}">
		  <li style="float:right"><a href="login.jsp">Login</a></li>
		  <li style="float:right"><a href="Register.jsp">Register</a></li>
		</c:if>
		<c:if test="${not empty sessionScope.USER}">
		  <li style="float:right"><a href="logout.jsp">Logout</a></li>
		  		  <li> <a href="profile_page.jsp">Profile</a></li>
		</c:if>

	</ul>
	<H3>Search By Author</H3>
	<form action="Author_Page.jsp" method="GET">
		First Name: <input type="text" name="fore_name" /> <br /> Last Name:
		<input type="text" name="last_name" /> <br /> <input type="submit"
			value="Submit" />
	</form>

	<h4>Example Searches</h4>

	<c:out value="Anna | Picca" />
	<br />
	<c:out value="E | Martin" />
	<br />
	<c:out value="Frank | Beier" />
	<br />
	<c:out value="Jo-Hua | Chiang" />
	<br />
	<c:out value="Serena | Di Vincenzo" />
	<br />

	<ul>
		<li><c:out value=".." />
	</ul>

	<H3>Search By Institution</H3>
	<form action="Institution_Page.jsp" method="GET">
		Institution Name: <input type="text" name="i_name" /> <input
			type="submit" value="Submit" />
	</form>

	<h4>Example Searches</h4>

	<c:out value="University of Iowa" />
	<br />
	<c:out value="University of Minnesota Cancer Center" />
	<br />

	<ul>
		<li><c:out value=".." />
	</ul>
	
		<H3>Search By PMID</H3>
	<form action="Article_Page.jsp" method="GET">
		PMID: <input type="text" name="pmid" /> <input type="submit"
			value="Submit" />
	</form>

	<h4>Example Searches</h4>

	<c:out value="18135775" />
	<br />
	<c:out value="58563" />
	<br />
	<c:out value="21126053" />
	<ul>
		<li><c:out value=".." />
	</ul>

	<H3>Search By Keyword</H3>
	<form action="Keyword_Page.jsp" method="GET">
		Keyword: <input type="text" name="k_name" /> <input type="submit"
			value="Submit" />
	</form>

	<h4>Example Searches</h4>

	<c:out value="Biology" />
	<br />
	<c:out value="Genetics" />
	<br />
	<c:out value="Surgery" />
	<br />
	<c:out value="Treatment" />
	<ul>
		<li><c:out value=".." />
	</ul>

</body>
<footer>
	<h2>Final Project: Institutional Repository Team A: Aaron McVay,
		Ben Schmidt, Bharat Satti, James Cox, John Young</h2>
</footer>
</html>
