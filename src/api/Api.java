package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.net.ssl.HttpsURLConnection;

public class Api {
	
	
	public String weatherInfo() throws IOException {

		String result;
		String api = "https://api.hgbrasil.com/weather?format=json&fields=only_results,temp,date,time,description,currently,city,humidity,"
				+ "wind_speedy,sunrise,sunset,condition_slug&key=5554743c&city_name=Campinas,SP";
		URL url = new URL(api);

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
