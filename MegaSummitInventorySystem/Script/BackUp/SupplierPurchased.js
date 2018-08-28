

var bl;

// ********************************************************************************************
// ----------------------------------- AUTO COMPLETE ------------------------------------------
// ********************************************************************************************

// -------------------------------------------------- Load All Product (AutoComplete)
function ProductAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteProduct",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xPurchaseInvoice_table tbody tr").each(function (i) {
                $(this).find("td .product_code").autocomplete({
                    source: response.d,
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
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// -------------------------------------------------- Load All Locations (AutoComplete)
function LocationAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteLocation",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xPurchaseInvoice_table tbody tr").each(function (i) {

                $(this).find("td .location_code").autocomplete({
                    source: response.d,
                    minLength: 0,
                    minChars: 0,
                    max: 12,
                    autoFill: true,
                    matchContains: false,
                    select: function (a, b) {
                        // ActionSelectProductDetails(b.item.id, this)
                    }
                })
            .on('focus', function (event) {
                var self = this;
                $(self).autocomplete("search", "");
            });

            });
        },

        error: function (response) {
            alert(response.status);
        }
    });


}

// -------------------------------------------------- Load All Reference for Searching 
function RefNoAutoComplete() {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedInvoiceRefAutoSelect",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_purchased_search").autocomplete({
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


    $("#txt_purchased_search").autocomplete({
        select: function (a, b) {

            ActionSelectInvoice(b.item.id);
        }
    });
}

// -------------------------------------------------- Filling Bank Name in Check Payment Table
function BankNameAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteBank",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#checkpayment_table tbody tr").each(function (i) {
                $(this).find("td .bank_name").autocomplete({
                    source: response.d,
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
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ********************************************************************************************
// ------------------------------------- SELECTING DATA ---------------------------------------
// ********************************************************************************************

// --------------------------------------------------- Create New Supplier Purchase
function NewSales() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    $('#supplier').val("");
    $('#SupplierID').val("0");
    $('#address').val("");
    $('#deliver_to').val("");
    $('#salesman').val("0");
    $('#po_number').val("");
    $('#terms').val("0");
    $('#refNo').val("");
    $('#reference_number').val("");
    $('#date').val("");
    $('#cancel_date').val("");
    $('#txtTotalPurchaseInvoice').val("0");
    $('#notes').val("");
    $('#hdnPurchasedID').val("0");
    $('#txtPaymentAmount').val("0");
    $("#xPurchaseInvoice_table tbody").empty();


    LoadTableRow();

    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    $('#date').val(month + "." + day + "." + year);
    $('#cancel_date').val(month + "." + day + "." + year);

    $("#xPurchaseList").hide();
    $("#xPurchaseForm").show();
}

// --------------------------------------------------- Load All Supplier (AutoComplete)
function LoadSupplier() {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SupplierAutoComplete",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#supplier").autocomplete({
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
}

// --------------------------------------------------- Load Supplier Information Details
function LoadSupplierDetails() {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSupplier",

        data: "{'id':'0','SupplierName':'" + $('#supplier').val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                
                $('#SupplierID').val(data[i]["ID"]);
                $('#address').val(data[i]["Address"]);
                $('#salesman').val(data[i]["Salesman"]);
                $('#terms').val(data[i]["TermID"]);
                $('#refNo').val(data[i]["ReferenceInitial"]);
            }
            LoadSalesOrder($('#SupplierID').val());
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Deliver to
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

// --------------------------------------------------- Load Employee (Salesman)
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

// --------------------------------------------------- FIll Product Table (Row)
function LoadTableRow() {
    var table = $("#xPurchaseInvoice_table tbody");
    table.empty();
    for (var i = 0; i < 10; i++) {
        table.append("<tr><td width='15%'><input class='product_code' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%; color: gray; outline: none;'/></td><td width='15%'><input class='location_code' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='qty' style='border: none; background-color: transparent;  width: 100%; color: gray; outline: none;'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='bonus_product' style='border: none; background-color: transparent;  width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='unit_product' style='border: none; background-color: transparent;  width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='price' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='discount_product' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='total_amount' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td></tr>");

    }

    ProductAutoComplete();
    LocationAutoComplete();
}

// --------------------------------------------------- Load Product Information Details
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
                $(me).closest("tr").find(".unit_product").val(data[i]["UnitName"]);
                $(me).closest("tr").find(".price").val(data[i]["PriceA"]);
                $(me).closest("tr").find(".discount_product").val('0');
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// --------------------------------------------------- Load Supplier ID
function LoadSupplierID() {
    var e = document.getElementById("supplier");
    var supID = e.options[e.selectedIndex].value;
    
}

// --------------------------------------------------- Load Purchased Order By Supplier
function LoadSalesOrder(SupplierID) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedOrderRefSelect",
        data: "{ 'id':'" + SupplierID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#order_number').empty();
            $('#order_number').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#order_number').append("<option value='" + data[i]["ID"] + "'>" + data[i]["RefNoSerial"] + "</option>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// --------------------------------------------------- Load Purchased Order Details
function LoadSalesOrderDetails() {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedOrderDetailsInvoiceSelect",
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

// --------------------------------------------------- Selecting Bank Name Information Details
function ActionCheckType(me) {
    $(me).closest("tr").find(".check_type").val("Posdated Check");
}

// --------------------------------------------------- Load Purchased Details
function LoadPurchasedInvoiceDetails(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedDetailSalesSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPurchaseInvoice_table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                
                $('#xPurchaseInvoice_table tbody:last').append("<tr><td width='15%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + data[i]["ProductName"] + "'/><input class='order_product' style='outline: none; border: none; background-color: transparent; display: none; width: 100%;'/></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value=" + data[i]["LocationName"] + " /></td><td width='10%'><input class='qty' style='outline: none;  color: gray; border: none; background-color: transparent;  width: 100%;'  onblur='ActionComputeAmount(this)' value='" + data[i]["Quantity"] + "' /></td><td width='10%'><input class='bonus_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + data[i]["Bonus"] + "'/></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  value='" + data[i]["UnitName"] + "'/></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'  value='" + data[i]["UnitPrice"] + "'/></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; color: gray; width: 100%;' value='" + data[i]["Discount"] + "' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; color: gray; background-color: transparent; width: 100%;' value='" + data[i]["Amount"] + "' /></td></tr>");

            }
            for (var i = 0; i < 15; i++) {
                $('#xPurchaseInvoice_table tbody:last').append("<tr><td width='15%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;'/><input class='order_product' style='outline: none; border: none; background-color: transparent; display: none; width: 100%;'/></td><td width='15%'><input class='location_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='bonus_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td></tr>");

            }
            ProductAutoComplete();
            LocationAutoComplete();
        },
        error: function (response) {
            alert(response.status);
        }
    });
    
    LoadPurchasedInvoicePayment(id);
}

// --------------------------------------------------- Load Purchased Payment
function LoadPurchasedInvoicePayment(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedPaymentSelect",
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

// --------------------------------------------------- Load Purchased Payment Detials
function actionSelectPayment(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

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
                $('#txtPaymentRef').val(data[i]["ReferenceNo"]);
                $('#hdnPaymentID').val(data[i]["ID"]);
            }
            getCashPayment(id);
            getCheckPayment(id);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Cash Payment
function getCashPayment(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

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
                $('#amount').val(data[i]["Amount"]);
                $('#txtTotalCash').val(data[i]["Amount"]);

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Check Payment
function getCheckPayment(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

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
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Purchased Invoice Information Details By Searching
function ActionSearchInvoice() {


    $("#xPurchaseList").hide();
    $("#xPurchaseForm").hide();
    $('#xPurchasedSearch').show();


    RefNoAutoComplete();


    $('#txt_purchased_search').focus();
  
}

// --------------------------------------------------- Load Supplier Information Details
function ActionSelectSupplierDetials() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCustomerDetails",
        data: "{'customerName':'" + $('#customer').val() + "' }",
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

                LoadSalesOrder($('#hdn_customerID').val());
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// --------------------------------------------------- Load Purchased Payment for Balance
function LoadPurchasedInvoicePaymentSelect(ID, RefNo, RefNoSerial, CreatedDate, SupplierName, Salesman, SubTotal, SubTotal) {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedPaymentSelectTotalAmount",
        data: "{'id':'" + ID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            if (data.length != 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#hdnTotalPay').val(data[i]["ApplyAmount"]);
                    var balanceAmount = Number(SubTotal) - Number($('#hdnTotalPay').val());
                    $('#xPurchaseList_table tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + RefNo + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='25%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SupplierName + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SubTotal + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + balanceAmount + "</div></td></tr>");
                }
            }
            else {
                $('#xPurchaseList_table tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + RefNo + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='25%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SupplierName + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SubTotal + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SubTotal + "</div></td></tr>");
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Purchased Invoice Information Details
function ActionSelectInvoice(id) {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    $("#hdnPurchasedID").val(id);

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedInvoiceSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                if (data[i]["InvoiceType"] == "OpeningBalance") {

                    LoadOpeningBalanceList(data[i]["SupplierID"]);
                    LoadOpeningBalancePaymentList(data[i]["SupplierID"]);

                    $("#xPurchaseList").hide();
                    $("#xPurchasedSearch").hide();
                    $("#xPurchaseForm").hide();
                    $("#xPurchasedOpeningBalance").show();
                    
                }
                else {
                    //LoadSalesOrder(data[i]["CustomerID"]);
                    $('#SupplierID').val(data[i]["SupplierID"]);
                    $('#supplier').val(data[i]["SupplierName"]);
                    $('#address').val(data[i]["Address"]);
                    $('#deliver_to').val(data[i]["DeliveryToID"]);
                    $('#salesman').val(data[i]["Salesman"]);
                    $('#po_number').val(data[i]["PoNo"]);
                    $('#terms').val(data[i]["TermID"]);
                    $('#refNo').val(data[i]["RefNo"]);
                    $('#reference_number').val(data[i]["RefNoSerial"]);
                    $('#date').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                    $('#cancel_date').val(ToJavaScriptDate(data[i]["CancelDate"]));
                    $('#txtTotalPurchaseInvoice').val(data[i]["SubTotal"]);
                    $('#notes').val(data[i]["Notes"]);
                    $('#txtSubtotal').val(data[i]["SubTotal"]);
                    $('#txtPaymentAmount').val(data[i]["PaymentAmt"]);
                    LoadPurchasedInvoiceDetails($("#hdnPurchasedID").val());
                    $("#xPurchaseList").hide();
                    $("#xPurchasedSearch").hide();
                    $("#xPurchaseForm").show();
                    $("#xPurchasedOpeningBalance").hide();
                }
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Purchased Invoice By Supplier
function LoadPurchasedInvoiceList() {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedInvoiceSelect",
        data: "{'id':'0' }",
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
                LoadPurchasedInvoicePaymentSelect(data[i]["ID"], data[i]["RefNo"], data[i]["RefNoSerial"], ToJavaScriptDate(data[i]["CreatedDate"]), data[i]["SupplierName"], data[i]["Salesman"], data[i]["SubTotal"], data[i]["SubTotal"]);

            }

            bl = window.setInterval("loadBlank()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


LoadSalesManOpeningBalance();
LoadBankOpeningBalance();
LoadChecktypeOpeningBalance();
LoadTermsOpeningBalance();


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

// --------------------------------------------------- Load All Bank for Opening Balance
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

// --------------------------------------------------- Load All Check Type
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

// --------------------------------------------------- Load Opening Balance By Specific Supplier
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

// --------------------------------------------------- Load Opening Balance Details By Specific Supplier
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
                $('#salemanOpeningBalance').val(data[i]["Salesman"]);
                $('#termOpeningBalance').val(data[i]["TermID"]);
                $('#refOpeningBalance').val(data[i]["RefNo"]);
                $('#ref_numberOpeningBalance').val(data[i]["RefNoSerial"]);
                $('#dateOpeningBalance').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                $('#amountOpeningBalance').val(data[i]["SubTotal"]);
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// --------------------------------------------------- Load Opening Balance Payment By Specific Supplier
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

// --------------------------------------------------- Load Opening Balance Details
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


function ShowOpeningBalancePayment() {
    $("#xGeneralInfoOpeningBalanceInvoice").hide();
    $("#xGeneralInfoOpeningBalancePayment").show();
}

function ShowOpeningBalance() {
    $("#xGeneralInfoOpeningBalanceInvoice").show();
    $("#xGeneralInfoOpeningBalancePayment").hide();
}


// **********************************************************************************************
// -------------------------------------- COMPUTATION -------------------------------------------
// **********************************************************************************************

// -------------------------------------------------- Compute Product Total Amount
function ActionComputeAmount(me) {
    var qty = $(me).closest("tr").find(".qty").val();
    var price = $(me).closest("tr").find(".price").val();
    var total = Number(price) * Number(qty);
    $(me).closest("tr").find(".total_amount").val(total);
    ActionComputeSubtotal();
}

// -------------------------------------------------- Compute All Product Total Amount
function ActionComputeSubtotal() {
    var totalAmount = 0;
    $("#xPurchaseInvoice_table tbody tr").each(function (i) {
        if ($(this).find("td .total_amount").val() > 0) {
            totalAmount += Number($(this).find("td .total_amount").val());
        }
    });
    $("#txtSubtotal").val(totalAmount);
    $("#txtTotalPurchaseInvoice").val(totalAmount);
}

// -------------------------------------------------- Compute Cash Payment 
function ComputeCashPayment() {
    var amount = $('#amount').val();
    $('#txtTotalCash').val(amount);

    ComputeTotalPayment();
}

// -------------------------------------------------- Compute Check Payment
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

// -------------------------------------------------- Compute Total Payment
function ComputeTotalPayment() {
    var amountCash = $('#txtTotalCash').val();
    var amountCheck = $('#txtTotalCheck').val();
    var NewTotal = Number(amountCash) + Number(amountCheck);
    $('#txtPaymentAmount').val(NewTotal);

}

// **********************************************************************************************
// --------------------------------------- INSERTING DATA ---------------------------------------
// **********************************************************************************************

// -------------------------------------------------- Saving Purchased Invoice
function SavingInvoice() {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    var supplierID = $('#SupplierID').val();
    var address = $('#address').val();
    var deliveryToID = $('#deliver_to').val();
    var salesman = $('#salesman').val();
    var poNo = $('#po_number').val();
    var termID = $('#terms').val();
    var refNo = $('#refNo').val();
    var refNoSerial = $('#reference_number').val();
    var createdDate = $('#date').val();
    var cancelDate = $('#cancel_date').val();
    var subTotal = $('#txtTotalPurchaseInvoice').val();
    var paymentAmt = $('#txtPaymentAmount').val();
    var memoAmt = "0";
    var notes = $('#notes').val();
    var productList = GenerateProductTable();

    if ($('#hdnPurchasedID').val() != "0") {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdatePurchasedInvoice",
            data: "{'id':'" + $('#hdnPurchasedID').val() + "','supplierID':'" + supplierID + "', 'address':'" + address + "', 'deliveryToID':'" + deliveryToID + "', 'salesman':'" + salesman + "', 'poNo':'" + poNo + "', 'termID':'" + termID + "', 'refNo':'" + refNo + "', 'refNoSerial':'" + refNoSerial + "', 'createdDate':'" + createdDate + "', 'cancelDate':'" + cancelDate + "', 'subTotal':'" + subTotal + "', 'paymentAmt':'" + paymentAmt + "', 'memoAmt':'" + memoAmt + "', 'notes':'" + notes + "', 'productList':'" + productList + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                SavingPayment($('#hdnPurchasedID').val());
                LoadPurchasedInvoiceList();
                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');

                $("#xPurchaseList").show();
                $("#xPurchaseForm").hide();
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
            data: "{'supplierID':'" + supplierID + "', 'address':'" + address + "', 'deliveryToID':'" + deliveryToID + "', 'salesman':'" + salesman + "', 'poNo':'" + poNo + "', 'termID':'" + termID + "', 'refNo':'" + refNo + "', 'refNoSerial':'" + refNoSerial + "', 'createdDate':'" + createdDate + "', 'cancelDate':'" + cancelDate + "', 'subTotal':'" + subTotal + "', 'paymentAmt':'" + paymentAmt + "', 'memoAmt':'" + memoAmt + "', 'notes':'" + notes + "', 'productList':'" + productList + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                SavingPayment(response.d);
                LoadPurchasedInvoiceList();
                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');

                $("#xPurchaseList").show();
                $("#xPurchaseForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

// -------------------------------------------------- Saving Purchased Invoice Payment
function SavingPayment(InvoiceID) {
    var refNo = $('#txtPaymentRef').val();
    var amount = $('#amount').val();
    var tableCheck = GenerateCheckTable();
    var totalAmount = $('#txtPaymentAmount').val();

    if (amount == "") {
        amount = "0";
    }

    if (refNo != "" && refNo != null) {
        if ($('#hdnPaymentID').val() == "0") {
            var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/SaveInvoicePayment",
                data: "{'invoiceid':'" + InvoiceID + "', 'refNo':'" + refNo + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'totalAmount':'" + totalAmount + "'}",
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
            var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateInvoicePayment",
                data: "{'invoiceid':'" + $('#hdnPaymentID').val() + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'totalAmount':'" + totalAmount + "'}",
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

// **********************************************************************************************
// ------------------------------------ PROCESSING USER DATA ------------------------------------
// **********************************************************************************************

// -------------------------------------------------- Collecting Product List
function GenerateProductTable() {

    var counter = 0;
    var productColletion = "";
    $('#xPurchaseInvoice_table tbody tr').each(function (i) {

        var x1 = $(this).find("td .product_code").val();
        var x2 = $(this).find("td .location_code").val();
        var x3 = $(this).find("td .qty").val();
        var x4 = $(this).find("td .unit_product").val();
        var x5 = $(this).find("td .price").val();
        var x6 = $(this).find("td .discount_product").val();
        var x7 = $(this).find("td .total_amount").val();
        var x8 = $(this).find("td .order_product").val();
        var x9 = $(this).find("td .bonus_product").val();
        if (x1 != "") {

            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "," + x7 + "," + x8 + ", " + x9 + "^";
        }
    });

    return productColletion;
}

// -------------------------------------------------- Collecting Check Payment 
function GenerateCheckTable() {

    var counter = 0;
    var productColletion = "";
    $('#checkpayment_table tbody tr').each(function (i) {

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

// -------------------------------------------------- Filling White Space on Table 
function loadBlank() {
    for (var i = 0; i < 30; i++) {
        $('#xPurchaseList_table tbody:last').append("<tr><td width='15%'><input class='product_code' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%; color: gray; outline: none;'/></td><td width='15%'><input class='location_code' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='qty' style='border: none; background-color: transparent;  width: 100%; color: gray; outline: none;'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='bonus_product' style='border: none; background-color: transparent;  width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='unit_product' style='border: none; background-color: transparent;  width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='price' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='discount_product' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td><td width='10%'><input class='total_amount' style='border: none; background-color: transparent; width: 100%; color: gray; outline: none;' /></td></tr>");
    }

    window.clearInterval(bl);
}

// -------------------------------------------------- Converting Date Formation
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}
