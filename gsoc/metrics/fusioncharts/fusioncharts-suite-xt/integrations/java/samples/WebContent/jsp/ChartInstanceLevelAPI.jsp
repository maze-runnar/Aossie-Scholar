<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="fusioncharts.FusionCharts" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../Styles/ChartSampleStyleSheet.css" rel="stylesheet" />
<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
<style>
    input[type=radio], input[type=checkbox] {
		display:none;
	}

    input[type=radio] + label, input[type=checkbox] + label {
		display:inline-block;
		margin:-2px;
		padding: 4px 12px;
		margin-bottom: 0;
		font-size: 14px;
		line-height: 20px;
		color: #333;
		text-align: center;
		text-shadow: 0 1px 1px rgba(255,255,255,0.75);
		vertical-align: middle;
		cursor: pointer;
		background-color: #f5f5f5;
		background-image: -moz-linear-gradient(top,#fff,#e6e6e6);
		background-image: -webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));
		background-image: -webkit-linear-gradient(top,#fff,#e6e6e6);
		background-image: -o-linear-gradient(top,#fff,#e6e6e6);
		background-image: linear-gradient(to bottom,#fff,#e6e6e6);
		background-repeat: repeat-x;
		border: 1px solid #ccc;
		border-color: #e6e6e6 #e6e6e6 #bfbfbf;
		border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
		border-bottom-color: #b3b3b3;
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe6e6e6',GradientType=0);
		filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
		-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
		-moz-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
		box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);
	}

	 input[type=radio]:checked + label, input[type=checkbox]:checked + label{
		   background-image: none;
		outline: 0;
		-webkit-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
		-moz-box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
		box-shadow: inset 0 2px 4px rgba(0,0,0,0.15),0 1px 2px rgba(0,0,0,0.05);
			background-color:#e0e0e0;
	}
   
    </style>
 <title>FusionCharts | Add event to a chart dyamically</title>
</head>
<body>
<script>
        track = function(){
            FusionCharts.addEventListener("dataplotclick", clickHandler);
            document.getElementById("message").innerHTML = "Click on the plot to see the value along with the label";
            
        };
        clickHandler = function(e){
            document.getElementById("message").innerHTML = "You have clicked on plot <b>"+  e.data.categoryLabel + "</b> whose value is <b>" + e.data.displayValue + "</b>";
        };
        removeEvent = function(){
            FusionCharts.removeEventListener("dataplotclick", clickHandler);
            document.getElementById("message").innerHTML = "Click the below buttons to add an event dynamically to the chart";
           
        }
    </script>
    <h3>Add event to a chart dyamically</h3>
    <div id ="chart"></div>
    <div>
         <p align="center" id ="message"></p>
     </div>

     <div id="controllers" align="center" style="font-family:'Helvetica Neue', Arial; font-size: 14px;">
         <input type="radio" id="radio1" name= "radios" onclick="track()" />
         <label for="radio1">LISTEN TO DATAPLOTCLICK EVENT</label>
         <input type="radio" id="radio2" name="radios" onclick="removeEvent()" />
         <label for="radio2">REMOVE DATAPLOTCLICK EVENT</label>
         
     </div> 
     <div><span><a href="../Index.jsp">Go Back</a></span></div>
     <%
        String jsonData;
        jsonData = "{      'chart': {        'caption': 'Countries With Most Oil Reserves [2017-18]',        'subCaption': 'In MMbbl = One Million barrels',        'xAxisName': 'Country',        'yAxisName': 'Reserves (MMbbl)',        'numberSuffix': 'K',        'theme': 'fusion',  },      'data': [{        'label': 'Venezuela',        'value': '290'      }, {        'label': 'Saudi',        'value': '260'      }, {        'label': 'Canada',        'value': '180'      }, {        'label': 'Iran',        'value': '140'      }, {        'label': 'Russia',        'value': '115'      }, {        'label': 'UAE',        'value': '100'      }, {        'label': 'US',        'value': '30'      }, {        'label': 'China',        'value': '30'      }]    }";
        FusionCharts column_chart = new FusionCharts(
    		  "column2d",
   		      "column_chart",
   		      "700", 
   		      "400",
   		      "chart",
   		      "json",
   		      jsonData      		      
    			);
      %>
 
		<%=column_chart.render()%>
</body>
</html>