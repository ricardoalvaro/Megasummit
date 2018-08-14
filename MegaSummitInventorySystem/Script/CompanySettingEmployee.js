/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />


//----------Memo

function LoadMemo() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'11', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_cm_prefix").val(data[i]["Prefix"]);
                $("#txt_cm_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_cm_automatic").attr('checked', 'checked');
                }

                $("#txt_cm_latest").val(data[i]["LatestNo"]);
                $("#txt_cm_next").val(data[i]["NextNo"]);

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
        var id = "11";
        var prefix = $("#txt_cm_prefix").val();
        var description = $("#txt_cm_description").val();
        var automatic = false;
        var latest = $("#txt_cm_latest").val();
        var next = $("#txt_cm_next").val();

        if ($('#chk_cm_automatic').is(":checked")) {
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

                $("#cv").removeAttr("class", "active");
                $("#ps").removeAttr("class", "active");
                $("#cm").removeAttr("class", "active");

                $("#cv").attr("class", "active");
                SubMenuDisplay('cv');

            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateMemo() {
    var prefix_initial = $("#txt_cm_prefix").val();
    var description = $("#txt_cm_description").val();
    var latest_no = $("#txt_cm_latest").val();
    var next_no = $("#txt_cm_next").val();

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


//----------PaySlip

function LoadPaySlip() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'10', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_ps_prefix").val(data[i]["Prefix"]);
                $("#txt_ps_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_ps_automatic").attr('checked', 'checked');
                }

                $("#txt_ps_latest").val(data[i]["LatestNo"]);
                $("#txt_ps_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdatePaySlip() {
    if (ValidateUpdatePaySlip()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "10";
        var prefix = $("#txt_ps_prefix").val();
        var description = $("#txt_ps_description").val();
        var automatic = false;
        var latest = $("#txt_ps_latest").val();
        var next = $("#txt_ps_next").val();

        if ($('#chk_ps_automatic').is(":checked")) {
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

                $("#cv").removeAttr("class", "active");
                $("#ps").removeAttr("class", "active");
                $("#cm").removeAttr("class", "active");

                $("#cm").attr("class", "active");
                SubMenuDisplay('cm');

            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdatePaySlip() {
    var prefix_initial = $("#txt_ps_prefix").val();
    var description = $("#txt_ps_description").val();
    var latest_no = $("#txt_ps_latest").val();
    var next_no = $("#txt_ps_next").val();

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


//----------Commission Voucher

function LoadCommissionVoucher() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'9', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_cv_prefix").val(data[i]["Prefix"]);
                $("#txt_cv_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_cv_automatic").attr('checked', 'checked');
                }

                $("#txt_cv_latest").val(data[i]["LatestNo"]);
                $("#txt_cv_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateCommissionVoucher() {
    if (ValidateUpdateCommissionVoucher()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "9";
        var prefix = $("#txt_cv_prefix").val();
        var description = $("#txt_cv_description").val();
        var automatic = false;
        var latest = $("#txt_cv_latest").val();
        var next = $("#txt_cv_next").val();

        if ($('#chk_cv_automatic').is(":checked")) {
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

                $("#cv").removeAttr("class", "active");
                $("#ps").removeAttr("class", "active");
                $("#cm").removeAttr("class", "active");

                $("#ps").attr("class", "active");
                SubMenuDisplay('ps');

            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateCommissionVoucher() {
    var prefix_initial = $("#txt_cv_prefix").val();
    var description = $("#txt_cv_description").val();
    var latest_no = $("#txt_cv_latest").val();
    var next_no = $("#txt_cv_next").val();

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