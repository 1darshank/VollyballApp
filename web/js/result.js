function game_result()
{
	//alert("hello");	
	var ourRequest = new XMLHttpRequest();
    ourRequest.open('GET', base_url+'/games?_s=status==I');
    ourRequest.onload = function () {
        var data = JSON.parse(ourRequest.responseText);
        //alert("hello");
        var divStr = "<table id='schedule_game'><tr><th><b>Home Team </th> <th><b>Home Team Score </th><th><b>Visitor Team</th><th><b>Visitor Team Score</th><th><b>Game Status</th><tr>";
        var elem = document.getElementById("result_div");
		
		for (i = 0; i < data.length; i++) {
            //alert("helloooooo");
            divStr += "<tr><td>"+data[i].homeTeamName+"</td><td>" + data[i].homeTeamScore + "</td><td>" + data[i].visitorTeamName + "</td><td>"+data[i].visitorTeamScore+"</td><td>C</td></tr>";
        }
		divStr += "</table>";
		elem.innerHTML=divStr;
		
        
    }
    ourRequest.send();
	
}