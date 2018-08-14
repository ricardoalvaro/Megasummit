
// ***************************************************************************************
// ------------------------------------- SELECTING DATA ----------------------------------
// ***************************************************************************************

// ------------------------------------------- Create new Product Assembly
function NewAssmbly() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    LoadProduct();
    LoadLocation();
    LoadReference();
    LoadProductUnit();
    CreateNewTableRow();
    LoadPreparedEmployee();

    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    if (month.toString().length == 1) {
        if (day.toString().length == 1) {
            $('#date').val("0" + month + "." + "0" + day + "." + year);
        }
        else {
            $('#date').val("0" + month + "." + day + "." + year);
        }
    }
    else {
        if (day.toString().length == 1) {
            $('#date').val(month + "." + "0" + day + "." + year);
        }
        else {
            $('#date').val(month + "." + day + "." + year);
        }
    }

}

//-------------------------------------------- Load All Product
function LoadProduct() {

    var pageUrl = '/Webservice/svr_ProductAssembly.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProduct",
        data: "{'id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#product').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#product').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ProductName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

//-------------------------------------------- Load All Location
function LoadLocation() {

    var pageUrl = '/Webservice/svr_ProductAssembly.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectLocation",
        data: "{'id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#location').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#location').append("<option value='" + data[i]["ID"] + "'>" + data[i]["LocationName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Product (AutoComplete)
function ProductAutoComplete() {
    var pageUrl = '/Webservice/svr_ProductAssembly.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteProduct",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#AssemblyTable tbody tr").each(function (i) {
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
                //$(me).closest("tr").find(".packing_product").val(data[i]["Packing"]);
                $(me).closest("tr").find(".unit_product").val(data[i]["UnitName"]);
                $(me).closest("tr").find(".price").val(data[i]["PriceA"]);
                $(me).closest("tr").find(".Ave_cost").val('0');
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Location (AutoComplete)
function LocationAutoComplete() {
    var pageUrl = '/Webservice/svr_ProductAssembly.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteLocation",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#AssemblyTable tbody tr").each(function (i) {

                $(this).find("td .location_code").autocomplete({
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

            });
        },

        error: function (response) {
            alert(response.status);
        }
    });


}

// ------------------------------------------- Create New Table Row
function CreateNewTableRow() {
    var table = $("#AssemblyTable tbody");
    table.empty();
    for (var i = 0; i < 10; i++) {
        table.append("<tr><td width='25%'><input class='product_code' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='20%'><input class='location_code' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='12%'><input class='qty_product' onblur='ActionComputeAmount(this)' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%;' /><input class='price' style='outline: none; border: none; background-color: transparent; color: gray;  width: 100%; display: none;'/></td><td width='12%'><input class='unit_product' style='outline: none; border: none; background-color: transparent;  width: 100%; color: gray;' /></td><td width='15%'><input class='Ave_cost' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='12%'><input class='Amount' style='outline: none; border: none; background-color: transparent; width: 100%; color: gray;' /></td><td width='5%'> <input type='button' name='name' value='X' class='ActionButton' /> </td></tr>");
    }

    ProductAutoComplete();
    LocationAutoComplete();
}

// ------------------------------------------- Collecting Product Details By Customer
function GenerateProductTable() {

    var counter = 0;
    var productColletion = "";
    $('#AssemblyTable tbody tr').each(function (i) {

        var x1 = $(this).find("td .product_code").val();
        var x2 = $(this).find("td .location_code").val();
        var x3 = $(this).find("td .qty_product").val();
        var x4 = $(this).find("td .unit_product").val();
        var x5 = $(this).find("td .Ave_cost").val();
        var x6 = $(this).find("td .Amount").val();
        if (x1 != "") {

            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "^";
        }
    });

    return productColletion;
}

//-------------------------------------------- Load All Product Unit
function LoadProductUnit() {

    var pageUrl = '/Webservice/svr_ProductAssembly.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectUnit",
        data: "{'id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#unit').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#unit').append("<option value='" + data[i]["ID"] + "'>" + data[i]["UnitName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Reference Initial
function LoadReference() {
    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReference",
        data: "{'referenceID':'12'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#reference_letter').val(data[i]["Prefix"]);
                if (data[i]["Automatic"] == true) {
                    $('#reference_number').val(data[i]["NextNo"]);
                }
            }
        },
        error: function (response) {
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

            $('#prepared_by').empty();
            $('#prepared_by').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#prepared_by').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Inventory Adjustment
function LoadProductAssembly(id) {
    var pageUrl = '/Webservice/svr_ProductAssembly.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductAssembly",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#ulAssembly').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ulAssembly").append("<li ><a><span class='ym-clearfix'><span class='name'> " + data[i]["refNo"] + "<span><div style='float: left;'>" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></span></span></a> </li>");
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// **************************************************************************************
// -------------------------------------- COMPUTATION -----------------------------------
// **************************************************************************************


