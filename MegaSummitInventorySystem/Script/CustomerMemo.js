/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />





function LoadCustomer() {

    var pageUrl = '/Webservice/svr_Customer.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCustomer",

        data: "{'id':'0','customer_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {



            $('#customer_name').empty();
            $('#customer_name').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#customer_name').append("<option value='" + data[i]["ID"] + "'>" + data[i]["CustomerName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}