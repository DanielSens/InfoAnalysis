<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, api.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>


<%
Weather cidade = (Weather) request.getAttribute("list");
ArrayList<ForecastNextDay> forecastnextday = (ArrayList<ForecastNextDay>) request.getAttribute("listdays");
if (cidade == null && forecastnextday == null) {
	HttpSession sessao = request.getSession(false);
	if (sessao != null) {
		cidade = (Weather) sessao.getAttribute("weather");
		forecastnextday = (ArrayList<ForecastNextDay>) sessao.getAttribute("listdays");
	} else {
		cidade = new Weather();
		forecastnextday =  new ArrayList<ForecastNextDay>();
	}
}
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Previsão do Tempo</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/weather.css" />

<!--Fontes-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		<a class="navbar-brand" style="color: white;">INFO ANALYSIS</a>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.html">Home<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href="dashboard.html">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link " href="sobre.html">Sobre</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>

	<div class="card">
		<div class="search">
			<form action="weather" method="post">
				<input type="text" class="search-bar" placeholder="Cidade, Estado"
					name="cidade" required>
				<button>
					<svg stroke="currentColor" fill="currentColor" stroke-width="0"
						viewBox="0 0 1024 1024" height="1.5em" width="1.5em"
						xmlns="http://www.w3.org/2000/svg">
          <path
							d="M909.6 854.5L649.9 594.8C690.2 542.7 712 479 712 412c0-80.2-31.3-155.4-87.9-212.1-56.6-56.7-132-87.9-212.1-87.9s-155.5 31.3-212.1 87.9C143.2 256.5 112 331.8 112 412c0 80.1 31.3 155.5 87.9 212.1C256.5 680.8 331.8 712 412 712c67 0 130.6-21.8 182.7-62l259.7 259.6a8.2 8.2 0 0 0 11.6 0l43.6-43.5a8.2 8.2 0 0 0 0-11.6zM570.4 570.4C528 612.7 471.8 636 412 636s-116-23.3-158.4-65.6C211.3 528 188 471.8 188 412s23.3-116.1 65.6-158.4C296 211.3 352.2 188 412 188s116.1 23.2 158.4 65.6S636 352.2 636 412s-23.3 116.1-65.6 158.4z">
          </path>
        </svg>
				</button>
			</form>
		</div>

		<%
		if (cidade == null) {
		%>
		<h3>Digite uma cidade seguida do seu estado.</h3>
		<%
		} else {
		%>

		<div class="Weather">
			<h3 class="city">
				Previsão do tempo em
				<%=cidade.getCity()%></h3>
			<h1 class="temp"><%=(int) cidade.getTemp()%>ºC
			</h1>
			<div class="flex">
				<div class="description">
					<%
					if (cidade.getCondition_code() == 28 || cidade.getCondition_code() == 26) {
					%>
					<i class="bi bi-cloudy" style="font-size: 2rem; color: white;"></i>
					<%
					} else if (cidade.getCondition_code() == 29 || cidade.getCondition_code() == 30) {
					%>
					<i class="bi bi-cloud-sun" style="font-size: 2rem; color: white;"></i>
					<%
					} else {

					}
					%>
					<%=cidade.getDescription()%>
				</div>
			</div>
		</div>
		<div class="humidity">
			Humidade:
			<%=(int) cidade.getHumidity()%>
		</div>
		<div class="wind">
			Velocidade do Vento:
			<%=cidade.getWind_speedy()%></div>
	</div>
<%-- 	<% --%>
// 	}
<%-- 	%> --%>
<%-- 	<% --%>
// 	for (ForecastNextDay days: forecastnextday){
<%-- 		%> --%>
<%-- 		<td><%=forecastnextday.%></td> --%>
<%-- 		<td><%=forecastnextday.getMin()%></td> --%>
<%-- 		<%}%> --%>
<!-- 	%> -->
	</div>
	</div>
	

</body>
</html>
