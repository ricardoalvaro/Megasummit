/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />
/// <reference path="jsPopDiv.js" />


//----------Discounting

function LoadMemo() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'19', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_bm_prefix").val(data[i]["Prefix"]);
                $("#txt_bm_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_bm_automatic").attr('checked', 'checked');
                }

                $("#txt_bm_latest").val(data[i]["LatestNo"]);
                $("#txt_bm_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateMemo() {
    if (ValidateUpdateMemo()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "19";
        var prefix = $("#txt_bm_prefix").val();
        var description = $("#txt_bm_description").val();
        var automatic = false;
        var latest = $("#txt_bm_latest").val();
        var next = $("#txt_bm_next").val();

        if ($('#chk_bm_automatic').is(":checked")) {
            automatic = true;
        }

        var data_transfer = "{'id':'{0}',  'prefix':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}'}"
                    .f(id, prefix, description, automatic, latest, next);

        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                $("#dp").removeAttr("class", "active");
                $("#wd").removeAttr("class", "active");
                $("#rt").removeAttr("class", "active");
                $("#ds").removeAttr("class", "active");
                $("#bm").removeAttr("class", "active");



                $("#dp").attr("class", "active");

                SubMenuDisplay('dp');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateMemo() {
    var prefix_initial = $("#txt_bm_prefix").val();
    var description = $("#txt_bm_description").val();
    var latest_no = $("#txt_bm_latest").val();
    var next_no = $("#txt_bm_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No required! <br>";
    }

    if (next_no == "") {
        message += "Next No required! <br>";
    }


    //-------------------------
    if (message == "") {
        return true
    }
    else {

        alert(message);
        return false;
    }

}

//----------Discounting

function LoadDiscounting() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'18', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_ds_prefix").val(data[i]["Prefix"]);
                $("#txt_ds_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_ds_automatic").attr('checked', 'checked');
                }

                $("#txt_ds_latest").val(data[i]["LatestNo"]);
                $("#txt_ds_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateDiscounting() {
    if (ValidateUpdateDiscounting()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "18";
        var prefix = $("#txt_ds_prefix").val();
        var description = $("#txt_ds_description").val();
        var automatic = false;
        var latest = $("#txt_ds_latest").val();
        var next = $("#txt_ds_next").val();

        if ($('#chk_ds_automatic').is(":checked")) {
            automatic = true;
        }

        var data_transfer = "{'id':'{0}',  'prefix':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}'}"
                    .f(id, prefix, description, automatic, latest, next);

        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                $("#dp").removeAttr("class", "active");
                $("#wd").removeAttr("class", "active");
                $("#rt").removeAttr("class", "active");
                $("#ds").removeAttr("class", "active");
                $("#bm").removeAttr("class", "active");



                $("#bm").attr("class", "active");

                SubMenuDisplay('bm');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateDiscounting() {
    var prefix_initial = $("#txt_ds_prefix").val();
    var description = $("#txt_ds_description").val();
    var latest_no = $("#txt_ds_latest").val();
    var next_no = $("#txt_ds_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No required! <br>";
    }

    if (next_no == "") {
        message += "Next No required! <br>";
    }


    //-------------------------
    if (message == "") {
        return true
    }
    else {

        alert(message);
        return false;
    }

}


//----------Return

function LoadReturn() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'17', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_rt_prefix").val(data[i]["Prefix"]);
                $("#txt_rt_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_rt_automatic").attr('checked', 'checked');
                }

                $("#txt_rt_latest").val(data[i]["LatestNo"]);
                $("#txt_rt_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateReturn() {
    if (ValidateUpdateReturn()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "17";
        var prefix = $("#txt_rt_prefix").val();
        var description = $("#txt_rt_description").val();
        var automatic = false;
        var latest = $("#txt_rt_latest").val();
        var next = $("#txt_rt_next").val();

        if ($('#chk_rt_automatic').is(":checked")) {
            automatic = true;
        }

        var data_transfer = "{'id':'{0}',  'prefix':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}'}"
                    .f(id, prefix, description, automatic, latest, next);

        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                $("#dp").removeAttr("class", "active");
                $("#wd").removeAttr("class", "active");
                $("#rt").removeAttr("class", "active");
                $("#ds").removeAttr("class", "active");
                $("#bm").removeAttr("class", "active");



                $("#ds").attr("class", "active");

                SubMenuDisplay('ds');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateReturn() {
    var prefix_initial = $("#txt_rt_prefix").val();
    var description = $("#txt_rt_description").val();
    var latest_no = $("#txt_rt_latest").val();
    var next_no = $("#txt_rt_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No required! <br>";
    }

    if (next_no == "") {
        message += "Next No required! <br>";
    }


    //-------------------------
    if (message == "") {
        return true
    }
    else {

        alert(message);
        return false;
    }

}

//----------Withdrawal

function LoadWithdrawal() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'16', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_wd_prefix").val(data[i]["Prefix"]);
                $("#txt_wd_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_wd_automatic").attr('checked', 'checked');
                }

                $("#txt_wd_latest").val(data[i]["LatestNo"]);
                $("#txt_wd_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateWithdrawal() {
    if (ValidateUpdateWithdrawal()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "16";
        var prefix = $("#txt_wd_prefix").val();
        var description = $("#txt_wd_description").val();
        var automatic = false;
        var latest = $("#txt_wd_latest").val();
        var next = $("#txt_wd_next").val();

        if ($('#chk_wd_automatic').is(":checked")) {
            automatic = true;
        }

        var data_transfer = "{'id':'{0}',  'prefix':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}'}"
                    .f(id, prefix, description, automatic, latest, next);

        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                $("#dp").removeAttr("class", "active");
                $("#wd").removeAttr("class", "active");
                $("#rt").removeAttr("class", "active");
                $("#ds").removeAttr("class", "active");
                $("#bm").removeAttr("class", "active");



                $("#rt").attr("class", "active");

                SubMenuDisplay('rt');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateWithdrawal() {
    var prefix_initial = $("#txt_wd_prefix").val();
    var description = $("#txt_wd_description").val();
    var latest_no = $("#txt_wd_latest").val();
    var next_no = $("#txt_wd_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No required! <br>";
    }

    if (next_no == "") {
        message += "Next No required! <br>";
    }


    //-------------------------
    if (message == "") {
        return true
    }
    else {

        alert(message);
        return false;
    }

}

//----------Deposit

function LoadDeposit() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'15', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_dp_prefix").val(data[i]["Prefix"]);
                $("#txt_dp_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_dp_automatic").attr('checked', 'checked');
                }

                $("#txt_dp_latest").val(data[i]["LatestNo"]);
                $("#txt_dp_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateDeposit() {
    if (ValidateUpdateDeposit()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "15";
        var prefix = $("#txt_dp_prefix").val();
        var description = $("#txt_dp_description").val();
        var automatic = false;
        var latest = $("#txt_dp_latest").val();
        var next = $("#txt_dp_next").val();

        if ($('#chk_dp_automatic').is(":checked")) {
            automatic = true;
        }

        var data_transfer = "{'id':'{0}',  'prefix':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}'}"
                    .f(id, prefix, description, automatic, latest, next);

        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                $("#dp").removeAttr("class", "active");
                $("#wd").removeAttr("class", "active");
                $("#rt").removeAttr("class", "active");
                $("#ds").removeAttr("class", "active");
                $("#bm").removeAttr("class", "active");



                $("#wd").attr("class", "active");

                SubMenuDisplay('wd');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateDeposit() {
    var prefix_initial = $("#txt_dp_prefix").val();
    var description = $("#txt_dp_description").val();
    var latest_no = $("#txt_dp_latest").val();
    var next_no = $("#txt_dp_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No required! <br>";
    }

    if (next_no == "") {
        message += "Next No required! <br>";
    }


    //-------------------------
    if (message == "") {
        return true
    }
    else {


        Popup.showModal("vDeposit");
        $("#vDepositData").html(message);

        //Popup.hide("");
        return false;
    }

}