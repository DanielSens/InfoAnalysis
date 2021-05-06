<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, api.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
Cidade cidade = (Cidade) request.getAttribute("list");
%>

<!DOCTYPE HTML>
<html>
<head>
<title>Dashboard</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/weather.css" />
<link rel="stylesheet" type="text/css" href="CSS/stylejs.css" />
<!--Fontes-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200&display=swap" rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
		style="justify-content: end;">
		<a class="navbar-brand" href="index.html">INFO ANALYSIS </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="index.html">Home<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href="DashboardControllerServlet">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link"
					href="PopulacaoControllerServlet">Tabela de dados</a></li>
				<li class="nav-item"><a class="nav-link " href="sobre.html">Sobre</a>
				</li>
				<li class="nav-item"><a class="nav-link  " href="#">Ajuda</a></li>
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<div class="card">
		<div class="search">
			<input type="text" class="search-bar" placeholder="Search">
			<button>
				<svg stroke="currentColor" fill="currentColor" stroke-width="0"
					viewBox="0 0 1024 1024" height="1.5em" width="1.5em"
					xmlns="http://www.w3.org/2000/svg">
          <path
						d="M909.6 854.5L649.9 594.8C690.2 542.7 712 479 712 412c0-80.2-31.3-155.4-87.9-212.1-56.6-56.7-132-87.9-212.1-87.9s-155.5 31.3-212.1 87.9C143.2 256.5 112 331.8 112 412c0 80.1 31.3 155.5 87.9 212.1C256.5 680.8 331.8 712 412 712c67 0 130.6-21.8 182.7-62l259.7 259.6a8.2 8.2 0 0 0 11.6 0l43.6-43.5a8.2 8.2 0 0 0 0-11.6zM570.4 570.4C528 612.7 471.8 636 412 636s-116-23.3-158.4-65.6C211.3 528 188 471.8 188 412s23.3-116.1 65.6-158.4C296 211.3 352.2 188 412 188s116.1 23.2 158.4 65.6S636 352.2 636 412s-23.3 116.1-65.6 158.4z">
          </path>
        </svg>
			</button>
		</div>
		<div class="Weather">
			<h3 class="city">Previsão do tempo em <%=cidade.getCity()%></h3>
			<h1 class="temp"><%=(int) cidade.getTemp()%>ºC</h1>
			<div class="flex">
				<img src="" alt="" class="icon" />
				<div class="description"><%=cidade.getDescription()%></div>
			</div>
			<div class="humidity">Humidade: <%=(int) cidade.getHumidity()%>%</div>
			<div class="wind">Velocidade do Vento: <%=cidade.getWind_speedy()%></div>
		</div>
	</div>

	</div>
</body>
</html>
