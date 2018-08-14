
// **********************************************************************************
// ---------------------------------- VARIABLES -------------------------------------
// **********************************************************************************

var result;
var sta = 0;
var elements_per_page = 25;
var limit = elements_per_page;
var max_size = 0;

LoadAllCustomer();

LoadBankOpeningBalance();
LoadChecktypeOpeningBalance();

// **********************************************************************************
// -------------------------------- SELECTING DATA ----------------------------------
// **********************************************************************************

// ------------------------------------------- Load All Customer
function LoadAllCustomer() {
    var pageUrl = '/Webservice/svr_Customer.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCustomer",

        data: "{'id':'0','customer_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            result = null;
            sta = 0;
            elements_per_page = 25;
            limit = elements_per_page;
            max_size = 0;

            result = eval(response.d);

            //------------paging---------------------

            max_size = result.length;

            if (max_size < limit) {
                limit = max_size;
            }


            goFun(sta, limit);
            //----------------------------

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Processing Page for Customer Data
function goFun(sta, limit) {

    $('#tblCustomer tbody').empty();

    for (var i = sta ; i < limit; i++) {

        var $nr = $("<tr onclick=\"ActionSelectSingleCustomer('" + result[i]['ID'] + "')\"><td width='20%'>" + result[i]['CustomerName'] + "</td><td width='15%'>" + result[i]['RegionName'] + "</td><td width='10%'>" + result[i]['Status'] + "</td><td width='10%'>" + result[i]['CreditLimit'] + "</td><td width='10%'>" + result[i]['EmployeeName'] + "</td></tr>");
        $('#tblCustomer tbody:last').append($nr);
    }

    for (var i = 0 ; i < 50; i++) {
        //alert('xx')
        $('#tblCustomer tbody:last').append("<tr><td width='20%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
    }

}

// ------------------------------------------- Next Page for Customer Data
$('#nextValue').click(function () {

    var next = limit;
    if (max_size > next) {
        limit = limit + elements_per_page;
        $('#tblCustomer tbody').empty();
        goFun(next, limit);
    }
});

// ------------------------------------------- Previous for Customer Data
$('#PreeValue').click(function () {
    var pre = limit - (2 * elements_per_page);
    if (pre >= 0) {
        limit = limit - elements_per_page;
        $('#tblCustomer tbody').empty();
        goFun(pre, limit);
    }
});

// ------------------------------------------- Load Opening Balance By Specific Customer
function LoadOpeningBalanceList() {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelectByCustomer",
        data: "{'id':'" + $('#hdn_customer_id').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ULOpeningBalance').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ULOpeningBalance").append("<li onclick='actionSelectPayment(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["RefNo"] + "<span><div style='float: left;'>" + data[i]["DatePay"] + "</div><div style='float: right; font-size: 15px;'>" + data[i]["TotalAmount"] + "</div></span></span></a> </li>");
            }
        },
        error: function (response) {
        }
    });
}

// ------------------------------------------- Load Opening Balance Payment By Specific Customer
function LoadOpeningBalancePaymentList() {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/OpeningBalancePaymentSelectByCustomer",
        data: "{'id':'0', 'CustomerID':'" + $('#hdn_customer_id').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#UlPaymentOpening').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#UlPaymentOpening").append("<li onclick='actionSelectPayment(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["RefNo"] + "<span><div style='float: left;'>" + data[i]["DatePay"] + "</div><div style='float: right; font-size: 15px;'>" + data[i]["TotalAmount"] + "</div></span></span></a> </li>");
            }
        },
        error: function (response) {
        }
    });
}

