/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

$(document).ready(function () {

    //load Product Department

    var pageUrl = '/Webservice/svr_ProductDepartment.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductDepartment",
        //SelectProductDepartment(long id, string product_department_name)
        data: "{'id':'0','product_department_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $("#product_department").empty();

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#product_department").append("<option value='" + data[i]["ID"] + "'>" + data[i]["ProductDepartmentName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


    //load  Location

    var pageUrl_Location = '/Webservice/svr_Location.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl_Location + "/SelectLocation",
        //SelectLocation(long id, string location_name)
        data: "{'id':'0','location_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $("#location").empty();

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#location").append("<option value='" + data[i]["ID"] + "'>" + data[i]["LocationName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


    //load reason  of adjustment

    var pageUrl_reason = '/Webservice/svr_ReasonOfAdjustment.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl_reason + "/SelectReasonOfAdjustment",
        // SelectReasonOfAdjustment(long id, string adjustment_name)
        data: "{'id':'0','adjustment_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $("#reason_of_adjustment").empty();

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#reason_of_adjustment").append("<option value='" + data[i]["ID"] + "'>" + data[i]["ReasonName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


    // on load  data
    $.ajax({
        type: "POST",
        url: "/Webservice/svr_ProductSetting.asmx" + "/SelectProductSetting",
        data: "{'id':'1','company_id':'0','product_department_id':'0','location_id':'0' ,'reason_of_adjustment':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#reason_of_adjustment").val( data[i]["ReasonOfAdjustmentID"]);
                $("#location").val( data[i]["LocationID"]);
                $("#product_department").val( data[i]["ProductDepartmentID"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


    

    $("#btn-save").click(function () {

        var id = 1;
        var company_id = 0;
        var product_department_id = $("#product_department").val();
        var location_id =  $("#location").val();
        var reason_of_adjustment =   $("#reason_of_adjustment").val();

        var data_transfer = "{ 'id':'{0}','company_id':'{1}', 'product_department_id':'{2}', 'location_id':'{3}', 'reason_of_adjustment':'{4}'}"
               .f(id, company_id, product_department_id, location_id, reason_of_adjustment);


        $.ajax({
            type: "POST",
            url: "/Webservice/svr_ProductSetting.asmx" + "/UpdateProductSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                window.location.href = "aspnetCompany-Defaults.aspx";
            },
            error: function (response) {
                alert(response.status);
            }
        });
     
    });


});