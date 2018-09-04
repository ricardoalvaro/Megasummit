/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------
var SupplierID = 0;
var PurchaseOrderID = 0;
var PurchaseInvoiceID = 0;
var helper = new Helper();


$(document).ready(function () {

    PurchaseInvoiceID = Number(helper.GetQuerystring()["purchaseInvoiceID"]);
    if (!$.isNumeric(PurchaseInvoiceID) || PurchaseInvoiceID <= 0) {
        PurchaseInvoiceID = 0;
    }


    //----------------

    //$("#hold").click(function () { alert('Not Working'); });

    $("#btn-save").removeClass("disabled").click(function ()
    {
        SavePurchaseInvoice(this);
    });

    GenerateStaticPurchaseList();
    GenerateDynamicAutoComplete();

    $("#customer").change(function (event) {
        ClearSupplierData(this);
    });

    $("#order_number").change(function () {
        FillPurchaseOrderTable($(this).val());
    });


    $("#liPurchaseOrder").click(function () {
        $("#liPurchaseOrder").addClass("active"); if ($(this).hasClass("active") == true) {
            $("#liPurchaseInvoice").removeClass("active");
            $("#purchase_order_holder").show();
            $("#purchase_invoice_holder").hide();
        }

    });

    $("#liPurchaseInvoice").click(function () {

        $("#liPurchaseInvoice").addClass("active");
        if ($(this).hasClass("active") == true) {
            $("#liPurchaseOrder").removeClass("active");
            $("#purchase_order_holder").hide();
            $("#purchase_invoice_holder").show();


        }

    });

    $(':input').on('input', function () { // do not allow single quote and double quote 
        this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
    });

    Fill();
    SelectPurchaseInvoice();
});


function SelectPurchaseInvoice()
{
    if (PurchaseInvoiceID != 0)
    {
        var data = SinglePurchaseInvoiceData;

        for (var i = 0; i < data.length; i++) {

            if (data[i]["ID"] == PurchaseInvoiceID) {

                SupplierID = data[i]["SupplierID"];
                $("#supplier").val(data[i]["SupplierName"]);
                $('#address').val(data[i]["Address"]);
                $('#deliver_to').val(data[i]["ForwarderToID"]);
                $('#salesman').val(data[i]["SalesmanID"]);
                $('#po_number').val(data[i]["PONo"]);
                $('#terms').val(data[i]["TermID"]);

                //$('#reference_no').text().attr('selected',data[i]["RefNo"];

                $("#reference_no").val(data[i]["RefNo"]);//.filter(function () { return $(this).text() == data[i]["RefNo"]; }).prop('selected', true);
                $('#reference_number').val(data[i]["RefNoSerial"]);

                $('#date').val(FormatDate(data[i]["CreatedDate"]));
                $('#cancel').val(FormatDate(data[i]["CancelDate"]));
                $('#notes').val(data[i]["Notes"]);


                var sub_total = Number(data[i]["SubTotal"]);
                var payment = Number(data[i]["Payment"]);
                var purchase_return = Number(data[i]["PurchaseReturn"]);

                $('#spnSubTotal').html(sub_total.toFixed(2));
                $('#spnTotalPayment').html(payment.toFixed(2)); // voucher
                $('#spnMemo').html(purchase_return.toFixed(2)); //return payment
                $('#spnAmountDue').html((sub_total - (payment + purchase_return)).toFixed(2)); //subtotal - (payment + memo )
                

                var detail = SinglePurchaseInvoiceDetailsData;

                for (var d = 0; d < detail.length; d++) {

                    $('#tblPurchaseInvoice tbody tr').each(function (i) {

                        var x2 = $(this).find("td .product").val();
                        if (x2 == "") {

                            $(this).find("td .order_detail_id").val(detail[d]["ID"]);
                            $(this).find("td .product").val(detail[d]["ProductName"]).attr("disabled", "disabled");
                            $(this).find("td .product_id").val(detail[d]["ProductID"]);
                            $(this).find("td .location").val(detail[d]["LocationName"]).attr("disabled", "disabled");
                            $(this).find("td .location_id").val(detail[d]["LocationID"]);
                            $(this).find("td .quantity").val(detail[d]["Quantity"]);//.attr("disabled", "disabled");
                            $(this).find("td .served").val(detail[d]["Served"]);//.attr("disabled", "disabled");
                            $(this).find("td .unit").val(detail[d]["UnitName"]).attr("disabled", "disabled");
                            $(this).find("td .price").val(detail[d]["UnitPrice"]);//.attr("disabled", "disabled");
                            $(this).find("td .discount").val(detail[d]["Discount"]);//.attr("disabled", "disabled");
                            $(this).find("td .amount").val(detail[d]["Amount"]);//.attr("disabled", "disabled");
                            return false;
                        }
                    });


                }
            }
        }
    }
  
}

