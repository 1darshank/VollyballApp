var base_url= 'http://volleyball-app-backend-dev-elb-800547385.us-east-1.elb.amazonaws.com/spglobal-reference-api-template-1.0.0/volleyball-app';

/* function hideAll() {
	$("#team").hide();
    $("#schedule").hide();
    $("#point_table").hide();
    $("#live_score").hide();
	$("#point_table1").hide();
	$("#result_table").hide();
} */



$(document).ready(function () {
    hideAll()
	//$("#result_table").hide();
	$('#home_btn').click(function(){
		//$("#result_table").hide();
		hideAll()
		$('#home').show();		
		
	});
    $('#schedule_btn').click(function () {
		//$("#result_table").hide();
        hideAll()
        $("#schedule").show();
    });

    $('#point_btn').click(function () {
		//$("#result_table").hide();
        hideAll()
        $("#point_table").show();
    });
	$('#result_btn').click(function () {
		//$("#result_table").hide();
        hideAll()
        $("#result_table").show();
    });
	
    $('#live_btn').click(function () {
		//$("#result_table").hide();
        hideAll()
        $("#live_score").show();
    });
	$('#point_btn1').click(function () {
		//$("#result_table").hide();
        hideAll()
        $('#point_table1').show();
    });
	$('#manu_btn').click(function(){
		$("#team").hide();
		$("#schedule").hide();
		$("#point_table").hide();
		$("#live_score").hide();
		$("#point_table1").hide();
		$("#result_table").hide();
	});
	

    //The hide function for responsive elements
    //*****************************************
	$('#home_btn_resp').click(function(){
		hideAll()
		$('#home').show();		
		
	});
    $('#schedule_btn_resp').click(function () {
        hideAll()
        $("#schedule").show();
    });

    $('#point_btn_resp').click(function () {
        hideAll()
        $("#point_table").show();
    });
	$('#result_btn_resp').click(function () {
		//$("#result_table").hide();
        hideAll()
        $("#result_table").show();
    });
    $('#live_btn_resp').click(function () {
        hideAll()
        $("#live_score").show();
    });
	
	$('#point_btn1_resp').click(function () {
        hideAll()
        $('#point_table1').show();
    });
	
	
	
});
function hideAll() {
    $("#team").hide();
	$("#schedule").hide();
    $("#point_table").hide();
    $("#live_score").hide();
	$("#point_table1").hide();
	$("#result_table").hide();
}
function manu_btn(){
	hideAll();
	
}
