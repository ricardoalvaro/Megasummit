/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

// ***************************************************************************************
// -------------------------------- SELECTING DATA ---------------------------------------
// ***************************************************************************************

// ------------------------------------------------------ Create New Sales Return
function NewSalesReturn() {

    LoadCustomer();
    LoadForwarded();
    LoadSalesman();
    LoadTerms();
    LoadReferenceNo();
    ProductAutoComplete();
    LocationAutoComplete();
    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    $('#date').val(month + "." + day + "." + year);

    $("#xSalesReturnList").hide();
    $("#xSalesReturnForm").show();

}

// ------------------------------------------------- Load All Customer (AutoComplete)
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

// ------------------------------------------------- Load Customer Information Details
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

                LoadSalesOrder(id);
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------- Load Deliver to
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

// ------------------------------------------------- Load Employee (Salesman)
function LoadSalesman() {
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

// ------------------------------------------------- Load All Terms
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

// ------------------------------------------------- Load Reference (Auto or Not)
function LoadReferenceNo() {
    var pageUrl = '/Webservice/svr_SalesReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'1', 'setting_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#reference_letter").val(data[i]["Prefix"]);
                if (data[i]["Automatic"] == true) {
                    $("#reference_number").val(data[i]["NextNo"]);
                }
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------------- Load ALl Product (AutoComplete)
function ProductAutoComplete() {
    var pageUrl = '/Webservice/svr_SalesReturn.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteProduct",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xProductTable tbody tr").each(function (i) {
                $(this).find("td .product").autocomplete({
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

// ------------------------------------------------- Load All Location (AutoComplete)
function LocationAutoComplete() {
    var pageUrl = '/Webservice/svr_SalesReturn.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteLocation",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xProductTable tbody tr").each(function (i) {

                $(this).find("td .location").autocomplete({
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

// ------------------------------------------------- Load Product Information Details
function ActionSelectProductDetails(id, me) {
    var pageUrl = '/Webservice/svr_SalesReturn.asmx';


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
                $(me).closest("tr").find(".unit").val(data[i]["UnitName"]);
                $(me).closest("tr").find(".price").val(data[i]["PriceA"]);
                $(me).closest("tr").find(".discount").val('0');
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------- Load All Sales Return
function LoadSalesReturnList() {
    var pageUrl = '/Webservice/svr_SalesReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesReturnSelect",
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xSalesReturnList tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xSalesReturnList tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectSalesReturn('" + data[i]["ID"] + "')\">" + data[i]["Prefix"] + "" + data[i]["RefNoSerial"] + "</div></td><td width='10%'><div>" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></td><td width='30%'><div>" + data[i]["CustomerName"] + "</div></td><td width='15%'><div>" + data[i]["Salesman"] + "</div></td><td width='10%'><div>" + data[i]["TotalAmount"] + "</div></td><td width='10%'><div>" + data[i]["TotalAmount"] + "</div></td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#xSalesReturnList tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='30%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------------- Load Sales Return Information By Selected Sales Return
function ActionSelectSalesReturn(id) {

    LoadCustomer();
    LoadForwarded();
    LoadSalesman();
    LoadTerms();
    LoadReferenceNo();
    ProductAutoComplete();
    LocationAutoComplete();

    $("#hdnReturnID").val(id);

    var pageUrl = '/Webservice/svr_SalesReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesReturnSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#customer').val(data[i]["CustomerID"]);
                $('#address').val(data[i]["Address"]);
                $('#salesman').val(data[i]["SalesmanID"]);
                $('#deliver_to').val(data[i]["DeliverToID"]);
                $('#po_number').val(data[i]["PONo"]);
                $('#terms').val(data[i]["TermID"]);
                $('#referenceNo').val(data[i]["Prefix"]);
                $('#reference_number').val(data[i]["RefNoSerial"]);
                $('#date').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                $('#notes').val(data[i]["Notes"]);
                $('#totalAmount').val(data[i]["TotalAmount"]);
                LoadSalesReturnDetails($("#hdnReturnID").val());
                $("#xSalesReturnList").hide();
                $("#xSalesReturnForm").show();
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------- Load Sales Return Details
function LoadSalesReturnDetails(id) {
    var pageUrl = '/Webservice/svr_SalesReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesReturnDetailsSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xProductTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xProductTable tbody:last').append("<tr><td width='20%'><input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' value='" + data[i]["ProductName"] + "'/></td><td width='10%'><input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' value='" + data[i]["LocationName"] + "'/></td><td width='10%'><input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' value='" + data[i]["Quantity"] + "'/></td><td width='10%'><input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' value='" + data[i]["UnitName"] + "'/></td><td width='10%'><input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' value='" + data[i]["UnitPrice"] + "'/></td><td width='10%'><input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' value='" + data[i]["Discount"] + "'/></td><td width='10%'><input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' value='" + data[i]["Amount"] + "'/></td></tr>");
            }
            if (data.length > 0) {
                for (var i = 0; i < 200 - data.length; i++) {
                    $('#xProductTable tbody:last').append("<tr><td width='20%'><input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)'/></td><td width='10%'><input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td></tr>");
                }
            }
            else {
                for (var i = 0; i < 200; i++) {
                    $('#xProductTable tbody:last').append("<tr><td width='20%'><input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)'/></td><td width='10%'><input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td><td width='10%'><input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;'/></td></tr>");
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
    ProductAutoComplete();
    LocationAutoComplete();
}

// ------------------------------------------------- Load Sales Invoice By Customer
function LoadSalesInvoiceList() {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceSalesCustomerSelect",
        data: "{'id':'" + $('#customer').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xInvoiceTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                var balanceAmount = Number(data[i]["SubTotalAmt"]) - Number(data[i]["PaymentAmount"]);
                if (Number(balanceAmount) > 0) {
                    $('#xInvoiceTable tbody:last').append("<tr><td width=\"10%\"> " + data[i]["PrefixInitial"] + "" + data[i]["RefNoSerial"] + " </td><td width=\"10%\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</td><td width=\"30%\">" + data[i]["Notes"] + "</td><td width=\"12%\"><input class='balance' style='border: none; background-color: transparent;' value='" + balanceAmount + "'/></td><td width=\"10%\"><div><input class='apply' style='color: gray; outline: none; width: 100%; text-align: right; border: none; background-color: transparent;'  onblur=\"ComputeApply();\" /><input class='salesID' style='color: gray; outline: none; width: 100%;  text-align: right; border: none; background-color: transparent; display: none;' value=" + data[i]["ID"] + " /></div></td></tr>");
                }
            }
            LoadSalesInvoicePayment();
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ***************************************************************************************
// ----------------------------------- COMPUTATION ---------------------------------------
// ***************************************************************************************

// ------------------------------------------------- Compute Total Amount in Table
function ActionComputeAmount(me) {
    var qty = $(me).closest("tr").find(".qty").val();
    var price = $(me).closest("tr").find(".price").val();
    var discount = $(me).closest("tr").find(".discount").val();
    var total = Number(price) * Number(qty);
    total -= Number(discount);
    $(me).closest("tr").find(".amount").val(total.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    ActionComputeSubtotal();
}

// ------------------------------------------------- Compute Subtotal
function ActionComputeSubtotal() {
    var totalAmount = 0;
    $("#xProductTable tbody tr").each(function (i) {
        if (Number($(this).find("td .amount").val().toString().replace(",", "")) > 0) {
            totalAmount += Number($(this).find("td .amount").val().toString().replace(",", ""));
        }
    });
    $("#totalAmount").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    $("#txtApplyAmount").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
}

// ------------------------------------------------- Compute Apply Amount
function ComputeApply() {
    var totalAmount = $("#totalAmount").val();
    $("#xInvoiceTable tbody tr").each(function (i) {
        if ($(this).find("td .apply").val() != null && $(this).find("td .apply").val() != "") {
            totalAmount -= Number($(this).find("td .apply").val());
        }
    });
    $("#txtApplyAmount").val(totalAmount);
}

// ***************************************************************************************
// ---------------------------------- INSERTING DATA -------------------------------------
// ***************************************************************************************

// -------------------------------------------------- Saving Sales Return
function SavingSalesReturn() {

    var pageUrl = '/Webservice/svr_SalesReturn.asmx';

    var customer_id = $('#hdn_customerID').val();
    var address = $('#address').val();
    var delivery_to_id = $('#deliver_to').val();
    var salesman_id = $('#salesman').val();
    var po_no = $('#po_number').val();
    var term_id = $('#terms').val();
    var ref_no = "1";
    var ref_no_serial = $('#reference_number').val();
    var created_date = $('#date').val();
    var notes = $('#notes').val();
    var total_amount = $('#totalAmount').val();
    var balance = "0";
    var productList = GenerateProductTable();
    var salesInvoice = GenerateSalesTable();


    if ($('#hdnReturnID').val() != 0) {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateSalesReturn",
            data: "{'id':'" + $('#hdnReturnID').val() + "', 'customer_id':'" + customer_id + "' , 'address':'" + address + "' , 'delivery_to_id':'" + delivery_to_id + "' , 'salesman_id':'" + salesman_id + "' , 'po_no':'" + po_no + "' , 'term_id':'" + term_id + "' , 'ref_no':'" + ref_no + "' , 'ref_no_serial':'" + ref_no_serial + "' , 'created_date':'" + created_date + "', 'notes':'" + notes + "' , 'total_amount':'" + total_amount + "','apply_to_invoice_amount':'0', 'balance':'" + balance + "', 'productList':'" + productList + "', 'salesInvoice':'" + salesInvoice + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadSalesReturnList();
                $("#xSalesReturnList").show();
                $("#xSalesReturnForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertSalesReturn",
            data: "{'customer_id':'" + customer_id + "' , 'address':'" + address + "' , 'delivery_to_id':'" + delivery_to_id + "' , 'salesman_id':'" + salesman_id + "' , 'po_no':'" + po_no + "' , 'term_id':'" + term_id + "' , 'ref_no':'" + ref_no + "' , 'ref_no_serial':'" + ref_no_serial + "' , 'created_date':'" + created_date + "', 'notes':'" + notes + "' , 'total_amount':'" + total_amount + "','apply_to_invoice_amount':'0', 'balance':'" + balance + "', 'productList':'" + productList + "', 'salesInvoice':'" + salesInvoice + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadSalesReturnList();
                $("#xSalesReturnList").show();
                $("#xSalesReturnForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

// ***************************************************************************************
// --------------------------------- PROCESS USER DATA -----------------------------------
// ***************************************************************************************

// -------------------------------------------------- Collecting Product In Table
function GenerateProductTable() {

    var counter = 0;
    var productColletion = "";
    $('#xProductTable tbody tr').each(function (i) {

        //if (counter > 0) {

        var x1 = $(this).find("td .product").val();
        var x2 = $(this).find("td .location").val();
        var x3 = $(this).find("td .qty").val();
        var x4 = $(this).find("td .unit").val();
        var x5 = $(this).find("td .price").val();
        var x6 = $(this).find("td .discount").val();
        var x7 = $(this).find("td .amount").val();

        if (x1 != "") {

            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "," + x7 + "^";
        }
        //}

        counter++;
    });

    return productColletion;
}

// -------------------------------------------------- Converting Date Format
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

// -------------------------------------------------- Collecting Appied Amount in Invoice
function GenerateSalesTable() {

    var counter = 0;
    var productColletion = "";
    $('#xInvoiceTable tbody tr').each(function (i) {

        //if (counter > 0) {

        var x1 = $(this).find("td .apply").val();
        var x2 = $(this).find("td .salesID").val();

        if (x1 != "") {

            productColletion += x1 + "," + x2 + "^";
        }
        //}

        counter++;
    });

    return productColletion;
}
