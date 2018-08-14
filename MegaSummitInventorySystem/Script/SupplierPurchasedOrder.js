

// ********************************************************************************************
// ----------------------------------- AUTO COMPLETE ------------------------------------------
// ********************************************************************************************

// ------------------------------------------------------- Load All Product (AutoComplete)
function ProductAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteProduct",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xPurchaseOrder_Table tbody tr").each(function (i) {
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

// ------------------------------------------------------- Load ALl Location (AutoComplete)
function LocationAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteLocation",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#xPurchaseOrder_Table tbody tr").each(function (i) {

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

// ------------------------------------------------------- Load All Reference for Searching
function RefNoAutoComplete() {
    var pageUrl = '/Webservice/svr_PurchasedOrder.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/_PurchasedOrderRefAutoSelect",
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

            ActionSelectSalesOrder(b.item.id);
        }
    });
}

// ********************************************************************************************
// ------------------------------------- SELECTING DATA ---------------------------------------
// ********************************************************************************************

// ------------------------------------------------------- New Purchased Order
function NewSales() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    //$('#hdn_customerID').val("0");
    //$('#customer').val("0");
    //$('#address').val("");
    //$('#deliver_to').val("0");
    //$('#hdn_deliverTo').val("0");
    //$('#salesman').val("0");

    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    $('#date').val(month + "." + day + "." + year);
    $('#cancel_date').val(month + "." + day + "." + year);


    $("#xPurchaseOrderList").hide();
    $("#xPurchaseOrderForm").show();
}

// ------------------------------------------------------ Load All Supplier (AutoComplete)
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
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------------------- Load Deliver to
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

// ------------------------------------------------------- Load Employee (Salesman)
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

// ------------------------------------------------------- Load All Terms
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

// ------------------------------------------------------- Filling Table Raw
function LoadTableRow() {
    var table = $("#xPurchaseOrder_Table tbody");
    table.empty();
    for (var i = 0; i < 5; i++) {
        table.append("<tr><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%;'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%;'/></td><td width='10%'><input class='location_code' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;  width: 100%;'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='bonus' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='served' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td></tr>");

    }

    ProductAutoComplete();
    LocationAutoComplete();
}

// ------------------------------------------------------- Load Selected Product Details
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

// ------------------------------------------------------- Load Purchased Order Data by Searching 
function ActionSearchInvoice() {


    $("#xPurchaseOrderList").hide();
    $("#xPurchaseOrderForm").hide();
    $('#xPurchasedSearch').show();

    $('#txt_purchased_search').val('');
    RefNoAutoComplete();
}