function SavePurchaseInvoice(me)
{
    if ($(me).hasClass("disabled") == false) {
        var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

        var order_status = "Posted";
        var supplier_id = SupplierID;
        var address = $('#address').val();
        var forwarder_to_id = $('#deliver_to').val();
        var salesman_id = $('#salesman').val();
        var po_no = $('#po_number').val();
        var term_id = $('#terms').val();
        var ref_no = $('#reference_letter').val();
        var ref_no_serial = $('#reference_number').val();
        var created_date = $('#date').val();
        var cancel_date = $('#cancel_date').val();
        var notes = $('#notes').val();


        var total_amt = $('#spnSubTotal').html();
        //var total_served = $('#spnServed').html();
        var productList = GetPurchaseInvoiceDetails();
        //InsertPurchasedInvoice( 
        //supplierID, address, deliveryToID, salesman, 
        //poNo, termID, refNo, refNoSerial,
        //createdDate, cancelDate, subTotal, notes,  
        //productList)
        if (PurchaseOrderID == 0) {//insert 

            var data_transfer = "{ 'supplierID':'{0}', 'address':'{1}', 'deliveryToID':'{2}', 'salesman':'{3}', 'poNo':'{4}', 'termID':'{5}', 'refNo':'{6}', 'refNoSerial':'{7}', 'createdDate':'{8}', 'cancelDate':'{9}', 'subTotal':'{10}', 'notes':'{11}',  'productList':'{12}'}"
            .f(supplier_id, address, forwarder_to_id, salesman_id,
            po_no, term_id, ref_no, ref_no_serial,
            created_date, cancel_date, total_amt,
            notes, productList);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertPurchasedInvoice",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    window.location = "aspnetPurchaseInvoice.aspx";
                    //alert(response.d);

                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }
        else { // update

            var data_transfer = "{'id':'" + PurchaseOrderID + "' , 'purchasedOrderStatus': '{0}', 'supplierID': '{1}', 'address': '{2}', 'deliveryToID': '{3}', 'salesman': '{4}', 'poNo': '{5}', 'termID': '{6}', 'refNo': '{7}', 'refNoSerial': '{8}', 'createdDate': '{9}', 'cancelDate': '{10}', 'notes': '{11}', 'totalAmount': '{12}', 'totalServed': '{13}', 'productList': '{14}' }"
             .f(order_status, supplier_id, address, forwarder_to_id,
            salesman_id, po_no, term_id, ref_no,
            ref_no_serial, created_date, cancel_date, notes,
            total_amt, total_served, productList);

            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdatePurchasedOrder",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    window.location = "aspnetPurchaseOrder.aspx";
                    //alert(response.d);

                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }
    }
}

function GetPurchaseInvoiceDetails() {
    var list = "";
    $('#tblPurchaseInvoice tbody tr').each(function (i) {

        var purchase_order_detail_id = $(this).find("td .purchase_order_detail_id").val();
        var product = $(this).find("td .product").val();
        var product_id = $(this).find("td .product_id").val();
        var location = $(this).find("td .location").val();
        var location_id = $(this).find("td .location_id").val();
        var quantity = ($(this).find("td .quantity").val() == '') ? '0' : $(this).find("td .quantity").val();
        var bonus = ($(this).find("td .bonus").val() == '') ? '0' : $(this).find("td .bonus").val();
        //var served = ($(this).find("td .served").val() == '') ? '0' : $(this).find("td .served").val();
        var unit = $(this).find("td .unit").val();
        var price = $(this).find("td .price").val();
        var discount = ($(this).find("td .discount").val() == '') ? '0' : $(this).find("td .discount").val();
        var amount = $(this).find("td .amount").val();


        if (product_id != "") {

            list += purchase_order_detail_id + "," + product + "," + product_id + "," + location + "," + location_id + "," + quantity + "," + bonus  + "," + unit + "," + price + "," + discount + "," + amount + "^";
        }
    });

    return list;
}


