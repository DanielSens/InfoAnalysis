package com.infoanalysis.jdbc;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/DashboardControllerServlet")
public class DashboardControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PopulacaoDbUtil db;

	@Resource(name = "jdbc/infoanalysis")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			db = new PopulacaoDbUtil(dataSource);
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			grafico(request, response);
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	private void grafico(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Populacao> populacao = db.getPopulacaoPorEstado();
		
		List<Populacao> homens = db.getHomensPorEstado();
		
		List<Populacao> mulheres = db.getMulheresPorEstado();

		
		request.setAttribute("POPULACAOPORESTADO_LIST", populacao);
		request.setAttribute("HOMENS_LIST", homens);
		request.setAttribute("MULHERES_LIST", mulheres);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.jsp");
		dispatcher.forward(request, response);
	}
	
}
