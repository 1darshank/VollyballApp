function schedule_fun() {
    hideAll();
    var ourRequest = new XMLHttpRequest();
    ourRequest.open('GET', 'http://52.54.236.153:8080/spglobal-reference-api-template-1.0.0/volleyball-app/schedules?_s=scheduleGroup.status==A');
    ourRequest.onload = function () {
        var data = JSON.parse(ourRequest.responseText);
        //alert("hello");
        //sche_table(data);
        var divStr = "<table border='1' id='schedule_game'><tr><th><b> Home Team </th> <th><b> Visitor Team </th><th><b>Court No.</th><th><b>Round Type</th></tr>";
        var elem = document.getElementById("game_div");


        for (i = 0; i < data.length; i++) {
            //alert("helloooooo");
            divStr += "<tr><td>" + data[i].homeTeamName + "</td><td>" + data[i].visitorTeamName + "</td><td>" + data[i].courtNo + "</td><td>" + data[i].round + "</td></tr>";


        }
        divStr += "</table>";
        elem.innerHTML = divStr;
    }



    ourRequest.send();

}

function hideAll() {
    $("#team").hide();
    $("#point_table").hide();
    $("#live_score").hide();
}