// ------------------------------------------- Load Opening Balance Details
function actionSelectPayment(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/OpeningBalancePaymentSelectByCustomerDetails",
        data: "{'id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#bank_name').val(data[i]["CheckID"]);
                $('#check_number').val(data[i]["CheckNo"]);
                $('#checkDate').val(ToJavaScriptDate(data[i]["CheckDate"]));
                $('#check_type').val(data[i]["CheckType"]);
                $('#checkAmount').val(data[i]["CheckAmount"]);
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Enableling Opening Balance Transaction
function LoadOpeningBalance() {
    $("#xGeneralInfoForm").hide();
    $("#NextPageID").hide();
    $("#xGeneralInfoOpeningBalance").show();
}

// ------------------------------------------- Create New Customer
function ActionNewCustomer(me) {

    if ($(me).hasClass("disabled") == false) {
        
        //clear all
        $("#customer_name").val('');

        //--------------------------------

        $('#action_general_info .save').removeClass('disabled');
        $('#action_general_info .delete').addClass('disabled');
        $('#action_general_info .new').addClass('disabled');
        $('#action_general_info .find').addClass('disabled');

        $("#subMenuID").hide();

        $("#xGeneralInfoList").hide();
        $("#xGeneralInfoForm").show();
        $("#xGeneralInfoSearch").hide();


        LoadRegion();
        LoadShipTo();
        LoadSalesMan();
        LoadTerms();
        LoadDefaultTerms();

        LoadReferenceNo();
        LoadSalesManOpeningBalance();
        LoadTermsOpeningBalance();

        $("#hdn_customer_id").val('0');


        $("#mnu_submenu").show();
        $("#xGeneralInfoForm").show();
        $("#xCustomerItems").hide();
        $("#xSalesOrder").hide();
        $("#xInvoices").hide();
        $("#xPayment").hide();
        $("#xMemo").hide();
    }
}

// ------------------------------------------- Load Customer Information Details
function ActionSelectSingleCustomer(id) {
    
    $("#hdn_customer_id").val(id);
    LoadRegion();
    LoadShipTo();
    LoadSalesMan();
    LoadTerms();


    $('#action_general_info .save').removeClass('disabled');
    $('#action_general_info .delete').removeClass('disabled');
    $('#action_general_info .new').addClass('disabled');
    $('#action_general_info .find').addClass('disabled');

    
    var pageUrl = '/Webservice/svr_Customer.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCustomer",
        data: "{ 'id':'" + id + "', 'customer_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            var region_id,municipality_id;
          
            for (var i = 0; i < data.length; i++) {
                
                LoadSalesOrderList(id);
                LoadSalesInvoiceList(id);
                LoadCashPayment(id);
                LoadCheckPayment(id);
                LoadCardPayment(id);

                LoadReferenceNo();
                LoadSalesManOpeningBalance();
                LoadTermsOpeningBalance();
                $("#customer_name").val(data[i]["CustomerName"]);
                $("#address").val(data[i]["Address"]);
                $("#contact_person").val(data[i]["ContactPerson"]);
                $("#region_province").val(data[i]["RegionID"]);
                //alert(data[i]["RegionID"]);
                region_id = data[i]["RegionID"];
                $("#municipality").val(data[i]["MunicipalityID"]);
                municipality_id = data[i]["MunicipalityID"];
                $("#business_phone").val(data[i]["BusinessPhone"]);
                $("#home_phone").val(data[i]["HomePhone"]);
                $("#fax").val(data[i]["Fax"]);
                $("#mobile_phone").val(data[i]["MobilePhone"]);
                $("#notes").val(data[i]["Notes"]);
                $("#ship_to").val(data[i]["ShipToID"]);
                $("#price_level").val(data[i]["PriceLevel"]);
                $("#status").val(data[i]["Status"]);
                $("#tin_number").val(data[i]["TinNo"]);
                $("#vat_number").val(data[i]["VatNo"]);
                $("#salesman").val(data[i]["SalesmanID"]);
                $("#terms").val(data[i]["TermID"]);
                $("#credit_limit").val(data[i]["CreditLimit"]);

                LoadOpeningBalanceList();
                LoadOpeningBalancePaymentList();
                //$("#txt_forwarder_name").val(data[i]["ForwardedName"]);
                //$("#txt_address").val(data[i]["Address"]);
                //$("#txt_contact_person").val(data[i]["ContactPerson"]);
                //$("#txt_telephone").val(data[i]["Telephone"]);
                //$("#txt_mobile_phone").val(data[i]["MobilePhone"]);
                //$("#txt_fax").val(data[i]["Fax"]);
                //$("#ddl_status").val(data[i]["Status"]);
                //$("#txt_area").val(data[i]["Area"]);

            }

         
            LoadMunicipalityPerRegion(region_id, municipality_id);

        },
        error: function (response) {
            alert(response.status);
        }
    });


    
    $("#subMenuID").hide();
    
    
    $("#mnu_submenu").show();
    $("#xGeneralInfoForm").show();
    $("#xGeneralInfoSearch").hide();
    $("#xCustomerItems").hide();
    $("#xSalesOrder").hide();
    $("#xInvoices").hide();
    $("#xGeneralInfoList").hide();
    $("#xPayment").hide();
    $("#xMemo").hide();
    $("#NextPageID").show();


}

// ------------------------------------------- Delete Specific Customer
function ActionDeleteCustomer(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_customer_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Customer.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteCustomer",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    window.location.href = "aspnetCustomer.aspx";
                    
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

// ------------------------------------------- Load All Customer (AutoComplete)
function CustomerAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Customer.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteCustomer",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_customer_search").autocomplete({
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


    $("#txt_customer_search").autocomplete({
        select: function (a, b) {

            ActionSelectSingleCustomer(b.item.id)
        }
    });
}

// ------------------------------------------- Load Searched Customer
function ActionSearchCustomer(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_general_info .save').addClass('disabled');
        $('#action_general_info .delete').addClass('disabled');
        $('#action_general_info .new').addClass('disabled');
        $('#action_general_info .find').addClass('disabled');

        $("#xGeneralInfoList").hide();
        $("#xGeneralInfoForm").hide();
        $("#xGeneralInfoSearch").show();

        $('#txt_bank_search').val('');
        CustomerAutoCompleteByName();
    }
}

// ------------------------------------------- Load All Regions



//function LoadRegionTest() {

//    //alert('x');
//    alert(RegionData.length);
//    alert(RegionData["RegionName"]);

//    for (var i = 0; i < RegionData.length; i++) {

//        //alert(RegionData[i]["RegionName"]);

//    }

//}



