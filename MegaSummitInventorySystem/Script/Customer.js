
/// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
//--------Need refactoring----------

$(document).ready(function () {

    $('#btn-new').removeClass('disabled');
    $('#btn-find').removeClass('disabled');
    var table = $("#tblMain");
    table.append(defaultTableRow());
});


$("#btn-find").click(function () {
    var table = $("#tblMain");
    table.html(""); //Clear 

    table.append("<tr id='rec-1'><td width='100%'><input type='text'  id='txt_search_customer'  class='long search_class ui-autocomplete-input' style='border:transparent' /></td></tr>");

    table.append(defaultTableRow());

    CustomerAutoCompleteByName();
});


function CustomerAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Customer.asmx';
    $.ajax({
        type: "POST", url: pageUrl + "/AutoCompleteCustomer", data: "{  }", contentType: "application/json; charset=utf-8", dataType: "json",
        success: function (response) {
            $("#txt_search_customer").autocomplete({
                source: response.d, minLength: 0, minChars: 0, max: 12, autoFill: true, matchContains: false
            }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
        }, error: function (response) { alert(response.status); }

    });


    $("#txt_search_customer").autocomplete({
        select: function (a, b) {

            RedirectToGeneralInfomation(b.item.id)
        }
    });
}

function RedirectToGeneralInfomation(customer_id) {
    window.location = "aspnetCustomerInformation.aspx?customerID=" + customer_id;
}

//--------------------------

$("#btn-new").click(function () {
    window.location = "aspnetCustomerInformation.aspx";
});



function defaultTableRow() {

    var temp = "<tr>   <td width='100%'></td></tr>";
    var result = "";

    for (var i = 0; i < 30; i++) {
        result += temp;
    }

    return result;
}