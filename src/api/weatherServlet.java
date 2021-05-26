package api;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.infoanalysis.jdbc.Populacao;

/**
 * Servlet implementation class weatherServlet
 */
@WebServlet("/weather")
public class weatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cidade = request.getParameter("cidade");

		try {
			tempo(request, response, cidade);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);

	}

	private void tempo(HttpServletRequest request, HttpServletResponse response, String cidade1) throws Exception {
		Api api = new Api();
		Cidade cidade = new Cidade();
		Gson gson = new GsonBuilder().create();
		cidade = gson.fromJson(api.weatherInfo(cidade1), Cidade.class);
		guardanaSessao(request, response, cidade);
		request.setAttribute("list", cidade);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");

		dispatcher.forward(request, response);
	}

	private void guardanaSessao(HttpServletRequest request, HttpServletResponse response, Cidade cidade) {
		HttpSession sessao = request.getSession();
		if (cidade != null) {
			sessao.setAttribute("cidade", cidade);
		} else {
			cidade = new Cidade();
		}

	}

}
