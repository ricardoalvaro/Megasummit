/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />


//----------Supplier Memo

function LoadSupplierMemo() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'8', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_sm_prefix").val(data[i]["Prefix"]);
                $("#txt_sm_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_sm_automatic").attr('checked', 'checked');
                }

                $("#txt_sm_latest").val(data[i]["LatestNo"]);
                $("#txt_sm_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateSupplierMemo() {
    if (ValidateUpdateSupplierMemo()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "8";
        var prefix = $("#txt_sm_prefix").val();
        var description = $("#txt_sm_description").val();
        var automatic = false;
        var latest = $("#txt_sm_latest").val();
        var next = $("#txt_sm_next").val();

        if ($('#chk_sm_automatic').is(":checked")) {
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

                $("#pr").removeAttr("class", "active");
                $("#po").removeAttr("class", "active");
                $("#sv").removeAttr("class", "active");
                $("#sm").removeAttr("class", "active");

                $("#pr").attr("class", "active");

                SubMenuDisplay('pr');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateSupplierMemo() {
    var prefix_initial = $("#txt_sm_prefix").val();
    var description = $("#txt_sm_description").val();
    var latest_no = $("#txt_sm_latest").val();
    var next_no = $("#txt_sm_next").val();

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


//----------Supplier Voucher

function LoadVoucherOrder() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'7', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_vo_prefix").val(data[i]["Prefix"]);
                $("#txt_vo_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_vo_automatic").attr('checked', 'checked');
                }

                $("#txt_vo_latest").val(data[i]["LatestNo"]);
                $("#txt_vo_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateVoucherOrder() {
    if (ValidateUpdateVoucherOrder()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "7";
        var prefix = $("#txt_vo_prefix").val();
        var description = $("#txt_vo_description").val();
        var automatic = false;
        var latest = $("#txt_vo_latest").val();
        var next = $("#txt_vo_next").val();

        if ($('#chk_vo_automatic').is(":checked")) {
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

                $("#pr").removeAttr("class", "active");
                $("#po").removeAttr("class", "active");
                $("#sv").removeAttr("class", "active");
                $("#sm").removeAttr("class", "active");

                $("#sm").attr("class", "active");

                SubMenuDisplay('sm');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateVoucherOrder() {
    var prefix_initial = $("#txt_vo_prefix").val();
    var description = $("#txt_vo_description").val();
    var latest_no = $("#txt_vo_latest").val();
    var next_no = $("#txt_vo_next").val();

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


//----------Purchase Order

function LoadPurchaseOrder() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'6', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_po_prefix").val(data[i]["Prefix"]);
                $("#txt_po_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_po_automatic").attr('checked', 'checked');
                }

                $("#txt_po_latest").val(data[i]["LatestNo"]);
                $("#txt_po_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdatePurchaseOrder() {
    if (ValidateUpdatePurchaseOrder()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "6";
        var prefix = $("#txt_po_prefix").val();
        var description = $("#txt_po_description").val();
        var automatic = false;
        var latest = $("#txt_po_latest").val();
        var next = $("#txt_po_next").val();

        if ($('#chk_po_automatic').is(":checked")) {
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

                $("#pr").removeAttr("class", "active");
                $("#po").removeAttr("class", "active");
                $("#sv").removeAttr("class", "active");
                $("#sm").removeAttr("class", "active");

                $("#sv").attr("class", "active");

                SubMenuDisplay('sv');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdatePurchaseOrder() {
    var prefix_initial = $("#txt_po_prefix").val();
    var description = $("#txt_po_description").val();
    var latest_no = $("#txt_po_latest").val();
    var next_no = $("#txt_po_next").val();

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

//----------Purchase Return

function LoadPurchaseReturn() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'5', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_pr_prefix").val(data[i]["Prefix"]);
                $("#txt_pr_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_pr_automatic").attr('checked', 'checked');
                }

                $("#txt_pr_latest").val(data[i]["LatestNo"]);
                $("#txt_pr_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdatePurchaseReturn() {
    if (ValidateUpdatePurchaseReturn()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "5";
        var prefix = $("#txt_pr_prefix").val();
        var description = $("#txt_pr_description").val();
        var automatic = false;
        var latest = $("#txt_pr_latest").val();
        var next = $("#txt_pr_next").val();

        if ($('#chk_pr_automatic').is(":checked")) {
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

                $("#pr").removeAttr("class", "active");
                $("#po").removeAttr("class", "active");
                $("#sv").removeAttr("class", "active");
                $("#sm").removeAttr("class", "active");

                $("#po").attr("class", "active");

                SubMenuDisplay('po');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdatePurchaseReturn() {
    var prefix_initial = $("#txt_pr_prefix").val();
    var description = $("#txt_pr_description").val();
    var latest_no = $("#txt_pr_latest").val();
    var next_no = $("#txt_pr_next").val();

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





