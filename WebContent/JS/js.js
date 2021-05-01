

/*
Gráfico de barras
*/
window.onload = function(grafico1,grafico2,grafico3) {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title: {
			text: "Top Oil Reserves"
		},
		axisY: {
			title: "Reserves(MMbbl)"
		},
		data: [{
			type: "column",
			showInLegend: true,
			legendMarkerColor: "grey",
			legendText: "MMbbl = one million barrels",
			dataPoints: [
				{ y: grafico1, label: "Venezuela" },
				{ y: 266455, label: "Saudi" },
				{ y: 169709, label: "Canada" },
				{ y: 158400, label: "Iran" },
				{ y: 142503, label: "Iraq" },
				{ y: 101500, label: "Kuwait" },
				{ y: 97800, label: "UAE" },
				{ y: 80000, label: "Russia" }
			]
		}]
	});
	chart.render();

	/*Gráfico de pizza*/
	var chart = new CanvasJS.Chart("pizza", {
		animationEnabled: true,
		title: {
			text: "Email Categories",
			horizontalAlign: "left"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 17,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				{ y: 67, label: "Inbox" },
				{ y: 28, label: "Archives" },
				{ y: 10, label: "Labels" },
				{ y: 7, label: "Drafts" },
				{ y: 15, label: "Trash" },
				{ y: 6, label: "Spam" }
			]
		}]
	});
	chart.render();

	/*Gráfico de barra horizontal*/
	var chart = new CanvasJS.Chart("barraH", {
		animationEnabled: true,
		title: {
			text: "Military Expenditure of Countries: 2016"
		},
		axisX: {
			interval: 1
		},
		axisY: {
			title: "Expenses in Billion Dollars",
			includeZero: true,
			scaleBreaks: {
				type: "wavy",
				customBreaks: [{
					startValue: 80,
					endValue: 210
				},
				{
					startValue: 230,
					endValue: 600
				}
				]
			}
		},
		data: [{
			type: "bar",
			toolTipContent: "<img src=\"https://canvasjs.com/wp-content/uploads/images/gallery/javascript-column-bar-charts/\"{url}\"\" style=\"width:40px; height:20px;\"> <b>{label}</b><br>Budget: ${y}bn<br>{gdp}% of GDP",
			dataPoints: [
				{ label: "Israel", y: 17.8, gdp: 5.8, url: "israel.png" },
				{ label: "United Arab Emirates", y: 22.8, gdp: 5.7, url: "uae.png" },
				{ label: "Brazil", y: 22.8, gdp: 1.3, url: "brazil.png" },
				{ label: "Australia", y: 24.3, gdp: 2.0, url: "australia.png" },
				{ label: "South Korea", y: 36.8, gdp: 2.7, url: "skorea.png" },
				{ label: "Germany", y: 41.1, gdp: 1.2, url: "germany.png" },
				{ label: "Japan", y: 46.1, gdp: 1.0, url: "japan.png" },
				{ label: "United Kingdom", y: 48.3, gdp: 1.9, url: "uk.png" },
				{ label: "India", y: 55.9, gdp: 2.5, url: "india.png" },
				{ label: "Russia", y: 69.2, gdp: 5.3, url: "russia.png" },
				{ label: "China", y: 215.7, gdp: 1.9, url: "china.png" },
				{ label: "United States", y: 611.2, gdp: 3.3, url: "us.png" }
			]
		}]
	});
	chart.render();
}



