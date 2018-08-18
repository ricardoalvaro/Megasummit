
/// <reference path="Helper.js" />
/// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
//--------Need refactoring----------

var CustomerID = 0;

$(document).ready(function () {

    Fill();
    var helper = new Helper();

    CustomerID = Number(helper.GetQuerystring()["customerID"]);
    if (!$.isNumeric(CustomerID) || CustomerID <= 0) {
        CustomerID = 0;
    }
    else {
        $('#btn-delete').removeClass('disabled');
        $('#btn-delete').click(function () { DeleteCustomer(CustomerID, this); });
    }


    if ($.trim(CustomerID) != 0) { ActionSelectSingleCustomer(CustomerID); }

    $('#btn-save').removeClass('disabled');

    $('#btn-save').click(function () { SaveCustomer(CustomerID, this); });


    $("#btn-opening-balance").click(function () {
        if (CustomerID > 0) {
            window.location = "aspnetCustomerInformationOpeningBalance.aspx?customerID=" + CustomerID;
        }
    });

});

function SaveCustomer(customer_id, me)
{
    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Customer.asmx';
        var id = customer_id;
        var customer_name = $("#customer_name").val();
        var address = $("#address").val();
        var contact_person = $("#contact_person").val();
        var region_province = $("#region_province").val();
        var municipality = $("#municipality").val();
        var business_phone = $("#business_phone").val();
        var home_phone = $("#home_phone").val();
        var fax = $("#fax").val();
        var mobile_phone = $("#mobile_phone").val();
        var notes = $("#notes").val();
        var ship_to = $("#ship_to").val();
        var price_level = $("#price_level").val();
        var status = $("#status").val();
        var tin_number = $("#tin_number").val();
        var vat_number = $("#vat_number").val();
        var salesman = $("#salesman").val();
        var terms = $("#terms").val();
        var credit_limit = ($("#credit_limit").val() == '') ? '0' : $("#credit_limit").val();

    
        if (id == 0) {

            var data_transfer = "{'customer_name':'{0}', 'address':'{1}','contact_person':'{2}','region_id':'{3}','municipality_id':'{4}','business_phone':'{5}','home_phone':'{6}','fax':'{7}','mobile_phone':'{8}','notes':'{9}','ship_to_id':'{10}','price_level':'{11}','status':'{12}','tin_no':'{13}','vat_no':'{14}','salesman_id':'{15}','term_id':'{16}','credit_limit':'{17}'}"
                    .f(customer_name, address, contact_person, region_province, municipality, business_phone, home_phone, fax, mobile_phone, notes, ship_to, price_level, status, tin_number, vat_number, salesman, terms, credit_limit);

            $.ajax({ type: "POST",url: pageUrl + "/InsertCustomer",data: data_transfer,contentType: "application/json; charset=utf-8",
                dataType: "json", crossdomain: true,
                success: function (response) {

                    window.location.href = "aspnetCustomerInformation.aspx?customerID=" + response.d;

                }, error: function (response) { alert(response.status); }
            });

        } else {
           
            var data_transfer = "{'id':'{0}','customer_name':'{1}', 'address':'{2}','contact_person':'{3}','region_id':'{4}','municipality_id':'{5}','business_phone':'{6}','home_phone':'{7}','fax':'{8}','mobile_phone':'{9}','notes':'{10}','ship_to_id':'{11}','price_level':'{12}','status':'{13}','tin_no':'{14}','vat_no':'{15}','salesman_id':'{16}','term_id':'{17}','credit_limit':'{18}'}"
                    .f(id, customer_name, address, contact_person, region_province, municipality, business_phone, home_phone, fax, mobile_phone, notes, ship_to, price_level, status, tin_number, vat_number, salesman, terms, credit_limit);

            $.ajax({ type: "POST", url: pageUrl + "/UpdateCustomer", data: data_transfer, contentType: "application/json; charset=utf-8",
                dataType: "json", crossdomain: true,
                success: function (response) {
                
                    window.location.href = "aspnetCustomerInformation.aspx?customerID=" + id;
                },
                error: function (response) { alert(response.status); }
            });
        }
    }
}

