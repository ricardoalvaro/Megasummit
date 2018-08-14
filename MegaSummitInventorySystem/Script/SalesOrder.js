
// ***************************************************************************************
// -------------------------------- SELECTING DATA ---------------------------------------
// ***************************************************************************************

// ------------------------------------------------- Create New Sales Order
function NewSalesOrder() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    LoadCustomer();
    LoadForwarded();
    LoadSalesman();
    LoadTerms();
    ProductAutoComplete();
    LocationAutoComplete();
    LoadReferenceNo();

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

    

    $("#xSalesOrderList").hide();
    $("#xSalesOrderForm").show();

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

                LoadSalesOrder($('#hdn_customerID').val());
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

// ------------------------------------------------- Load All Remarks
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

// ------------------------------------------------- Load Reference (Auto or Not)
function LoadReferenceNo() {
    var pageUrl = '/Webservice/svr_SalesOrder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSetting",
        data: "{ 'id':'2', 'setting_name':'' }",
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
    var pageUrl = '/Webservice/svr_SalesOrder.asmx';
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
    var pageUrl = '/Webservice/svr_SalesOrder.asmx';
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
    var pageUrl = '/Webservice/svr_SalesOrder.asmx';


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
                $(me).closest("tr").find(".served").val("0");
                $(me).closest("tr").find(".price").val(data[i]["PriceA"]);
                $(me).closest("tr").find(".discount_product").val('0');
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------- Load All Sales Orders
function LoadSalesOrderList() {
    var pageUrl = '/Webservice/svr_SalesOrder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderSelect",
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xOrderTableList tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xOrderTableList tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["Prefix"] + "" + data[i]["RefNoSerial"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></td><td width='30%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["CustomerName"] + "</div></td><td width='15%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["Salesman"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + Number(data[i]["TotalAmount"]).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["TotalServed"] + "</div></td><td width='10%'><div onclick=\"ActionSelectSalesOrder('" + data[i]["ID"] + "')\">" + data[i]["OrderStatus"] + "</div></td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#xOrderTableList tbody:last').append("<tr><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='30%'><div>" + "" + "</div></td><td width='15%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td><td width='10%'><div>" + "" + "</div></td></tr>");
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
    
}

// ------------------------------------------------- Load Sales Order Information By Selectec Sales Order
function ActionSelectSalesOrder(id) {

    $("#xSalesOrderSearch").hide();
    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    LoadCustomer();
    LoadForwarded();
    LoadSalesman();
    LoadTerms();
    LoadReferenceNo();

    $("#hdnSalesOrderID").val(id);

    var pageUrl = '/Webservice/svr_SalesOrder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderSelect",
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
                $('#cancel_date').val(ToJavaScriptDate(data[i]["CancelDate"]));
                $('#notes').val(data[i]["Notes"]);
                $('#totalAmount').val(data[i]["TotalAmount"]);
                //$('#totalServed').val(data[i]["TotalServed"]);
                LoadSalesOrderDetails($("#hdnSalesOrderID").val());
                $("#xSalesOrderList").hide();
                $("#xSalesOrderForm").show();
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------- Load Sales Order Details
function LoadSalesOrderDetails(id) {

    var totalServed = 0;
    var pageUrl = '/Webservice/svr_SalesOrder.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderDetailsSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xProductTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#xProductTable tbody:last').append("<tr><td width='20%'><input class='product' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' value='" + data[i]["ProductName"] + "'/></td><td width='10%'><input class='location' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' value='" + data[i]["LocationName"] + "'/></td><td width='10%'><input class='qty' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' value='" + data[i]["Quantity"] + "'/></td><td width='10%'><input class='served' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' value='" + data[i]["Served"] + "'/></td><td width='10%'><input class='unit' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' value='" + data[i]["UnitName"] + "'/></td><td width='10%'><input class='price' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' value='" + data[i]["UnitPrice"] + "'/></td><td width='10%'><input class='discount' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' value='" + data[i]["Discount"] + "'  onblur='ComputeDiscount(this);' /></td><td width='10%'><input class='amount' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' value='" + data[i]["Amount"] + "'/></td></tr>");
                totalServed += Number(data[i]["Served"]);
            }
            if (data.length > 0) {
                for (var i = 0; i < 200 - data.length; i++) {
                    $('#xProductTable tbody:last').append("<tr><td width='20%'><input class='product' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='location' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='qty' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)'/></td><td width='10%'><input class='served' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='unit' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='price' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='discount' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'  onblur='ComputeDiscount(this);' /></td><td width='10%'><input class='amount' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td></tr>");
                }
            }
            else {
                for (var i = 0; i < 200; i++) {
                    $('#xProductTable tbody:last').append("<tr><td width='20%'><input class='product' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='location' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='qty' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)'/></td><td width='10%'><input class='served' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='unit' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='price' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'/></td><td width='10%'><input class='discount' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;'  onblur='ComputeDiscount(this);' /></td><td width='10%'><input class='amount' style='color: gray; width: 100%; outline: none; 'border: none; background-color: transparent;'/></td></tr>");
                }
            }
            $("#totalServed").val(totalServed);
        },
        error: function (response) {
            alert(response.status);
        }
    });
    ProductAutoComplete();
    LocationAutoComplete();
}

