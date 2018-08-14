

// --------------------------------------------------- Create New Supplier
function NewSupplier() {

    $('#supplier_action .save').removeClass('disabled');
    $('#supplier_action .delete').addClass('disabled');
    $('#supplier_action .new').addClass('disabled');
    $('#supplier_action .find').addClass('disabled');

    LoadRegion();
    LoadMunicipalityPerRegion();
    LoadSalesMan();
    LoadTerms();

    LoadSalesManOpeningBalance();
    LoadTermsOpeningBalance();

    $("#hdn_supplier_id").val("0");
    $("#supplier_name").val("");
    $("#address").val("");
    $("#contact_person").val("");
    $("#region_province").val("");
    $("#municipality").val("0");
    $("#business_phone1").val("");
    $("#business_phone2").val("");
    $("#fax").val("");
    $("#mobile_phone").val("");
    $("#notes").val("");
    $("#reference_initial").val("");
    $("#tin_number").val("");
    $("#vat_number").val("");
    $("#salesman").val("");
    $("#terms").val("0");
    
    $('#xSupplierInfoList').hide();
    $('#xSuppliersSubMenu').show();
    $('#xSuppliersGeneralInfo').show();
    $('#mnu_submenu').show();
    $('#SubMenuID').hide();
    

}

// **********************************************************************************************
// -------------------------------------- SELECTING DATA ----------------------------------------
// **********************************************************************************************

// --------------------------------------------------- Load All Region
function LoadRegion() {

            $('#region_province').empty();
            var data = RegionAutoCompleteData;
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#region_province').append("<option value='" + data[i]["ID"] + "'>" + data[i]["RegionName"] + "</option>");

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
    //        var data = eval(response.d);
    //        var obj = "";
    //        for (var i = 0; i < data.length; i++) {

    //            $('#region_province').append("<option value='" + data[i]["ID"] + "'>" + data[i]["RegionName"] + "</option>");

    //        }

    //        //LoadMunicipalityPerRegion();
    //    },
    //    error: function (response) {
    //   //     alert(response.status);
    //    }
    //});

}

// --------------------------------------------------- Load Municipality by Region
function LoadMunicipalityPerRegion() {

    var id = $('#region_province').val();

    
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

                table.append("<option value='" + data[i]["ID"] + "' >" + data[i]["MunicipalityName"] + "</option>");

            }
        },
        error: function (response) {
        }
    });

}

// --------------------------------------------------- Load All Employee (Salesman)
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

                $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load All Terms
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

// --------------------------------------------------- Load All Supplier
function LoadSupplierList() {
    var pageUrl = '/Webservice/svr_Supplier.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SupplierSelect",
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xSupplierInfoListTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xSupplierInfoListTable tbody:last').append("<tr><td width='40%'><div onclick=\"ActionSelectSupplier('" + data[i]["ID"] + "')\">" + data[i]["SupplierName"] + "</div></td><td width='15%'><div onclick=\"ActionSelectSupplier('" + data[i]["ID"] + "')\">" + data[i]["RegionName"] + "</div></td><td width='15%'><div onclick=\"ActionSelectSupplier('" + data[i]["ID"] + "')\">" + data[i]["ContactPerson"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSupplier('" + data[i]["ID"] + "')\">" + data[i]["BusinessPhone1"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSupplier('" + data[i]["ID"] + "')\">" + data[i]["Fax"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSupplier('" + data[i]["ID"] + "')\">" + "0" + "</div></td></tr>");

            }
            for (var i = 0; i < 20; i++) {
                $('#xSupplierInfoListTable tbody:last').append("<tr><td width='40%'><div >" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div >" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
   
}

// --------------------------------------------------- Load Supplier Details
function ActionSelectSupplier(id) {

    $('#supplier_action .save').removeClass('disabled');
    $('#supplier_action .new').addClass('disabled');
    $('#supplier_action .find').addClass('disabled');

    $('#mnu_submenu').show();
    $('#SubMenuID').hide();

    LoadRegion();
    LoadMunicipalityPerRegion();
    LoadSalesMan();
    LoadTerms();

   
    $("#hdn_supplier_id").val(id);

    var pageUrl = '/Webservice/svr_Supplier.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SupplierSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                LoadSalesManOpeningBalance();
                LoadTermsOpeningBalance();

                $('#SupplierID').val(data[i]["ID"]);
                $('#supplier_name').val(data[i]["SupplierName"]);
                $('#address').val(data[i]["Address"]);
                $('#contact_person').val(data[i]["ContactPerson"]);
                $('#region_province').val(data[i]["RegionID"]);
                $('#municipality').val(data[i]["MunicipalityID"]);
                $('#business_phone1').val(data[i]["BusinessPhone1"]);
                $('#business_phone2').val(data[i]["BusinessPhone2"]);
                $('#fax').val(data[i]["Fax"]);
                $('#mobile_phone').val(data[i]["Mobile"]);
                $('#notes').val(data[i]["Notes"]);
                $('#reference_initial').val(data[i]["ReferenceInitial"]);
                $('#tin_number').val(data[i]["TinNo"]);
                $('#vat_number').val(data[i]["VatNo"]);
                $('#salesman').val(data[i]["Salesman"]);
                $('#terms').val(data[i]["TermID"]);

                $('#salesmanOpeningBalance').val(data[i]["Salesman"]);
                $('#termOpeningBalance').val(data[i]["TermID"]);

                //$('#supplier_since').val(data[i]["CustomerID"]);
                //$('#ave_payable').val(data[i]["CustomerID"]);
                //$('#last_invoice_date').val(data[i]["CustomerID"]);
                //$('#last_invoice_amt').val(data[i]["CustomerID"]);
                //$('#last_payment_date').val(data[i]["CustomerID"]);
                //$('#last_payment_amt').val(data[i]["CustomerID"]);
                //$('#total_cleared').val(data[i]["CustomerID"]);
                //$('#total_uncleared').val(data[i]["CustomerID"]);
                //$('#balance').val(data[i]["CustomerID"]);

                LoadPurchasedInvoiceList();
                

                LoadOpeningBalanceList(data[i]["ID"]);
                LoadOpeningBalancePaymentList(data[i]["ID"]);

                $('#xSupplierSearch').hide();
                $('#xSupplierInfoList').hide();
                $('#xSuppliersGeneralInfo').show();
                $('#xSuppliersSubMenu').show();
                
                LoadSupplierRefence(data[i]["ID"]);
                
            }


        },
        error: function (response) {
            //alert(response.status);
        }
    });

}

