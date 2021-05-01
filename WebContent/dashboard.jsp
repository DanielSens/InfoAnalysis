<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.infoanalysis.jdbc.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
Gson gsonObj = new Gson();
Map<Object, Object> mapPopulacao = null;
List<Map<Object, Object>> listPopulacao = new ArrayList<Map<Object, Object>>();

Map<Object, Object> mapHomens = null;
List<Map<Object, Object>> listHomens = new ArrayList<Map<Object, Object>>();

Map<Object, Object> mapMulheres = null;
List<Map<Object, Object>> listMulheres = new ArrayList<Map<Object, Object>>();
List<Populacao> thePopulacao = (List<Populacao>) request.getAttribute("POPULACAOPORESTADO_LIST");
List<Populacao> homens = (List<Populacao>) request.getAttribute("HOMENS_LIST");
List<Populacao> mulheres = (List<Populacao>) request.getAttribute("MULHERES_LIST");

for (Populacao pop : thePopulacao) {
	mapPopulacao = new HashMap<Object, Object>();
	mapPopulacao.put("label", pop.getUf());
	mapPopulacao.put("y", pop.getTotal());
	listPopulacao.add(mapPopulacao);
}

for (Populacao pop : homens) {
	mapHomens = new HashMap<Object, Object>();
	mapHomens.put("label", pop.getUf());
	mapHomens.put("y", pop.getTotal());
	listHomens.add(mapHomens);
}

for (Populacao pop : mulheres) {
	mapMulheres = new HashMap<Object, Object>();
	mapMulheres.put("label", pop.getUf());
	mapMulheres.put("y", pop.getTotal());
	listMulheres.add(mapMulheres);
}

String dataPopulacao = gsonObj.toJson(listPopulacao);
String dataHomens = gsonObj.toJson(listHomens);
String dataMulheres = gsonObj.toJson(listMulheres);
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
	
<script type="text/javascript">
	window.onload = function() {

		var chart = new CanvasJS.Chart("chartHomensMulheres",  {
			title : {
				text : "Diferença Homens e Mulheres Por Estado"
			},
			theme : "light1",
			axisX : {
				title : "Estado"
			},
			axisY : {
				title : "Total",
				includeZero : true
			},

			data : [ {
				type : "column",
				yValueFormatString : "#,##0.## Homens",
				legendText : "{label}",
				showInLegend : true,
				legendText : "Homens",
				dataPoints :
<%out.print(dataHomens);%>
	}, {
				type : "column",
				yValueFormatString : "#,##0.## Mulheres",
				showInLegend : true,
				legendText : "Mulheres",
				dataPoints :
<%out.print(dataMulheres);%>
	} ]
		});
		chart.render();
			
		var chartPopulacao = new CanvasJS.Chart("chartPopulacao", {
			title : {
				text : "Total de Pessoas Por Estado"
			},
			axisX : {
				title : "Estado"
			},
			axisY : {
				title : "Total Pessoas",
				includeZero : true
			},
			data : [ {
				type : "pie",
				showInLegend : true,
				legendText : "{label}",
				toolTipContent : "{label}: <strong>{y}</strong> Pessoas",
				indexLabel : "{label} {y}",

				dataPoints :
<%out.print(dataPopulacao);%>
	} ]
		});
		chartPopulacao.render();

	}
</script>

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
	<div id="chartHomensMulheres" style="height: 370px; width: 50%;"></div>
	<div id="chartPopulacao" style="height: 370px; width: 50%;"></div>


	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>


</body>
</html>