// -------------------------------------------------- Load Searched Sales order
function ActionSearchOrder() {


    $("#xSalesOrderList").hide();
    $("#xSalesOrderForm").hide();
    $('#xSalesOrderSearch').show();

    $('#txt_sales_search').val('');
    RefNoAutoComplete();
}

// -------------------------------------------------- Load All Reference (AutoComplete)
function RefNoAutoComplete() {
    var pageUrl = '/Webservice/svr_SalesOrder.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/OrderRefAutocom",
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

            ActionSelectSalesOrder(b.item.id);
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
    var total = Number(price) * Number(qty);
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
}

// ------------------------------------------- Compute Product Discount
function ComputeDiscount(me) {
    //ActionComputeAmount(me);
    var textArr1 = new Array();
    var TotalPlus = 0;
    var TotalMinus = 0;
    textArr1 = $(me).closest("tr").find(".discount").val().split("+");
    var totalAmount = Number($(me).closest("tr").find(".amount").val().toString().replace(",", ""));
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
    $(me).closest("tr").find(".amount").val(totalAmount.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
    ActionComputeSubtotal();
}

// ***************************************************************************************
// ---------------------------------- INSERTING DATA -------------------------------------
// ***************************************************************************************

// -------------------------------------------------- Saving Sales Order
function SavingSalesOrder(stats) {

    var pageUrl = '/Webservice/svr_SalesOrder.asmx';

    var customer_id = $('#hdn_customerID').val();
    var address = $('#address').val();
    var delivery_to_id = $('#deliver_to').val();
    var salesman_id = $('#salesman').val();
    var po_no = $('#po_number').val();
    var term_id = $('#terms').val();
    var ref_no = "2";
    var ref_no_serial = $('#reference_number').val();
    var created_date = $('#date').val();
    var cancel_date = $('#cancel_date').val();
    var notes = $('#notes').val();
    var total_amount = $('#totalAmount').val().replace(",", "");
    var total_served = $('#totalServed').val();
    var balance = $('#balance').val();
    var productList = GenerateProductTable();


    if ($('#hdnSalesOrderID').val() != 0) {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateSalesOrder",
            data: "{'id':'" + $('#hdnSalesOrderID').val() + "', 'customer_id':'" + customer_id + "' , 'address':'" + address + "' , 'delivery_to_id':'" + delivery_to_id + "' , 'salesman_id':'" + salesman_id + "' , 'po_no':'" + po_no + "' , 'term_id':'" + term_id + "' , 'ref_no':'" + ref_no + "' , 'ref_no_serial':'" + ref_no_serial + "' , 'created_date':'" + created_date + "' , 'cancel_date':'" + cancel_date + "' , 'notes':'" + notes + "' , 'total_amount':'" + total_amount + "' , 'total_served':'" + total_served + "' , 'balance':'" + balance + "', 'productList':'" + productList + "', 'orderStatus':'" + stats + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadSalesOrderList();
                $("#xSalesOrderList").show();
                $("#xSalesOrderForm").hide();
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertSalesOrder",
            data: "{'customer_id':'" + customer_id + "' , 'address':'" + address + "' , 'delivery_to_id':'" + delivery_to_id + "' , 'salesman_id':'" + salesman_id + "' , 'po_no':'" + po_no + "' , 'term_id':'" + term_id + "' , 'ref_no':'" + ref_no + "' , 'ref_no_serial':'" + ref_no_serial + "' , 'created_date':'" + created_date + "' , 'cancel_date':'" + cancel_date + "' , 'notes':'" + notes + "' , 'total_amount':'" + total_amount + "' , 'total_served':'" + total_served + "' , 'balance':'" + balance + "', 'productList':'" + productList + "', 'orderStatus':'" + stats + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadSalesOrderList();
                $("#xSalesOrderList").show();
                $("#xSalesOrderForm").hide();
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
        var x4 = $(this).find("td .served").val();
        var x5 = $(this).find("td .unit").val();
        var x6 = $(this).find("td .price").val();
        var x7 = $(this).find("td .discount").val();
        var x8 = $(this).find("td .amount").val();

        if (x1 != "") {

            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "," + x7 + "," + x8 + "^";
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

// -------------------------------------------------- Remove Product list Row
function RemoveRow() {
    $('.ActionButton').on('click', function () {
        $(this).closest('tr').remove();
        //$("#salesInvoice_table tbody").append("<tr><td width=\"20\"><input class='product' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='location' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='qty' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td><td width=\"10%\"><input class='served' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='unit' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='price' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='discount' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' onblur='ComputeDiscount(this);' /></td><td width=\"10%\"><input class='amount' style='color: gray; width: 100%; outline: none; border: none; background-color: transparent;' /></td><td width='5%'> <input type='button' name='name' value='X' class='ActionButton' /> </td></tr>");
        ActionComputeSubtotal();
        return false;
    });
}