// ------------------------------------------- Compute Product Price Amount
function ActionComputeAmount(me) {
    var qty = $(me).closest("tr").find(".qty_product").val();
    if (Number(qty) > 1) {
        LoadProductUnitPlural($(me).closest("tr").find(".product_code").val(), me);
    }
    var price = $(me).closest("tr").find(".price").val().toString();
    var total = Number(price.replace(",", "")) * Number(qty);
    $(me).closest("tr").find(".Amount").val(total.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));

    ActionComputeSubtotal();
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

// ------------------------------------------- Compute All Product Average Cost
function ActionComputeSubtotal() {
    var totalAmount = 0;
    var totalQty = Number($("#quantity").val());
    $("#AssemblyTable tbody tr").each(function (i) {
        if (Number($(this).find("td .Amount").val().toString().replace(",", "")) > 0) {
            totalAmount += Number($(this).find("td .Amount").val().toString().replace(",", ""));
        }
    }); 
    $("#average_cost").val(totalAmount / totalQty);
    //$("#txtTotalSalesInvoice").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    //$("#txtAmountDue").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
}


// ***************************************************************************************
// --------------------------------------- SAVING DATA -----------------------------------
// ***************************************************************************************

// ------------------------------------------- Saving Customer Sales Invoice
function SavingAssembly() {

    var pageUrl = '/Webservice/svr_ProductAssembly.asmx';

    var productID = $('#product').val();
    var locationID = $('#location').val();
    var quantity = $('#quantity').val();
    var unit = $('#unit').val();
    var average_cost = $('#average_cost').val();
    var reference_letter = $('#reference_letter').val();
    var reference_number = $('#reference_number').val();
    var created_date = $('#date').val().replace(".", "/").replace(".", "/");
    var batch_number = $('#batch_number').val();
    var prepared_by = $('#prepared_by').val();
    var productList = GenerateProductTable();

    //if ($('#hdnInvoiceID').val() != 0) {
    //    $.ajax({
    //        type: "POST",
    //        url: pageUrl + "/UpdateInvoice",
    //        data: "{'id':'" + $('#hdnInvoiceID').val() + "','invoice_status':'" + invoice_status + "', 'customer_id':'" + customer_id + "', 'address':'" + address + "', 'forwarder_to_id':'" + forwarder_to_id + "', 'salesman_id':'" + salesman_id + "', 'po_no':'" + po_no + "', 'term_id':'" + term_id + "', 'ref_no':'" + ref_no + "', 'ref_no_serial':'" + ref_no_serial + "', 'created_date':'" + created_date + "', 'delivery_date':'" + delivery_date + "', 'prepared_by':'" + prepared_by + "', 'checked_by':'" + checked_by + "', 'delivered_by':'" + delivered_by + "', 'way_bill_no':'" + way_bill_no + "', 'container_no':'" + container_no + "', 'bill_of_landing':'" + bill_of_landing + "', 'commission_rate':'" + commission_rate + "', 'commission_amt':'" + commission_amt + "', 'remarks_id':'" + remarks_id + "', 'notes':'" + notes + "', 'sub_total_amt':'" + sub_total_amt + "', 'tax_amt':'" + tax_amt + "', 'shipping_amt':'" + shipping_amt + "', 'payment_amt':'" + payment_amt + "', 'memo_amt':'" + memo_amt + "', 'adjustment_amt':'" + adjustment_amt + "', 'productList':'" + productList + "', 'productListAD':'" + productListAD + "'}",
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        crossdomain: true,
    //        success: function (response) {
    //            LoadSalesInvoiceList();
    //            $('#toolbar .save').addClass('disabled');
    //            $('#toolbar .new').removeClass('disabled');
    //            $('#toolbar .find').removeClass('disabled');
    //        },
    //        error: function (response) {
    //            alert(response.status);
    //        }
    //    });
    //}
    //else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertProductAssembly",
            data: "{'productID':'" + productID + "', 'locationID':'" + locationID + "', 'quantity':'" + quantity + "', 'unit':'" + unit + "','average_cost':'" + average_cost + "', 'referenceNo':'" + reference_letter + "" + reference_number + "', 'date':'" + created_date + "', 'batch_number':'" + batch_number + "', 'prepared_by':'" + prepared_by + "', 'productList':'" + productList + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');

                $('#product').empty();
                $('#location').empty();
                $('#quantity').val("");
                $('#unit').empty();
                $('#average_cost').val("");
                $('#reference_letter').val("");
                $('#reference_number').val("");
                $('#date').val("");
                $('#batch_number').val("");
                $('#prepared_by').empty();
                $('#prepared_by').empty();
                CreateNewTableRow();
                LoadProductAssembly("0");
            },
            error: function (response) {
                alert(response.d);
            }
        });
    //}
}


// ***************************************************************************************
// --------------------------------- PROCESSING USER DATA --------------------------------
// ***************************************************************************************

// -------------------------------------------------- Converting Date Format
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}