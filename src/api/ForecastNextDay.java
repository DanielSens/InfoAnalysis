package api;

public class ForecastNextDay {
	
	private String date;
	private int max;
	private int min;
	private String description;
	
	public String getDate() {
		return date;
	}
	public int getMax() {
		return max;
	}
	public int getMin() {
		return min;
	}
	public String getDescription() {
		return description;
	}
	@Override
	public String toString() {
		return "ForecastNextDay [Data=" + date + ", Max=" + max + ", Min=" + min + ", Descrição=" + description + "]";
	}
	
}
