package api;

import java.util.ArrayList;
import java.util.List;

public class Forecast {
  private String date;
  private String description;
  ArrayList<ForecastNextDay> forecast = new ArrayList<ForecastNextDay>();


 // Getter Methods 

  public String getDate() {
    return date;
  }

  public String getDescription() {
    return description;
  }

 // Setter Methods 

  public void setDate( String date ) {
    this.date = date;
  }

  public void setDescription( String description ) {
    this.description = description;
  }

@Override
public String toString() {
	return "[date=" + date + ", description=" + description + ", forecast=" + forecast + "]";
}
  
  
}