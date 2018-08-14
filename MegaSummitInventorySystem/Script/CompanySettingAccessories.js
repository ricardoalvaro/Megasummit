/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />




function LoadCounterReceipt() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'23', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_cr_prefix").val(data[i]["Prefix"]);
                $("#txt_cr_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_cr_automatic").attr('checked', 'checked');
                }

                $("#txt_cr_latest").val(data[i]["LatestNo"]);
                $("#txt_cr_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateCounterReceipt() {
    var pageUrl = '/Webservice/svr_Setting.asmx';
    var id = "23";
    var prefix = $("#txt_cr_prefix").val();
    var description = $("#txt_cr_description").val();
    var automatic = false;
    var latest = $("#txt_cr_latest").val();
    var next = $("#txt_cr_next").val();

    if ($('#chk_cr_automatic').is(":checked")) {
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

            $("#pl").removeAttr("class", "active");
            $("#pu").removeAttr("class", "active");
            $("#cr").removeAttr("class", "active");



            $("#pl").attr("class", "active");

            SubMenuDisplay('pl');
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

//-----------------------------

function LoadPickUpSlip() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'22', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_pu_prefix").val(data[i]["Prefix"]);
                $("#txt_pu_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_pu_automatic").attr('checked', 'checked');
                }

                $("#txt_pu_latest").val(data[i]["LatestNo"]);
                $("#txt_pu_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdatePickUpSlip() {
    var pageUrl = '/Webservice/svr_Setting.asmx';
    var id = "22";
    var prefix = $("#txt_pu_prefix").val();
    var description = $("#txt_pu_description").val();
    var automatic = false;
    var latest = $("#txt_pu_latest").val();
    var next = $("#txt_pu_next").val();

    if ($('#chk_pu_automatic').is(":checked")) {
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

            $("#pl").removeAttr("class", "active");
            $("#pu").removeAttr("class", "active");
            $("#cr").removeAttr("class", "active");



            $("#cr").attr("class", "active");

            SubMenuDisplay('cr');
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

//--------------------------------

function LoadPackingList() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'21', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_pl_prefix").val(data[i]["Prefix"]);
                $("#txt_pl_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_pl_automatic").attr('checked', 'checked');
                }

                $("#txt_pl_latest").val(data[i]["LatestNo"]);
                $("#txt_pl_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdatePackingList() {
    var pageUrl = '/Webservice/svr_Setting.asmx';
    var id = "21";
    var prefix = $("#txt_pl_prefix").val();
    var description = $("#txt_pl_description").val();
    var automatic = false;
    var latest = $("#txt_pl_latest").val();
    var next = $("#txt_pl_next").val();

    if ($('#chk_pl_automatic').is(":checked")) {
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

            $("#pl").removeAttr("class", "active");
            $("#pu").removeAttr("class", "active");
            $("#cr").removeAttr("class", "active");
            


            $("#pu").attr("class", "active");

            SubMenuDisplay('pu');
        },
        error: function (response) {
            alert(response.status);
        }
    });
}