// --------------------------------------------------- Load All Supplier
function SupplierAutoComplete() {
    var pageUrl = '/Webservice/svr_Supplier.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteSupplier",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_supplier_search").autocomplete({
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


    $("#txt_supplier_search").autocomplete({
        select: function (a, b) {

            ActionSelectSupplier(b.item.id);
        }
    });
}

// --------------------------------------------------- Load Searched Supplier
function ActionSearch() {

    $('#xSupplierInfoList').hide();
    $('#xSuppliersGeneralInfo').hide();
    $('#xSuppliersSupplierItem').hide();
    $('#xSuppliersPurchaseOrder').hide();
    $('#xSuppliersInvoice').hide();
    $('#xSuppliersPayments').hide();
    $('#xSuppliersMemo').hide();
    $('#xSupplierSearch').show();

    $('#txt_supplier_search').val('');
    SupplierAutoComplete();
}

// --------------------------------------------------- Load Supplier Invoices
function LoadPurchasedInvoiceList() {
    var pageUrl = '/Webservice/svr_Supplier.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedInvoiceSupplierSelect",
        data: "{'id':'" + $('#hdn_supplier_id').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#xPurchaseList_table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                var invoiceID = data[i]["ID"];
                $('#hdnPurchasedID').val(invoiceID);
                LoadPurchasedInvoicePaymentSelect(data[i]["ID"], data[i]["RefNo"], data[i]["RefNoSerial"], ToJavaScriptDate(data[i]["CreatedDate"]), data[i]["SupplierName"], data[i]["SalesmanName"], data[i]["SubTotal"], data[i]["SubTotal"]);

            }
        },
        error: function (response) {
            //alert(response.status);
        }
    });
}

// --------------------------------------------------- Computing Supplier Payments perInvoice
function LoadPurchasedInvoicePaymentSelect(ID, RefNo, RefNoSerial, CreatedDate, SupplierName, Salesman, SubTotal, SubTotal) {

    var pageUrl = '/Webservice/svr_Supplier.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedPaymentSelectTotalAmount",
        data: "{'id':'" + $('#hdnPurchasedID').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            if (data.length != 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#hdnTotalPay').val(data[i]["applyAmount"]);
                    var balanceAmount = Number(SubTotal) - Number($('#hdnTotalPay').val());
                    $('#xPurchaseList_table tbody:last').append("<tr><td width='12%'><div>" + RefNo + "" + RefNoSerial + "</div></td><td width='12%'><div>" + CreatedDate + "</div></td><td width='25%'><div>" + Salesman + "</div></td><td width='10%'><div>" + days_between(ToJavaScriptDate(data[i]["CreatedDate"]), ToJavaScriptDate(Date.now())) + "</div></td><td width='10%'><div>" + SubTotal + "</div></td><td width='10%'><div>" + balanceAmount + "</div></td></tr>");
                }
            }
            else {
                $('#xPurchaseList_table tbody:last').append("<tr><td width='12%'><div>" + RefNo + "" + RefNoSerial + "</div></td><td width='12%'><div>" + CreatedDate + "</div></td><td width='25%'><div>" + Salesman + "</div></td><td width='10%'><div>" + days_between(ToJavaScriptDate(data[i]["CreatedDate"]), ToJavaScriptDate(Date.now())) + "</div></td><td width='10%'><div>" + SubTotal + "</div></td><td width='10%'><div>" + SubTotal + "</div></td></tr>");
            }
        },
        error: function (response) {
            //alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Supplier Information Reference
function LoadSupplierRefence(id) {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSupplier",

        data: "{'id':'" + id + "','SupplierName':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#SupplierID').val(data[i]["ID"]);
                $('#refNo').val(data[i]["ReferenceInitial"]);
            }
            //LoadSalesOrder($('#SupplierID').val());
        },
        error: function (response) {
            alert(response.status);
        }
    });
}



