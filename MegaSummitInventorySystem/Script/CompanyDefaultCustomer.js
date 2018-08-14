/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

$(document).ready(function () {


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

///-------------------------------

    var pageUrlSalesRef = '/Webservice/svr_SalesSetting.asmx';
    $.ajax({
        type: "POST",
        url: pageUrlSalesRef + "/SelectSalesSetting",
        //SelectSalesSetting(long id)
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $("#ddl_sales_reference").empty();

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#ddl_sales_reference").append("<option value='" + data[i]["ID"] + "'>" + data[i]["PrefixInitial"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });



var pageUrlCustomerDefault = '/Webservice/svr_CustomerSetting.asmx';
$.ajax({
    type: "POST",
    url: pageUrlCustomerDefault + "/SelectCustomerSetting",
    //SelectSalesSetting(long id)
    data: "{'id':'1' }",
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    crossdomain: true,
    success: function (response) {

       
        var data = eval(response.d);
        var obj = "";
        for (var i = 0; i < data.length; i++) {

            $("#ddl_price_level").val(data[i]["PriceLevel"] );
            $("#ddl_status").val(data[i]["Status"] );
            $("#ddl_terms").val(data[i]["TermsID"] );
            $("#txt_credit_limit").val(data[i]["Credit"] );
            $("#ddl_sales_reference").val(data[i]["SalesReference"] );
            $("#ddl_payment_method").val(data[i]["PaymentMethod"] );


        }


    },
    error: function (response) {
        alert(response.status);
    }

});



$("#btn-save").click(function () {

    var id = 1;
    var company_id = 0;
    var price_level =  $("#ddl_price_level").val();
    var status = $("#ddl_status").val();
    var term = $("#ddl_terms").val();
    var credit = $("#txt_credit_limit").val();
    var sr = $("#ddl_sales_reference").val();
    var method = $("#ddl_payment_method").val();

    var data_transfer = "{ 'id':'{0}',  'company_id':'{1}','price_level':'{2}',  'status':'{3}',  'term_id':'{4}',  'credit':'{5}',  'sales_reference':'{6}',  'payment_method':'{7}'}"
           .f(id, company_id, price_level, status, term, credit, sr, method);


    $.ajax({
        type: "POST",
        url: "/Webservice/svr_CustomerSetting.asmx" + "/UpdateCustomerSetting",
        data: data_transfer,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            window.location.href = "aspnetCompany-Defaults-Supplier.aspx";
        },
        error: function (response) {
            alert(response.status);
        }
    });


});









});