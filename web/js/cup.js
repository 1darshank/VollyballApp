    $(document).ready(function () {
        hideAll()
        $('#team_btn').click(function () {
            hideAll()
            resetDropdown("divisions")
            resetDropdown("teams")
            $('#teams_span').text('')
            $.ajax({
                url: "http://52.54.236.153:8080/spglobal-reference-api-template-1.0.0/volleyball-app/divisions?_s=status==A"
            }).then(function (data) {
                for (i = 0; i < data.length; i++) {
                    $('select[name=divisions]').append('<option value="' + data[i].id + '" data-index="' + data[i].id + '">' + data[i].name + '</option>')
                }
            });

            $("#team").show();
        });

        //onchange for divisions dropdown
        $('select[name=divisions]').change(function () {
            var selectedIndex = $(this).find(":selected").attr("data-index");

            // make a call to get teams by division
            $.ajax({
                url: "http://52.54.236.153:8080/spglobal-reference-api-template-1.0.0/volleyball-app/teams?_s=division.id==" + selectedIndex
            }).then(function (data) {
                resetDropdown("teams")
                for (i = 0; i < data.length; i++) {
                    $('select[name=teams]').append('<option value="' + data[i].id + '" data-index="' + data[i].id + '">' + data[i].name + '</option>')
                }
            });
        });


        $('#schedule_btn').click(function () {
            hideAll()
            $("#schedule").show();
        });

        $('#point_btn').click(function () {
            hideAll()
            $("#point_table").show();
        });

        $('#live_btn').click(function () {
            hideAll()
            $("#live_score").show();
        });

        //The hide function for responsive elements
        //*****************************************
        $('#team_btn_resp').click(function () {
            hideAll()
            $("#team").show();
        });
        $('#schedule_btn_resp').click(function () {
            hideAll()
            $("#schedule").show();
        });

        $('#point_btn_resp').click(function () {
            hideAll()
            $("#point_table").show();
        });

        $('#live_btn_resp').click(function () {
            hideAll()
            $("#live_score").show();
        });
        //******************************************
        function test() {
            var id = this.id.substring(this.id.lastIndexOf("_") + 1, this.id.length)
            alert(id)
            $.ajax({
                url: "http://52.54.236.153:8080/spglobal-reference-api-template-1.0.0/volleyball-app/teams?_s=division.id==" + id
            }).then(function (data) {
                for (i = 0; i < data.length; i++) {
                    alert(data[i].name)
                }

            });
        }

        function resetDropdown(name) {
            var selector = "select[name=" + name + "]"
            $(selector).find('option').remove().end().append('<option value="---"></option>');
        }

        function hideAll() {
            $("#team").hide();
            $("#schedule").hide();
            $("#point_table").hide();
            $("#live_score").hide();
        }
    });