function ComputeComponentAmount(me) {
    var qty = ($(me).closest("tr").find(".quantity").val());
    var price = ($(me).closest("tr").find(".price").val());
    var dis = ($(me).closest("tr").find(".discount").val())


    qty = (qty == '') ? '0' : qty;
    price = (price == '') ? '0' : price;
    dis = (dis == '') ? '0' : dis;


    $(me).closest("tr").find(".amount").val(ComputeAmount(Number(qty) * Number(price), dis));

    var total = 0;
    $("#tblPurchaseInvoice tbody tr").find('td').each(function () {
        if (!isNaN($(this).find(".amount").val())) {
            var component_amount = $(this).find(".amount").val();

            total = Number(total) + Number(component_amount);
            //console.log(total);
        }
    });



    //$("#spnInvoiceAmount").html((total).toFixed(2));
    //$("#spnSubTotal").val((total).toFixed(2)).trigger('change');
    //var total_amount = 0;

    $("#spnAmountDue").html(total.toFixed(2));
    $("#spnSubTotal").html(total.toFixed(2));
    $("#spnPurchaseInvoiceAmount").html(total.toFixed(2));
    
    

}

function ComputeAmount(total, dis) {
    var textArr1 = new Array();
    var TotalPlus = 0;
    var TotalMinus = 0;
    textArr1 = dis.split("+");
    var totalAmount = Number(total);

    var NewTotal = 0;
    for (var i = 0; i < textArr1.length; i++) {
        var ss = textArr1[i].toString();
        if (ss.indexOf("-") != -1) {
            var textArr2 = new Array();
            textArr2 = textArr1[i].split("-");
            for (var z = 0; z < textArr2.length; z++) {
                if (z == 0) {

                    if (textArr2[z] != '') {

                        var disPer = Number(textArr2[z]) / 100;
                        var discount = Number(totalAmount) * Number(disPer);
                        totalAmount = totalAmount + discount;
                    }
                }
                else {
                    if (textArr2[z] != '') {

                        var disPer = Number(textArr2[z]) / 100;
                        var discount = Number(totalAmount) * Number(disPer);
                        totalAmount = totalAmount - discount;

                    }
                }
            }
        }
        else {
            if (textArr1[i] != '') {
                var disPer = Number(textArr1[i]) / 100;
                var discount = Number(totalAmount) * Number(disPer);
                totalAmount = totalAmount + discount;
            }
        }
    }

    return totalAmount.toFixed(2);

}

function GenerateDynamicAutoComplete() {
    $("#tblPurchaseInvoice tbody tr").find('td').each(function () {

        $(this).find(".product").autocomplete({
            source: ProductAutoCompleteData, minLength: 0, minChars: 0, max: 12, autoFill: true, matchContains: false,
            select: function (a, b) {
                GetProductDetails(b.item.id, this);
            }
        }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); })
          .change(function () { $(this).closest("tr").find(":input").val(''); });


        $(this).find(".location").autocomplete({
            source: LocationAutoCompleteData, minLength: 0, minChars: 0, max: 12, autoFill: true, matchContains: false,
            select: function (a, b) {
                $(this).closest("tr").find(".location_id").val(b.item.id);
            }
        }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });


        $(this).find(".quantity").change(function () { ComputeComponentAmount(this); });

        $(this).find(".unit").change(function () { ComputeComponentAmount(this); });

        $(this).find(".discount").change(function () { ComputeComponentAmount(this); });
    });
}

