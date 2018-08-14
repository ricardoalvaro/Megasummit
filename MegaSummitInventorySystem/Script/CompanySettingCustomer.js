/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

//-------SALES


$('#access').change(function () {

    $("#cheight-105 tbody tr").each(function (i) {

        if ($("#access").is(':checked')) {
            $(this).find("td .nolbl").attr("checked", "true");
        }
        else {
            $(this).find("td .nolbl").removeAttr("checked");
        }

    });

});

 



var bl;
function  LoadSales() {

    $('#action_sales .save').addClass('disabled');
    $('#action_sales .delete').addClass('disabled');
    $('#action_sales .new').removeClass('disabled');
    $('#action_sales .find').removeClass('disabled');

    var pageUrl = '/Webservice/svr_SalesSetting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSalesSetting",
        data: "{ 'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xSales tbody').empty();
                var data = eval(response.d);
                var obj = "";
                for (var i = 0; i < data.length; i++) {

                    $('#xSales tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectSales('" + data[i]["ID"] + "')\">" + data[i]["PrefixInitial"] + "</div></td><td>" + data[i]["Description"] + "</td></tr>");

                }
            }
            bl = window.setInterval("loadBlankSales()", 300);


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Filling Table Blank Space
function loadBlankSales() {
    for (var i = 0; i < 30; i++) {
        $('#xSales tbody:last').append("<tr><td width='50%'><div >" + "" + "</div></td><td>" + "" + "</td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectSales(id) {
    $('#action_sales .save').removeClass('disabled');
    $('#action_sales .delete').removeClass('disabled');
    $('#action_sales .new').addClass('disabled');
    $('#action_sales .find').addClass('disabled');

    $("#hdn_sales_id").val(id);



    var pageUrl = '/Webservice/svr_SalesSetting.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSalesSetting",
        data: "{ 'id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

              
                $("#prefix_initial").val(data[i]["PrefixInitial"]);
                $("#description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#latest_number").attr('checked', 'checked');
                }

                $("#latest_number_sales").val(data[i]["LatestNo"]);
                $("#next_number").val(data[i]["NextNo"]);
                $("#maximum_lines").val(data[i]["MaximumLine"]);

            }

            LoadProductDepartment();
            //SelectDataRangeTaxes(id);

        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xSales").hide();
    $("#xSalesSearch").hide();
    $("#xSalesManage").show();

}

function LoadProductDepartment() {
    var sale_id = $("#hdn_sales_id").val();
    var pageUrl = '/Webservice/svr_ProductDepartment.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductDepartment",
        data: "{ 'id':'0', 'product_department_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#cheight-105 tbody");
            table.empty();
            var range_data = data;
            for (var i = 0; i < range_data.length; i++) {
                
             
                table.append("<tr><td width='65%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' />" + data[i]["ProductDepartmentName"] + "</td> <td width='35%' align='center'><input type='checkbox' class='nolbl' style='display: block;z-index: 9;position: relative;top: 4px;left: 33px;'><label for='access1'>&nbsp;</label></td></tr>");
            }

            for (var i = 0; i < 20; i++)//plus 50 rows
            {
                table.append("<tr><td width='65%'></td><td width='35%'></td></tr>");
            }

            //------------------------------------------------------------------

        

             
                $.ajax({
                    type: "POST",
                    url: "/Webservice/svr_SalesSettingProductDescription.asmx/SelectSalesSettingProductDescription",
                    data: "{ 'id':'0', 'sale_setting_id':'"+sale_id+"', 'product_department_id':'0'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        var data = eval(response.d);
                       

                        $("#cheight-105 tbody tr").each(function (i) {
                            var department_id = $(this).find("td .hdn").val()

                            for (var i = 0; i < data.length; i++) {

                                //alert(department_id + "   " + sale_id);
                                if (data[i]["ProductDepartmentID"] == department_id && data[i]["SalesSettingID"] == sale_id) {
                                    $(this).find("td .nolbl").attr("checked", "true");
                                    //alert(department_id + "   " + sale_id);
                                }

                            }

                        });

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });




       




        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionNewSales(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_sales_id").val('0');


        $("#prefix_initial").val('');
        $("#description").val('');

        $("#latest_number_sales").val('');
        $("#next_number").val('');
        $("#maximum_lines").val('');

        LoadProductDepartment();

        $('#action_sales .save').removeClass('disabled');
        $('#action_sales .delete').addClass('disabled');
        $('#action_sales .new').addClass('disabled');
        $('#action_sales .find').addClass('disabled');

        $("#xSales").hide();
        $("#xSalesSearch").hide();
        $("#xSalesManage").show();


    }
}

