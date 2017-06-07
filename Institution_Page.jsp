<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse Institutions</title>
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

	<H3><%=request.getParameter("i_name")%>'s Profile
	</H3>

	<h4>Publications per Year</h4>
<html>
<body>
	<div id="chart"></div>
	<script src="http://d3js.org/d3.v2.min.js"></script>
	<script>
function renderChart() {

var data = d3.csv.parse(d3.select('#csv').text());
var valueLabelWidth = 40; // space reserved for value labels (right)
var barHeight = 20; // height of one bar
var barLabelWidth = 100; // space reserved for bar labels
var barLabelPadding = 5; // padding between bar and bar labels (left)
var gridLabelHeight = 18; // space reserved for gridline labels
var gridChartOffset = 3; // space between start of grid and first bar
var maxBarWidth = 420; // width of the bar with the max value
 
// accessor functions 
var barLabel = function(d) { return d['Year']; };
var barValue = function(d) { return parseFloat(d['Count']); };
 
// scales
var yScale = d3.scale.ordinal().domain(d3.range(0, data.length)).rangeBands([0, data.length * barHeight]);
var y = function(d, i) { return yScale(i); };
var yText = function(d, i) { return y(d, i) + yScale.rangeBand() / 2; };
var x = d3.scale.linear().domain([0, d3.max(data, barValue)]).range([0, maxBarWidth]);
// svg container element
var chart = d3.select('#chart').append("svg")
  .attr('width', maxBarWidth + barLabelWidth + valueLabelWidth)
  .attr('height', gridLabelHeight + gridChartOffset + data.length * barHeight);
// bar labels
var labelsContainer = chart.append('g')
  .attr('transform', 'translate(' + (barLabelWidth - barLabelPadding) + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
labelsContainer.selectAll('text').data(data).enter().append('text')
  .attr('y', yText)
  .attr('stroke', 'none')
  .attr('fill', 'black')
  .attr("dy", ".35em") // vertical-align: middle
  .attr('text-anchor', 'end')
  .text(barLabel);
// bars
var barsContainer = chart.append('g')
  .attr('transform', 'translate(' + barLabelWidth + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
barsContainer.selectAll("rect").data(data).enter().append("rect")
  .attr('y', y)
  .attr('height', yScale.rangeBand())
  .attr('width', function(d) { return x(barValue(d)); })
  .attr('stroke', 'white')
  .attr('fill', 'green');
// bar value labels
barsContainer.selectAll("text").data(data).enter().append("text")
  .attr("x", function(d) { return x(barValue(d)); })
  .attr("y", yText)
  .attr("dx", 3) // padding-left
  .attr("dy", ".35em") // vertical-align: middle
  .attr("text-anchor", "start") // text-align: right
  .attr("fill", "black")
  .attr("stroke", "none")
  .text(function(d) { return d3.round(barValue(d), 2); });
}
    </script>
	<sql:query var="inst_years" dataSource="${jbdc}">
	select pub_year, count(pmid) from medline.journal natural join medline.affiliation where label ~'^<%=request.getParameter("i_name")%>' group by pub_year order by pub_year;
	</sql:query>

	<script id="csv" type="text/csv">Year,Count
<c:forEach items="${inst_years.rows}" var="result"> ${result.pub_year},${result.count}
</c:forEach></script>
	<script>renderChart();</script>
</body>
</html>

<sql:query var="inst_author" dataSource="${jbdc}">
	select distinct(last_name), fore_name from medline.author natural join medline.affiliation where label~'^<%=request.getParameter("i_name")%>' order by last_name;
	</sql:query>

<h4>
	Authors at
	<%=request.getParameter("i_name")%></h4>
<c:forEach items="${inst_author.rows}" var="result">
	<a
		href="Author_Page.jsp?fore_name=${result.fore_name}&last_name=${result.last_name}">${result.last_name},
		${result.fore_name}</a>
	<br />
</c:forEach>

</body>
</html>