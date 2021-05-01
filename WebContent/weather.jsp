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
<link rel="stylesheet" type="text/css" href="CSS/dashboard.css" />
<link rel="stylesheet" type="text/css" href="CSS/stylejs.css" />
<!--Fontes-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #CD5B45;">
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

	<div id="container">
		<div id="content">
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<th scope="col">Head</th>
						<th scope="col">Body</th>
					</tr>
				</thead>
				<tbody>
				
				<tr>
					<td>Cidade</td>
					<td><%=cidade.getCity()%></td>
				</tr>
				<tr>
					<td>Temperatura</td>
					<td><%=cidade.getTemp() + "°"%></td>
				</tr>
				<tr>
					<td>Data</td>
					<td><%=cidade.getDate()%></td>
				</tr>
				<tr>
					<td>Descricao</td>
					<td><%=cidade.getDescription()%></td>
				</tr>
				<tr>
					
					<td>Dia/Noite</td>
					<td><%=cidade.getCurrently()%></td>
				</tr>
				<tr>
				    <td>Humidade</td>
					<td><%=cidade.getHumidity() + "%"%></td>
				</tr>
				<tr>
					<td>Velocidade do Vento</td>
					<td><%=cidade.getWind_speedy()%></td>
				</tr>
				<tr>
				    <td>Nascer do Sol</td>
					<td><%=cidade.getSunrise()%></td>
				</tr>
				<tr>
					
					<td>Por so Sol</td>
					<td><%=cidade.getSunset()%></td>
				</tr>
				<tr>
				    <td>Condicao do Tempo</td>
					<td><%=cidade.getCondition_slug()%></td>
				</tr>
</tbody>
</table>
</div>
</div>
</body>
</html>