function GenerateStaticPurchaseList() {
    var ret = "";
    for (var i = 0; i < 20; i++) {
        $("#tblPurchaseInvoice tbody").append("<tr><td width='15%'><input type='hidden' class='purchase_order_detail_id' /><input type='text' class='product' /><input type='hidden' class='product_id' /></td><td width='15%'><input type='text' class='location' /><input type='hidden' class='location_id' /></td><td width='10%'><input type='text' class='quantity' /></td><td width='10%'><input type='text' class='bonus' /></td><td width='10%'><input type='text' class='unit' /></td><td width='10%'><input type='text' class='price' /></td><td width='10%'><input type='text' class='discount' /></td><td width='10%'><input type='text' class='amount' /></td></tr>");
    }
}

function GetProductDetails(product_id, me) {
    var data = ProductDetailData;

    for (var i = 0; i < data.length; i++) {
        if (product_id == data[i]["ID"]) {

            $(me).closest("tr").find(".price").val(data[i]["Cost"]);
            $(me).closest("tr").find(".product_id").val(product_id);
            $(me).closest("tr").find(".unit").val(data[i]["UnitName"]);

            $(me).closest("tr").find(".location").val(data[i]["LocationName"]);
            $(me).closest("tr").find(".location_id").val(data[i]["LocationID"]);

        }
    }
}

function FillPurchaseOrderTable(purchase_id) {
    if (purchase_id != 0) {
        var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

        $.ajax({
            type: "POST",
            url: pageUrl + "/PurchasedOrderDetailsInvoiceSelect",
            data: "{'id':'" + $('#order_number').val() + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                $('#tblPurchaseOrder tbody').empty();

                var data = eval(response.d);
                var obj = "";
                for (var i = 0; i < data.length; i++) {
                   
                    $('#tblPurchaseOrder tbody:last').append("<tr onclick=\"FillPurchaseInvoiceDetail('" + data[i]["ID"] + "')\"><td width='15%'>" + data[i]['ProductName'] + "</td><td width='15%'>" + data[i]['LocationName'] + "</td><td width='10%'>" + data[i]['Quantity'] + "</td> <td width='10%'>" + data[i]['Bonus'] + "</td><td width='10%'>" + data[i]['UnitName'] + "</td><td width='10%'>" + data[i]['UnitPrice'] + "</td><td width='10%'>" + data[i]['Discount'] + "</td><td width='10%'>" + ComputeDiscountedAmount(Number(data[i]['Quantity']) * Number(data[i]['UnitPrice']), data[i]['Discount']) + "</td></tr>");

                }

                defaultList();

            },
            error: function (response) {
                alert(response.status);
            }
        });
    }

}