LoadBankOpeningBalance();
LoadChecktypeOpeningBalance();

// --------------------------------------------------- Load All Employee(Salesman) For Opening Balance
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

// --------------------------------------------------- Load All Terms For Opening Balance
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

// ------------------------------------------- Load Opening Balance By Specific Supplier
function LoadOpeningBalanceList(id) {
    var pageUrl = '/Webservice/svr_Supplier.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceOpeningtSelectBySupplier",
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
        }
    });
}

// ------------------------------------------- Load Opening Balance Details By Specific Supplier
function actionSelectOpeningBalance(id) {
    var pageUrl = '/Webservice/svr_Supplier.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceOpeningSelectBySupplierDetails",
        data: "{'id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#hdnOpeningBalanceID').val(id);
                $('#salesmanOpeningBalance').val(data[i]["Salesman"]);
                $('#termOpeningBalance').val(data[i]["TermID"]);
                $('#SalesRef').val(data[i]["RefNo"]);
                $('#referenceOpening').val(data[i]["RefNoSerial"]);
                $('#dateOpening').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                $('#amount').val(data[i]["SubTotal"]);
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Opening Balance Payment By Specific Supplier
function LoadOpeningBalancePaymentList(id) {
    var pageUrl = '/Webservice/svr_Supplier.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/OpeningBalancePaymentSelectBySupplier",
        data: "{'id':'0', 'SupplierID':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#UlPaymentOpening').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#UlPaymentOpening").append("<li onclick='actionSelectPaymentOpening(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["RefNo"] + "<span><div style='float: left;'>" + data[i]["DatePay"] + "</div><div style='float: right; font-size: 15px;'>" + data[i]["TotalAmount"] + "</div></span></span></a> </li>");
            }
        },
        error: function (response) {
        }
    });
}

