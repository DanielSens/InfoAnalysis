package api;

import java.io.IOException;
import java.util.ArrayList;
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
		WeatherApi api = new WeatherApi();
		Weather weather = new Weather();
		Gson gson = new GsonBuilder().create();
		weather = gson.fromJson(api.weatherInfo(cidade1), Weather.class);
		
		ForecastApi forecastApi = new ForecastApi();
		Forecast forecast = new Forecast();
		forecast = gson.fromJson(forecastApi.weatherInfo(cidade1), Forecast.class);
		ArrayList<ForecastNextDay> forecastnextday = forecast.forecast;
		System.out.println(forecast);
		
		guardanaSessao(request, response, weather,forecastnextday);
		request.setAttribute("list", weather);
		request.setAttribute("listdays", forecastnextday);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		
		
		dispatcher.forward(request, response);
	}

	private void guardanaSessao(HttpServletRequest request, HttpServletResponse response, Weather weather, ArrayList<ForecastNextDay> forecastnextday) {
		HttpSession sessao = request.getSession();
		if (weather != null && forecastnextday != null) {
			sessao.setAttribute("weather", weather);
			sessao.setAttribute("forecastnextday", forecastnextday);
		} else {
			weather = new Weather();
			forecastnextday = new ArrayList<ForecastNextDay>();
		}

	}

}
