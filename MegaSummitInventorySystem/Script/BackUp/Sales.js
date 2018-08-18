/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

var bl;


// ******************************************************************************************
// ------------------------------- LOAD SYSTEM DEFAUL DATA ----------------------------------
// ******************************************************************************************

//ProductAutoComplete();
//LocationAutoComplete();
$(document).ready(function () {
    ProductAutoComplete();
    LocationAutoComplete();
});


// ------------------------------------------- Create new Sales
function NewSales() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    LoadCustomer();
    LoadForwarded();
    LoadSalesman();
    LoadTerms();
    LoadRemarks();
    LoadReferenceNo();
    LoadPreparedEmployee();
    LoadCheckedEmployee();
    LoadDeliveredEmployee();
    LoadCardType();
    LoadCardExp();
    LoadAccountEmployee();
    LoadPaymentRefDetails();
    LoadCustomerSettingsDefault();

    $('#hdn_customerID').val("0");
    $('#customer').val("");
    $('#address').val("");
    $('#po_number').val("");
    $('#hdn_refNo').val("");
    $('#reference_number').val("");
    $('#date').val("");
    $('#delivery_date').val("");
    $('#checked').val("0");
    $('#hdn_check').val("0");
    $('#waybill_number').val("");
    $('#container_number').val("");
    $('#lading_bill').val("");
    $('#commission_rate').val("0.00");
    $('#commission_amount').val("0.00");
    $('#notes').val("");
    $('#txtSubtotal').val("0.00");
    $('#txtTax').val("0.00");
    $('#txtShipping').val("0.00");
    $('#txtPayment').val("0.00");
    $('#txtMemo').val("0.00");
    $('#txtAdjustment').val("0.00");

    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    $('#date').val("0" + month + "." + day + "." + year);

    $("#xSalesList").hide();
    $("#xSalesForm").show();
}