function ActionSelectSingleCustomer(customer_id)
{
    var helper = new Helper();
    var data = CustomerSingleData;
    var municipality_id = 0;
    var region_id = 0;
    for (var i = 0; i < data.length; i++) {


        $("#customer_name").val(data[i]["CustomerName"]);
        $("#address").val(data[i]["Address"]);
        $("#contact_person").val(data[i]["ContactPerson"]);
        $("#region_province").val(data[i]["RegionID"]);

        municipality_id = data[i]["MunicipalityID"];
        region_id = data[i]["RegionID"];

        $("#business_phone").val(data[i]["BusinessPhone"]);
        $("#home_phone").val(data[i]["HomePhone"]);
        $("#fax").val(data[i]["Fax"]);
        $("#mobile_phone").val(data[i]["MobilePhone"]);
        $("#notes").val(data[i]["Notes"]);
        $("#ship_to option:selected").val(data[i]["ShipToID"]);
        $("#price_level option:selected").text(data[i]["PriceLevel"]);
        $("#status option:selected").val(data[i]["Status"]);
        $("#tin_number").val(data[i]["TinNo"]);
        $("#vat_number").val(data[i]["VatNo"]);
        $("#salesman").val(data[i]["SalesmanID"]);
        $("#terms").val(data[i]["TermID"]);
        $("#credit_limit").val(data[i]["CreditLimit"]);
        $("#customer_since").val(helper.FormatDate(data[i]["DateCreated"]));
        //$("#txt_forwarder_name").val(data[i]["ForwardedName"]);
        //$("#txt_address").val(data[i]["Address"]);
        //$("#txt_contact_person").val(data[i]["ContactPerson"]);
        //$("#txt_telephone").val(data[i]["Telephone"]);
        //$("#txt_mobile_phone").val(data[i]["MobilePhone"]);
        //$("#txt_fax").val(data[i]["Fax"]);
        //$("#ddl_status").val(data[i]["Status"]);
        //$("#txt_area").val(data[i]["Area"]);

    }

    FillMunicipalityPerRegion(region_id);
    $("#municipality").val(municipality_id);





}

function DeleteCustomer(customer_id, me)
{
    alert(customer_id);
}


function Fill()
{
    FillRegion();
    FillForwarder();
    FillSalesMan();
    FillTerms();
    fillSetting();
}

function FillRegion()
{
    var data = RegionData;

    $('#region_province').empty();

    for (var i = 0; i < data.length; i++) {
        $('#region_province').append("<option value='" + RegionData[i]["ID"] + "'>" + RegionData[i]["RegionName"] + "</option>");
    }

    FillMunicipalityPerRegion($('#region_province').val());

    $('#region_province').change(function () { FillMunicipalityPerRegion($('#region_province').val()); });
  
}

function FillMunicipalityPerRegion(id) {

    if (id == '' || id == null) {
        id = $('#region_province').val();
    }

    var data = MunicipalityData;
    var table = $("#municipality"); table.empty();
   
    //alert(id);

    for (var i = 0; i < data.length; i++) {

        if (id == Number(data[i]["RegionID"])) {

            table.append("<option value='" + data[i]["ID"] + "'  >" + data[i]["MunicipalityName"] + "</option>");
        }


    }

}

function FillForwarder() {
    $('#ship_to').empty();
    var data = ForwarderData;
    for (var i = 0; i < data.length; i++) {

        $('#ship_to').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ForwardedName"] + "</option>");

    }
}

function FillSalesMan() {

    $('#salesman').empty();
    var data = EmployeeData;
    for (var i = 0; i < data.length; i++) {
       
        if (data[i]["EmployeeType"] == "Salesman") {
            $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");
        }

    }
}

function FillTerms() {

    $('#terms').empty();
    var data = TermData;
    for (var i = 0; i < data.length; i++) {
        $('#terms').append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>");
    }
}


function fillSetting()
{
    var data = SettingData;

    for (var i = 0; i < data.length; i++) {
        $('#price_level option:selected ').text(data[i]["PriceLevel"]);
        $("#status option:selected").text(data[i]["Status"]);
        $("#credit_limit").val(data[i]["Credit"]);
        $("#terms option:selected").val(data[i]["TermsID"]);
    }

}

