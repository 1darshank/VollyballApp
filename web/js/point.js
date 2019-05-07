function team_standing()
{
	//alert("hello");
	var ourRequest = new XMLHttpRequest();
    ourRequest.open('GET', base_url+'/games/team-standing');
    ourRequest.onload = function () {
        var data = JSON.parse(ourRequest.responseText);
        //alert("hello");
        var divStr = "<table id='schedule_game'><tr><th>Team Name</th><th><b>Points</th> <th><b>ScoreLead</th></tr>";
        var elem = document.getElementById("point_div");
		
		for (i = 0; i < data.length; i++) {
            //alert("helloooooo");
            divStr += "<tr><td>"+data[i].teamName+"</td><td>" + data[i].points + "</td><td>" + data[i].scoreLead + "</td></tr>";
        }
		divStr += "</table>";
		elem.innerHTML=divStr;
		
        
    }



    ourRequest.send();
}