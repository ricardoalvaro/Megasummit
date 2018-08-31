/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------
var SupplierID = 0;
var PurchaseReturnID = 0;
var helper = new Helper();


$(document).ready(function () {

    PurchaseReturnID = Number(helper.GetQuerystring()["purchaseReturnID"]);
    if (!$.isNumeric(PurchaseReturnID) || PurchaseReturnID <= 0) {
        PurchaseReturnID = 0;
    }

    $("#hold").click(function () { alert('Not Working'); });

    $("#btn-save").removeClass("disabled").click(function () { SavePurchaseReturn(this); });
    $('#btn-new').click(function () {
        if ($(this).hasClass('disabled') == false) {
            window.location = 'aspnetSalesReturnInformation.aspx';
        }
    });


    GenerateStaticInvoiceList();
    GenerateDynamicAutoComplete();

    $("#supplier").change(function (event) {
        ClearSupplierData(this);
    });

    $('#applyToInvoice').click(function () {

        if (PurchaseReturnID <= 0) {
            FillInvoiceList(SupplierID);
        }

        $('#tblPurchaseReturn').height(125.1);
        $('#tblReference').show();


    });

    $(':input').on('input', function () { // do not allow single quote and double quote 
        this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
    });

    Fill();

    if (PurchaseReturnID > 0) {
        SelectPurchaseReturn(PurchaseReturnID);
    }

});



function SelectPurchaseReturn(purchase_return_id) {
    $('#btn-new').removeClass('disabled');
    $('#btn-save').addClass('disabled');

    var pageUrl = '/Webservice/svr_PurchasedReturn.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchaseReturnSelect",
        data: "{ 'purchase_return_id':'" + purchase_return_id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);

            for (var i = 0; i < data.length; i++) {


                //---------
                SupplierID = data[i]['Supplier'];
                $("#supplier").val(data[i]["SupplierName"]);
                $('#address').val(data[i]["Address"]);
                $('#deliver_to').val(data[i]["ForwarderToID"]);
                $('#salesman').val(data[i]["SalesmanID"]);
                $('#po_number').val(data[i]["PONo"]);
                $('#terms').val(data[i]["TermID"]);
                $("#reference_no").val(data[i]["RefNo"]);
                $('#reference_number').val(data[i]["RefSerial"]);
                $('#date').val(FormatDate(data[i]["Date"]));
                $('#notes').val(data[i]["Notes"]);
                $('#spnTotal').html(data[i]["TotalAmount"]);


            }


            var actualarray = $.parseJSON(response.d);
            //$('#tblSalesReturn tbody tr').empty();
            $.each(actualarray, function (i, v) {

                var _pro = v.PurchaseReturnDetails;
                //alert(_pro.length);
                for (var p = 0; p < _pro.length; p++) {

                    //alert(_pro[p]["ProductName"]);
                    $('#tblPurchaseReturn tbody tr').each(function (i) {

                        var x2 = $(this).find("td .product").val();
                        if (x2 == "") {

                            $(this).find("td .order_detail_id").val(_pro[p]["ID"]);
                            $(this).find("td .product").val(_pro[p]["ProductName"]).attr("disabled", "disabled");
                            $(this).find("td .product_id").val(_pro[p]["ProductID"]);
                            $(this).find("td .location").val(_pro[p]["LocationName"]).attr("disabled", "disabled");
                            $(this).find("td .location_id").val(_pro[p]["LocationID"]);
                            $(this).find("td .quantity").val(_pro[p]["Quantity"]).attr("disabled", "disabled");
                            $(this).find("td .unit").val(_pro[p]["Unit"]).attr("disabled", "disabled");
                            $(this).find("td .price").val(_pro[p]["UnitPrice"]).attr("disabled", "disabled");
                            $(this).find("td .discount").val(_pro[p]["Discount"]).attr("disabled", "disabled");
                            $(this).find("td .amount").val(_pro[p]["Amount"]).attr("disabled", "disabled");
                            return false;
                        }
                    });

                }


                var _app = v.ApplyLists;
                $('#tblPurchaseInvoice tbody').empty();
                for (var i = 0; i < _app.length; i++) {

                    $("#tblPurchaseInvoice tbody").append(ListInvoiceFormatEdit(_app[i]['PurchaseID'], _app[i]['RefNo'], FormatDate(_app[i]['Date']), _app[i]['Description'], _app[i]['Salesman'], _app[i]['Balance'], _app[i]['AppliedAmount']));

                }

                for (var i = 0; i < 20; i++) {
                    $("#tblPurchaseInvoice tbody").append("<tr><td width='15%'></td><td width='15%'></td><td width='20%'></td><td width='20%'></td><td width='15%'><span class='spn_balance'></span></td><td width='15%'> </td></tr>");
                }

                ComputeApplytoInvoice();


            });


        },
        error: function (response) {
            alert(response.status);
        }
    });

}


