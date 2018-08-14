/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />



//----------Openign Balance

function LoadOpeningBalance() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'14', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_ob_prefix").val(data[i]["Prefix"]);
                $("#txt_ob_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_ob_automatic").attr('checked', 'checked');
                }

                $("#txt_ob_latest").val(data[i]["LatestNo"]);
                $("#txt_ob_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateOpeningBalance() {
    if (ValidateUpdateOpeningBalance()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "14";
        var prefix = $("#txt_ob_prefix").val();
        var description = $("#txt_ob_description").val();
        var automatic = false;
        var latest = $("#txt_ob_latest").val();
        var next = $("#txt_ob_next").val();

        if ($('#chk_ob_automatic').is(":checked")) {
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

                $("#as").removeAttr("class", "active");
                $("#ia").removeAttr("class", "active");
                $("#ob").removeAttr("class", "active");

                $("#as").attr("class", "active");
                SubMenuDisplay('as');

            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateOpeningBalance() {
    var prefix_initial = $("#txt_ob_prefix").val();
    var description = $("#txt_ob_description").val();
    var latest_no = $("#txt_ob_latest").val();
    var next_no = $("#txt_ob_next").val();

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


//----------Inventory Adjustment

function LoadInventoryAdjustment() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'13', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_ia_prefix").val(data[i]["Prefix"]);
                $("#txt_ia_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_ia_automatic").attr('checked', 'checked');
                }

                $("#txt_ia_latest").val(data[i]["LatestNo"]);
                $("#txt_ia_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateInventoryAdjustment() {
    if (ValidateUpdateInventoryAdjustment()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "13";
        var prefix = $("#txt_ia_prefix").val();
        var description = $("#txt_ia_description").val();
        var automatic = false;
        var latest = $("#txt_ia_latest").val();
        var next = $("#txt_ia_next").val();

        if ($('#chk_ia_automatic').is(":checked")) {
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

                $("#as").removeAttr("class", "active");
                $("#ia").removeAttr("class", "active");
                $("#ob").removeAttr("class", "active");

                $("#ob").attr("class", "active");
                SubMenuDisplay('ob');

            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateInventoryAdjustment() {
    var prefix_initial = $("#txt_ia_prefix").val();
    var description = $("#txt_ia_description").val();
    var latest_no = $("#txt_ia_latest").val();
    var next_no = $("#txt_ia_next").val();

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


//----------Assemble

function LoadAssemble() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'12', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_as_prefix").val(data[i]["Prefix"]);
                $("#txt_as_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_as_automatic").attr('checked', 'checked');
                }

                $("#txt_as_latest").val(data[i]["LatestNo"]);
                $("#txt_as_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateAssemble() {
    if (ValidateUpdateAssemble()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "12";
        var prefix = $("#txt_as_prefix").val();
        var description = $("#txt_as_description").val();
        var automatic = false;
        var latest = $("#txt_as_latest").val();
        var next = $("#txt_as_next").val();

        if ($('#chk_as_automatic').is(":checked")) {
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

                $("#as").removeAttr("class", "active");
                $("#ia").removeAttr("class", "active");
                $("#ob").removeAttr("class", "active");

                $("#ia").attr("class", "active");
                SubMenuDisplay('ia');

            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateAssemble() {
    var prefix_initial = $("#txt_as_prefix").val();
    var description = $("#txt_as_description").val();
    var latest_no = $("#txt_as_latest").val();
    var next_no = $("#txt_as_next").val();

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
