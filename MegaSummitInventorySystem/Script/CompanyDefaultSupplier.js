/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

$(document).ready(function () {


    //Load Province Region
    var pageUrl = '/Webservice/svr_Region.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRegion",
        //SelectProductDepartment(long id, string product_department_name)
        data: "{'id':'0','region_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $("#ddl_region_province").empty();

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#ddl_region_province").append("<option value='" + data[i]["ID"] + "'>" + data[i]["RegionName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

    ////--------------------------------------
    var pageUrlTerms = '/Webservice/svr_Terms.asmx';
    $.ajax({
        type: "POST",
        url: pageUrlTerms + "/SelectTerm",
        //SelectProductDepartment(long id, string product_department_name)
        data: "{'id':'0','term_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $("#ddl_terms").empty();

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#ddl_terms").append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

    ///-------------------------------------

    var pageUrlDefaultSupplier = '/Webservice/svr_SupplierSetting.asmx';
    $.ajax({
        type: "POST",
        url: pageUrlDefaultSupplier + "/SelectSupplierSetting",
        //SelectSupplierSetting(long id, long company_id, long region_province_id, long term_id, string payment_method, int day_cancellation)
        data: "{ 'id':'1' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#ddl_region_province").val(data[i]["RegionProvinceID"]);
                $("#ddl_terms").val(data[i]["TermID"]);
                $("#ddl_payment_method").val(data[i]["PaymentMethod"]);
                $("#txt_days_of_cancellation").val(data[i]["DayCancellation"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });



    $("#btn-save").click(function () {

        var id = 1;
        var company_id = 0;
        var region_id = $("#ddl_region_province").val();
        var term_id = $("#ddl_terms").val();
        var payment_method = $("#ddl_payment_method").val();
        var cancellation_date = $("#txt_days_of_cancellation").val();

        var data_transfer = "{ 'id':'{0}',  'company_id':'{1}',  'region_province_id':'{2}',  'term_id':'{3}',  'payment_method':'{4}',  'day_cancellation':'{5}'}"
               .f(id, company_id, region_id, term_id,payment_method,cancellation_date);


        $.ajax({
            type: "POST",
            url: "/Webservice/svr_SupplierSetting.asmx" + "/UpdateSupplierSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                window.location.href = "aspnetCompany-Defaults-Employee.aspx";
            },
            error: function (response) {
                alert(response.status);
            }
        });


    });



});