function ListInvoiceFormatEdit(invoice_id, ref_no, date, description, salesman, total, payment) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='15%'>" + date + "</td><td width='20%'>" + description + "</td><td width='20%'>" + salesman + "</td><td width='15%'><span class='spn_balance'>" + total + "</span></td><td width='15%'><input type='text' class='apply' value='" + payment + "' disabled/><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
}



function SavePurchaseReturn(me) {
    if ($(me).hasClass("disabled") == false) {
        var pageUrl = '/Webservice/svr_PurchasedReturn.asmx';
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
        var notes = $('#notes').val();
        var total_amt = $('#spnTotal').html();
        var total_apply = $('#spnApplyToInvoice').html();
        var productList = GetSalesOrderDetails();
        var InvoiceList = GetApplyToInvoice();
        var balance = '0';

        //customer_id, //address, //delivery_to_id, //salesman_id,
        //po_no, //term_id, //ref_no, //ref_no_serial,//created_date, 
        //notes, //total_amount, //apply_to_invoice_amount,//balance, //productList,
        //salesInvoice

        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertPurchasedReturn",
            data:
                "{'supplier_id':'{0}' , 'address':'{1}' , 'delivery_to_id':'{2}' ,'salesman_id':'{3}' ,'po_no':'{4}' ,'term_id':'{5}' , 'ref_no':'{6}' , 'ref_no_serial':'{7}' ,'created_date':'{8}', 'notes':'{9}' , 'total_amount':'{10}','apply_to_invoice_amount':'{11}','balance':'{12}','productList':'{13}', 'salesInvoice':'{14}' }"
                .f(supplier_id, address, forwarder_to_id, salesman_id,
                po_no, term_id, ref_no, ref_no_serial, created_date,
                notes, total_amt, total_apply, balance, productList, InvoiceList),


            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                window.location = 'aspnetPurchaseReturn.aspx';
            },
            error: function (response) {
                alert(response.status);
            }
        });

    }
}


function GetApplyToInvoice() {
    var ret = '';
    $("#tblPurchaseInvoice tbody tr").find('td').each(function () {

        if (!isNaN($(this).find(".apply").val())) {
            if (Number($(this).find(".apply").val()) > 0) {
                ret += $(this).closest('tr').find(".invoice_id").val() + '^' + $(this).find(".apply").val() + '|';
            }
        }
    });

    return ret;
}

function GetSalesOrderDetails() {
    var list = "";
    $('#tblPurchaseReturn tbody tr').each(function (i) {

        var order_details_id = $(this).find("td .order_detail_id").val();
        var product = $(this).find("td .product").val();
        var product_id = $(this).find("td .product_id").val();
        var location = $(this).find("td .location").val();
        var location_id = $(this).find("td .location_id").val();
        var quantity = $(this).find("td .quantity").val();
        var unit = $(this).find("td .unit").val();
        var price = $(this).find("td .price").val();
        var discount = ($(this).find("td .discount").val() == '') ? '0' : $(this).find("td .discount").val();
        var amount = $(this).find("td .amount").val();


        if (product_id != "") {

            list += order_details_id + "^" + product + "^" + product_id + "^" + location + "^" + location_id + "^" + quantity + "^" + unit + "^" + price + "^" + discount + "^" + amount + "|";
        }
    });

    return list;
}

function GenerateStaticInvoiceList() {
  
    for (var i = 0; i < 20; i++) {
        $("#tblPurchaseReturn tbody").append("<tr><td width='20%'><input type='text' class='product' /><input type='hidden' class='product_id' /></td><td width='10%'><input type='text' class='location' /><input type='hidden' class='location_id' /></td><td width='10%'><input type='text' class='quantity' /></td><td width='10%'><input type='text' class='unit' /></td><td width='10%'><input type='text' class='price' /></td><td width='10%'><input type='text' class='discount' /></td><td width='10%'><input type='text' class='amount' /></td></tr>");
       // alert('x');
    }
}