function ActionSaveUpdateSales(me) {

    GetSelectedBox();

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_SalesSetting.asmx';


        var id = $("#hdn_sales_id").val();

        var prefix = $("#prefix_initial").val();
        var description = $("#description").val();
        var automatic = false;
        var latest = $("#latest_number_sales").val();
        var next = $("#next_number").val();
        var max_line = $("#maximum_lines").val();

        if ($('#chk_cm_automatic').is(":checked")) {
            automatic = true;
        }

        var table_chunk = GetSelectedBox();

        if (id == '0') {
            var data_transfer = "{  'company_id':'{0}', 'prefix_initial':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}',  'maximum_line':'{6}', 'table_chunk':'{7}' }"
               .f(0, prefix, description, automatic, latest, next, max_line, table_chunk);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertSalesSetting",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadSales();
                    SubMenuDisplay('s');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{'id':'" + id + "',  'company_id':'{0}', 'prefix_initial':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}',  'maximum_line':'{6}', 'table_chunk':'{7}' }"
                .f(0, prefix, description, automatic, latest, next, max_line, table_chunk);



            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateSalesSetting",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadSales();
                    SubMenuDisplay('s');


                },
                error: function (response) {
                    alert(response.status);
                }
            });


      

        }



    }
}


function GetSelectedBox()
{
    var chunk = "";
    $("#cheight-105 tbody tr").each(function (i) {

        if ($(this).find(".nolbl").is(':checked'))
        {
            chunk += $(this).find(".hdn").val() + ',';
        }
    });

    return chunk;

}

function ActionDeleteSales(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_sales_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_SalesSetting.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteSalesSetting",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadSales();
                    SubMenuDisplay('s');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function SalesAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_SalesSetting.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteSales",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_sales_search").autocomplete({
                source: response.d,
                minLength: 0,
                minChars: 0,
                max: 12,
                autoFill: true,
                matchContains: false
            })

                .on('focus', function (event) {
                    var self = this;
                    $(self).autocomplete("search", "");
                });
        },

        error: function (response) {
            alert(response.status);
        }

    });


    $("#txt_sales_search").autocomplete({
        select: function (a, b) {

            ActionSelectContribution(b.item.id)
        }
    });
}

function ActionSearchSales(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_sales .save').addClass('disabled');
        $('#action_sales .delete').addClass('disabled');
        $('#action_sales .new').addClass('disabled');
        $('#action_sales .find').addClass('disabled');

        $("#xSales").hide();
        $("#xSalesManage").hide();
        $("#xSalesSearch").show();


        SalesAutoCompleteByName();
    }
}


//----------MEMO