// ------------------------------------------- Load Opening Balance Details
function actionSelectPaymentOpening(id) {
    var pageUrl = '/Webservice/svr_Supplier.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelectBySupplierDetails",
        data: "{'id':'" + id + "','SupplierID':'0'}",
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


// **********************************************************************************************
// -------------------------------------- INSERTING DATA ----------------------------------------
// **********************************************************************************************

// ---------------------------------------------------- Save or Update Supplier Information
function SaveUpdateSupplier(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Supplier.asmx';

        var id = $("#SupplierID").val();
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

        if (id == '0') {

            var data_transfer = "{'supplier_name':'{0}', 'address':'{1}','contact_person':'{2}','region_province':'{3}','municipality':'{4}','business_phone1':'{5}','business_phone2':'{6}','fax':'{7}','mobile_phone':'{8}','notes':'{9}','reference_initial':'{10}','tin_number':'{11}','vat_number':'{12}','salesman':'{13}','terms':'{14}'}"
                                .f(supplier_name, address, contact_person, region_province, municipality, business_phone1, business_phone2, fax, mobile_phone, notes, reference_initial, tin_number, vat_number, salesman, terms);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertSupplier",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                   // if ($("#reference_number").val() != "") {
                        SavingInvoice(id);
                    //}
                    LoadSupplierList();

                    $('#supplier_action .save').addClass('disabled');
                    $('#supplier_action .new').removeClass('disabled');
                    $('#supplier_action .find').removeClass('disabled');

                    $('#xSupplierInfoList').show();
                    $('#xSuppliersSubMenu').hide();
                    $('#mnu_submenu').hide();
                    $('#SubMenuID').show();

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {
            var data_transfer = "{'id':'{0}', 'supplier_name':'{1}', 'address':'{2}','contact_person':'{3}','region_province':'{4}','municipality':'{5}','business_phone1':'{6}','business_phone2':'{7}','fax':'{8}','mobile_phone':'{9}','notes':'{10}','reference_initial':'{11}','tin_number':'{12}','vat_number':'{13}','salesman':'{14}','terms':'{15}'}"
                                .f(id, supplier_name, address, contact_person, region_province, municipality, business_phone1, business_phone2, fax, mobile_phone, notes, reference_initial, tin_number, vat_number, salesman, terms);

            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateSupplier",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    //if ($("#reference_number").val() != "") {
                        SavingInvoice(id);
                    //}
                    
                    LoadSupplierList();

                    $('#supplier_action .save').addClass('disabled');
                    $('#supplier_action .new').removeClass('disabled');
                    $('#supplier_action .find').removeClass('disabled');

                    $('#xSupplierInfoList').show();
                    $('#xSuppliersSubMenu').hide();

                    $('#mnu_submenu').hide();
                    $('#SubMenuID').show();

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

// ---------------------------------------------------- Saving Opening Balance
function SavingInvoice(id) {

    var pageUrl = '/Webservice/svr_Supplier.asmx';

    var supplierID = id;
    var address = "";
    var deliveryToID = "0";
    var salesman = $('#salesmanOpeningBalance').val();
    var poNo = "0";
    var termID = $('#termOpeningBalance').val();
    var refNo = $('#refNo').val();
    var refNoSerial = $('#reference_number').val();
    var createdDate = $('#date').val();
    var cancelDate = $('#date').val();
    var subTotal = $('#amount').val();
    var paymentAmt = "0";
    var memoAmt = "0";
    var notes = "";
    var balance = $('#BalanceOpeningBalance').val();


    var bank_name = $('#bank_name').val();
    var check_number = $('#check_number').val();
    var checkDate = $('#checkDate').val();
    var checkt = $('#check_type').val();
    var checkAmount = $('#checkAmount').val();
    var checkID = $('#hdnCheckTypeID').val();


    if ($('#hdnOpeningBalanceID').val() != "0") {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdatePurchasedInvoice",
            data: "{'id':'" + $('#hdnOpeningBalanceID').val() + "','supplierID':'" + id + "', 'address':'" + address + "', 'deliveryToID':'" + deliveryToID + "', 'salesman':'" + salesman + "', 'poNo':'" + poNo + "', 'termID':'" + termID + "', 'refNo':'" + refNo + "', 'refNoSerial':'" + refNoSerial + "', 'createdDate':'" + createdDate + "', 'cancelDate':'" + cancelDate + "', 'subTotal':'" + subTotal + "', 'paymentAmt':'" + paymentAmt + "', 'memoAmt':'" + memoAmt + "', 'notes':'" + notes + "', 'balance':'" + balance + "', 'bank_name':'" + bank_name + "', 'check_number':'" + check_number + "', 'checkDate':'" + checkDate + "', 'checkt':'" + checkt + "', 'checkAmount':'" + checkAmount + "', 'checkID':'" + checkID + "'}",
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
            url: pageUrl + "/InsertPurchasedInvoice",
            data: "{'supplierID':'" + id + "', 'address':'" + address + "', 'deliveryToID':'" + deliveryToID + "', 'salesman':'" + salesman + "', 'poNo':'" + poNo + "', 'termID':'" + termID + "', 'refNo':'" + refNo + "', 'refNoSerial':'" + refNoSerial + "', 'createdDate':'" + createdDate + "', 'cancelDate':'" + cancelDate + "', 'subTotal':'" + subTotal + "', 'paymentAmt':'" + paymentAmt + "', 'memoAmt':'" + memoAmt + "', 'notes':'" + notes + "', 'balance':'" + balance + "', 'bank_name':'" + bank_name + "', 'check_number':'" + check_number + "', 'checkDate':'" + checkDate + "', 'checkt':'" + checkt + "', 'checkAmount':'" + checkAmount + "', 'checkID':'" + checkID + "'}",
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


function ShowOpeningBalancePayment() {
    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").show();
}

function ShowOpeningBalance() {
    $("#xGeneralInfoOpeningBalanceInvoice").show();
    $("#xGeneralInfoOpeningBalancePayment").hide();
}


// **********************************************************************************************
// ----------------------------------- PROCESSING USER DATA -------------------------------------
// **********************************************************************************************

// ---------------------------------------------------- Load Opening Balance
function LoadOpeningBalance() {
    $("#xSuppliersGeneralInfo").hide();
    $("#NextPageID").hide();
    $("#xSupplierOpeningBalance").show();
}

// ---------------------------------------------------- Computing Difference between two Dates
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

// ---------------------------------------------------- Converting Dates
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}
