/// <reference path="js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------


var SupplierID = 0;

$(document).ready(function () {

    Fill();
    var helper = new Helper();

    SupplierID = Number(helper.GetQuerystring()["supplierID"]);
    if (!$.isNumeric(SupplierID) || SupplierID <= 0) {
        SupplierID = 0;
    }
    else {
        $('#btn-delete').removeClass('disabled');
        $('#btn-delete').click(function ()
        {
            DeleteSupplier(SupplierID, this);
        });
    }


    if ($.trim(SupplierID) != 0)
    {
        ActionSelectSingleSupplier(SupplierID);
    }

    $('#btn-save').removeClass('disabled');

    $('#btn-save').click(function () {
        SaveSupplier(SupplierID, this);
    });


    $("#btn-opening-balance").click(function () {
        //if (CustomerID > 0) {
        //    window.location = "aspnetCustomerInformationOpeningBalance.aspx?customerID=" + CustomerID;
        //}
    });

});



function SaveSupplier(supplier_id, me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Supplier.asmx';

        var id = supplier_id;
        var supplier_name = $("#supplier_name").val();
        var address = $("#address").val();
        var contact_person = $("#contact_person").val();
        var region_province = $("#region_province").val();
        var municipality = $("#municipality").val();
        var business_phone1 = $("#business_phone1").val();
        var business_phone2 = $("#business_phone2").val();
        var fax = $("#fax").val();
        var mobile_phone = $("#mobile_phone").val();
        var notes = $("#notes").val();
        var reference_initial = $("#reference_initial").val();
        var tin_number = $("#tin_number").val();
        var vat_number = $("#vat_number").val();
        var salesman = $("#salesman").val();
        var terms = $("#terms").val();



        if (id == 0) {

            var data_transfer = "{'supplier_name':'{0}', 'address':'{1}','contact_person':'{2}','region_province':'{3}','municipality':'{4}','business_phone1':'{5}','business_phone2':'{6}','fax':'{7}','mobile_phone':'{8}','notes':'{9}','reference_initial':'{10}','tin_number':'{11}','vat_number':'{12}','salesman':'{13}','terms':'{14}'}"
                                  .f(supplier_name, address, contact_person, region_province, municipality, business_phone1, business_phone2, fax, mobile_phone, notes, reference_initial, tin_number, vat_number, salesman, terms);

            $.ajax({
                type: "POST",url: pageUrl + "/InsertSupplier",data: data_transfer,contentType: "application/json; charset=utf-8",
                dataType: "json",crossdomain: true,
                success: function (response) {
                    window.location = 'aspnetSupplierInformation.aspx?supplierID=' + response.d;

                },
                error: function (response) {
                    alert(response.status);
                }
            });



        } else {

            var data_transfer = "{'id':'{0}', 'supplier_name':'{1}', 'address':'{2}','contact_person':'{3}','region_province':'{4}','municipality':'{5}','business_phone1':'{6}','business_phone2':'{7}','fax':'{8}','mobile_phone':'{9}','notes':'{10}','reference_initial':'{11}','tin_number':'{12}','vat_number':'{13}','salesman':'{14}','terms':'{15}'}"
                                 .f(id, supplier_name, address, contact_person, region_province, municipality, business_phone1, business_phone2, fax, mobile_phone, notes, reference_initial, tin_number, vat_number, salesman, terms);

            $.ajax({
                type: "POST", url: pageUrl + "/UpdateSupplier", data: data_transfer, contentType: "application/json; charset=utf-8",
                dataType: "json", crossdomain: true,
                success: function (response) {
                    window.location = 'aspnetSupplierInformation.aspx?supplierID=' + response.d;
                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }
    }
}



function ActionSelectSingleSupplier(supplier_id) {
    var helper = new Helper();
    var data = SupplierSingleData;
    var municipality_id = 0;
    var region_id = 0;

    //alert('x');
    for (var i = 0; i < data.length; i++) {


        $("#supplier_name").val(data[i]["SupplierName"]);
        $("#address").val(data[i]["Address"]);
        $("#contact_person").val(data[i]["ContactPerson"]);
        $("#region_province").val(data[i]["RegionID"]);

        municipality_id = data[i]["MunicipalityID"];
        region_id = data[i]["RegionID"];

        $("#business_phone1").val(data[i]["BusinessPhone1"]);
        $("#business_phone2").val(data[i]["BusinessPhone2"]);
        $("#home_phone").val(data[i]["HomePhone"]);
        $("#fax").val(data[i]["Fax"]);
        $("#mobile_phone").val(data[i]["Mobile"]);
        $("#notes").val(data[i]["Notes"]);

        $("#reference_initial").val(data[i]["ReferenceInitial"]);
        $("#mobile_phone").text(data[i]["Mobile"]);
        //$("#status option:selected").val(data[i]["Status"]);


        $("#tin_number").val(data[i]["TinNo"]);
        $("#vat_number").val(data[i]["VatNo"]);
        $("#salesman").val(data[i]["SalesmanID"]);
        $("#terms").val(data[i]["TermID"]);

        //$("#customer_since").val(helper.FormatDate(data[i]["DateCreated"]));
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

function DeleteSupplier(supplier_id, me) {
    alert(supplier_id);
}


///------------------

function Fill() {
    FillRegion();
    FillSalesMan();
    FillTerms();
}

function FillRegion() {
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