function LoadRegion() {

    $('#region_province').empty();

    for (var i = 0; i < RegionData.length; i++) {

        $('#region_province').append("<option value='" + RegionData[i]["ID"] + "'>" + RegionData[i]["RegionName"] + "</option>");
        //alert(RegionData[i]["RegionName"]);

    }

 


    //var pageUrl = '/Webservice/svr_Region.asmx';

    //$.ajax({
    //    type: "POST",
    //    url: pageUrl + "/SelectRegion",
    //    data: "{'id':'0','region_name':'' }",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    crossdomain: true,
    //    success: function (response) {

    //        $('#region_province').empty();
    //        $('#region_province').append("<option value='" + "0" + "'>" + "" + "</option>");
    //        var data = eval(response.d);
    //        var obj = "";
    //        for (var i = 0; i < data.length; i++) {

    //          

    //        }


    //       // LoadMunicipalityPerRegion();

    //    },
    //    error: function (response) {
    //        alert(response.status);
    //    }
    //});

}

// ------------------------------------------- Load All Municipality By Region
function LoadMunicipalityPerRegion(id,municipality_id) {

    if (id == '' || id == null)
    {
        id = $('#region_province').val();
    }
    

    //var id = $('#region_province').val();

   // alert(id);

    var pageUrl = '/Webservice/svr_RegionMunicipality.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRegionMunicipality",
        data: "{ 'id':'0', 'region_id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#municipality");
            table.empty();
            var range_data = data;

            //alert(range_data);
            for (var i = 0; i < range_data.length; i++) {


                ///alert(data[i]["ID"] + "municipal id =" + municipality_id);
                if (Number(municipality_id) == Number(data[i]["ID"])) {
                    table.append("<option value='" + data[i]["ID"] + "' selected='true' >" + data[i]["MunicipalityName"] + "</option>");
                }
                else {
                    table.append("<option value='" + data[i]["ID"] + "' >" + data[i]["MunicipalityName"] + "</option>");
                }
                

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Forwarder
function LoadShipTo() {
    var pageUrl = '/Webservice/svr_Forwarder.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectForwarder",
        data: "{ 'id':'0', 'forwarder_name':'', 'address':'', 'contact_person':'', 'telephone':'', 'mobile_phone':'', 'fax':'', 'status':'', 'area':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ship_to').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#ship_to').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ForwardedName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load All Employee (Salesman)
function LoadSalesMan() {
    var pageUrl = '/Webservice/svr_Employee.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{ 'id':'0', 'employee_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#salesman').empty();
            
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i]["EmployeeType"] == "Salesman") {
                    $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");
                }

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load All Terms
function LoadTerms() {

    var pageUrl = '/Webservice/svr_Terms.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectTerm",
        data: "{ 'id':'0', 'term_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#terms').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#terms').append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Customer Default Terms
function LoadDefaultTerms() {

    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesReferenceDefault",
        data: "{ 'id':'0', 'term_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#terms').val(data[i]["TermsID"]);
                $('#price_level').val(data[i]["PriceLevel"]);
                $('#status').val(data[i]["Status"]);
                $('#credit_limit').val(data[i]["Credit"]);
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Employee (Salesman) for Opening Balance
function LoadSalesManOpeningBalance() {
    var pageUrl = '/Webservice/svr_Employee.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{ 'id':'0', 'employee_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#salesmanOpeningBalance').empty();

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i]["EmployeeType"] == "Salesman") {
                    $('#salesmanOpeningBalance').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");
                }

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Terms for Opening Balance
function LoadTermsOpeningBalance() {

    var pageUrl = '/Webservice/svr_Terms.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectTerm",
        data: "{ 'id':'0', 'term_name':'' }",
        contentType: "application/json; charset=utf-8",  
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#termOpeningBalance').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#termOpeningBalance').append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Customer Sales Reference Number for Opening Balance
function LoadReferenceNo() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReferenceNo",
        data: "{ 'id':'0', 'prefix_initial':'', 'description':'', 'lastest':'0', 'nextno':'0', 'maximum':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#SalesRef').empty();
            $('#SalesRef').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#SalesRef').append("<option value='" + data[i]["ID"] + "'>" + data[i]["PrefixInitial"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Latest or Manual Reference Number for Opening Balance
function LoadRefDetails() {
    var e = document.getElementById("SalesRef");
    var refID = e.options[e.selectedIndex].value;

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRefDetails",
        data: "{ 'id':'" + refID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                if (data[i]["Automatic"] == true) {
                    $('#reference_number').val(data[i]["NextNo"]);
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load All Bank for Opening Balance
function LoadBankOpeningBalance() {

    var pageUrl = '/Webservice/svr_Customer.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectBank",
        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#bank_name').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#bank_name').append("<option value='" + data[i]["ID"] + "'>" + data[i]["BankName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load All Check Type
function LoadChecktypeOpeningBalance() {

    var pageUrl = '/Webservice/svr_Customer.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCheckType",
        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#check_type').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#check_type').append("<option value='" + data[i]["ID"] + "'>" + data[i]["CheckType"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// **********************************************************************************
// --------------------------------- INSERTING DATA ---------------------------------
// **********************************************************************************

// ------------------------------------------- Save or Update Customer Information
function ActionSaveUpdateCustomer(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Customer.asmx';
        var id = $("#hdn_customer_id").val();
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
        var credit_limit = $("#credit_limit").val();

        //----list down all controls


        if (id == '0') {

            //InsertCustomer(string customer_name,string address,string contact_person,long region_id,long municipality_id,string business_phone,string home_phone,string fax,string mobile_phone,string notes,long ship_to_id,string price_level,string status,string tin_no,string vat_no,long salesman_id,long term_id,decimal credit_limit)
            var data_transfer = "{'customer_name':'{0}', 'address':'{1}','contact_person':'{2}','region_id':'{3}','municipality_id':'{4}','business_phone':'{5}','home_phone':'{6}','fax':'{7}','mobile_phone':'{8}','notes':'{9}','ship_to_id':'{10}','price_level':'{11}','status':'{12}','tin_no':'{13}','vat_no':'{14}','salesman_id':'{15}','term_id':'{16}','credit_limit':'{17}'}"
                    .f(customer_name, address, contact_person, region_province, municipality, business_phone, home_phone, fax, mobile_phone, notes, ship_to, price_level, status, tin_number, vat_number, salesman, terms, credit_limit);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertCustomer",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    SavingInvoice(response.d);
                    LoadAllCustomer();

                    $('#action_general_info .save').addClass('disabled');
                    $('#action_general_info .delete').addClass('disabled');
                    $('#action_general_info .new').removeClass('disabled');
                    $('#action_general_info .find').removeClass('disabled');

                    $("#subMenuID").hide();
                    $("#submenu").hide();
                    $("#xGeneralInfoList").show();
                    $("#xGeneralInfoForm").hide();
                    $("#xGeneralInfoSearch").hide();
                    $("#mnu_submenu").hide();
                    $("#xGeneralInfoForm").show();
                    $("#xCustomerItems").hide();
                    $("#xSalesOrder").hide();
                    $("#xInvoices").hide();
                    $("#xPayment").hide();
                    $("#xMemo").hide();


                    // window.location.href = "aspnetCustomer.aspx";

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {
            //UpdateCustomer(long id, string customer_name, string address, string contact_person, long region_id, long municipality_id, string business_phone, string home_phone, string fax, string mobile_phone, string notes, long ship_to_id, string price_level, string status, string tin_no, string vat_no, long salesman_id, long term_id, decimal credit_limit)
            var data_transfer = "{'id':'{0}','customer_name':'{1}', 'address':'{2}','contact_person':'{3}','region_id':'{4}','municipality_id':'{5}','business_phone':'{6}','home_phone':'{7}','fax':'{8}','mobile_phone':'{9}','notes':'{10}','ship_to_id':'{11}','price_level':'{12}','status':'{13}','tin_no':'{14}','vat_no':'{15}','salesman_id':'{16}','term_id':'{17}','credit_limit':'{18}'}"
                    .f(id, customer_name, address, contact_person, region_province, municipality, business_phone, home_phone, fax, mobile_phone, notes, ship_to, price_level, status, tin_number, vat_number, salesman, terms, credit_limit);

            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateCustomer",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    SavingInvoice(id);
                    LoadAllCustomer();

                    $('#action_general_info .save').addClass('disabled');
                    $('#action_general_info .delete').addClass('disabled');
                    $('#action_general_info .new').removeClass('disabled');
                    $('#action_general_info .find').removeClass('disabled');

                    $("#subMenuID").hide();

                    $("#xGeneralInfoList").show();
                    $("#xGeneralInfoForm").hide();
                    $("#xGeneralInfoSearch").hide();
                    $("#mnu_submenu").hide();
                    $("#xGeneralInfoForm").show();
                    $("#xCustomerItems").hide();
                    $("#xSalesOrder").hide();
                    $("#xInvoices").hide();
                    $("#xPayment").hide();
                    $("#xMemo").hide();


                    //window.location.href = "aspnetCustomer.aspx";
                    //SubMenuDisplay('bank');
                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }
    }
}

// ------------------------------------------- Saving Customer Sales Invoice
function SavingInvoice(customerID) {

    var pageUrl = '/Webservice/svr_Customer.asmx';

    var invoice_status = "Posted"; 
    var customer_id = customerID;
    var address = $('#address').val();
    var forwarder_to_id = "0";
    var salesman_id = $('#salesmanOpeningBalance').val();
    var po_no = "0";
    var term_id = $('#termOpeningBalance').val();
    var ref_no = $('#SalesRef').val();
    var ref_no_serial = $('#reference_number').val();
    var created_date = $('#date').val().replace(".", "/").replace(".", "/");
    var delivery_date = $('#date').val().replace(".", "/").replace(".", "/");
    var prepared_by = "0";
    var checked_by = "0";
    var delivered_by = "0";
    var way_bill_no = "0";
    var container_no = "0";
    var bill_of_landing = "0";
    var commission_rate = $('#commmission').val();
    var commission_amt = "0";
    var remarks_id = "0";
    var notes = "";
    var sub_total_amt = $('#amount').val();
    var tax_amt = "0";
    var shipping_amt = "0";
    var payment_amt = "0";
    var memo_amt = "0";
    var adjustment_amt = "0";
    var balance = $('#BalanceOpeningBalance').val();


    var bank_name = $('#bank_name').val();
    var check_number = $('#check_number').val();
    var checkDate = $('#checkDate').val();
    var checkt = $('#check_type').val();
    var checkAmount = $('#checkAmount').val();
    var checkID = $('#hdnCheckTypeID').val();


    if ($('#hdnInvoiceID').val() != 0) {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateInvoice",
            data: "{'id':'" + $('#hdnInvoiceID').val() + "','invoice_status':'" + invoice_status + "', 'customer_id':'" + customer_id + "', 'address':'" + address + "', 'forwarder_to_id':'" + forwarder_to_id + "', 'salesman_id':'" + salesman_id + "', 'po_no':'" + po_no + "', 'term_id':'" + term_id + "', 'ref_no':'" + ref_no + "', 'ref_no_serial':'" + ref_no_serial + "', 'created_date':'" + created_date + "', 'delivery_date':'" + delivery_date + "', 'prepared_by':'" + prepared_by + "', 'checked_by':'" + checked_by + "', 'delivered_by':'" + delivered_by + "', 'way_bill_no':'" + way_bill_no + "', 'container_no':'" + container_no + "', 'bill_of_landing':'" + bill_of_landing + "', 'commission_rate':'" + commission_rate + "', 'commission_amt':'" + commission_amt + "', 'remarks_id':'" + remarks_id + "', 'notes':'" + notes + "', 'sub_total_amt':'" + sub_total_amt + "', 'tax_amt':'" + tax_amt + "', 'shipping_amt':'" + shipping_amt + "', 'payment_amt':'" + payment_amt + "', 'memo_amt':'" + memo_amt + "', 'adjustment_amt':'" + adjustment_amt + "','balance':'" + balance + "', 'bank_name':'" + bank_name + "','check_number':'" + check_number + "','checkDate':'" + checkDate + "', 'checkt':'" + checkt + "','checkAmount':'" + checkAmount + "', 'checkID':'" + checkID + "'}",
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
    else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertInvoice",
            data: "{'invoice_status':'" + invoice_status + "', 'customer_id':'" + customer_id + "', 'address':'" + address + "', 'forwarder_to_id':'" + forwarder_to_id + "', 'salesman_id':'" + salesman_id + "', 'po_no':'" + po_no + "', 'term_id':'" + term_id + "', 'ref_no':'" + ref_no + "', 'ref_no_serial':'" + ref_no_serial + "', 'created_date':'" + created_date + "', 'delivery_date':'" + delivery_date + "', 'prepared_by':'" + prepared_by + "', 'checked_by':'" + checked_by + "', 'delivered_by':'" + delivered_by + "', 'way_bill_no':'" + way_bill_no + "', 'container_no':'" + container_no + "', 'bill_of_landing':'" + bill_of_landing + "', 'commission_rate':'" + commission_rate + "', 'commission_amt':'" + commission_amt + "', 'remarks_id':'" + remarks_id + "', 'notes':'" + notes + "', 'sub_total_amt':'" + sub_total_amt + "', 'tax_amt':'" + tax_amt + "', 'shipping_amt':'" + shipping_amt + "', 'payment_amt':'" + payment_amt + "', 'memo_amt':'" + memo_amt + "', 'adjustment_amt':'" + adjustment_amt + "','balance':'" + balance + "', 'bank_name':'" + bank_name + "','check_number':'" + check_number + "','checkDate':'" + checkDate + "', 'checkt':'" + checkt + "','checkAmount':'" + checkAmount + "', 'checkID':'" + checkID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
            },
            error: function (response) {
                alert(response.d);
            }
        });
    }
}

function ShowOpeningBalancePayment() {
    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").show();
}

function ShowOpeningBalance() {
    $("#xGeneralInfoOpeningBalanceInvoice").show();
    $("#xGeneralInfoOpeningBalancePayment").hide();
}

var bl;

function LoadSalesOrderList(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/CustomerSalesOrderSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#SalesOrderTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#SalesOrderTable tbody:last').append("<tr><td width='15%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["Prefix"] + "" + data[i]["RefNoSerial"] + "</div></td><td width='15%'><div>" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></td><td width='25%'><div>" + data[i]["Salesman"] + "</div></td><td width='15%'><div>" + data[i]["TotalAmount"] + "</div></td><td width='15%'><div>" + data[i]["TotalServed"] + "</div></td><td width='15%'><div>" + data[i]["OrderStatus"] + "</div></td></tr>");

                }
                bl = window.setInterval("loadBlankSalesOrderList()", 300);
            }
            else {
                for (var i = 0; i < 50; i++) {
                    $('#SalesOrderTable tbody:last').append("<tr><td width='15%'><div >" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='25%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td></tr>");

                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
    LoadSalesOrderDetails(id);
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankSalesOrderList() {
    for (var i = 0; i < 20; i++) {
        $('#SalesOrderTable tbody:last').append("<tr><td width='15%'><div >" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='25%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

function LoadSalesOrderDetails(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceDetailsSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#customerItemTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#customerItemTable tbody:last').append("<tr><td width='25%'><input class='product' style='border: none; background-color: transparent;' value='" + data[i]["ProductName"] + "'/></td><td width='10%'><input class='location' style='border: none; background-color: transparent;' value='" + data[i]["refNO"] + "'/></td><td width='18%'><input class='qty' style='border: none; background-color: transparent;' value='" + ToJavaScriptDate(data[i]["DateCreated"]) + "'/></td><td width='10%'><input class='unit' style='border: none; background-color: transparent;' value='" + data[i]["Quantity"] + "'/></td><td width='10%'><input class='price' style='border: none; background-color: transparent;' value='" + data[i]["UnitName"] + "'/></td><td width='15%'><input class='discount' style='border: none; background-color: transparent;' value='0'/></td><input class='discount' style='border: none; background-color: transparent;' value='" + data[i]["Discount"] + "'/></td></tr>");
                }
                bl = window.setInterval("loadBlankCustomerItem()", 300);
            }

            else {
                for (var i = 0; i < 50; i++) {
                    $('#customerItemTable tbody:last').append("<tr><td width='25%'><input class='product' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='10%'><input class='location' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='18%'><input class='qty' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='10%'><input class='unit' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='10%'><input class='price' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='15%'><input class='discount' style='border: none; background-color: transparent;' value=''/></td><input class='discount' style='border: none; background-color: transparent;' value='" + "" + "'/></td></tr>");
                }
            }

            
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Filling Table Blank Space
function loadBlankCustomerItem() {
    for (var i = 0; i < 50; i++) {
        $('#customerItemTable tbody:last').append("<tr><td width='25%'><input class='product' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='10%'><input class='location' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='18%'><input class='qty' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='10%'><input class='unit' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='10%'><input class='price' style='border: none; background-color: transparent;' value='" + "" + "'/></td><td width='15%'><input class='discount' style='border: none; background-color: transparent;' value=''/></td><input class='discount' style='border: none; background-color: transparent;' value='" + "" + "'/></td></tr>");
    }

    window.clearInterval(bl);
}


//----------------------------------

function ShowActiveTab(tab) {

    $("#liGeneralInfo").removeClass("active form")
    $("#liCustomerItem").removeClass("active form")
    $("#liSalesOrder").removeClass("active form")
    $("#liInvoices").removeClass("active form")
    $("#liPayment").removeClass("active form")
    $("#liMemo").removeClass("active form")

    $("#liGeneralInfo").removeClass("view")
    $("#liCustomerItem").removeClass("view")
    $("#liSalesOrder").removeClass("view")
    $("#liInvoices").removeClass("view")
    $("#liPayment").removeClass("view")
    $("#liMemo").removeClass("view")


    //actions
    $("#action_general_info").hide();
    $("#action_customer_item").hide();
    $("#action_sales_order").hide();
    $("#action_invoices").hide();
    $("#action_payment").hide();
    $("#action_memo").hide();


    if (tab == 'general_info') {
        $("#action_general_info").show();

        ActionNewCustomer();
        $("#NextPageID").show();
        $("#liGeneralInfo").addClass("active form")
        $("#liCustomerItem").addClass("view")
        $("#liSalesOrder").addClass("view")
        $("#liInvoices").addClass("view")
        $("#liPayment").addClass("view")
        $("#liMemo").addClass("view")
        

    }
    else if (tab == 'customer_item') {
        $("#action_customer_item").show();
        OpenCustomerItems();
        $("#liGeneralInfo").addClass("view")
        $("#liCustomerItem").addClass("active form")
        $("#liSalesOrder").addClass("view")
        $("#liInvoices").addClass("view")
        $("#liPayment").addClass("view")
        $("#liMemo").addClass("view")
        //addClassalert('sss');

    }
    else if (tab == 'sales_order') {
        $("#action_sales_order").show();
        OpenSalesOrder();
        $("#liGeneralInfo").addClass("view")
        $("#liCustomerItem").addClass("view")
        $("#liSalesOrder").addClass("active form")
        $("#liInvoices").addClass("view")
        $("#liPayment").addClass("view")
        $("#liMemo").addClass("view")
    }
    else if (tab == 'invoices') {
        $("#action_invoices").show();
        OpenInvoices();
        $("#liGeneralInfo").addClass("view")
        $("#liCustomerItem").addClass("view")
        $("#liSalesOrder").addClass("view")
        $("#liInvoices").addClass("active form")
        $("#liPayment").addClass("view")
        $("#liMemo").addClass("view")

    }
    else if (tab == 'payment') {
        $("#action_payment").show();
        OpenPayment();
        $("#liGeneralInfo").addClass("view")
        $("#liCustomerItem").addClass("view")
        $("#liSalesOrder").addClass("view")
        $("#liInvoices").addClass("view")
        $("#liPayment").addClass("active form")
        $("#liMemo").addClass("view")
    }
    else if (tab == 'memo') {
        $("#action_memo").show();
        OpenMemo();
        $("#liGeneralInfo").addClass("view")
        $("#liCustomerItem").addClass("view")
        $("#liSalesOrder").addClass("view")
        $("#liInvoices").addClass("view")
        $("#liPayment").addClass("view")
        $("#liMemo").addClass("active form")
    }
}

//----------------------------------

function LoadSalesInvoiceList(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceSalesCustomerSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xInvoiceAllTable tbody').empty();
            $('#xInvoicePaidTable tbody').empty();
            $('#xInvoiceUnPaidTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var balanceAmount = Number(data[i]["SubTotalAmt"]) - Number(data[i]["PaymentAmount"]);
                    $('#xInvoiceAllTable tbody:last').append("<tr><td width=\"12%\"> " + data[i]["PrefixInitial"] + "" + data[i]["RefNoSerial"] + " </td><td width=\"12%\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</td><td width=\"25%\">" + data[i]["Salesman"] + "</td><td width=\"10%\">" + days_between(ToJavaScriptDate(data[i]["CreatedDate"]), ToJavaScriptDate(Date.now())) + "</td><td width=\"10%\">" + data[i]["SubTotalAmt"] + "</td><td width=\"10%\">" + balanceAmount + "</td></tr>");
                    if (balanceAmount == "0") {
                        $('#xInvoicePaidTable tbody:last').append("<tr><td width=\"12%\"> " + data[i]["PrefixInitial"] + "" + data[i]["RefNoSerial"] + " </td><td width=\"12%\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</td><td width=\"25%\">" + data[i]["Salesman"] + "</td><td width=\"10%\">" + days_between(ToJavaScriptDate(data[i]["CreatedDate"]), ToJavaScriptDate(Date.now())) + "</td><td width=\"10%\">" + data[i]["SubTotalAmt"] + "</td><td width=\"10%\">" + balanceAmount + "</td></tr>");
                    }
                    else {
                        $('#xInvoiceUnPaidTable tbody:last').append("<tr><td width=\"12%\"> " + data[i]["PrefixInitial"] + "" + data[i]["RefNoSerial"] + " </td><td width=\"12%\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</td><td width=\"25%\">" + data[i]["Salesman"] + "</td><td width=\"10%\">" + days_between(ToJavaScriptDate(data[i]["CreatedDate"]), ToJavaScriptDate(Date.now())) + "</td><td width=\"10%\">" + data[i]["SubTotalAmt"] + "</td><td width=\"10%\">" + balanceAmount + "</td></tr>");
                    }

                }

                bl = window.setInterval("loadBlankSalesInvoiceList()", 300);
            }
            else {
                for (var i = 0; i < 50; i++) {
                    $('#xInvoiceUnPaidTable tbody:last').append("<tr><td width=\"12%\"> " + "" + " </td><td width=\"12%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td></tr>");
                    $('#xInvoiceAllTable tbody:last').append("<tr><td width=\"12%\"> " + "" + "" + "" + " </td><td width=\"12%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td></tr>");

                }
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Filling Table Blank Space
function loadBlankSalesInvoiceList() {
    for (var i = 0; i < 50; i++) {
        $('#xInvoiceUnPaidTable tbody:last').append("<tr><td width=\"12%\"> " + "" + " </td><td width=\"12%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td></tr>");
        $('#xInvoiceAllTable tbody:last').append("<tr><td width=\"12%\"> " + "" + "" + "" + " </td><td width=\"12%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td><td width=\"10%\">" + "" + "</td></tr>");

    }

    window.clearInterval(bl);
}


function LoadCashPayment(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentCashSelectByCustomer",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPaymentCashTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#xPaymentCashTable tbody:last').append("<tr><td width=\"25%\">" + data[i]["RefereneNo"] + "</td><td width=\"25%\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</td><td width=\"25%\">" + data[i]["Amount"] + "</td><td width=\"25%\">" + data[i]["Amount"] + "</td></tr>");
                }
                bl = window.setInterval("loadBlankPayment()", 300);
            }
            else {
                for (var i = 0; i < 50; i++) {
                    $('#xPaymentCashTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                    $('#xPaymentCheckTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                    $('#xPaymentCardTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Filling Table Blank Space
function loadBlankPayment() {
    for (var i = 0; i < 50; i++) {
        $('#xPaymentCashTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
        $('#xPaymentCheckTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
        $('#xPaymentCardTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
    }

    window.clearInterval(bl);
}


function LoadCheckPayment(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentCheckSelectByCustomer",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPaymentCheckTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#xPaymentCheckTable tbody:last').append("<tr><td width=\"25%\">" + data[i]["RefereneNo"] + "</td><td width=\"25%\">" + ToJavaScriptDate(data[i]["CheckDate"]) + "</td><td width=\"25%\">" + data[i]["Amount"] + "</td><td width=\"25%\">" + data[i]["Amount"] + "</td></tr>");
                }
                bl = window.setInterval("loadBlankPayment()", 300);
            }
            else {
                for (var i = 0; i < 50; i++) {
                    $('#xPaymentCashTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                    $('#xPaymentCheckTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                    $('#xPaymentCardTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadCardPayment(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentCardSelectByCustomer",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#xPaymentCardTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#xPaymentCardTable tbody:last').append("<tr><td width=\"25%\">" + data[i]["RefereneNo"] + "</td><td width=\"25%\">" + ToJavaScriptDate(data[i]["CreateDate"]) + "</td><td width=\"25%\">" + data[i]["Amount"] + "</td><td width=\"25%\">" + data[i]["Amount"] + "</td></tr>");
                }
                bl = window.setInterval("loadBlankPayment()", 300);
            }
            else {
                for (var i = 0; i < 50; i++) {
                    $('#xPaymentCashTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                    $('#xPaymentCheckTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                    $('#xPaymentCardTable tbody:last').append("<tr><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td><td width=\"25%\">" + "" + "</td></tr>");
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function days_between(date1, date2) {

    // The number of milliseconds in one day
    var ONE_DAY = 24 * 60 * 60 * 1000;

    // Convert both dates to milliseconds

    var date1_ms = new Date(date1);
    var date2_ms = new Date(date2);


    // Calculate the difference in milliseconds
    var difference_ms = Math.abs(date1_ms - date2_ms);
    // Convert back to days and return
    var diffDays = Math.round(Math.abs((date2_ms.getTime() - date1_ms.getTime()) / (ONE_DAY)));
    return diffDays;

}

function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

function OpenCustomerItems() {
    $("#mnu_submenu").show();
    $("#xCustomerItems").show();

    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").hide();
    $("#xSalesOrder").hide();
    $("#xInvoices").hide();
    $("#xGeneralInfoForm").hide();
    $("#xGeneralInfoList").hide();
    $("#xPayment").hide();
    $("#xMemo").hide();
    $("#NextPageID").show();
}

function OpenSalesOrder() {
    $("#mnu_submenu").show();
    $("#xCustomerItems").hide();
    $("#xSalesOrder").show();
    $("#xInvoices").hide();
    $("#xGeneralInfoForm").hide();
    $("#xGeneralInfoList").hide();
    $("#xSalesOrderAll").show();
    $("#xPayment").hide();
    $("#xMemo").hide();
    $("#NextPageID").hide();
    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").hide();
}

function OpenInvoices() {
    $("#mnu_submenu").show();
    $("#xCustomerItems").hide();
    $("#xSalesOrder").hide();
    $("#xInvoices").show();
    $("#xGeneralInfoForm").hide();
    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").hide();
    $("#xInvoicesAll").show();
    $("#xPayment").hide();
    $("#xMemo").hide();
    $("#NextPageID").hide();
}

function OpenSalesOrderAll() {
    $("#xSalesOrderAll").show();
    $("#xSalesOrderOpen").hide();
    $("#xSalesOrderClosed").hide();
}

function OpenSalesOrderClosed() {
    $("#xSalesOrderAll").hide();
    $("#xSalesOrderOpen").show();
    $("#xSalesOrderClosed").hide();
}

function OpenSalesOrderOpen() {
    $("#xSalesOrderAll").hide();
    $("#xSalesOrderOpen").hide();
    $("#xSalesOrderClosed").show();
}

function OpenInvoicesAll() {
    $("#xInvoicesAll").show();
    $("#xInvoicesPaid").hide();
    $("#xInvoicesUnpaid").hide();
}

function OpenInvoicesPaid() {
    $("#xInvoicesAll").hide();
    $("#xInvoicesPaid").show();
    $("#xInvoicesUnpaid").hide();
}

function OpenInvoicesUnpaid() {
    $("#xInvoicesAll").hide();
    $("#xInvoicesPaid").hide();
    $("#xInvoicesUnpaid").show();
}

function OpenGeneralInfoFrom() {
    $("#xGeneralInfoList").hide();
    $("#xGeneralInfoForm").show();
}

function OpenPayment() {
    $("#xCustomerItems").hide();
    $("#xSalesOrder").hide();
    $("#xInvoices").hide();
    //$("#xGeneralInfo").hide();
    $("#xInvoicesAll").hide();
    $("#xPayment").show();
    $("#xPaymentCash").show();
    $("#xMemo").hide();
    $("#NextPageID").hide();
    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").hide();
}

function OpenPaymentCash() {
    $("#xPaymentCash").show();
    $("#xPaymentCheck").hide();
    $("#xPaymentCard").hide();
}

function OpenPaymentCheck() {
    $("#xPaymentCash").hide();
    $("#xPaymentCheck").show();
    $("#xPaymentCard").hide();
}

function OpenPaymentCard() {
    $("#xPaymentCash").hide();
    $("#xPaymentCheck").hide();
    $("#xPaymentCard").show();
}

function OpenMemo() {
    $("#xCustomerItems").hide();
    $("#xSalesOrder").hide();
    $("#xInvoices").hide();
    //$("#xGeneralInfo").hide();
    $("#xInvoicesAll").hide();
    $("#xPayment").hide();
    $("#xMemo").show();
    $("#xMemoAll").show();
    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").hide();
}

function OpenMemoAll() {
    $("#xMemoAll").show();
    $("#xMemoDebit").hide();
    $("#xMemoCredit").hide();
}

function OpenMemoDebit() {
    $("#xMemoAll").hide();
    $("#xMemoDebit").show();
    $("#xMemoCredit").hide();
}

function OpenMemoCredit() {
    $("#xMemoAll").hide();
    $("#xMemoDebit").hide();
    $("#xMemoCredit").show();
}