function FillPurchaseInvoiceDetail(ID) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedOrderDetailsInvoiceSelectByID",
        data: "{'id':'" + ID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var y = 0; y < data.length; y++) {
                $('#tblPurchaseInvoice tbody tr').each(function (i) {

                    //var x1 = $(this).find("td .packing").val();
                    var x2 = $(this).find("td .product").val();
                    //var x3 = $(this).find("td .location").val();
                    //var x4 = $(this).find("td .qty_product").val();
                    //var x5 = $(this).find("td .unit").val();
                    //var x6 = $(this).find("td .price").val();
                    //var x7 = $(this).find("td .discount").val();
                    //var x8 = $(this).find("td .total_amount").val();
                    if (x2 == "") {

                        $(this).find("td .purchase_order_detail_id").val(data[y]["ID"]);
                        //$(this).find("td .packing").val(data[y]["PackingName"]);
                        //$(this).find("td .packing_id").val(data[y]["PackingID"]);
                        $(this).find("td .product").val(data[y]["ProductName"]);
                        $(this).find("td .product_id").val(data[y]["ProductID"]);
                        $(this).find("td .location").val(data[y]["LocationName"]);
                        $(this).find("td .location_id").val(data[y]["LocationID"]);
                        $(this).find("td .unit").val(data[y]["UnitName"]);
                        $(this).find("td .price").val(data[y]["UnitPrice"]);
                        $(this).find("td .discount").val(data[y]["Discount"]);
                        $(this).find("td .quantity").val(data[y]["Quantity"]).trigger('change');
                        $(this).find("td .bonus").val(data[y]["Bonus"]);//.trigger('change');
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

function ComputeDiscountedAmount(total, dis) {
    var textArr1 = new Array();
    var TotalPlus = 0;
    var TotalMinus = 0;
    textArr1 = dis.split("+");
    var totalAmount = Number(total);

    var NewTotal = 0;
    for (var i = 0; i < textArr1.length; i++) {
        var ss = textArr1[i].toString();
        if (ss.indexOf("-") != -1) {
            var textArr2 = new Array();
            textArr2 = textArr1[i].split("-");
            for (var z = 0; z < textArr2.length; z++) {
                if (z == 0) {

                    if (textArr2[z] != '') {

                        var disPer = Number(textArr2[z]) / 100;
                        var discount = Number(totalAmount) * Number(disPer);
                        totalAmount = totalAmount + discount;
                    }
                }
                else {
                    if (textArr2[z] != '') {

                        var disPer = Number(textArr2[z]) / 100;
                        var discount = Number(totalAmount) * Number(disPer);
                        totalAmount = totalAmount - discount;

                    }
                }
            }
        }
        else {
            if (textArr1[i] != '') {
                var disPer = Number(textArr1[i]) / 100;
                var discount = Number(totalAmount) * Number(disPer);
                totalAmount = totalAmount + discount;
            }
        }
    }

    return totalAmount.toFixed(2);

}

function ClearSupplierData(me) {
    if ($(me).text() == '') {
        SupplierID = 0;
        $('#address').val('');
    }
}

function defaultList()
{
    for (var i = 0; i < 30; i++) {
        $("#tblPurchaseOrder tbody").append('<tr><td></td></tr>');
    }
}

function Fill() {
    FillSupplierAutoComplete();
    FillForwarder();
    FillSalesman();
    FillTerm();
    FillDate();
    defaultList();
}

function FillSupplierAutoComplete() {
    $("#supplier").autocomplete({
        source: SupplierData, minLength: 0, minChars: 0, max: 12, autoFill: true,
        matchContains: false, select: function (a, b) {
            //customer information
            FillSupplierDetails(b.item.id);
            SupplierID = b.item.id;
        }
    }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });


}

function FillSupplierDetails(supplier_id) {

    var pageUrl = '/Webservice/svr_Supplier.asmx';
    $.ajax({
        type: "POST", url: pageUrl + "/SupplierSelect", data: "{'id':'" + supplier_id + "' }", contentType: "application/json; charset=utf-8",
        dataType: "json", crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {

                //$('#salesman').val(data[i]["Salesman"]);
                //$('#deliver_to').val(data[i]["ShipToID"]);
                //$('#terms').val(data[i]["TermID"]);

                //------------------------------------------
                $('#address').val(data[i]["Address"]);
                FillPurchaseOrder(supplier_id);
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function FillPurchaseOrder(supplier_id)
{

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedOrderRefSelect",
        data: "{ 'id':'" + supplier_id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#order_number').empty();
            $('#order_number').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#order_number').append("<option value='" + data[i]["ID"] + "'>" + data[i]["RefNo"] + data[i]["ID"] + "</option>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function FillForwarder() {

    $('#deliver_to').empty(); //$('#deliver_to').append("<option value='" + "0" + "'>" + "</option>");
    var data = ForwarderData;
    for (var i = 0; i < data.length; i++) { $('#deliver_to').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ForwardedName"] + "</option>"); }

}

function FillSalesman() {
    $('#salesman').empty(); //$('#salesman').append("<option value='" + "0" + "'>" + "</option>");
    var data = SalesmanData;
    for (var i = 0; i < data.length; i++) { $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>"); }
}

function FillTerm() {
    $('#terms').empty();// $('#terms').append("<option value='" + "0" + "'>" + "</option>");
    var data = TermData;
    for (var i = 0; i < data.length; i++) { $('#terms').append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>"); }
}

//function FillReference() {
//    $('#reference_no').empty(); //$('#remarks').append("<option value='" + "0" + "'>" + "</option>");
//    var data = RefNoData;
//    for (var i = 0; i < data.length; i++) { $('#reference_no').append("<option value='" + data[i]["ID"] + "'>" + data[i]["PrefixInitial"] + "</option>"); }

//}

function FillDate() {
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);
    // $('#cancel_date').val("0" + month + "/" + day + "/" + year);

}
