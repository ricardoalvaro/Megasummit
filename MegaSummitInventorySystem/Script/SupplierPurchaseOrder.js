﻿/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------
var SupplierID = 0;
var PurchaseOrderID = 0;
var helper = new Helper();


$(document).ready(function () {

    PurchaseOrderID = Number(helper.GetQuerystring()["purchaseOrderID"]);
    if (!$.isNumeric(PurchaseOrderID) || PurchaseOrderID <= 0) {
        PurchaseOrderID = 0;
    }


    //----------------

    $("#hold").click(function () { alert('Not Working'); });

    $("#btn-save").removeClass("disabled").click(function () { SavePurchaseOrder(this); });

    GenerateStaticPurchaseList();
    GenerateDynamicAutoComplete();

    $("#customer").change(function (event) {
        ClearCustomerData(this);
    });

    $(':input').on('input', function () { // do not allow single quote and double quote 
        this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
    });

    Fill();
    SelectPurchaseOrder();
});


function CloseStatus() {
    if (PurchaseOrderID > 0) {

        var pageUrl = '/Webservice/svr_PurchasedOrder.asmx';

        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdatePurchasedOrderStatus",
            data: "{'id' :'" + PurchaseOrderID + "'}",
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

function SelectPurchaseOrder() {
    if (PurchaseOrderID > 0) {


        var data = SinglePurchaseOrderData;

        for (var i = 0; i < data.length; i++) {

            if (data[i]["ID"] == PurchaseOrderID) {

                SupplierID = data[i]["SupplierID"];
                $("#supplier").val(data[i]["SupplierName"]).trigger('change');
                $('#address').val(data[i]["Address"]);
                $('#deliver_to').val(data[i]["ForwarderToID"]);
                $('#salesman').val(data[i]["SalesmanID"]);
                $('#po_number').val(data[i]["PONo"]);
                $('#terms').val(data[i]["TermID"]);

                //$('#reference_no').text().attr('selected',data[i]["RefNo"];

                $("#reference_no").val(data[i]["RefNo"]);//.filter(function () { return $(this).text() == data[i]["RefNo"]; }).prop('selected', true);
                $('#reference_number').val(data[i]["ID"]);

                $('#date').val(FormatDate(data[i]["CreatedDate"]));
                $('#cancel').val(FormatDate(data[i]["CancelDate"]));
                $('#notes').val(data[i]["Notes"]);


                $('#spnTotal').html(data[i]["TotalAmount"]);
                $('#spnServed').html(data[i]["TotalServed"]);
                $('#spnBalance').html(Number(data[i]["TotalAmount"]) - Number(data[i]["TotalServed"]));


                var detail = SinglePurchaseOrderDetailsData;

                for (var d = 0; d < detail.length; d++) {

                    $('#tblPurchaseOrder tbody tr').each(function (i) {

                        var x2 = $(this).find("td .product").val();
                        if (x2 == "") {

                            $(this).find("td .order_detail_id").val(detail[d]["ID"]);
                            $(this).find("td .product").val(detail[d]["ProductName"]).attr("disabled", "disabled");
                            $(this).find("td .product_id").val(detail[d]["ProductID"]);
                            $(this).find("td .location").val(detail[d]["LocationName"]).attr("disabled", "disabled");
                            $(this).find("td .location_id").val(detail[d]["LocationID"]);
                            $(this).find("td .quantity").val(detail[d]["Quantity"]);//.trigger('change');//.attr("disabled", "disabled");
                            $(this).find("td .bonus").val(detail[d]["Bonus"]);
                            $(this).find("td .served").val(detail[d]["Served"]);//.trigger('change');//.attr("disabled", "disabled");
                            $(this).find("td .unit").val(detail[d]["UnitName"]).attr("disabled", "disabled");
                            $(this).find("td .price").val(detail[d]["UnitPrice"]);//.attr("disabled", "disabled");
                            $(this).find("td .discount").val(detail[d]["Discount"]);//.attr("disabled", "disabled");
                            $(this).find("td .amount").val(detail[d]["Amount"]);//.trigger('change');//.attr("disabled", "disabled");
                            //$(this).find("td .amount").trigger('change');

                            
                            return false;
                        }
                    });


                }
            }
        }

    }
}

function SavePurchaseOrder(me) {
    if ($(me).hasClass("disabled") == false) {
        var pageUrl = '/Webservice/svr_PurchasedOrder.asmx';

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


        var total_amt = $('#spnTotal').html();
        var total_served = $('#spnServed').html();
        var productList = GetPurchaseOrderDetails();

        //InsertPurchasedOrder( 
        
        if (PurchaseOrderID == 0) {//insert 

            var data_transfer = "{'purchasedOrderStatus':'{0}', 'supplierID':'{1}', 'address':'{2}', 'deliveryToID':'{3}', 'salesman':'{4}', 'poNo':'{5}', 'termID':'{6}', 'refNo':'{7}', 'refNoSerial':'{8}', 'createdDate':'{9}', 'cancelDate':'{10}', 'notes':'{11}', 'totalAmount':'{12}', 'totalServed':'{13}',  'productList':'{14}'}"
            .f(order_status,supplier_id,address,forwarder_to_id,
            salesman_id, po_no, term_id, ref_no,
            ref_no_serial,created_date,cancel_date,notes,
            total_amt,total_served,productList );

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertPurchasedOrder",
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
        else { // update

            //UpdatePurchasedOrder(long id, string purchasedOrderStatus, long supplierID, string address, long deliveryToID, long salesman, string poNo, long termID, string refNo, string refNoSerial, DateTime createdDate, string cancelDate, string notes, decimal totalAmount, decimal totalServed, string productList)

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

function GetPurchaseOrderDetails() {
    var list = "";
    $('#tblPurchaseOrder tbody tr').each(function (i) {

        var order_details_id = $(this).find("td .order_detail_id").val();
        var product = $(this).find("td .product").val();
        var product_id = $(this).find("td .product_id").val();
        var location = $(this).find("td .location").val();
        var location_id = $(this).find("td .location_id").val();
        var quantity = ($(this).find("td .quantity").val() == '') ? '0' : $(this).find("td .quantity").val();
        var bonus = ($(this).find("td .bonus").val() == '') ? '0' : $(this).find("td .bonus").val();
        var served = ($(this).find("td .served").val() == '') ? '0' : $(this).find("td .served").val();
        var unit = $(this).find("td .unit").val();
        var price = $(this).find("td .price").val();
        var discount = ($(this).find("td .discount").val() == '') ? '0' : $(this).find("td .discount").val();
        var amount = $(this).find("td .amount").val();


        if (product_id != "") {

            list += order_details_id + "," + product + "," + product_id + "," + location + "," + location_id + "," + quantity + "," + bonus + "," + served + "," + unit + "," + price + "," + discount + "," + amount + "^";
        }
    });

    return list;
}

function GenerateDynamicAutoComplete() {
    $("#tblPurchaseOrder tbody tr").find('td').each(function () {

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

        $(this).find(".bonus").change(function () { ComputeComponentAmount(this); });

        $(this).find(".quantity").change(function () { ComputeComponentAmount(this); });

        $(this).find(".unit").change(function () { ComputeComponentAmount(this); });

        $(this).find(".discount").change(function () { ComputeComponentAmount(this); });

        $(this).find(".price").change(function () { ComputeComponentAmount(this); });

        $(this).find(".served").change(function () { ComputeComponentAmount(this); });
    });
}

function GenerateStaticPurchaseList() {


    var ret = "";
    for (var i = 0; i < 20; i++) {
        $("#tblPurchaseOrder tbody").append("<tr><td width='20%'><input type='hidden' class='order_detail_id' value='0' /><input type='text' class='product' /><input type='hidden' class='product_id' /></td><td width='10%'><input type='text' class='location' /><input type='hidden' class='location_id' /></td><td width='10%'><input type='text' class='quantity' /></td><td width='10%'><input type='text' class='bonus' /></td><td width='10%'><input type='text' class='served' /></td><td width='10%'><input type='text' class='unit' /></td><td width='10%'><input type='text' class='price' /></td><td width='10%'><input type='text' class='discount' /></td><td width='10%'><input type='text' class='amount' /></td></tr>");
    }
}

function GetProductDetails(product_id, me) {
    var data = ProductDetailData;

    for (var i = 0; i < data.length; i++) {
        if (product_id == data[i]["ID"]) {

            $(me).closest("tr").find(".price").val(data[i]["Cost"]);
            $(me).closest("tr").find(".product_id").val(product_id);
            $(me).closest("tr").find(".unit").val(data[i]["UnitName"]);
            $(me).closest("tr").find(".location").val(data[i]["LocationName"]).trigger('change');
            $(me).closest("tr").find(".location_id").val(data[i]["LocationID"]);

        }
    }
}

function ClearCustomerData(me) {
    if ($(me).val() == '') {
        CustomerID = 0;
        $('#address').val('');
    }
}

function ComputeComponentAmount(me) {
    var qty = ($(me).closest("tr").find(".quantity").val());
    var price = ($(me).closest("tr").find(".price").val());
    var dis = ($(me).closest("tr").find(".discount").val())


    qty = (qty == '') ? '0' : qty;
    price = (price == '') ? '0' : price;
    dis = (dis == '') ? '0' : dis;

    //alert(dis);
    $(me).closest("tr").find(".amount").val(ComputeAmount(Number(qty) * Number(price), dis));

    var total = 0;
    var serve = 0;
    $("#tblPurchaseOrder tbody tr").find('td').each(function () {
        if (!isNaN($(this).find(".amount").val())) {
            var component_amount = $(this).find(".amount").val();

            total = Number(total) + Number(component_amount);
            //------
            dis = ($(this).closest("tr").find(".discount").val())
            dis = (dis == '') ? '0' : dis;

            price = ($(this).closest("tr").find(".price").val())
            price = (price == '') ? '0' : price;

            //-----
            var _serve = ($(this).closest("tr").find(".served").val())
            _serve = (_serve == '') ? '0' : _serve;

            serve += Number(ComputeAmount(Number(_serve) * Number(price), dis))
        }
    });


    $("#spnTotal").html(total);
    $("#spnServed").html(serve);
    $("#spnBalance").html(Number(total) - Number(serve));
}

function ComputeAmount(total, dis) {

    //alert(dis);
    //if (typeof dis != 'undefined') {
    //    dis = '0';
    //}
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

//------------------------------------

function Fill() {
    FillSupplierAutoComplete();
    FillForwarder();
    FillSalesman();
    FillTerm();
    FillDate();
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