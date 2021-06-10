package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class ForecastApi {

	public String weatherInfo(String cidade) throws IOException {
       cidade = cidade.replaceAll(" ","");
		String result;
		String api = "https://api.hgbrasil.com/weather?array_limit=4&fields=only_results,forecast,max,min,date,description&key=5554743c&city_name="
				+ cidade;
		URL url = new URL(api);

		//KEY DE CONSULTA DANIEL: 5554743c
		
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		
		int responseCode = connection.getResponseCode();
		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			
			in.close();


			return response.toString();
			
		} else {
			return "GET request not worked";
		}

		
		
	}}