// ------------------------------------------- Load All Customer (AutoComplete)
function LoadCustomer() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteCustomer",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#customer").autocomplete({
                source: response.d,
                minLength: 0,
                minChars: 0,
                max: 12,
                autoFill: true,
                matchContains: false,
                select: function (a, b) {
                    ActionSelectCustomerDetials(b.item.id);
                }
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

}

// ------------------------------------------- Load Customer Information Details
function ActionSelectCustomerDetials(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCustomerDetails",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {
                $('#hdn_customerID').val(data[i]["ID"]);
                $('#address').val(data[i]["Address"]);
                $('#salesman').val(data[i]["SalesmanID"]);
                $('#deliver_to').val(data[i]["ShipToID"]);
                $('#terms').val(data[i]["TermID"]);
                $('#hdnPriceLevel').val(data[i]["PriceLevel"]);
                $('#txtCreditLimit').val(data[i]["CreditLimit"]);
                
                LoadSalesOrder($('#hdn_customerID').val());
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Customer Settings Default
function LoadCustomerSettingsDefault() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesReferenceDefault",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {
                $('#referenceNo').val(data[i]["SalesReference"]);
                LoadMaximumLines();
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Deliver to 
function LoadForwarded() {

    var pageUrl = '/Webservice/svr_Forwarder.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectForwarder",
        data: "{ 'id':'0', 'forwarder_name':'', 'address':'', 'contact_person':'', 'telephone':'', 'mobile_phone':'', 'fax':'', 'status':'', 'area':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#deliver_to').empty();
            $('#deliver_to').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#deliver_to').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ForwardedName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Employee (Salesman)
function LoadSalesman() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{ 'id':'0', 'employeeName':'', 'employeeType':'Salesman'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#salesman').empty();
            $('#salesman').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

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
            $('#terms').append("<option value='" + "0" + "'>" + "</option>");
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

// ------------------------------------------- Load All Remarks
function LoadRemarks() {
    var pageUrl = '/Webservice/svr_Remarks.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRemarks",
        data: "{ 'id':'0', 'remarks_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            //remarks


            $('#remarks').empty();
            $('#remarks').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#remarks').append("<option value='" + data[i]["ID"] + "'>" + data[i]["RemarksName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Customer Sales Reference Number
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

            $('#referenceNo').empty();
            $('#referenceNo').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#referenceNo').append("<option value='" + data[i]["ID"] + "'>" + data[i]["PrefixInitial"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Employee (Prepared)
function LoadPreparedEmployee() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{ 'id':'0', 'employeeName':'', 'employeeType':'Employee'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#prepared').empty();
            $('#prepared').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#prepared').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Employee (for Check)
function LoadCheckedEmployee() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{ 'id':'0', 'employeeName':'', 'employeeType':'Employee'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#checked').empty();
            $('#checked').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#checked').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Employee (for Delivery)
function LoadDeliveredEmployee() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{ 'id':'0', 'employeeName':'', 'employeeType':'Employee'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#delivered').empty();
            $('#delivered').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#delivered').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Payment Card Type
function LoadCardType() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCardType",
        data: "{ 'id':'0', 'CardTypeName':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#card_type').empty();
            $('#card_type').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#card_type').append("<option value='" + data[i]["ID"] + "'>" + data[i]["CardTypeName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Payment Card Expiration Year
function LoadCardExp() {

    var d = new Date();
    var dYear = d.getFullYear();
    var dYear2 = Number(dYear) + 1;
    var dYear3 = Number(dYear) + 2;
    var dYear4 = Number(dYear) + 3;

    $('#expiration_year').empty();
    $('#expiration_year').append("<option value='" + "0" + "'>" + "</option>");
    $('#expiration_year').append("<option value='" + dYear + "'>" + dYear + "</option>");
    $('#expiration_year').append("<option value='" + dYear2 + "'>" + dYear2 + "</option>");
    $('#expiration_year').append("<option value='" + dYear3 + "'>" + dYear3 + "</option>");
    $('#expiration_year').append("<option value='" + dYear4 + "'>" + dYear4 + "</option>");
}

// ------------------------------------------- Load Employee Account
function LoadAccountEmployee() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{ 'id':'0', 'employeeName':'', 'employeeType':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#employee_name').empty();
            $('#employee_name').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#employee_name').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Product (AutoComplete)
function ProductAutoComplete() {

    //$("#ContentPlaceHolder1_txtPayment").autocomplete({
    //    source: ['DROP SHIPPING', 'WAREHOUSE', 'DIRECT SALES'],
    //    minLength: 0,
    //    minChars: 0,
    //    max: 12,
    //    autoFill: true,
    //    matchContains: false
    //}).on('focus', function (event) {
    //    var self = this;
    //    $(self).autocomplete("search", "");
    //});

       //#salesInvoice_table
    $("#salesInvoice_table tbody tr").each(function (i) {
        $(this).find("td .product_code").autocomplete({
            source: ProductAutoCompleteData,
            minLength: 0,
            minChars: 0,
            max: 12,
            autoFill: true,
            matchContains: false,
            select: function (a, b) {
                ActionSelectProductDetails(b.item.id, this)
            }
        })
    .on('focus', function (event) {
        var self = this;
        $(self).autocomplete("search", "");
    });
    });


    //alert('xx');

    //var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    //$.ajax({
    //    type: "POST",
    //    url: pageUrl + "/AutoCompleteProduct",
    //    data: "{  }",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (response) {
    //        $("#salesInvoice_table tbody tr").each(function (i) {
    //                $(this).find("td .product_code").autocomplete({
    //                    source: response.d,
    //                    minLength: 0,
    //                    minChars: 0,
    //                    max: 12,
    //                    autoFill: true,
    //                    matchContains: false,
    //                    select: function (a, b) {
    //                        ActionSelectProductDetails(b.item.id, this)
    //                    }
    //                })
    //            .on('focus', function (event) {
    //                var self = this;
    //                $(self).autocomplete("search", "");
    //            });
    //        });
    //    },
    //    error: function (response) {
    //        alert(response.status);
    //    }
    //});
}

// ------------------------------------------- Load Product Information Details
function ActionSelectProductDetails(id, me) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductDetails",
        data: "{ 'id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $(me).closest("tr").find(".packing_product").val(data[i]["Packing"]);
                $(me).closest("tr").find(".unit_product").val(data[i]["UnitName"]);
                $("#ProductUnitID").val(data[i]["UnitID"]);

                if ($('#hdnPriceLevel').val() == "A") {
                    var priceUn = Number(data[i]["PriceA"]);
                    var priceUn1 = Number(data[i]["PriceB"]);
                    var priceUn2 = Number(data[i]["PriceC"]);

                    $(me).closest("tr").find(".price").val(priceUn.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $(me).closest("tr").find(".discount_product").val("-" + data[i]["DiscountA"]);

                    $('#txtRpriceA').val(priceUn.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscA').val("-" + data[i]["DiscountA"]);
                    $('#txtRpriceB').val(priceUn1.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscB').val("-" + data[i]["DiscountB"]);
                    $('#txtRpriceC').val(priceUn2.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscC').val("-" + data[i]["DiscountC"]);


                }
                else if ($('#hdnPriceLevel').val() == "B") {
                    var priceUn = Number(data[i]["PriceB"]);
                    var priceUn1 = Number(data[i]["PriceA"]);
                    var priceUn2 = Number(data[i]["PriceC"]);

                    var priceUn2 = priceUn.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    $(me).closest("tr").find(".price").val(priceUn.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $(me).closest("tr").find(".discount_product").val("-" + data[i]["DiscountB"]);



                    $('#txtRpriceA').val(priceUn1.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscA').val("-" + data[i]["DiscountA"]);
                    $('#txtRpriceB').val(priceUn.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscB').val("-" + data[i]["DiscountB"]);
                    $('#txtRpriceC').val(priceUn2.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscC').val("-" + data[i]["DiscountC"]);

                }
                else if ($('#hdnPriceLevel').val() == "C") {
                    var priceUn = Number(data[i]["PriceC"]);
                    var priceUn1 = Number(data[i]["PriceB"]);
                    var priceUn2 = Number(data[i]["PriceA"]);

                    $(me).closest("tr").find(".price").val(priceUn.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $(me).closest("tr").find(".discount_product").val("-" + data[i]["DiscountC"]);

                    $('#txtRpriceA').val(priceUn2.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscA').val("-" + data[i]["DiscountA"]);
                    $('#txtRpriceB').val(priceUn1.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscB').val("-" + data[i]["DiscountB"]);
                    $('#txtRpriceC').val(priceUn.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $('#txtRdiscC').val("-" + data[i]["DiscountC"]);
                }
                else {
                    $(me).closest("tr").find(".price").val("0.00");
                    $(me).closest("tr").find(".discount_product").val('0');
                }
               
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Product Unit
function LoadProductUnitPlural(product_code, me) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/ProductUnitPlural",
        data: "{ 'product_code':'" + product_code + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $(me).closest("tr").find(".unit_product").val(data[i]["Plural"]);

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Location (AutoComplete)
function LocationAutoComplete() {

            $("#salesInvoice_table tbody tr").each(function (i) {

                $(this).find("td .location_code").autocomplete({
                    source: LocationAutoCompleteData,
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

            });


    //var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    //$.ajax({
    //    type: "POST",
    //    url: pageUrl + "/AutoCompleteLocation",
    //    data: "{  }",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (response) {
    //        $("#salesInvoice_table tbody tr").each(function (i) {

    //            $(this).find("td .location_code").autocomplete({
    //                source: response.d,
    //                minLength: 0,
    //                minChars: 0,
    //                max: 12,
    //                autoFill: true,
    //                matchContains: false
    //            })
    //        .on('focus', function (event) {
    //            var self = this;
    //            $(self).autocomplete("search", "");
    //        });

    //        });
    //    },

    //    error: function (response) {
    //        alert(response.status);
    //    }
    //});


}

// ------------------------------------------- Load Bank Name (AutoComplete)
function BankNameAutoComplete() {


    $("#checkpayment_table tbody tr").each(function (i) {
                    $(this).find("td .bank_name").autocomplete({
                        source: BankAutoCompleteData,
                        minLength: 0,
                        minChars: 0,
                        max: 12,
                        autoFill: true,
                        matchContains: false,
                        select: function (a, b) {
                            ActionCheckType(this);
                        }
                    })
                .on('focus', function (event) {
                    var self = this;
                    $(self).autocomplete("search", "");
                });
                });

    //var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    //$.ajax({
    //    type: "POST",
    //    url: pageUrl + "/AutoCompleteBank",
    //    data: "{  }",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (response) {
    //        $("#checkpayment_table tbody tr").each(function (i) {
    //            $(this).find("td .bank_name").autocomplete({
    //                source: response.d,
    //                minLength: 0,
    //                minChars: 0,
    //                max: 12,
    //                autoFill: true,
    //                matchContains: false,
    //                select: function (a, b) {
    //                    ActionCheckType(this);
    //                }
    //            })
    //        .on('focus', function (event) {
    //            var self = this;
    //            $(self).autocomplete("search", "");
    //        });
    //        });
    //    },
    //    error: function (response) {
    //        alert(response.status);
    //    }
    //});
}

// ------------------------------------------- Insert in Customer Bank Payment as POSTED CHECK
function ActionCheckType(me) {
    $(me).closest("tr").find(".check_type").val("Posdated Check");
}

// ------------------------------------------- Load Sales Order by Customer
function LoadSalesOrder(CustomerID) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderRefSelect",
        data: "{ 'id':'" + CustomerID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#order_number').empty();
            $('#order_number').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#order_number').append("<option value='" + data[i]["ID"] + "'>" + data[i]["refNumber"] + "</option>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Sales Order Details
function LoadSalesOrderDetails() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderDetailsInvoiceSelect",
        data: "{'id':'" + $('#order_number').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#salesorderTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                
                $('#salesorderTable tbody:last').append("<tr><td width='30%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["ProductName"] + "</div></td><td width='15%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["LocationName"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["Quantity"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["UnitName"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["UnitPrice"] + "</td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["Discount"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["Amount"] + "</div></td></tr>");
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Remove Product list Row
function RemoveRow() {
    $('.ActionButton').on('click', function () {
        $(this).closest('tr').remove();
        //$("#salesInvoice_table tbody").append("<tr><td width='10%'><input class='packing_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' readonly='true'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%; color: gray;'/></td><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='qty_product' onblur='ActionComputeAmount(this); ComputeDiscount(this);' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;' /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='5%'> <input type='button' name='name' value='X' class='ActionButton' /> </td></tr>");
        ActionComputeSubtotal();
        return false;
    });
}

// ------------------------------------------- Put Sales Order to Sales Invoice Product List
function ServerdOrder(ID) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderDetailsSelectToIV",
        data: "{'id':'" + ID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var y = 0; y < data.length; y++) {
                $('#salesInvoice_table tbody tr').each(function (i) {
                    var x1 = $(this).find("td .packing_product").val();
                    var x2 = $(this).find("td .product_code").val();
                    var x3 = $(this).find("td .location_code").val();
                    var x4 = $(this).find("td .qty_product").val();
                    var x5 = $(this).find("td .unit_product").val();
                    var x6 = $(this).find("td .price").val();
                    var x7 = $(this).find("td .discount_product").val();
                    var x8 = $(this).find("td .total_amount").val();
                    if (x2 == "") {
                        $(this).find("td .order_product").val(data[y]["ID"]);
                        $(this).find("td .packing_product").val(data[y]["PackingName"]);
                        $(this).find("td .product_code").val(data[y]["ProductName"]);
                        $(this).find("td .location_code").val(data[y]["LocationName"]);
                        $(this).find("td .unit_product").val(data[y]["UnitName"]);
                        $(this).find("td .price").val(data[y]["UnitPrice"]);
                        $(this).find("td .discount_product").val(data[y]["Discount"]);
                        return false;
                    }
                });
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Create Product List Depends on Reference Number
function LoadMaximumLines() {

    var e = document.getElementById("referenceNo");
    var refID = e.options[e.selectedIndex].value;

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectMaximumLines",
        data: "{ 'id':'" + refID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var table = $("#salesInvoice_table tbody");
            table.empty();
            for (var i = 0; i < response.d; i++) {
                table.append("<tr><td width='10%'><input class='packing_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%; color: gray;'/></td><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='qty_product' onblur='ActionComputeAmount(this); ComputeDiscount(this);' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;' /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='price'  onblur='ActionComputeAmount(this); ComputeDiscount(this);' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray; text-align: right;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' onblur='ActionComputeAmount(this); ComputeDiscount(this);' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray; text-align: right;' /></td><td width='5%'> <input type='button' name='name' value='X' class='ActionButton' /> </td></tr>");
                
            }
            
            LoadRefID();
            RemoveRow();


            LoadRefDetails();
            ProductAutoComplete();
            LocationAutoComplete();
        },
        error: function (response) {
            alert(response.status);
        }
    });
    


    ProductAutoComplete();
    LocationAutoComplete();
}

// ------------------------------------------- Load Latest or Manual Reference Number
function LoadRefDetails() {
    var e = document.getElementById("referenceNo");
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

// ------------------------------------------- Load Latest or Manual Payment Reference Number
function LoadPaymentRefDetails() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectPaymentRefDetails",
        data: "{ 'id':'3'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i]["Automatic"] == true) {
                    $('#txtPaymentRef').val(data[i]["NextNo"]);
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Create Product list after loading data from Database
function LoadMaximumLinesUpdate(curRow) {

    var e = document.getElementById("referenceNo");
    var refID = e.options[e.selectedIndex].value;

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectMaximumLines",
        data: "{ 'id':'" + refID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var table = $("#salesInvoice_table tbody");
            for (var i = 0; i < response.d - curRow; i++) {
                table.append("<tr><td width='10%'><input class='packing_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%; color: gray;'/></td><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='qty_product' onblur='ActionComputeAmount(this); ComputeDiscount(this);' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;' /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray; text-align: right;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  onblur='ActionComputeAmount(this); ComputeDiscount(this);'/></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray; text-align: right;' /></td><td width='5%'> <input type='button' name='name' value='X' class='ActionButton' /> </td></tr>");

            }
            LoadRefID();
            RemoveRow();

            ProductAutoComplete();
            LocationAutoComplete();
        },
        error: function (response) {
            alert(response.status);
        }
    });
    
    ProductAutoComplete();
    LocationAutoComplete();
}

// ------------------------------------------- Filling Table Blank Space
function loadBlank() {
    for (var i = 0; i < 50; i++) {
        $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='30%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");
    }

    window.clearInterval(bl);
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankSalesInvoice() {
    for (var i = 0; i < 50; i++) {
        $("#salesInvoice_table tbody:last").append("<tr><td width='10%'><input class='packing_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%; color: gray;'/></td><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='qty_product' onblur='ActionComputeAmount(this); ComputeDiscount(this);' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;' /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray; text-align: right;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  onblur='ComputeDiscount(this);'/></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray; text-align: right;' /></td><td width='5%'> <input type='button' name='name' value='X' class='ActionButton' /> </td></tr>");
    }

}


// ------------------------------------------- Filling Table Blank Space
function loadBlankSalesOrder() {
    for (var i = 0; i < 20; i++) {
        $('#salesorderTable tbody:last').append("<tr><td width='30%'><div>" + "" + "</div></td><td width='15%'><div class='actioncClick' >" + "" + "</div></td><td width='10%'><div class='actioncClick'>" + "" + "</div></td><td width='10%'><div class='actioncClick'>" + "" + "</div></td><td width='10%'><div class='actioncClick'>" + "" + "</td><td width='10%'><div class='actioncClick' >" + "" + "</div></td><td width='10%'><div class='actioncClick'>" + "" + "</div></td></tr>");
    }

}

// ------------------------------------------- Converting System Date to Javascript Date
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

// ------------------------------------------- Filling Adjustment Table
function FillingAdjustmentTable() {

    $('#salesInvoice_table tbody tr').each(function (i) {
        var pageUrl = '/Webservice/svr_CustomerSales.asmx';
        var packing_product = $(this).find("td .packing_product").val();
        var product_code = $(this).find("td .product_code").val();
        var location_code = $(this).find("td .location_code").val();
        var qty_product = $(this).find("td .qty_product").val();
        var unit_product = $(this).find("td .unit_product").val();
        var price = $(this).find("td .price").val();
        var discount_product = $(this).find("td .discount_product").val();
        var total_amount = $(this).find("td .total_amount").val();
        var order_product = $(this).find("td .order_product").val();
        if (packing_product != "") {
            $('#xSalesAdjusment_Table tbody').empty();
            $.ajax({
                type: "POST",
                url: pageUrl + "/InvoiceAdjustment",
                data: "{'invoiceID':'" + $("#hdnInvoiceID").val() + "', 'productName':'" + product_code + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    var data = eval(response.d);
                    for (var i = 0; i < data.length; i++) {
                        if (data[i]["Discount"] != discount_product && data[i]["UnitPrice"] != price) {
                            $('#xSalesAdjusment_Table tbody').append("<tr><td width='30%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' value='" + product_code + "' readonly='true' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + location_code + "' readonly='true' /></td><td width='10%'><input class='qty_product' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;'  value='" + qty_product + "'  readonly='true'/></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + unit_product + "' readonly='true' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: red;'  value='" + data[i]["UnitPrice"] + "' onblur='ActionComputeAmountAdjustment(this);' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: red;' onblur='ComputeDiscount(this);'  value='" + data[i]["Discount"] + "' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + data[i]["Amount"] + "' readonly='true' /></td></tr>");
                        }
                        else if (data[i]["UnitPrice"] != price) {
                            $('#xSalesAdjusment_Table tbody').append("<tr><td width='30%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' value='" + product_code + "' readonly='true' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + location_code + "' readonly='true' /></td><td width='10%'><input class='qty_product' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;'  value='" + qty_product + "'  readonly='true'/></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + unit_product + "' readonly='true' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: red;'  value='" + data[i]["UnitPrice"] + "' onblur='ActionComputeAmountAdjustment(this);' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' onblur='ComputeDiscount(this);'  value='" + data[i]["Discount"] + "' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + data[i]["Amount"] + "' readonly='true' /></td></tr>");
                        }
                        else if (data[i]["Discount"] != discount_product) {
                            $('#xSalesAdjusment_Table tbody').append("<tr><td width='30%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' value='" + product_code + "' readonly='true' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + location_code + "' readonly='true' /></td><td width='10%'><input class='qty_product' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;'  value='" + qty_product + "'  readonly='true'/></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + unit_product + "' readonly='true' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + data[i]["UnitPrice"] + "' onblur='ActionComputeAmountAdjustment(this);' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: red;' onblur='ComputeDiscount(this);'  value='" + data[i]["Discount"] + "' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + data[i]["Amount"] + "' readonly='true' /></td></tr>");
                        }
                        else {
                            $('#xSalesAdjusment_Table tbody').append("<tr><td width='30%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' value='" + product_code + "' readonly='true' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + location_code + "' readonly='true' /></td><td width='10%'><input class='qty_product' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;'  value='" + qty_product + "'  readonly='true'/></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + unit_product + "' readonly='true' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + price + "' onblur='ActionComputeAmountAdjustment(this);' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' onblur='ComputeDiscount(this);'  value='" + discount_product + "' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + total_amount + "' readonly='true' /></td></tr>");
                        }
                    }
                    if (data.length == 0) {
                        $('#xSalesAdjusment_Table tbody').append("<tr><td width='30%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' value='" + product_code + "' readonly='true' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + location_code + "' readonly='true' /></td><td width='10%'><input class='qty_product' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;'  value='" + qty_product + "'  readonly='true'/></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + unit_product + "' readonly='true' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + price + "' onblur='ActionComputeAmountAdjustment(this);' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' onblur='ComputeDiscount(this);'  value='" + discount_product + "' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + total_amount + "' readonly='true' /></td></tr>");
                    }
                },
                error: function (response) {
                    alert(response.status);
                }
            });
           
        }
    });

}

// ------------------------------------------- Load Opening Balance List
function LoadOpeningBalanceList(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelectByCustomer",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ULOpeningBalance').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ULOpeningBalance").append("<li onclick='actionSelectOpeningBalance(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["RefNo"] + "<span><div style='float: left;'>" + data[i]["DatePay"] + "</div><div style='float: right; font-size: 15px;'>" + data[i]["TotalAmount"] + "</div></span></span></a> </li>");
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function actionSelectOpeningBalance(id) {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelectByCustomerDetails",
        data: "{'id':'0', 'InvoiceID':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#hdnInvoiceID').val(id);
                $('#address').val(data[i]["Address"]);
                $('#salesmanOpeningBalance').val(data[i]["SalesmanID"]);
                $('#termOpeningBalance').val(data[i]["TermID"]);
                $('#SalesRef').val(data[i]["RefNo"]);
                $('#referenceOpening').val(data[i]["RefNoSerial"]);
                $('#dateOpening').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                $('#commmission').val(data[i]["CommissionRate"]);
                $('#amount').val(data[i]["SubTotalAmt"]);
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


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


// ------------------------------------------- Load Opening Balance Payment By Specific Customer
function LoadOpeningBalancePaymentList() {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/OpeningBalancePaymentSelectByCustomer",
        data: "{'id':'0', 'CustomerID':'" + $('#hdnCustomerID').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#UlPaymentOpening').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#UlPaymentOpening").append("<li onclick='actionSelectOpeningBalancePayment(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["RefNo"] + "<span><div style='float: left;'>" + data[i]["DatePay"] + "</div><div style='float: right; font-size: 15px;'>" + data[i]["TotalAmount"] + "</div></span></span></a> </li>");
            }
        },
        error: function (response) {
        }
    });
}

// ------------------------------------------- Load Opening Balance Details
function actionSelectOpeningBalancePayment(id) {
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
                $('#hdnOpeningPaymentID').val(id);
                $('#bank_name').val(data[i]["CheckID"]);
                $('#check_number').val(data[i]["CheckNo"]);
                $('#check_type').val(data[i]["CheckType"]);
                $('#OpeningDate').val(ToJavaScriptDate(data[i]["CheckDate"]));
                $('#OpeningAmount').val(data[i]["CheckAmount"]);
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


function ShowOpeningBalancePayment() {
    LoadOpeningBalancePaymentList();
    $("#xSalesOpeningBalanceInvoice").hide();
    $("#xSalesOpeningBalancePayment").show();
    
}

function ShowOpeningBalance() {
    $("#xSalesOpeningBalanceInvoice").show();
    $("#xSalesOpeningBalancePayment").hide();
}

// ------------------------------------------- Load Customer Sales Reference Number
function LoadReferenceNoOpening() {

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

// ------------------------------------------- Load Latest or Manual Reference Number
function LoadRefDetailsOpening() {
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
                    $('#referenceOpening').val(data[i]["NextNo"]);
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ***************************************************************************************************
// -------------------------------------- RETREIVE DATA ID -------------------------------------------
// ***************************************************************************************************

// ------------------------------------------- Retreive Selected Customer ID
function LoadCustomerID() {
    var e = document.getElementById("customer");
    var cusID = e.options[e.selectedIndex].value;
    $('#hdn_customerID').val(cusID);
    LoadSalesOrder($('#hdn_customerID').val());
}
       
// ------------------------------------------- Retreive Selected Deliver to ID
function LoadDelivertoID() {
    var e = document.getElementById("deliver_to");
    var DelivertoID = e.options[e.selectedIndex].value;
    $('#hdn_deliverTo').val(DelivertoID);
}

// ------------------------------------------- Retreive Selected Salesman ID
function LoadSalesmanID() {
    var e = document.getElementById("salesman");
    var SalesmanID = e.options[e.selectedIndex].value;
    $('#hdn_salesman').val(SalesmanID);
}

// ------------------------------------------- Retreive Selected Terms ID
function LoadTermID() {
    var e = document.getElementById("terms");
    var termID = e.options[e.selectedIndex].value;
    $('#hdn_termID').val(termID);
}

// ------------------------------------------- Retreive Selected Reference ID
function LoadRefID() {
    var e = document.getElementById("referenceNo");
    var RefID = e.options[e.selectedIndex].value;
    $('#hdn_refNo').val(RefID);
}

// ------------------------------------------- Retreive Selected Prepared by ID
function LoadPerparedID() {
    var e = document.getElementById("prepared");
    var PerparedID = e.options[e.selectedIndex].value;
    $('#hdn_perparedID').val(PerparedID);
}

// ------------------------------------------- Retreive Selected Checker ID
function LoadCheckedID() {
    var e = document.getElementById("checked");
    var CheckedID = e.options[e.selectedIndex].value;
    $('#hdn_check').val(CheckedID);
}

// ------------------------------------------- Retreive Selected for Delivery ID
function LoadDeliveredID() {
    var e = document.getElementById("delivered");
    var DeliveredID = e.options[e.selectedIndex].value;
    $('#hdn_delivered').val(DeliveredID);
}

// ------------------------------------------- Retreive Selected Remarks ID
function LoadRemarksID() {
    var e = document.getElementById("remarks");
    var DeliveredID = e.options[e.selectedIndex].value;
    $('#hdn_remarks').val(DeliveredID);
}

// ***************************************************************************************************
// ---------------------------------- AMOUNT COMPUTATION ---------------------------------------------
// ***************************************************************************************************

// ------------------------------------------- Compute Product Price Amount
function ActionComputeAmount(me) {
    var qty = $(me).closest("tr").find(".qty_product").val();
    if (Number(qty) > 1) {
        LoadProductUnitPlural($(me).closest("tr").find(".product_code").val(), me);
    }
    var price = $(me).closest("tr").find(".price").val().toString();
    var total = Number(price.replace(",","")) * Number(qty);
    $(me).closest("tr").find(".total_amount").val(total.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    
    ActionComputeSubtotal();
}

// ------------------------------------------- Compute Product Price Amount in Adjustment
function ActionComputeAmountAdjustment(me) {
    var qty = $(me).closest("tr").find(".qty_product").val();
    var price = $(me).closest("tr").find(".price").val().toString();
    var total = Number(price.replace(",", "")) * Number(qty);
    $(me).closest("tr").find(".total_amount").val(total.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
}

// ------------------------------------------- Compute All Product Price Amount
function ActionComputeSubtotal() {
    var totalAmount = 0;
    $("#salesInvoice_table tbody tr").each(function (i) {
        if (Number($(this).find("td .total_amount").val().toString().replace(",", "")) > 0) {
            totalAmount += Number($(this).find("td .total_amount").val().toString().replace(",", ""));
        }
    });
    $("#txtSubtotal").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    $("#txtTotalSalesInvoice").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    $("#txtAmountDue").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
}

// ------------------------------------------- Compute Product Discount
function ComputeDiscount(me) {
    //ActionComputeAmount(me);
    var textArr1 = new Array();
    var TotalPlus = 0;
    var TotalMinus = 0;
    textArr1 = $(me).closest("tr").find(".discount_product").val().split("+");
    var totalAmount = Number($(me).closest("tr").find(".total_amount").val().toString().replace(",", ""));
    var NewTotal = 0;
    for (var i = 0; i < textArr1.length; i++) {
        var ss = textArr1[i].toString();
        if (ss.indexOf("-") != -1) {
            var textArr2 = new Array();
            textArr2 = textArr1[i].split("-");
            for (var z = 0; z < textArr2.length; z++) {
                if (z == 0) {
                    var disPer = Number(textArr2[z]) / 100;
                    var discount = Number(totalAmount) * Number(disPer);
                    totalAmount = totalAmount + discount;
                }
                else {
                    var disPer = Number(textArr2[z]) / 100;
                    var discount = Number(totalAmount) * Number(disPer);
                    totalAmount = totalAmount - discount;
                }
            }
        }
        else {
            var disPer = Number(textArr1[i]) / 100;
            var discount = Number(totalAmount) * Number(disPer);
            totalAmount = totalAmount + discount;
        }
    }
    $(me).closest("tr").find(".total_amount").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    ActionComputeSubtotal();
}

// ------------------------------------------- Compute Customer Cash Payment
function ComputeCashPayment() {
    var amount = $('#amount_cash').val();
    $('#txtTotalCash').val(amount);

    ComputeTotalPayment();
}

// ------------------------------------------- Compute Customer Check Payment
function ComputeCheckPayment() {
    var totalAmount = 0;
    $("#checkpayment_table tbody tr").each(function (i) {
        if ($(this).find("td .amount_check").val() != null && $(this).find("td .amount_check").val() != "") {
            totalAmount += Number($(this).find("td .amount_check").val());
        }
    });
    $("#txtTotalCheck").val(totalAmount);
    ComputeTotalPayment();
}

// ------------------------------------------- Compute Customer Card Payment
function ComputeCardPayment() {
    var amount = $('#card_amount').val();
    $('#txtTotalCard').val(amount);

    ComputeTotalPayment();
}

// ------------------------------------------- Compute Customer Total Payment
function ComputeTotalPayment() {
    var amountCash = $('#txtTotalCash').val();
    var amountCheck = $('#txtTotalCheck').val();
    var amountCard = $('#txtTotalCard').val();
    var amountAccount = $('#txtTotalAccount').val();
    var NewTotal = (Number(amountCash) + Number(amountCheck)) + (Number(amountCard) + Number(amountAccount));
    $('#txtPayment').val(NewTotal);

}

// **************************************************************************************************
// ------------------------------------ ACCESSING DATABASE ------------------------------------------
// **************************************************************************************************

// ------------------------------------------- Load Saved Sales Invoices
function LoadSalesInvoiceList() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    
    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceSalesSelect",
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#tblCustomer tbody').empty();
            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var invoiceID = data[i]["ID"];
                    $('#hndSalesInvoiceID').val(invoiceID);
                    LoadSalesInvoicePaymentSelect(data[i]["ID"], data[i]["PrefixInitial"], data[i]["RefNoSerial"], ToJavaScriptDate(data[i]["CreatedDate"]), data[i]["CustomerName"], data[i]["Salesman"], data[i]["SubTotalAmt"], data[i]["InvoiceStatus"], data[i]["SubTotalAmt"]);

                }

              
            }
            else {
                for (var i = 0; i < 20; i++) {
                    $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='30%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");
                }

                

            }

            //loadBlank();
        },
        error: function (response) {

        }
    });
    
   
    
}

// ------------------------------------------- Load Saved Sales Invoice With Computing Balance
function LoadSalesInvoicePaymentSelect(ID,PrefixInitial,RefNoSerial,CreatedDate,CustomerName,Salesman,SubTotalAmt,InvoiceStatus,SubTotalAmt) {

            //var SalesInvoiceID = $('#hndSalesInvoiceID').val();
            //var data = InvoicePaymentData;
            //var obj = "";
            //if (data.length != 0) {
            //    for (var i = 0; i < data.length; i++) {

            //        if (SalesInvoiceID == data[i]["InvoiceID"])
            //        {
            //            var totalAmount = 0;
            //            var tempSalesInvoiceID = $('#hndSalesInvoiceID').val();

            //            for (var x = 0; i < data.length; x++)
            //            {
            //                if (SalesInvoiceID == data[i]["InvoiceID"])
            //                {
            //                    totalAmount = Number(totalAmount) + Number(data[i]["applyAmount"]);
            //                }
            //            }


            //            $('#hdnTotalPay').val(totalAmount);
            //            if ($('#hdnTotalPay').val() != null && $('#hdnTotalPay').val() != "") {
            //                var balanceAmount = Number(SubTotalAmt) - Number($('#hdnTotalPay').val());
            //                $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + PrefixInitial + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='30%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CustomerName + "</div></td><td width='15%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + Salesman + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(balanceAmount).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + InvoiceStatus + "</div></td></tr>");
            //            }
            //            else {
            //                //for (var i = 0; i < 20; i++) {
            //                //    $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='30%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");
            //                //}
            //                $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + PrefixInitial + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='30%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CustomerName + "</div></td><td width='15%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + Salesman + "</div></td><td width='10%'><div style=\"text-align: right; \" onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + InvoiceStatus + "</div></td></tr>");
            //            }



            //            break;
            //        }



                  
            //    }
            //}
            //else {
            //    $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + PrefixInitial + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='30%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CustomerName + "</div></td><td width='15%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + Salesman + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div  style=\"text-align: right; \" onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + InvoiceStatus + "</div></td></tr>");
            //}

    // alert('xx');
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelectTotalAmount",
        data: "{'id':'" + $('#hndSalesInvoiceID').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            if (data.length != 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#hdnTotalPay').val(data[i]["applyAmount"]);
                    if ($('#hdnTotalPay').val() != null && $('#hdnTotalPay').val() != "") {
                        var balanceAmount = Number(SubTotalAmt) - Number($('#hdnTotalPay').val());
                        $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + PrefixInitial + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='30%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CustomerName + "</div></td><td width='15%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + Salesman + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(balanceAmount).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + InvoiceStatus + "</div></td></tr>");
                    }
                    else {
                        //for (var i = 0; i < 20; i++) {
                        //    $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='30%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");
                        //}
                        $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + PrefixInitial + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='30%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CustomerName + "</div></td><td width='15%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + Salesman + "</div></td><td width='10%'><div style=\"text-align: right; \" onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + InvoiceStatus + "</div></td></tr>");
                    }
                }

                //bl = window.setInterval("loadBlank()", 99999);
            }
            else {
                $('#tab_content_holder tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + PrefixInitial + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='30%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CustomerName + "</div></td><td width='15%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + Salesman + "</div></td><td width='10%'><div style=\"text-align: right; \"  onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div  style=\"text-align: right; \" onclick=\"ActionSelectInvoice('" + ID + "')\">" + Number(SubTotalAmt).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + InvoiceStatus + "</div></td></tr>");
            }
            
        },
        error: function (response) {
        }
    });
   
}

// ------------------------------------------- Load Sales Invoice By Customer
function ActionSelectInvoice(id) {

    //alert('ccc');
    LoadCustomer();
    LoadForwarded();
    LoadSalesman();
    LoadTerms();
    LoadRemarks();
    LoadReferenceNo();
    LoadPreparedEmployee();
    LoadCheckedEmployee();
    LoadDeliveredEmployee();

    $("#hdnInvoiceID").val(id);

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceSalesSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                if (data[i]["InvoiceType"] == "OpeningBalance") {

                    LoadReferenceNoOpening();
                    LoadSalesManOpeningBalance();
                    LoadTermsOpeningBalance();

                    LoadOpeningBalanceList(data[i]["CustomerID"]);
                    $("#xSalesList").hide();
                    $("#xSalesOpeningBalance").show();
                }
                else {

                    $('#toolbar .save').removeClass('disabled');
                    $('#toolbar .new').addClass('disabled');
                    $('#toolbar .find').addClass('disabled');

                    $('#hdn_InvoiceStatus').val(data[i]["InvoiceStatus"]);
                    $('#hdn_customerID').val(data[i]["CustomerID"]);
                    LoadSalesOrder(data[i]["CustomerID"]);
                    $('#hdnCustomerID').val(data[i]["CustomerID"]);
                    $('#customer').val(data[i]["CustomerName"]);
                    $('#address').val(data[i]["Address"]);
                    $('#deliver_to').val(data[i]["ForwarderToID"]);
                    $('#hdn_deliverTo').val(data[i]["ForwarderToID"]);
                    $('#salesman').val(data[i]["SalesmanID"]);
                    $('#hdn_salesman').val(data[i]["SalesmanID"]);
                    $('#po_number').val(data[i]["PONo"]);
                    $('#terms').val(data[i]["TermID"]);
                    $('#hdn_termID').val(data[i]["TermID"]);
                    $('#hdn_refNo').val(data[i]["RefNo"]);
                    $('#referenceNo').val(data[i]["RefNo"]);
                    $('#reference_number').val(data[i]["RefNoSerial"]);
                    $('#date').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                    $('#delivery_date').val(ToJavaScriptDate(data[i]["DeliveryDate"]));
                    $('#prepared').val(data[i]["PreparedBy"]);
                    $('#hdn_perparedID').val(data[i]["PreparedBy"]);
                    $('#checked').val(data[i]["CheckedBy"]);
                    $('#hdn_check').val(data[i]["CheckedBy"]);
                    $('#hdn_delivered').val(data[i]["DeliveredBy"]);
                    $('#delivered').val(data[i]["DeliveredBy"]);
                    $('#waybill_number').val(data[i]["WayBillNo"]);
                    $('#container_number').val(data[i]["ContainerNo"]);
                    $('#lading_bill').val(data[i]["BillOfLanding"]);
                    $('#commission_rate').val(data[i]["CommissionRate"]);
                    $('#commission_amount').val(data[i]["CommissionAmt"]);
                    $('#remarks').val(data[i]["RemarksID"]);
                    $('#hdn_remarks').val(data[i]["RemarksID"]);
                    $('#notes').val(data[i]["Notes"]);
                    $('#txtSubtotal').val(data[i]["SubTotalAmt"]);
                    $('#txtTotalSalesInvoice').val(data[i]["SubTotalAmt"]);
                    $('#txtTax').val(data[i]["TaxAmt"]);
                    $('#txtShipping').val(data[i]["ShippingAmt"]);
                    $('#txtPayment').val(data[i]["PaymentAmt"]);
                    $('#txtMemo').val(data[i]["MemoAmt"]);
                    $('#txtAdjustment').val(data[i]["AdjustmentAmt"]);
                    LoadSalesInvoiceDetails($("#hdnInvoiceID").val());
                    $("#xSalesList").hide();
                    $("#xSalesForm").show();
                    $('#xLSalesInvoiceSearch').hide();
                    $('#xSalesAdjustment').hide();
                }
            }


           


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Sales Invoice Product Details by Customer
function LoadSalesInvoiceDetails(id) {
    LoadSalesInvoicePayment(id);
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceDetailSalesSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#salesInvoice_table tbody').empty();
            var data = eval(response.d);

            ///alert(data.length);


            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#salesInvoice_table tbody:last').append("<tr><td width='10%'><input class='packing_product' style='outline: none; border: none; background-color: transparent;  color: gray; width: 100%;' value=" + data[i]["Packing"] + " /></td><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;' value='" + data[i]["ProductName"] + "' /></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;'  value='" + data[i]["LocationName"] + "'/></td><td width='10%'><input class='qty_product' onblur='ActionComputeAmount(this); ComputeDiscount(this);' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;' value=" + data[i]["Quantity"] + " /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;' value=" + data[i]["UnitName"] + " /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;' value=" + data[i]["UnitPrice"] + " /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;' value='" + data[i]["Discount"] + "'  onblur='ActionComputeAmount(this); ComputeDiscount(this);' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;' value=" + data[i]["Amount"] + " /></td><td width='5%'> <input type='button' name='name' value='X' class='ActionButton' /> </td></tr>");

            }
            RemoveRow();
            LoadMaximumLinesUpdate(data.length);
        },
        error: function (response) {
            alert(response.status);
        }
    });
    
}

// ------------------------------------------- Load Customer All Payment
function LoadSalesInvoicePayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ulPayment').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ulPayment").append("<li onclick='actionSelectPayment(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["RefNo"] + "<span><div style='float: left;'>" + data[i]["DatePay"] + "</div><div style='float: right; font-size: 15px;'>" + data[i]["TotalAmount"] + "</div></span></span></a> </li>");
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Processing Selected Customer Payment
function actionSelectPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentReferenceSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#txtPaymentRef').val(data[i]["RefereneNo"]);
                $('#hdnPaymentID').val(data[i]["ID"]);
            }
            getCashPayment(id);
            getCheckPayment(id);
            getCardPayment(id);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Customer Cash Payment
function getCashPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentCashSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#amount_cash').val(data[i]["Amount"]);
                $('#txtTotalCash').val(data[i]["Amount"]);
                
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Customer Check Payment
function getCheckPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentCheckSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var table = $("#checkpayment_table tbody");
            table.empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                table.append(" <tr><td width=\"42%\"><input class='bank_name' style='border: none; background-color: transparent;' value='" + data[i]["BankName"] + "'/></td><td width=\"15%\"><input class='check_no' style='border: none; background-color: transparent;'  value='" + data[i]["CheckNo"] + "'/></td><td width=\"10%\"><input class='date_check date' style='border: none; background-color: transparent;' value='" + data[i]["CheckDate"] + "'/></td><td width=\"15%\"><input class='check_type' style='border: none; background-color: transparent;'  value='" + data[i]["CheckType"] + "'/></td><td width=\"10%\"><input class='amount_check' style='border: none; background-color: transparent;' onblur=\"ComputeCheckPayment();\"   value='" + data[i]["Amount"] + "'/></td></tr>");
                ComputeCheckPayment();
            }
            if (data.length == 0) {
                for (var i = 0; i < 10; i++) {

                    table.append(" <tr><td width=\"42%\"><input class='bank_name' style='border: none; background-color: transparent;' /></td><td width=\"15%\"><input class='check_no' style='border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='date_check date' style='border: none; background-color: transparent;' /></td><td width=\"15%\"><input class='check_type' style='border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='amount_check' style='border: none; background-color: transparent;' onblur=\"ComputeCheckPayment();\" /></td></tr>");
                }
            }
            else {
                for (var i = 0; i < 5; i++) {

                    table.append(" <tr><td width=\"42%\"><input class='bank_name' style='border: none; background-color: transparent;' /></td><td width=\"15%\"><input class='check_no' style='border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='date_check date' style='border: none; background-color: transparent;' /></td><td width=\"15%\"><input class='check_type' style='border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='amount_check' style='border: none; background-color: transparent;' onblur=\"ComputeCheckPayment();\" /></td></tr>");
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
    BankNameAutoComplete();
}

// ------------------------------------------- Load Customer Card Payment
function getCardPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentCardSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#card_type').val(data[i]["CardTypeID"]);
                $('#card_number').val(data[i]["CardNumber"]);
                $('#card_name').val(data[i]["NameOnCard"]);
                $('#expiration_month').val(data[i]["ExpirationMonth"]);
                $('#expiration_year').val(data[i]["ExpirationYear"]);
                $('#approval_code').val(data[i]["ApprovalCode"]);
                $('#card_amount').val(data[i]["Amount"]);
                $('#txtTotalCard').val(data[i]["Amount"]);
                
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load All Sales Invoice Reference Number for Seaching
function RefNoAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceRefAutocom",
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

            ActionSelectInvoice(b.item.id);
        }
    });
}

// ------------------------------------------- Load Sales Invoice By Customer After Searching
function ActionSearchInvoice() {
  

    $("#xSalesList").hide();
    $("#xSalesForm").hide();
    $('#xLSalesInvoiceSearch').show();

    $('#txt_sales_search').val('');
    RefNoAutoComplete();
}

// *******************************************************************************************************
// ------------------------------------ PROCESSING USER DATA ---------------------------------------------
// *******************************************************************************************************

// ------------------------------------------- Saving Customer Sales Invoice
function SavingInvoice(invoiceStatus) {  

    var pageUrl = '/Webservice/svr_Invoice.asmx';

    var invoice_status = invoiceStatus;
    var customer_id = $('#hdn_customerID').val();
    var address = $('#address').val();
    var forwarder_to_id = $('#deliver_to').val();
    var salesman_id = $('#salesman').val();
    var po_no = $('#po_number').val();
    var term_id = $('#terms').val();
    var ref_no = $('#hdn_refNo').val();
    var ref_no_serial = $('#reference_number').val();
    var created_date = $('#date').val().replace(".", "/").replace(".", "/");
    var delivery_date = $('#delivery_date').val();
    var prepared_by = $('#prepared').val();
    var checked_by = $('#checked').val();
    var delivered_by = $('#delivered').val();
    var way_bill_no = $('#waybill_number').val();
    var container_no = $('#container_number').val();
    var bill_of_landing = $('#lading_bill').val();
    var commission_rate = $('#commission_rate').val();
    var commission_amt = $('#commission_amount').val();
    var remarks_id = $('#remarks').val();
    var notes = $('#notes').val();
    var sub_total_amt = $('#txtSubtotal').val().replace(",", "");
    var tax_amt = $('#txtTax').val();
    var shipping_amt = $('#txtShipping').val();
    var payment_amt = $('#txtPayment').val();
    var memo_amt = $('#txtMemo').val();
    var adjustment_amt = $('#txtAdjustment').val();
    var productList = GenerateProductTable();
    var productListAD = GenerateAdjustmentProductTable();


    if ($('#hdnInvoiceID').val() != 0) {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateInvoice",
            data: "{'id':'" + $('#hdnInvoiceID').val() + "','invoice_status':'" + invoice_status + "', 'customer_id':'" + customer_id + "', 'address':'" + address + "', 'forwarder_to_id':'" + forwarder_to_id + "', 'salesman_id':'" + salesman_id + "', 'po_no':'" + po_no + "', 'term_id':'" + term_id + "', 'ref_no':'" + ref_no + "', 'ref_no_serial':'" + ref_no_serial + "', 'created_date':'" + created_date + "', 'delivery_date':'" + delivery_date + "', 'prepared_by':'" + prepared_by + "', 'checked_by':'" + checked_by + "', 'delivered_by':'" + delivered_by + "', 'way_bill_no':'" + way_bill_no + "', 'container_no':'" + container_no + "', 'bill_of_landing':'" + bill_of_landing + "', 'commission_rate':'" + commission_rate + "', 'commission_amt':'" + commission_amt + "', 'remarks_id':'" + remarks_id + "', 'notes':'" + notes + "', 'sub_total_amt':'" + sub_total_amt + "', 'tax_amt':'" + tax_amt + "', 'shipping_amt':'" + shipping_amt + "', 'payment_amt':'" + payment_amt + "', 'memo_amt':'" + memo_amt + "', 'adjustment_amt':'" + adjustment_amt + "', 'productList':'" + productList + "', 'productListAD':'" + productListAD + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                SavingPayment($('#hdnInvoiceID').val());
                LoadSalesInvoiceList();
                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');
                $("#xSalesList").show();
                $("#xSalesForm").hide();
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
            data: "{'invoice_status':'" + invoice_status + "', 'customer_id':'" + customer_id + "', 'address':'" + address + "', 'forwarder_to_id':'" + forwarder_to_id + "', 'salesman_id':'" + salesman_id + "', 'po_no':'" + po_no + "', 'term_id':'" + term_id + "', 'ref_no':'" + ref_no + "', 'ref_no_serial':'" + ref_no_serial + "', 'created_date':'" + created_date + "', 'delivery_date':'" + delivery_date + "', 'prepared_by':'" + prepared_by + "', 'checked_by':'" + checked_by + "', 'delivered_by':'" + delivered_by + "', 'way_bill_no':'" + way_bill_no + "', 'container_no':'" + container_no + "', 'bill_of_landing':'" + bill_of_landing + "', 'commission_rate':'" + commission_rate + "', 'commission_amt':'" + commission_amt + "', 'remarks_id':'" + remarks_id + "', 'notes':'" + notes + "', 'sub_total_amt':'" + sub_total_amt + "', 'tax_amt':'" + tax_amt + "', 'shipping_amt':'" + shipping_amt + "', 'payment_amt':'" + payment_amt + "', 'memo_amt':'" + memo_amt + "', 'adjustment_amt':'" + adjustment_amt + "', 'productList':'" + productList + "', 'productListAD':'" + productListAD + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                SavingPayment(response.d);
                LoadSalesInvoiceList();
                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');
                $("#xSalesList").show();
                $("#xSalesForm").hide();
            },
            error: function (response) {
                alert(response.d);
            }
        });
    }
}

// ------------------------------------------- Svaing Customer Payment
function SavingPayment(InvoiceID) {
    var refNo = $('#txtPaymentRef').val();
    var amount = $('#amount_cash').val();
    var tableCheck = GenerateCheckTable();
    var cardID = $('#card_type').val();
    var cardNumber = $('#card_number').val();
    var nameCard = $('#card_name').val();
    var expMonth = $('#expiration_month').val();
    var expYear = $('#expiration_year').val();
    var AppCode = $('#approval_code').val();
    var amountCard = $('#card_amount').val();
    var totalAmount = $('#txtPayment').val();

    if (amountCard == "") {
       amountCard = "0";
    }
    if (amount == "") {
        amount = "0";
    }
    if (cardID == "") {
        cardID = "0"
    }
    if (amountCard == "0" && amount == "0" && cardID == "0" & $('#txtTotalCheck').val() == "0") {

    }
    else {
        if (refNo != "" && refNo != null) {
            if ($('#hdnPaymentID').val() == "0") {
                var pageUrl = '/Webservice/svr_Invoice.asmx';
                $.ajax({
                    type: "POST",
                    url: pageUrl + "/SaveInvoicePayment",
                    data: "{'invoiceid':'" + InvoiceID + "', 'refNo':'" + refNo + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'cardID':'" + cardID + "', 'cardNumber':'" + cardNumber + "', 'nameCard':'" + nameCard + "', 'expMonth':'" + expMonth + "', 'expYear':'" + expYear + "', 'AppCode':'" + AppCode + "', 'amountCard':'" + amountCard + "', 'totalAmount':'" + totalAmount + "'}",
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
                var pageUrl = '/Webservice/svr_Invoice.asmx';
                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateInvoicePayment",
                    data: "{'id':'" + $('#hdnPaymentID').val() + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'cardID':'" + cardID + "', 'cardNumber':'" + cardNumber + "', 'nameCard':'" + nameCard + "', 'expMonth':'" + expMonth + "', 'expYear':'" + expYear + "', 'AppCode':'" + AppCode + "', 'amountCard':'" + amountCard + "', 'totalAmount':'" + totalAmount + "'}",
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
        }
    }
}

// ------------------------------------------- Collecting Product Details By Customer
function GenerateProductTable() {

    var counter = 0;
    var productColletion = "";
    $('#salesInvoice_table tbody tr').each(function (i) {

        var x1 = $(this).find("td .packing_product").val().replace(",", "");;
        var x2 = $(this).find("td .product_code").val().replace(",", "");;
        var x3 = $(this).find("td .location_code").val().replace(",", "");;
        var x4 = $(this).find("td .qty_product").val().replace(",", "");;
        var x5 = $(this).find("td .unit_product").val().replace(",", "");;
        var x6 = $(this).find("td .price").val().replace(",", "");;
        var x7 = $(this).find("td .discount_product").val().replace(",", "");;
        var x8 = $(this).find("td .total_amount").val().replace(",", "");;
        var x9 = $(this).find("td .order_product").val().replace(",", "");;
        if (x1 != "") {

            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "," + x7 + "," + x8 + ", " + x9 + "^";
        }
    });

    return productColletion;
}

// ------------------------------------------- Collecting Customer Check Payment
function GenerateCheckTable() {

    var counter = 0;
    var productColletion = "";
    $('#xSalesNewPaymentCheck tbody tr').each(function (i) {

        var x1 = $(this).find("td .bank_name").val();
        var x2 = $(this).find("td .check_no").val();
        var x3 = $(this).find("td .date_check").val();
        var x4 = $(this).find("td .check_type").val();
        var x5 = $(this).find("td .amount_check").val();

        if (x1 != "") {
            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "^";

        }

        counter++;
    });

    return productColletion;
}

// ------------------------------------------- Collecting Adjustment Product Details By Customer
function GenerateAdjustmentProductTable() {

    var counter = 0;
    var productColletion = "";
    $('#xSalesAdjusment_Table tbody tr').each(function (i) {

        var x1 = $(this).find("td .product_code").val();
        var x2 = $(this).find("td .location_code").val();
        var x3 = $(this).find("td .qty_product").val();
        var x4 = $(this).find("td .unit_product").val();
        var x5 = $(this).find("td .price").val();
        var x6 = $(this).find("td .discount_product").val();
        var x7 = $(this).find("td .total_amount").val();
        if (x1 != "") {

            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "," + x7 + "^";
        }
    });

    return productColletion;
}