function LoadMemo() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'4', 'setting_name':'' }",
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
        var id = "4";
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

                $("#sales").removeAttr("class", "active");
                $("#sales_receipt").removeAttr("class", "active");
                $("#sales_order").removeAttr("class", "active");
                $("#official_receipt").removeAttr("class", "active");
                $("#customer_receipt").removeAttr("class", "active");

                $("#sales").attr("class", "active");

                SubMenuDisplay('s');
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
        message += "Latest No. required! <br>";
    }

    if (next_no == "") {
        message += "Next No. required! <br>";
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

//----------OFFICIAL RECEIPT

function LoadOfficialReceipt() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'3', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_or_prefix").val(data[i]["Prefix"]);
                $("#txt_or_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_or_automatic").attr('checked', 'checked');
                }

                $("#txt_or_latest").val(data[i]["LatestNo"]);
                $("#txt_or_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateOfficialReceipt() {
    if (ValidateUpdateOfficialReceipt()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "3";
        var prefix = $("#txt_or_prefix").val();
        var description = $("#txt_or_description").val();
        var automatic = false;
        var latest = $("#txt_or_latest").val();
        var next = $("#txt_or_next").val();

        if ($('#chk_or_automatic').is(":checked")) {
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

                $("#sales").removeAttr("class", "active");
                $("#sales_receipt").removeAttr("class", "active");
                $("#sales_order").removeAttr("class", "active");
                $("#official_receipt").removeAttr("class", "active");
                $("#customer_receipt").removeAttr("class", "active");

                $("#customer_receipt").attr("class", "active");

                SubMenuDisplay('cm');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateOfficialReceipt() {
    var prefix_initial = $("#txt_or_prefix").val();
    var description = $("#txt_or_description").val();
    var latest_no = $("#txt_or_latest").val();
    var next_no = $("#txt_or_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No. required! <br>";
    }

    if (next_no == "") {
        message += "Next No. required! <br>";
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

//----------SALES ORDER

function LoadSalesOrder() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'2', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_so_prefix").val(data[i]["Prefix"]);
                $("#txt_so_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true) {
                    $("#chk_so_automatic").attr('checked', 'checked');
                }

                $("#txt_so_latest").val(data[i]["LatestNo"]);
                $("#txt_so_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateSalesOrder() {
    if (ValidateUpdateSalesOrder()) {
        var pageUrl = '/Webservice/svr_Setting.asmx';
        var id = "2";
        var prefix = $("#txt_so_prefix").val();
        var description = $("#txt_so_description").val();
        var automatic = false;
        var latest = $("#txt_so_latest").val();
        var next = $("#txt_so_next").val();

        if ($('#chk_so_automatic').is(":checked")) {
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

                $("#sales").removeAttr("class", "active");
                $("#sales_receipt").removeAttr("class", "active");
                $("#sales_order").removeAttr("class", "active");
                $("#official_receipt").removeAttr("class", "active");
                $("#customer_receipt").removeAttr("class", "active");

                $("#official_receipt").attr("class", "active");

                SubMenuDisplay('or');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function ValidateUpdateSalesOrder() {
    var prefix_initial = $("#txt_so_prefix").val();
    var description = $("#txt_so_description").val();
    var latest_no = $("#txt_so_latest").val();
    var next_no = $("#txt_so_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No. required! <br>";
    }

    if (next_no == "") {
        message += "Next No. required! <br>";
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

//----------SALES RETURN

function LoadSalesReturn() {
    var pageUrl = '/Webservice/svr_Setting.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'1', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

          
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_sr_prefix").val(data[i]["Prefix"]);
                $("#txt_sr_description").val(data[i]["Description"]);

                if (data[i]["Automatic"] == true)
                {
                    $("#chk_sr_automatic").attr('checked', 'checked');
                }

                $("#txt_sr_latest").val(data[i]["LatestNo"]);
                $("#txt_sr_next").val(data[i]["NextNo"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function UpdateSalesReturn()
{
    var pageUrl = '/Webservice/svr_Setting.asmx';
    var id = "1";
    var prefix =           $("#txt_sr_prefix").val();
    var description =      $("#txt_sr_description").val();
    var automatic =        false;
    var latest =           $("#txt_sr_latest").val();
    var next =             $("#txt_sr_next").val();

    if ($('#chk_sr_automatic').is(":checked")) {
        automatic = true;
    } 
    
    if (ValidateUpdateSalesReturn()) {
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

                $("#sales").removeAttr("class", "active");
                $("#sales_receipt").removeAttr("class", "active");
                $("#sales_order").removeAttr("class", "active");
                $("#official_receipt").removeAttr("class", "active");
                $("#customer_receipt").removeAttr("class", "active");

                $("#sales_order").attr("class", "active");

                SubMenuDisplay('or');
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

function SubMenuDisplay(display) {


    $("#xSales").hide();
    $("#action_sales").hide();

    $("#xSalesReturn").hide();
    $("#action_sales_return").hide();

    $("#xSalesOrder").hide();
    $("#xActionSalesOrder").hide();

    $("#xOfficialReceipt").hide();
    $("#action_official_receipt").hide();

    $("#xMemo").hide();
    $("#action_memo").hide();




    if (display == 's') {
        $("#xSales").show();
        $("#action_sales").show();
        LoadSales();
    }
    else if (display == 'sr') {
        LoadSalesReturn();
        $("#xSalesReturn").show();
        $("#action_sales_return").show();
    }
    else if (display == 'so') {
        LoadSalesOrder();
        $("#xSalesOrder").show();
        $("#xActionSalesOrder").show();
    }
    else if (display == 'or') {
        LoadOfficialReceipt();
        $("#xOfficialReceipt").show();
        $("#action_official_receipt").show();
    }
    else if (display == 'cm') {

        LoadMemo();
        $("#xMemo").show();
        $("#action_memo").show();
    }

}

function ValidateUpdateSalesReturn() {
    var prefix_initial = $("#txt_sr_prefix").val();
    var description = $("#txt_sr_description").val();
    var latest_no = $("#txt_sr_latest").val();
    var next_no = $("#txt_sr_next").val();

    var message = "";

    if (prefix_initial == "") {
        message += "Prefix Initial required! <br>";
    }

    if (description == "") {
        message += "Description required! <br>";
    }

    if (latest_no == "") {
        message += "Latest No. required! <br>";
    }

    if (next_no == "") {
        message += "Next No. required! <br>";
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