// ------------------------------------------------------- Load All Purchased Order
function LoadPurchasedOrderList() {
    var pageUrl = '/Webservice/svr_PurchasedOrder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedOrderSelect",
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPurchaseOrderList_table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xPurchaseOrderList_table tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["RefNo"] + "" + data[i]["RefNoSerial"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></td><td width='25%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["SupplierName"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + ToJavaScriptDate(data[i]["CancelDate"]) + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["TotalAmount"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["TotalServed"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["PurchasedOrderStatus"] + "</div></td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#xPurchaseOrderList_table tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='25%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");

            }
            ProductAutoComplete();
            LocationAutoComplete();
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------------------- Load Purchase Order Data
function ActionSelectSalesOrder(id) {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    $("#hdnPurchasedOrderID").val(id);

    var pageUrl = '/Webservice/svr_PurchasedOrder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedOrderSelect",
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
                $('#refNo').val(data[i]["RefNo"]);
                $('#reference_number').val(data[i]["RefNoSerial"]);
                $('#date').val(ToJavaScriptDate(data[i]["CreatedDate"]));
                $('#cancel_date').val(ToJavaScriptDate(data[i]["CancelDate"]));
                $('#notes').val(data[i]["Notes"]);
                $('#txtSubtotal').val(data[i]["TotalAmount"]);
                $('#txtTotalServed').val(data[i]["TotalServed"]);
                LoadSalesOrderDetails($("#hdnPurchasedOrderID").val());
                
                $("#xPurchasedSearch").hide();
                $("#xPurchaseOrderList").hide();
                $("#xPurchaseOrderForm").show();
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------------- Load Purchased Order Details
function LoadSalesOrderDetails(id) {

    var totalServed = 0;
    var pageUrl = '/Webservice/svr_PurchasedOrder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedOrderDetailsSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPurchaseOrder_Table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                
                $('#xPurchaseOrder_Table tbody:last').append("<tr><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%;'  value='" + data[i]["ProductName"] + "'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%;'/></td><td width='10%'><input class='location_code' style='outline: none; border: none; background-color: transparent; width: 100%;'  value='" + data[i]["LocationName"] + "' /></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;  width: 100%;'  value='" + data[i]["Quantity"] + "'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='bonus' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='served' style='outline: none; border: none; background-color: transparent;  width: 100%;' value='" + data[i]["Served"] + "' /></td><td width='10%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%;'  value='" + data[i]["UnitName"] + "' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%;'  value='" + data[i]["UnitPrice"] + "' /></td><td width='10%'><input class='discount_product'  value='" + data[i]["Discount"] + "' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='total_amount' style='border: none; background-color: transparent; width: 100%;'  value='" + data[i]["Amount"] + "' /></td></tr>");
                
                totalServed += Number(data[i]["Served"]);
            }
            if (data.length > 0) {
                for (var i = 0; i < 10 - data.length; i++) {
                    $('#xPurchaseOrder_Table tbody:last').append("<tr><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%;'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%;'/></td><td width='10%'><input class='location_code' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;  width: 100%;'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='bonus' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='bonus_product' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='served' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td></tr>");
                }
            }
            else {
                for (var i = 0; i < 10; i++) {
                    $('#xPurchaseOrder_Table tbody:last').append("<tr><td width='20%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%;'/><input class='order_product' style='border: none; background-color: transparent; display: none; width: 100%;'/></td><td width='10%'><input class='location_code' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='qty' style='outline: none; border: none; background-color: transparent;  width: 100%;'  onblur='ActionComputeAmount(this)'  /></td><td width='10%'><input class='bonus' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='bonus_product' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='served' style='outline: none; border: none; background-color: transparent;  width: 100%;' /></td><td width='10%'><input class='price' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='discount_product' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td><td width='10%'><input class='total_amount' style='outline: none; border: none; background-color: transparent; width: 100%;' /></td></tr>");
                }
            }

            $("#txtTotalServed").val(totalServed);

            ProductAutoComplete();
            LocationAutoComplete();

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ********************************************************************************************
// --------------------------------------- COMPUTATION ----------------------------------------
// ********************************************************************************************

// ------------------------------------------------------- Compute Total Amount in table
function ActionComputeAmount(me) {
    var qty = $(me).closest("tr").find(".qty").val();
    var price = $(me).closest("tr").find(".price").val();
    var total = Number(price) * Number(qty);
    $(me).closest("tr").find(".total_amount").val(total);
    ActionComputeSubtotal();
}

// ------------------------------------------------------- Compute Subtotal
function ActionComputeSubtotal() {
    var totalAmount = 0;
    $("#xPurchaseOrder_Table tbody tr").each(function (i) {
        if ($(this).find("td .total_amount").val() > 0) {
            totalAmount += Number($(this).find("td .total_amount").val());
        }
    });
    $("#txtSubtotal").val(totalAmount);
    $("#txtTotalPurchaseInvoice").val(totalAmount);
}

// ------------------------------------------------------- Compute Discount Per-Product
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

// **********************************************************************************************
// --------------------------------------- INSERTING DATA ---------------------------------------
// **********************************************************************************************

// ------------------------------------------------------- Saving Purchased Order Data
function SavingPurchaseOrder() {

    var pageUrl = '/Webservice/svr_PurchasedOrder.asmx';

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
    var subTotal = $('#txtSubtotal').val();
    var totalServed = "0";
    var balance = "0";
    var notes = $('#notes').val();
    var productList = GenerateProductTable();

    if ($('#hdnPurchasedOrderID').val() != 0) {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdatePurchasedOrder",
            data: "{'id':'" + $('#hdnPurchasedOrderID').val() + "','purchasedOrderStatus':'Posted', 'supplierID':'" + supplierID + "', 'address':'" + address + "', 'deliveryToID':'" + deliveryToID + "', 'salesman':'" + salesman + "', 'poNo':'" + poNo + "', 'termID':'" + termID + "', 'refNo':'" + refNo + "', 'refNoSerial':'" + refNoSerial + "', 'createdDate':'" + createdDate + "', 'cancelDate':'" + cancelDate + "', 'notes':'" + notes + "', 'totalAmount':'" + subTotal + "', 'totalServed':'" + totalServed + "', 'balance':'" + balance + "', 'productList':'" + productList + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                //SavingPayment($('#hdnInvoiceID').val());
                LoadPurchasedOrderList();
                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');
                $("#xPurchaseOrderList").show();
                $("#xPurchaseOrderForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertPurchasedOrder",
            data: "{'purchasedOrderStatus':'" + 'Posted' + "', 'supplierID':'" + supplierID + "', 'address':'" + address + "', 'deliveryToID':'" + deliveryToID + "', 'salesman':'" + salesman + "', 'poNo':'" + poNo + "', 'termID':'" + termID + "', 'refNo':'" + refNo + "', 'refNoSerial':'" + refNoSerial + "', 'createdDate':'" + createdDate + "', 'cancelDate':'" + cancelDate + "', 'notes':'" + notes + "', 'totalAmount':'" + subTotal + "', 'totalServed':'" + totalServed + "', 'balance':'" + balance + "', 'productList':'" + productList + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                //SavingPayment(response.d);
                LoadPurchasedOrderList();
                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');
                $("#xPurchaseOrderList").show();
                $("#xPurchaseOrderForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
}

// **********************************************************************************************
// ------------------------------------ PROCESSING USER DATA ------------------------------------
// **********************************************************************************************

// ------------------------------------------------------- Collecting Product Data on table
function GenerateProductTable() {

    var counter = 0;
    var productColletion = "";
    $('#xPurchaseOrder_Table tbody tr').each(function (i) {

        var x1 = $(this).find("td .product_code").val();
        var x2 = $(this).find("td .location_code").val();
        var x3 = $(this).find("td .qty").val();
        var x4 = $(this).find("td .served").val();
        var x5 = $(this).find("td .unit_product").val();
        var x6 = $(this).find("td .price").val();
        var x7 = $(this).find("td .discount_product").val();
        var x8 = $(this).find("td .total_amount").val(); 
        var x8 = $(this).find("td .total_amount").val();
        var x9 = $(this).find("td .bonus").val();
        if (x1 != "") {

            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "," + x7 + "," + x8 + ", " + x9 + "^";
        }
    });

    return productColletion;
}

// ------------------------------------------------------- Convert Data Format
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

