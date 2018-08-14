/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />


//-----------------------------------------------

var bl;

//----------location default
$('#action_location .save').addClass('disabled');
$('#action_location .delete').addClass('disabled');
$('#action_location .new').removeClass('disabled');
$('#action_location .find').removeClass('disabled');
//--------------------------------


//$("#xLocation").show();
//$("#action_location").show();

//$("#xRegionProvince").hide();
//$("#action_region_province").hide();

//$("#xProductDepartment").hide();
//$("#action_product_department").hide();

//$("#xBank").hide();
//$("#action_bank").hide();

//$("#xForwarder").hide();
//$("#action_forwarder").hide();




function SubMenuDisplay(display) {
    $("#xLocation").hide();
    $("#xLocationManage").hide();
    $("#xLocationSearch").hide();
    $("#action_location").hide();


    $("#xRegionProvince").hide();
    $("#xRegionProvinceManage").hide();
    $("#xRegionProvinceSearch").hide();
    $("#action_region_province").hide();

    $("#xProductDepartment").hide();
    $("#xProductDepartmentManage").hide();
    $("#xProductDepartmentSearch").hide();
    $("#action_product_department").hide();

    $("#xBank").hide();
    $("xBankManage").hide();
    $("xBankSearch").hide();
    $("#action_bank").hide();

    $("#xForwarder").hide();
    $("#xForwarderManage").hide();
    $("#xForwarderSearch").hide();
    $("#action_forwarder").hide();


    //--------------------------------
    $("#xLocationManage").hide();
    $("#xLocationSearch").hide();
    //--------------------------------

    if (display == 'location') {
        $("#xLocation").show();
        $("#action_location").show();
        LoadLocation();

        $('#action_location .save').addClass('disabled');
        $('#action_location .delete').addClass('disabled');
        $('#action_location .new').removeClass('disabled');
        $('#action_location .find').removeClass('disabled');

    }
    else if (display == 'region_province') {
        $("#xRegionProvince").show();
        $("#action_region_province").show();

        LoadRegion();
        $('#action_region_province .save').addClass('disabled');
        $('#action_region_province .delete').addClass('disabled');
        $('#action_region_province .new').removeClass('disabled');
        $('#action_region_province .find').removeClass('disabled');
    }
    else if (display == 'product_department') {
        $("#xProductDepartment").show();
        $("#action_product_department").show();

        LoadProduct();
        $('#action_product_department .save').addClass('disabled');
        $('#action_product_department .delete').addClass('disabled');
        $('#action_product_department .new').removeClass('disabled');
        $('#action_product_department .find').removeClass('disabled');
    }
    else if (display == 'bank') {
        $("#xBank").show();
        $("#action_bank").show();

        LoadBank();
        $('#action_bank .save').addClass('disabled');
        $('#action_bank .delete').addClass('disabled');
        $('#action_bank .new').removeClass('disabled');
        $('#action_bank .find').removeClass('disabled');


    }
    else if (display == 'forwarder') {

        $("#xForwarder").show();
        $("#action_forwarder").show();

        LoadForwarder();
        $('#action_forwarder .save').addClass('disabled');
        $('#action_forwarder .delete').addClass('disabled');
        $('#action_forwarder .new').removeClass('disabled');
        $('#action_forwarder .find').removeClass('disabled');
    }
}



//------FORWARDER SECTION-----------------------

