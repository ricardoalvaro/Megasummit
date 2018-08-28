
// ********************************************************************************************
// -------------------------------------- AUTO COMPLETE ---------------------------------------
// ********************************************************************************************

// ---------------------------------------------------------------- Load All Product (AutoComplete)
function ProductAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteProduct",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xPurchaseReturnFormList_table tbody tr").each(function (i) {
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

// ---------------------------------------------------------------- Load All Location (AutoComplete)
function LocationAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteLocation",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xPurchaseReturnFormList_table tbody tr").each(function (i) {

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

// ********************************************************************************************
// --------------------------------------- SELECTING DATA -------------------------------------
// ********************************************************************************************

function NewSales() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    $('#date').val(month + "." + day + "." + year);

    $("#xPurchaseReturn").hide();
    $("#xPurchaseReturnForm").show();
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

// --------------------------------------------------- Load Deliver To
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

// --------------------------------------------------- Filling Table Row
function LoadTableRow() {
    var table = $("#xPurchaseReturnFormList_table tbody");
    table.empty();
    for (var i = 0; i < 10; i++) {
        table.append("<tr><td width='20%'><input class='product' style='outline: none; border: none; background-color: transparent; width: 100%;'/></td><td width='20%'><input class='location' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;  width: 100%;'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='unit' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='discount' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='amount' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td></tr>");
    }

    ProductAutoComplete();
    LocationAutoComplete();
}

// --------------------------------------------------- Load Selected Product Details
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

// ---------------------------------------------------- Load All Purchased Return
function LoadPurchasedReturnList() {
    var pageUrl = '/Webservice/svr_PurchasedReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedReturnSelect",
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPurchaseReturn_table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xPurchaseReturn_table tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectSalesReturn('" + data[i]["ID"] + "')\">" + data[i]["RefNo"] + "" + data[i]["RefNoSerial"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesReturn('" + data[i]["ID"] + "')\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></td><td width='25%'><div onclick=\"ActionSelectSalesReturn('" + data[i]["ID"] + "')\">" + data[i]["SupplierName"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesReturn('" + data[i]["ID"] + "')\">" + data[i]["TotalAmount"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesReturn('" + data[i]["ID"] + "')\">" + data[i]["TotalAmount"] + "</div></td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#xPurchaseReturn_table tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='25%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ---------------------------------------------------- Load Selected Purchased Return Details
function ActionSelectSalesReturn(id) {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    
    $("#hdnReturnID").val(id);

    var pageUrl = '/Webservice/svr_PurchasedReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedReturnSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#supplier').val(data[i]["SupplierID"]);
                $('#address').val(data[i]["Address"]);
                $('#deliver_to').val(data[i]["DeliveryToID"]);
                $('#salesman').val(data[i]["Salesman"]);
                $('#po_number').val(data[i]["PoNo"]);
                $('#terms').val(data[i]["TermID"]);
                $('#refNo').val(data[i]["RefNo"]);;
                $('#reference_number').val(data[i]["RefNoSerial"]);
                $('#date').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                $('#notes').val(data[i]["Notes"]);
                $('#totalAmount').val(data[i]["TotalAmount"]);
                
                LoadPurchasedReturnDetails($("#hdnReturnID").val());
                $("#xPurchaseReturn").hide();
                $("#xPurchaseReturnForm").show();

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ---------------------------------------------------- Load Purchased Return Details
function LoadPurchasedReturnDetails(id) {
    var pageUrl = '/Webservice/svr_PurchasedReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedReturnDetailsSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPurchaseReturnFormList_table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xPurchaseReturnFormList_table tbody:last').append("<tr><td width='20%'><input class='product' style='outline: none; border: none; background-color: transparent;' value='" + data[i]["ProductName"] + "'/></td><td width='20%'><input class='location' style='outline: none; border: none; background-color: transparent;' value='" + data[i]["LocationName"] + "'/></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' value='" + data[i]["Quantity"] + "'/></td><td width='10%'><input class='unit' style='outline: none; border: none; background-color: transparent;' value='" + data[i]["UnitName"] + "'/></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent;' value='" + data[i]["UnitPrice"] + "'/></td><td width='10%'><input class='discount' style='outline: none; border: none; background-color: transparent;' value='" + data[i]["Discount"] + "'/></td><td width='10%'><input class='amount' style='outline: none; border: none; background-color: transparent;' value='" + data[i]["Amount"] + "'/></td></tr>");
            }
            if (data.length > 0) {
                for (var i = 0; i < 200 - data.length; i++) {
                    $('#xPurchaseReturnFormList_table tbody:last').append("<tr><td width='20%'><input class='product' style='outline: none; border: none; background-color: transparent;'/></td><td width='20%'><input class='location' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)'/></td><td width='10%'><input class='unit' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='discount' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='amount' style='outline: none; border: none; background-color: transparent;'/></td></tr>");
                }
            }
            else {
                for (var i = 0; i < 200; i++) {
                    $('#xPurchaseReturnFormList_table tbody:last').append("<tr><td width='20%'><input class='product' style='outline: none; border: none; background-color: transparent;'/></td><td width='20%'><input class='location' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)'/></td><td width='10%'><input class='unit' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='discount' style='outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='amount' style='outline: none; border: none; background-color: transparent;'/></td></tr>");
                }
            }
            ProductAutoComplete();
            LocationAutoComplete();
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ---------------------------------------------------- Load Purchased Invoice By Supplier
function LoadPurchasedInvoiceList() {
    var pageUrl = '/Webservice/svr_PurchasedReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchaseInvoiceSupplierSelect",
        data: "{'id':'" + $('#supplier').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#xInvoiceTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                var balanceAmount = Number(data[i]["SubTotal"]) - Number(data[i]["PaymentAmt"]);
                if (Number(balanceAmount) > 0) {
                    $('#xInvoiceTable tbody:last').append("<tr><td width=\"10%\"> " + data[i]["RefNo"] + "" + data[i]["RefNoSerial"] + " </td><td width=\"10%\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</td><td width=\"30%\">" + data[i]["Notes"] + "</td><td width=\"12%\"><input class='balance' style='outline: none; border: none; background-color: transparent;' value='" + balanceAmount + "'/></td><td width=\"10%\"><div><input class='apply' style='border: none; background-color: transparent;'  onblur=\"ComputeApply();\" /><input class='salesID' style='outline: none; border: none; background-color: transparent; display: none;' value=" + data[i]["ID"] + " /></div></td></tr>");
                }
            }
            //LoadSalesInvoicePayment();
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ********************************************************************************************
// --------------------------------------- COMPUTATION ----------------------------------------
// ********************************************************************************************

// ---------------------------------------------------- Compute Total Amount in Table
function ActionComputeAmount(me) {
    var qty = $(me).closest("tr").find(".qty").val();
    var price = $(me).closest("tr").find(".price").val();
    var total = Number(price) * Number(qty);
    $(me).closest("tr").find(".amount").val(total);
    ActionComputeSubtotal();
}

// ---------------------------------------------------- Compute Subtotal
function ActionComputeSubtotal() {
    var totalAmount = 0;
    $("#xPurchaseReturnFormList_table tbody tr").each(function (i) {
        if ($(this).find("td .total_amount").val() > 0) {
            totalAmount += Number($(this).find("td .amount").val());
        }
    });
    $("#totalAmount").val(totalAmount);
    $("#txtApplyAmount").val(totalAmount);
}

// ---------------------------------------------------- Compute Discount Per-Product
function ComputeDiscount(me) {
    ActionComputeAmount(me);
    var textArr1 = new Array();
    var TotalPlus = 0;
    var TotalMinus = 0;
    textArr1 = $(me).closest("tr").find(".discount_product").val().split("+");
    var totalAmount = $(me).closest("tr").find(".total_amount").val();
    var NewTotal = 0;
    for (var i = 0; i < textArr1.length; i++) {
        var textArr2 = new Array();
        textArr2 = textArr1[i].split("-");
        for (var z = 0; z < textArr2.length; z++) {
            if (z == 0) {
                TotalPlus += Number(textArr2[z]);
            }
            else if (z == 1) {
                TotalMinus += Number(textArr2[z]);
            }
        }
    }
    NewTotal = Number(totalAmount) + Number(TotalPlus);
    NewTotal = Number(NewTotal) - Number(TotalMinus);
    $(me).closest("tr").find(".total_amount").val(NewTotal);
    ActionComputeSubtotal();
}

// ---------------------------------------------------- Compute Applied Amount on Purchased Invoice
function ComputeApply() {
    var totalAmount = $("#totalAmount").val();
    $("#xInvoiceTable tbody tr").each(function (i) {
        if ($(this).find("td .apply").val() != null && $(this).find("td .apply").val() != "") {
            totalAmount -= Number($(this).find("td .apply").val());
        }
    });
    $("#txtApplyAmount").val(totalAmount);
}

// ********************************************************************************************
// ------------------------------------- INSERTING DATA ---------------------------------------
// ********************************************************************************************

// ---------------------------------------------------- Saving Purchased Return Data
function SavingSalesReturn() {

    var pageUrl = '/Webservice/svr_PurchasedReturn.asmx';

    var supplier = $('#SupplierID').val();
    var address = $('#address').val();
    var delivery_to_id = $('#deliver_to').val();
    var salesman_id = $('#salesman').val();
    var po_no = $('#po_number').val();
    var term_id = $('#terms').val();
    var ref_no = $('#refNo').val();;
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
            url: pageUrl + "/UpdatePurchasedReturn",
            data: "{'id':'" + $('#hdnReturnID').val() + "', 'supplierID':'" + supplier + "' , 'address':'" + address + "' , 'deliveryToID':'" + delivery_to_id + "' , 'salesman':'" + salesman_id + "' , 'poNo':'" + po_no + "' , 'termID':'" + term_id + "' , 'refNo':'" + ref_no + "' , 'refNoSerial':'" + ref_no_serial + "' , 'createdDate':'" + created_date + "', 'notes':'" + notes + "' , 'totalAmount':'" + total_amount + "','applyToInvoiceAmt':'0', 'balance':'" + balance + "', 'productList':'" + productList + "', 'salesInvoice':'" + salesInvoice + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                //LoadSalesReturnList();
                $("#xPurchaseReturn").show();
                $("#xPurchaseReturnForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertPurchasedReturn",
            data: "{'supplierID':'" + supplier + "' , 'address':'" + address + "' , 'deliveryToID':'" + delivery_to_id + "' , 'salesman':'" + salesman_id + "' , 'poNo':'" + po_no + "' , 'termID':'" + term_id + "' , 'refNo':'" + ref_no + "' , 'refNoSerial':'" + ref_no_serial + "' , 'createdDate':'" + created_date + "', 'notes':'" + notes + "' , 'totalAmount':'" + total_amount + "','applyToInvoiceAmt':'0', 'balance':'" + balance + "', 'productList':'" + productList + "', 'salesInvoice':'" + salesInvoice + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                //LoadSalesReturnList();
                $("#xPurchaseReturn").show();
                $("#xPurchaseReturnForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

// ********************************************************************************************
// ------------------------------------ PROCESS USER DATA -------------------------------------
// ********************************************************************************************

// ---------------------------------------------------- Collecting Product Data in Table
function GenerateProductTable() {

    var counter = 0;
    var productColletion = "";
    $('#xPurchaseReturnFormList_table tbody tr').each(function (i) {

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

// ---------------------------------------------------- Converting Date Format
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

// ---------------------------------------------------- Collecting Amount Data in table
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



