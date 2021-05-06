<%@ page import="java.util.*, com.infoanalysis.jdbc.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>Lista</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/dashboard.css" />
<!--Fontes-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
	rel="stylesheet">
        
</head>

<%
List<Populacao> thePopulacao = (List<Populacao>) request.getAttribute("POPULACAO_LIST");
List<Populacao> theHomens = (List<Populacao>) request.getAttribute("HOMENS_LIST");


%>

<body>
	  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #CD5B45;">
    <a class="navbar-brand" href="index.html">INFO ANALYSIS </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="index.html">Home<span class="sr-only">(current)</span></a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="DashboardControllerServlet">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="PopulacaoControllerServlet">Tabela de dados</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="sobre.html">Sobre</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  " href="#">Ajuda</a>
        </li>
      </ul>
    </div>
  </nav>
	<br>
	<br>

	<div id="container">
		<div id="content">
			<table class="table table-striped table-dark">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">UF</th>
						<th scope="col">Municipio</th>
						<th scope="col">Total</th>
						<th scope="col">Homens</th>
						<th scope="col">Mulheres</th>
						<th scope="col">População Cedida</th>
					</tr>
				</thead>
				<%
				for (Populacao tempPopulacao : thePopulacao) {
				%>

				<tr>
					<td><%=tempPopulacao.getId()%></td>
					<td><%=tempPopulacao.getUf()%></td>
					<td><%=tempPopulacao.getMunicipios()%></td>
					<td><%=tempPopulacao.getTotal()%></td>
					<td><%=tempPopulacao.getHomens()%></td>
					<td><%=tempPopulacao.getMulheres()%></td>
					<td><%=tempPopulacao.getPopulacaocedida()%></td>

				</tr>

				<%
				}
				%>
			</table>
		</div>
	</div>
	
	
</body>



</html>