function LoadForwarder() {
    var pageUrl = '/Webservice/svr_Forwarder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectForwarder",
        data: "{ 'id':'0', 'forwarder_name':'', 'address':'', 'contact_person':'', 'telephone':'', 'mobile_phone':'', 'fax':'', 'status':'', 'area':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xForwarder tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xForwarder tbody:last').append("<tr><td><div onclick=\"ActionSelectForwarder('" + data[i]["ID"] + "')\">" + data[i]["ForwardedName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankForwarder()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankForwarder() {
    for (var i = 0; i < 20; i++) {
        $('#xForwarder tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectForwarder(id) {
    $('#action_forwarder .save').removeClass('disabled');
    $('#action_forwarder .delete').removeClass('disabled');
    $('#action_forwarder .new').addClass('disabled');
    $('#action_forwarder .find').addClass('disabled');

    $("#hdn_forwarder_id").val(id);



    var pageUrl = '/Webservice/svr_Forwarder.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectForwarder",
        data: "{ 'id':'" + id + "', 'forwarder_name':'', 'address':'', 'contact_person':'', 'telephone':'', 'mobile_phone':'', 'fax':'', 'status':'', 'area':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_forwarder_name").val(data[i]["ForwardedName"]);
                $("#txt_address").val(data[i]["Address"]);
                $("#txt_contact_person").val(data[i]["ContactPerson"]);
                $("#txt_telephone").val(data[i]["Telephone"]);
                $("#txt_mobile_phone").val(data[i]["MobilePhone"]);
                $("#txt_fax").val(data[i]["Fax"]);
                $("#ddl_status").val(data[i]["Status"]);
                $("#txt_area").val(data[i]["Area"]);
               
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xForwarder").hide();
    $("#xForwarderSearch").hide();
    $("#xForwarderManage").show();

}

function ActionNewForwarder(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_forwarder_id").val('0');
        $("#txt_forwarder_name").val('');
        $("#txt_address").val('');
        $("#txt_contact_person").val('');
        $("#txt_telephone").val('');
        $("#txt_mobile_phone").val('');
        $("#txt_fax").val('');
        $("#ddl_status").val('');
        $("#txt_area").val('');

        $('#action_forwarder .save').removeClass('disabled');
        $('#action_forwarder .delete').addClass('disabled');
        $('#action_forwarder .new').addClass('disabled');
        $('#action_forwarder .find').addClass('disabled');

        $("#xForwarder").hide();
        $("#xForwarderSearch").hide();
        $("#xForwarderManage").show();

    }
}

function ActionSaveUpdateForwarder(me) {

    if ($(me).hasClass("disabled") == false) {
        var pageUrl = '/Webservice/svr_Forwarder.asmx';
        var id = $("#hdn_forwarder_id").val();
        var forwarder_name = $("#txt_forwarder_name").val();
        var address =  $("#txt_address").val();
        var contact_person = $("#txt_contact_person").val();
        var telephone = $("#txt_telephone").val();
        var mobile_phone = $("#txt_mobile_phone").val();
        var fax= $("#txt_fax").val();
        var status = $("#ddl_status option:selected").val();
        var area = $("#txt_area").val();

        if (id == '0') {
            if (ValidateAddUpdateForwarder()) {
                var data_transfer = "{ 'forwarder_name':'{0}', 'address':'{1}', 'contact_person':'{2}', 'telephone':'{3}', 'mobile_phone':'{4}', 'fax':'{5}', 'status':'{6}', 'area':'{7}' }"
                    .f(forwarder_name, address, contact_person, telephone, mobile_phone, fax, status, area);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertForwarder",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadForwarder();
                        SubMenuDisplay('forwarder');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateForwarder()) {
                var data_transfer = "{ 'id':'{0}','forwarder_name':'{1}', 'address':'{2}', 'contact_person':'{3}', 'telephone':'{4}', 'mobile_phone':'{5}', 'fax':'{6}', 'status':'{7}', 'area':'{8}' }"
                     .f(id, forwarder_name, address, contact_person, telephone, mobile_phone, fax, status, area);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateForwarder",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadForwarder();
                        SubMenuDisplay('forwarder');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteForwarder(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_forwarder_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Forwarder.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteForwarder",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadForwarder();
                    SubMenuDisplay('forwarder');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function ForwarderAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Forwarder.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteForwarder",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_forwarder_search").autocomplete({
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


    $("#txt_forwarder_search").autocomplete({
        select: function (a, b) {

            ActionSelectForwarder(b.item.id)
        }
    });
}

function ActionSearchForwarder(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_forwarder .save').addClass('disabled');
        $('#action_forwarder .delete').addClass('disabled');
        $('#action_forwarder .new').addClass('disabled');
        $('#action_forwarder .find').addClass('disabled');

        $("#xForwarder").hide();
        $("#xForwarderManage").hide();
        $("#xForwarderSearch").show();

        $('#txt_forwarder_search').val('');
        ForwarderAutoCompleteByName();
    }
}

function ValidateAddUpdateForwarder() {
    var forwarder = $("#txt_forwarder_name").val();
    var address = $("#txt_address").val();
    var contact_person = $("#txt_contact_person").val();
    var mobile = $("#txt_mobile_phone").val();
    var area = $("#txt_area").val();

    var message = "";

    if (forwarder == "") {
        message += "Forwarder required!";
    }

    //if (address == "") {
    //    message += "Address required!";
    //}

    //if (contact_person == "") {
    //    message += "Contact Person required!";
    //}

    //if (mobile == "") {
    //    message += "Mobile required!";
    //}

    //if (area == "") {
    //    message += "Area required!";
    //}

    //-------------------------
    if (message == "") {
        return true
    }
    else {
        alert(message);
        return false;
    }
}



//------BANK SECTION-----------------------

function LoadBank() {
    var pageUrl = '/Webservice/svr_Bank.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectBank",
        data: "{'id':'0','bank_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xBank tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xBank tbody:last').append("<tr><td><div onclick=\"ActionSelectBank('" + data[i]["ID"] + "')\">" + data[i]["BankName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankBank()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankBank() {
    for (var i = 0; i < 20; i++) {
        $('#xBank tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectBank(id) {
    $('#action_bank .save').removeClass('disabled');
    $('#action_bank .delete').removeClass('disabled');
    $('#action_bank .new').addClass('disabled');
    $('#action_bank .find').addClass('disabled');

    $("#hdn_bank_id").val(id);



    var pageUrl = '/Webservice/svr_Bank.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectBank",
        data: "{'id':'" + id + "','bank_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_bank").val(data[i]["BankName"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xBank").hide();
    $("#xBankSearch").hide();
    $("#xBankManage").show();
    
}

function ActionNewBank(me) {

    if ($(me).hasClass("disabled") == false) {
        $("#hdn_bank_id").val('0');
        $("#txt_bank").val('');

        $('#action_bank .save').removeClass('disabled');
        $('#action_bank .delete').addClass('disabled');
        $('#action_bank .new').addClass('disabled');
        $('#action_bank .find').addClass('disabled');

        $("#xBank").hide();
        $("#xBankManage").show();
    }
}

function ActionSaveUpdateBank(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_bank.asmx';
        var id = $("#hdn_bank_id").val();
        var bank_name = $("#txt_bank").val();

        if (id == '0') {

            if (ValidateAddUpdateBank()) {
                var data_transfer = "{'bank_name':'{0}'}"
                    .f(bank_name);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertBank",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadBank();
                        SubMenuDisplay('bank');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateBank()) {
                var data_transfer = "{'id':'{0}', 'bank_name':'{1}'}"
                    .f(id, bank_name);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateBank",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {
                        LoadBank();
                        SubMenuDisplay('bank');
                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteBank(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_bank_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Bank.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteBank",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadBank();
                    SubMenuDisplay('bank');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function BankAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Bank.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteBank",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_bank_search").autocomplete({
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


    $("#txt_bank_search").autocomplete({
        select: function (a, b) {

            ActionSelectBank(b.item.id)
        }
    });
}

function ActionSearchBank(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_bank .save').addClass('disabled');
        $('#action_bank .delete').addClass('disabled');
        $('#action_bank .new').addClass('disabled');
        $('#action_bank .find').addClass('disabled');

        $("#xBank").hide();
        $("#xBankManage").hide();
        $("#xBankSearch").show();

        $('#txt_bank_search').val('');
        BankAutoCompleteByName();
    }
}

function ValidateAddUpdateBank() {
    var bank = $("#txt_bank").val();

    var message = "";

    if (bank == "") {
        message += "Bank required!";
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




//------LOCATION SECTION-----------------------

function LoadLocation()
{
    var pageUrl = '/Webservice/svr_Location.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectLocation",
        data: "{'id':'0','location_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xLocation tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xLocation tbody:last').append("<tr><td><div onclick=\"ActionSelectLocation('" + data[i]["ID"] + "')\">" + data[i]["LocationName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankLocation()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankLocation() {
    for (var i = 0; i < 20; i++) {
        $('#xLocation tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");
    }

    window.clearInterval(bl);
}

function ActionSelectLocation(id) {
    $('#action_location .save').removeClass('disabled');
    $('#action_location .delete').removeClass('disabled');
    $('#action_location .new').addClass('disabled');
    $('#action_location .find').addClass('disabled');

    $("#hdn_location_id").val(id);



    var pageUrl = '/Webservice/svr_Location.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectLocation",
        data: "{'id':'" + id + "','location_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_location").val(data[i]["LocationName"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xLocation").hide();
    $("#xLocationSearch").hide();
    $("#xLocationManage").show();
}

function ActionNewLocation(me) {

    if ($(me).hasClass("disabled") == false) {
        $("#hdn_location_id").val('0');
        $("#txt_location").val('');

        $('#action_location .save').removeClass('disabled');
        $('#action_location .delete').addClass('disabled');
        $('#action_location .new').addClass('disabled');
        $('#action_location .find').addClass('disabled');

        $("#xLocation").hide();
        $("#xLocationManage").show();
    }
}

function ActionSaveUpdateLocation(me)
{

   ///var location = $("#txt_location").val();
   
    if ($(me).hasClass("disabled") == false) {



        var id = $("#hdn_location_id").val();
        var location_name = $("#txt_location").val();

        if (id == '0') {

          


            if (ValidateAddUpdateLocation()) {

                var pageUrl = '/Webservice/svr_Location.asmx';

                var data_transfer = "{'location_name':'{0}'}"
                    .f(location_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertLocation",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadLocation();
                        SubMenuDisplay('location');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });

            }


        } else {


            if (ValidateAddUpdateLocation()) {

                var pageUrl = '/Webservice/svr_Location.asmx';

                var data_transfer = "{'id':'{0}', 'location_name':'{1}'}"
                    .f(id, location_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateLocation",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {
                        LoadLocation();
                        SubMenuDisplay('location');
                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });

            }



        }


        
    }
}

function ActionDeleteLocation(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_location_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Location.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteLocation",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadLocation();
                    SubMenuDisplay('location');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function LocationAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Location.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteLocation",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_location_search").autocomplete({
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


    $("#txt_location_search").autocomplete({
        select: function (a, b) {

            ActionSelectLocation(b.item.id)
        }
    });
}

function ActionSearchLocation(me)
{
    if ($(me).hasClass("disabled") == false) {
        $('#action_location .save').addClass('disabled');
        $('#action_location .delete').addClass('disabled');
        $('#action_location .new').addClass('disabled');
        $('#action_location .find').addClass('disabled');

        $("#xLocation").hide();
        $("#xLocationManage").hide();
        $('#xLocationSearch').show();

        $('#txt_location_search').val('');
        LocationAutoCompleteByName();
    }
}


function ValidateAddUpdateLocation()
{
    var location = $("#txt_location").val();
    //alert(location);
    var message = "";

    if (location == "") {
        message += "Location required!";
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


//------REGION SECTION-----------------------

function LoadRegion() {
    var pageUrl = '/Webservice/svr_Region.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRegion",
        data: "{'id':'0','region_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xRegionProvince tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xRegionProvince tbody:last').append("<tr><td><div onclick=\"ActionSelectRegion('" + data[i]["ID"] + "')\">" + data[i]["RegionName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankRegion()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });

    

}

// ------------------------------------------- Filling Table Blank Space
function loadBlankRegion() {
    for (var i = 0; i < 20; i++) {
        $('#xRegionProvince tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");
    }

    window.clearInterval(bl);
}

function ActionSelectRegion(id) {
    $('#action_region_province .save').removeClass('disabled');
    $('#action_region_province .delete').removeClass('disabled');
    $('#action_region_province .new').addClass('disabled');
    $('#action_region_province .find').addClass('disabled');

    $("#hdn_region_id").val(id);

    var pageUrl = '/Webservice/svr_Region.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRegion",
        data: "{'id':'" + id + "','region_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_region").val(data[i]["RegionName"]);
            }

            SelectDataRegionMunicipality(id);


        },
        error: function (response) {
            alert(response.status);
        }
    });


    $("#xRegionProvince").hide();
    $("#xRegionProvinceSearch").hide();
    $("#xRegionProvinceManage").show();
}

function SelectDataRegionMunicipality(id) {
    var pageUrl = '/Webservice/svr_RegionMunicipality.asmx';

    //SelectRegionMunicipality(long id, long region_id)
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRegionMunicipality",
        data: "{ 'id':'0', 'region_id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#region_province_table tbody");
            table.empty();
            var range_data = data;

            //alert(range_data);
            for (var i = 0; i < range_data.length; i++) {

                table.append("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short municipality' value='" + data[i]["MunicipalityName"] + "'></td></tr>");
             
            }

            for (var i = 0; i < 50; i++)//plus 50 rows
            {
                table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short municipality'></td></tr>");
            }



        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionNewRegion(me) {

    if ($(me).hasClass("disabled") == false) {
        $("#hdn_region_id").val('0');
        $("#txt_region").val('');

        $('#action_region_province .save').removeClass('disabled');
        $('#action_region_province .delete').addClass('disabled');
        $('#action_region_province .new').addClass('disabled');
        $('#action_region_province .find').addClass('disabled');

        $("#xRegionProvince").hide();
        $("#xRegionProvinceManage").show();

        var table = $("#region_province_table tbody");
        table.empty();

        for (var i = 0; i < 50; i++)//plus 50 rows
        {
            table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short municipality'></td></tr>");
        }
    }
}

function ActionSaveUpdateRegion(me) {

    if ($(me).hasClass("disabled") == false) {



        var id = $("#hdn_region_id").val();
        var region_name = $("#txt_region").val();
        var table_chunk = GenerateMunicipalityTableChunk();
        if (id == '0') {



                var pageUrl = '/Webservice/svr_Region.asmx';

                var data_transfer = "{'region_name':'{0}','table_chunk':'{1}'}"
                    .f(region_name, table_chunk);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertRegion",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadRegion();
                        SubMenuDisplay('region_province');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });

            


        } else {



                var pageUrl = '/Webservice/svr_Region.asmx';

                var data_transfer = "{'id':'{0}', 'region_name':'{1}'}"
                    .f(id, region_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateRegion",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {
                        LoadRegion();
                        SubMenuDisplay('region_province');
                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });

                $("#region_province_table tbody tr").each(function (i) {

                    if ($(this).find("td .municipality").val().length > 0) {

                        var _dataUpdate = "{'id':'" + $(this).find("td .hdn").val() + "',  'region_id':'" + id + "',  'municipality_name':'" + $(this).find("td .municipality").val() + "'}";

                        $.ajax({
                            type: "POST",
                            url: "/Webservice/svr_RegionMunicipality.asmx/UpdateRegionMunicipality",
                            //UpdateDeduction( )
                            data: _dataUpdate,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            crossdomain: true,
                            success: function (response) {
                            },
                            error: function (response) {
                                alert(response.status);
                            }
                        });

                    }

                });

        }
    }
}

function GenerateMunicipalityTableChunk() {

    //-------------------------

    var chunk = "";
    $("#region_province_table tbody tr").each(function (i) {

        if ($(this).find("td .municipality").val().length > 0) {
            chunk += $(this).find("td .municipality").val() + "^";
        }
     
    });

    //var table = $("#region_province_table tbody");
    //for (var i = 0; i < 50; i++)//plus 50 rows
    //{
    //    table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
    //}


    return chunk;
}

function ActionDeleteRegion(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_region_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Region.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteRegion",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadRegion();
                    SubMenuDisplay('region_province');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function RegionAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Region.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteRegion",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_region_search").autocomplete({
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


    $("#txt_region_search").autocomplete({
        select: function (a, b) {

            ActionSelectRegion(b.item.id)
        }
    });
}

function ActionSearchRegion(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_region_province .save').addClass('disabled');
        $('#action_region_province .delete').addClass('disabled');
        $('#action_region_province .new').addClass('disabled');
        $('#action_region_province .find').addClass('disabled');

        $("#xRegionProvince").hide();
        $("#xRegionProvinceManage").hide();
        $('#xRegionProvinceSearch').show();

        $('#txt_region_search').val('');
        RegionAutoCompleteByName();
    }
}

function ValidateAddUpdateRegion() {
    var location = $("#txt_region").val();

    var message = "";

    if (location == "") {
        message += "Region required!";
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


//------PRODUCT DEPARTMENT SECTION-----------------------

function LoadProduct() {
    var pageUrl = '/Webservice/svr_ProductDepartment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductDepartment",
        data: "{'id':'0','product_department_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xProductDepartment tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xProductDepartment tbody:last').append("<tr><td><div onclick=\"ActionSelectProduct('" + data[i]["ID"] + "')\">" + data[i]["ProductDepartmentName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankProduct()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankProduct() {
    for (var i = 0; i < 20; i++) {
        $('#xProductDepartment tbody:last').append("<tr><td><div >" + "" + "</div></td></tr>");
    }

    window.clearInterval(bl);
}


function ActionSelectProduct(id) {
    $('#action_product_department .save').removeClass('disabled');
    $('#action_product_department .delete').removeClass('disabled');
    $('#action_product_department .new').addClass('disabled');
    $('#action_product_department .find').addClass('disabled');

    $("#hdn_product_id").val(id);

    var pageUrl = '/Webservice/svr_ProductDepartment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductDepartment",
        data: "{'id':'" + id + "','product_department_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_product").val(data[i]["ProductDepartmentName"]);
            }

            SelectDataProductClass(id);

        },
        error: function (response) {
            alert(response.status);
        }
    });


    $("#xProductDepartment").hide();
    $("#xProductDepartmentSearch").hide();
    $("#xProductDepartmentManage").show();
}

function SelectDataProductClass(id) {
    var pageUrl = '/Webservice/svr_ProductClass.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductClass",
        data: "{ 'id':'0', 'product_department_id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#product_department_table tbody");
            table.empty();
            var range_data = data;

            //alert(range_data);
            for (var i = 0; i < range_data.length; i++) {

                table.append("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short product_class' value='" + data[i]["ProductClassName"] + "'></td></tr>");

            }

            for (var i = 0; i < 50; i++)//plus 50 rows
            {
                table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short product_class'></td></tr>");
            }



        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionNewProduct(me) {

    if ($(me).hasClass("disabled") == false) {
        $("#hdn_product_id").val('0');
        $("#txt_product").val('');

        $('#action_product_department .save').removeClass('disabled');
        $('#action_product_department .delete').addClass('disabled');
        $('#action_product_department .new').addClass('disabled');
        $('#action_product_department .find').addClass('disabled');

        $("#xProductDepartment").hide();
        $("#xProductDepartmentManage").show();

        //
        var table = $("#product_department_table tbody");
        table.empty();

        for (var i = 0; i < 50; i++)//plus 50 rows
        {
            table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short product_class'></td></tr>");
        }

    }
}

function ActionSaveUpdateProduct(me) {

    if ($(me).hasClass("disabled") == false) {



        var id = $("#hdn_product_id").val();
        var product_name = $("#txt_product").val();
        var table_chunk = GenerateProductClassTableChunk();

        if (id == '0') {

                var pageUrl = '/Webservice/svr_ProductDepartment.asmx';

                var data_transfer = "{'product_department_name':'{0}', 'table_chunk':'{1}'}"
                    .f(product_name, table_chunk);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertProductDepartment",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadProduct();
                        SubMenuDisplay('product_department');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });



        } else {



                var pageUrl = '/Webservice/svr_ProductDepartment.asmx';

                var data_transfer = "{'id':'{0}', 'product_department_name':'{1}'}"
                    .f(id, product_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateProductDepartment",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {
                        LoadProduct();
                        SubMenuDisplay('product_department');
                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });


            //----------------

                $("#product_department_table tbody tr").each(function (i) {

                    if ($(this).find("td .product_class").val().length > 0) {

                        var _dataUpdate = "{'id':'" + $(this).find("td .hdn").val() + "',  'product_department_id':'" + id + "',  'product_class_name':'" + $(this).find("td .product_class").val() + "'}";

                        $.ajax({
                            type: "POST",
                            url: "/Webservice/svr_ProductClass.asmx/UpdateProductClass",
                            //UpdateDeduction( )
                            data: _dataUpdate,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            crossdomain: true,
                            success: function (response) {
                            },
                            error: function (response) {
                                alert(response.status);
                            }
                        });

                    }

                });


        }
    }
}

function GenerateProductClassTableChunk() {

    //-------------------------

    var chunk = "";
    $("#product_department_table tbody tr").each(function (i) {

        if ($(this).find("td .product_class").val().length > 0) {
            chunk += $(this).find("td .product_class").val() + "^";
        }

    });

    //var table = $("#region_province_table tbody");
    //for (var i = 0; i < 50; i++)//plus 50 rows
    //{
    //    table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
    //}


    return chunk;
}

function ActionDeleteProduct(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_product_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_ProductDepartment.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteProductDepartment",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadRegion();
                    SubMenuDisplay('product_department');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function ProductAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_ProductDepartment.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteProduct",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_product_search").autocomplete({
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


    $("#txt_product_search").autocomplete({
        select: function (a, b) {

            ActionSelectProduct(b.item.id)
        }
    });
}

function ActionSearchProduct(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_product_department .save').addClass('disabled');
        $('#action_product_department .delete').addClass('disabled');
        $('#action_product_department .new').addClass('disabled');
        $('#action_product_department .find').addClass('disabled');

        $("#xProductDepartment").hide();
        $("#xProductDepartmentManage").hide();
        $('#xProductDepartmentSearch').show();

        $('#txt_product_search').val('');
        ProductAutoCompleteByName();
    }
}

function ValidateAddUpdateProduct() {
    var location = $("#txt_product").val();

    var message = "";

    if (location == "") {
        message += "Product Department required!";
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

