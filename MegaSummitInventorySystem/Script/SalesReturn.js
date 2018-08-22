/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------
var CustomerID = 0;
var SalesReturnID = 0;
var helper = new Helper();


$(document).ready(function () {

    SalesReturnID = Number(helper.GetQuerystring()["salesReturnID"]);
    if (!$.isNumeric(SalesReturnID) || SalesReturnID <= 0) {
        SalesReturnID = 0;
    }

    $("#hold").click(function () { alert('Not Working'); });

    $("#btn-save").removeClass("disabled").click(function () { SaveInvoice(this); });

    GenerateStaticInvoiceList();
    GenerateDynamicAutoComplete();

    $("#customer").change(function (event) {
        ClearCustomerData(this);
    });

    $('#applyToInvoice').click(function () {

        FillInvoiceList(CustomerID);
        $('#tblSalesReturn').height(125.1);
        $('#tblReference').show();
         

    });

    $(':input').on('input', function () { // do not allow single quote and double quote 
        this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
    });

    Fill();
});


function FillInvoiceList(customer_id) {

    var pageUrl = '/Webservice/svr_OfficialReceipt.asmx';
    //GetInvoiceBalance(long customer_id)
    $.ajax({
        type: "POST", url: pageUrl + "/GetInvoiceBalance", data: "{'customer_id':'" + customer_id + "' }",
        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
        success: function (response) {

            $('#tbl_apply_invoices tbody').empty();
            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {

                $("#tblInvoices tbody").append(ListInvoiceFormat(data[i]['ID'], data[i]['RefNo'], FormatDate(data[i]['CreatedDate']), data[i]['Description'], data[i]['Salesman'], data[i]['Balance']));

            }

            for (var i = 0; i < 20; i++) {
                $("#tblInvoices tbody").append("<tr><td width='15%'></td><td width='10%'></td><td width='23%'></td><td width='15%'></td><td width='12%'></td><td width='20%'></td></tr>");
            }




        },
        error: function (response) {
        }
    });


}

function ListInvoiceFormat(invoice_id, ref_no, date, description, salesman, balance) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='10%'>" + date + "</td><td width='23%'>" + description + "</td><td width='15%'>" + salesman + "</td><td width='12%'><span class='spn_balance'>" + balance + "</span></td><td width='20%'><input type='text' class='apply' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
}


function ClearCustomerData(me) {
    if ($(me).val() == '') {
        CustomerID = 0;
        $('#address').val('');
    }
}

function GenerateDynamicAutoComplete() {
    $("#tblSalesReturn tbody tr").find('td').each(function () {

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

        //$(this).find(".served").change(function () { ComputeComponentAmount(this); });
    });
}

function GenerateStaticInvoiceList() {


    var ret = "";
    for (var i = 0; i < 20; i++) {
        $("#tblSalesReturn tbody").append("<tr><td width='20%'><input type='text' class='product' /><input type='hidden' class='product_id' /></td><td width='10%'><input type='text' class='location' /><input type='hidden' class='location_id' /></td><td width='10%'><input type='text' class='quantity' /></td><td width='10%'><input type='text' class='unit' /></td><td width='10%'><input type='text' class='price' /></td><td width='10%'><input type='text' class='discount' /></td><td width='10%'><input type='text' class='amount' /></td></tr>");
    }
}

function GetProductDetails(product_id, me) {
    var data = ProductDetailData;

    for (var i = 0; i < data.length; i++) {
        if (product_id == data[i]["ID"]) {

            $(me).closest("tr").find(".price").val(data[i]["Cost"]);
            $(me).closest("tr").find(".product_id").val(product_id);
            $(me).closest("tr").find(".unit").val(data[i]["UnitName"]);

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
    $("#tblSalesReturn tbody tr").find('td').each(function () {
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

//-----------------

function ApplyToAllCheck(me) {

    if (!$(me).is(':checked')) {
        //$(me).closest('tr').find('.apply').val('0');
        $("#tblInvoices tbody tr").find('td').each(function () {

            if (!isNaN($(this).find('.apply').val())) {
                // alert('x');


                $(this).closest('tr').find('.apply').val('0');
                $(this).find('.chk').prop('checked', false);
            }
        });

    }
    else {
        $("#tblInvoices tbody tr").find('td').each(function () {

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


function ComputeApplytoInvoice()
{
   
    var apply = 0;

    $("#tblInvoices tbody tr").find('td').each(function () {
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
    $("#tblInvoices tbody tr").find('td').each(function () {

        if (!isNaN($(this).find('.apply').val())) {
            ret += Number($(this).find('.apply').val());
        }
    });

    var current_total = Number($('#spnTotal').html());

    return current_total - Number(ret);


   // return Number($('#spnTotal').html());
}

function Fill() {
    FillCustomerAutoComplete();
    FillForwarder();
    FillSalesman();
    FillTerm();
    FillDate();
    FillDate();
}

function FillCustomerAutoComplete() {
    $("#customer").autocomplete({
        source: CustomerData, minLength: 0, minChars: 0, max: 12, autoFill: true,
        matchContains: false, select: function (a, b) {
            //customer information
            FillCustomerDetails(b.item.id);
            CustomerID = b.item.id;
        }
    }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
}

function FillCustomerDetails(customer_id) {
    //customer address
    //credit limit
    //invoice balance
    //post dated check
    //available credit



    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST", url: pageUrl + "/SelectCustomerDetails", data: "{'id':'" + customer_id + "' }", contentType: "application/json; charset=utf-8",
        dataType: "json", crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {

                $('#salesman').val(data[i]["SalesmanID"]);
                $('#deliver_to').val(data[i]["ShipToID"]);
                $('#terms').val(data[i]["TermID"]);

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

function FillReference() {
    $('#reference_no').empty(); //$('#remarks').append("<option value='" + "0" + "'>" + "</option>");
    var data = RefNoData;
    for (var i = 0; i < data.length; i++) { $('#reference_no').append("<option value='" + data[i]["ID"] + "'>" + data[i]["PrefixInitial"] + "</option>"); }

}

function FillDate() {
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);
    $('#cancel_date').val("0" + month + "/" + day + "/" + year);

}