function GenerateDynamicAutoComplete() {
    $("#tblPurchaseReturn tbody tr").find('td').each(function () {

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

        $(this).find(".price").change(function () { ComputeComponentAmount(this); });

        $(this).find(".discount").change(function () { ComputeComponentAmount(this); });

        //$(this).find(".served").change(function () { ComputeComponentAmount(this); });
    });
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
    $("#tblPurchaseReturn tbody tr").find('td').each(function () {
        if (!isNaN($(this).find(".amount").val())) {
            var component_amount = $(this).find(".amount").val();

            total = Number(total) + Number(component_amount);
            //------
            //dis = ($(this).closest("tr").find(".discount").val())
            //dis = (dis == '') ? '0' : dis;

            //price = ($(this).closest("tr").find(".price").val())
            //price = (price == '') ? '0' : price;

            //-----
            //var _serve = ($(this).closest("tr").find(".served").val())
            //_serve = (_serve == '') ? '0' : _serve;

            //serve += Number(ComputeAmount(Number(_serve) * Number(price), dis))
        }
    });




    //alert(total_amount);
    $("#spnTotal").html(total);
    // $("#spnServed").html(serve);
    // $("#spnBalance").html(total - serve);


    ComputeApplytoInvoice();
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

function ComputeApplytoInvoice() {

    var apply = 0;

    $("#tblPurchaseInvoice tbody tr").find('td').each(function () {
        if (!isNaN($(this).find(".apply").val())) {
            var component_amount = $(this).find(".apply").val();

            apply = Number(apply) + Number(component_amount);
            //  alert(apply);
        }
    });


    //--------------

    //  alert(apply);
    $('#spnApplyToInvoice').html('0');
    var total = Number($('#spnTotal').html());

    $('#spnApplyToInvoice').html(apply);
    $('#spnBalance').html(total - apply);



}

function FillInvoiceList(supplier_id) {

    var pageUrl = '/Webservice/svr_Voucher.asmx';
    //GetInvoiceBalance(long customer_id)
    $.ajax({
        type: "POST", url: pageUrl + "/GetPurchaseInvoiceBalance", data: "{'supplier_id':'" + supplier_id + "' }",
        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
        success: function (response) {

            $('#tblPurchaseInvoice tbody').empty();
            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {

                $("#tblPurchaseInvoice tbody").append(ListInvoiceFormat(data[i]['ID'], data[i]['RefNo'], FormatDate(data[i]['CreatedDate']), data[i]['Description'], data[i]['Salesman'], data[i]['Balance']));

            }

            for (var i = 0; i < 20; i++) {
                $("#tblPurchaseInvoice tbody").append("<tr><td width='15%'></td><td width='10%'></td><td width='23%'></td><td width='15%'></td><td width='12%'></td><td width='20%'></td></tr>");
            }



        },
        error: function (response) {
        }
    });


}

function ListInvoiceFormat(invoice_id, ref_no, date, description, salesman, balance) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='15%'>" + date + "</td><td width='20%'>" + description + "</td><td width='20%'>" + salesman + "</td><td width='15%'><span class='spn_balance'>" + balance + "</span></td><td width='15%'><input type='text' class='apply' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
}

function ClearSupplierData(me) {
    if ($(me).val() == '') {
        CustomerID = 0;
        $('#address').val('');
    }
}

//-----------------------------

function ApplyToAllCheck(me) {

    if (!$(me).is(':checked')) {
        //$(me).closest('tr').find('.apply').val('0');
        $("#tblPurchaseInvoice tbody tr").find('td').each(function () {

            if (!isNaN($(this).find('.apply').val())) {
                // alert('x');


                $(this).closest('tr').find('.apply').val('0');
                $(this).find('.chk').prop('checked', false);
            }
        });

    }
    else {
        $("#tblPurchaseInvoice tbody tr").find('td').each(function () {

            if (!isNaN($(this).find('.apply').val())) {

                var current_total = GetCurrentTotal();
                var bal = 0;

                bal = Number($(this).closest('tr').find('.spn_balance').html());

                if (current_total < bal) {
                    $(this).closest('tr').find('.apply').val(current_total);
                }
                else if (current_total == bal) {
                    $(this).closest('tr').find('.apply').val(current_total)
                }
                else if (current_total > bal) {
                    $(this).closest('tr').find('.apply').val(bal);

                }


                $(this).find('.chk').prop('checked', true);
            }
        });
    }


    ComputeApplytoInvoice();

}

function ValidateEntry(me) {
    if (!$(me).is(':checked')) {
        $(me).closest('tr').find('.apply').val('0');
        ComputeApplytoInvoice();
        return;
    }

    var current_total = GetCurrentTotal();
    var bal = 0;


    if (!isNaN($(me).closest('tr').find('.spn_balance').html())) {

        bal = Number($(me).closest('tr').find('.spn_balance').html());

        if (current_total < bal) {
            $(me).closest('tr').find('.apply').val(current_total);
        }
        else if (current_total == bal) {
            $(me).closest('tr').find('.apply').val(current_total);
        }
        else if (current_total > bal) {
            $(me).closest('tr').find('.apply').val(bal);

        }

    }

    ComputeApplytoInvoice();

}

function GetCurrentTotal() {
    var ret = 0;
    $("#tblPurchaseInvoice tbody tr").find('td').each(function () {

        if (!isNaN($(this).find('.apply').val())) {
            ret += Number($(this).find('.apply').val());
        }
    });

    var current_total = Number($('#spnTotal').html());

    return current_total - Number(ret);


    // return Number($('#spnTotal').html());
}


//-----------------

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

    $('#deliver_to').empty(); 
    var data = ForwarderData;
    for (var i = 0; i < data.length; i++) { $('#deliver_to').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ForwardedName"] + "</option>"); }

}

function FillSalesman() {
    $('#salesman').empty(); 
    var data = SalesmanData;
    for (var i = 0; i < data.length; i++) { $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>"); }
}

function FillTerm() {
    $('#terms').empty();
    var data = TermData;
    for (var i = 0; i < data.length; i++) { $('#terms').append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>"); }
}

function FillDate() {
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);

}



