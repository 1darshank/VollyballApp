$(document).ready(function () {
    $('#team_btn').click(function () {
		team_click()
    });
    $('#team_btn_resp').click(function () {
       team_click()
    });

    //onchange for divisions dropdown
    $('select[name=divisions]').change(function () {
        var selectedIndex = $(this).find(":selected").attr("data-index");

        // make a call to get teams by division
        $.ajax({
            url: base_url+"/teams?_s=division.id==" + selectedIndex
        }).then(function (data) {
            //resetDropdown("teams")
            for (i = 0; i < data.length; i++) {
                $('select[name=teams]').append('<option value="' + data[i].id + '" data-index="' + data[i].name + '">' + data[i].name + '</option>')
            }
        });
    });

	
	//onchange for teams dropdown
    $('select[name=teams]').change(function () {
        var selectedIndex = $(this).find(":selected").attr("data-index");

        // make a call to get teams by division
        $.ajax({
            url: base_url+"/teams?_s=name==" + selectedIndex
        }).then(function (data) {
			 $('#team_div').text('')
            //resetDropdown("teams")
			var input = "<table id='schedule_game'><tr><th>Name</th><th>Detail</th></tr>";
            for (i = 0; i < data[0].teamPlayers.length; i++) {
                console.log(data)
                //have to print a table here
				//alert(data[i].teamPlayers[0].firstName);
				input += "<tr><td>" + data[0].teamPlayers[i].firstName+"</td><td>"+data[0].teamPlayers[i].lastName+"</td></tr>";
            }
			input += "</table>";
			$('#team_div').append(input);
        });
    });
    function resetDropdown(name) {
        var selector = "select[name=" + name + "]"
        $(selector).find('option').remove().end().append('<option value="---"></option>');
		$('#team_div').text('')
		
		
    }
	
	function team_click() {
		$("#point_table1").hide();
		 hideAll()
		
        resetDropdown("divisions")
        resetDropdown("teams")
        $('#teams_span').text('')
        $.ajax({
            url: base_url+"/divisions?_s=status==A"
        }).then(function (data) {
            for (i = 0; i < data.length; i++) {
                $('select[name=divisions]').append('<option value="' + data[i].id + '" data-index="' + data[i].id + '">' + data[i].name + '</option>')
            }
        });
		
        $("#team").show();
	}
});