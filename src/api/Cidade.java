package api;

public class Cidade {

	
		  private float temp;
		  private String date;
		  private String time;
		  private String description;
		  private String currently;
		  private String city;
		  private float humidity;
		  private String wind_speedy;
		  private String sunrise;
		  private String sunset;
		  private String condition_slug;


		 // Getter Methods 

		  public float getTemp() {
		    return temp;
		  }

		  public String getDate() {
		    return date;
		  }

		  public String getTime() {
		    return time;
		  }

		  public String getDescription() {
		    return description;
		  }

		  public String getCurrently() {
		    return currently;
		  }

		  public String getCity() {
		    return city;
		  }

		  public float getHumidity() {
		    return humidity;
		  }

		  public String getWind_speedy() {
		    return wind_speedy;
		  }

		  public String getSunrise() {
		    return sunrise;
		  }

		  public String getSunset() {
		    return sunset;
		  }

		  public String getCondition_slug() {
		    return condition_slug;
		  }

		 // Setter Methods 

		  public void setTemp( float temp ) {
		    this.temp = temp;
		  }

		  public void setDate( String date ) {
		    this.date = date;
		  }

		  public void setTime( String time ) {
		    this.time = time;
		  }

		  public void setDescription( String description ) {
		    this.description = description;
		  }

		  public void setCurrently( String currently ) {
		    this.currently = currently;
		  }

		  public void setCity( String city ) {
		    this.city = city;
		  }

		  public void setHumidity( float humidity ) {
		    this.humidity = humidity;
		  }

		  public void setWind_speedy( String wind_speedy ) {
		    this.wind_speedy = wind_speedy;
		  }

		  public void setSunrise( String sunrise ) {
		    this.sunrise = sunrise;
		  }

		  public void setSunset( String sunset ) {
		    this.sunset = sunset;
		  }

		  public void setCondition_slug( String condition_slug ) {
		    this.condition_slug = condition_slug;
		  }

		@Override
		public String toString() {
			return "Cidade [temp=" + temp + "\n, date=" + date + "\n, time=" + time + "\n, description=" + description
					+ "\n, currently=" + currently + "\n, city=" + city + "\n, humidity=" + humidity + "\n, wind_speedy="
					+ wind_speedy + "\n, sunrise=" + sunrise + "\n, sunset=" + sunset + "\n, condition_slug=" + condition_slug
					+ "]";
		}
		  
		  
}	  
	
	

