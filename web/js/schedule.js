function schedule_fun() {
	
    var ourRequest = new XMLHttpRequest();
    ourRequest.open('GET', base_url+'/schedules?_s=scheduleGroup.status==A');
    ourRequest.onload = function () {
        var data = JSON.parse(ourRequest.responseText);
        //alert("hello");
        //sche_table(data);
        var divStr = "<table border='1' id='schedule_game'><tr><th><b>Court No.</th><th><b> Visitor Team </th><th><b> Home Team </th><th><b>Round Type</th><th>Time</th></tr>";
        var elem = document.getElementById("game_div");


        for (i = 0; i < data.length; i++) {
            //alert("helloooooo");
            divStr += "<tr><td>" + data[i].courtNo + "</td><td>" + data[i].visitorTeamName + "</td><td>" + data[i].homeTeamName + "</td><td>" + data[i].round + "</td><td>"+data[i].scheduleDate+"</td></tr>";


        }
        divStr += "</table>";
        elem.innerHTML = divStr;
    }
    ourRequest.send();

}


