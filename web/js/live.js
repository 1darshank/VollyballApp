function live_fun(){
	$('#live_div').text('')
	setInterval(live_time,3000);
}
//
function live_time() {
	$("#hide_p").hide()
    var ourRequest = new XMLHttpRequest();
    ourRequest.open('GET', base_url+'/games?_s=status==A');
    ourRequest.onload = function () {
        var data = JSON.parse(ourRequest.responseText);
        //alert("hello");
        var divStr = "<table id='schedule_game'><tr><th>Court No.</th><th><b> Home Team </th> <th><b>Home Team Score </th><th><b>Visitor Team</th><th><b>Visitor Team Score</th><tr>";
        var elem = document.getElementById("live_div");
		
		for (i = 0; i < data.length; i++) {
            //alert("helloooooo");
            divStr += "<tr><td>"+data[i].courtNo+"</td><td>" + data[i].homeTeamName + "</td><td>" + data[i].homeTeamScore + "</td><td>" + data[i].visitorTeamName + "</td><td>" + data[i].visitorTeamScore + "</td></tr>";
        }
		divStr += "</table>";
		elem.innerHTML=divStr;
		
        
    }



    ourRequest.send();

}


