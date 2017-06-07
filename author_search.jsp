<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search By Author</title>
</head>
<body>
<H2>Search By Author</H2>
<form action="Author_Page.jsp" method="GET">
First Name: <input type="text" name="fore_name"/> <br/>
Last Name: <input type="text" name="last_name"/>
<input type="submit" value="Submit" />
</form>

<h4>Example Searches</h4>
<ul>
<li> <c:out value="Anna | Picca" />
<li> <c:out value="E | Martin" />
<li> <c:out value="Frank | Beier" />
<li> <c:out value="Jo-Hua | Chiang" />
<li> <c:out value="Serena | Di Vincenzo" />
</ul>


</body>
</html>