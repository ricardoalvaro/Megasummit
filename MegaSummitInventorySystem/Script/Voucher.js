/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------

var SupplierID = 0;
var VoucherID = 0;

$(document).ready(function () {

    var helper = new Helper();
    SupplierID = Number(helper.GetQuerystring()["customerID"]);
    if (!$.isNumeric(SupplierID) || SupplierID <= 0) {
        SupplierID = 0;
    }



    //$('#btn-save').removeClass('disabled');

    //$('#btn-save').click(function () {
    //    SaveOfficialReceipt(this);
    //});


    $('#btn-new').click(function () {

        if ($(this).hasClass("disabled") == false) {
            window.location = "aspnetVoucher.aspx";
        }
    });

    $("#input_cash_amount").change(function () {
        $('#spnCash').html(Number($(this).val()).toFixed(2));
    });


    CheckList();

    Fill();

    //if (CustomerID > 0) {
    //    FillCustomerDetails(CustomerID);
    //}

});

function CheckList() {
    $("#check tbody").empty();

    for (var i = 0; i < 20; i++) {
        $("#check tbody").append(" <tr><td width='30%'><input type='text' class='bank' /><input type='hidden' class='bank_id' /></td> <td width='20%'><input type='text' class='check_no' /></td> <td width='15%'><input type='text' name='date' class='date _date' /></td> <td width='15%'><input type='text' class='amount' /></td></tr>");
    }
}

function PaymentType(me, ctrl) {

    if (ctrl == 'cash') {
        $('#cash').show(); $('#check').hide();
    }
    else if (ctrl == 'check') {
        $('#cash').hide(); $('#check').show(); 
    }
   


    $(".potabs li").each(function (index) {

        if ($(me).text() == $(this).text()) {
            $(this).addClass('active');
        }
        else {
            $(this).removeClass('active');
        }

    });
}



function Fill() {
    FillCustomerAutoComplete();
    CreateDate();
    FillDefaultList();
    FillBank();
    FillBankAccountAutoComplete();

}


function FillCustomerAutoComplete() {
    $("#supplier").autocomplete({
        source: SupplierData, minLength: 0, minChars: 0, max: 12, autoFill: true,
        matchContains: false, select: function (a, b) {
            //supplier information
            FillSupplierDetails(b.item.id);
            SupplierID = b.item.id;
        }
    }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
}


function FillSupplierDetails(supplier_id) {

    //load OR raise in this customer
    //FillSupplier(supplier_id);

    //load all invoices that are not paid
    FillInvoiceList(supplier_id);
    //------invoice look up-------
    //sales return
    //official receipt
}

function FillSupplier(supplier_id) {
    var pageUrl = '/Webservice/svr_OfficialReceipt.asmx';

    $.ajax({
        type: "POST", url: pageUrl + "/GetOfficialReceiptCustomer", data: "{'id':'0', 'customer_id':'" + customer_id + "' }",
        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
        success: function (response) {

            $('#ulCustomer').empty();
            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {

                $('#customer').val(data[i]['CustomerName']);

                $("#ulCustomer").append(ListOfficialReceipt(data[i]["ID"], data[i]['CustomerName'], data[i]['RefNo'], data[i]['TotalAmount']));
            }

            for (var i = 0; i < 20; i++) {
                $("#ulCustomer").append("<li><a href='javascript:void(0);'  id='item-1' ><span class='name'>&nbsp;<span class='ym-clearfix'><span class='float-left'>&nbsp;</span><span class='float-right'>&nbsp;</span></span></span></a></li>");
            }
        },
        error: function (response) {
        }
    });
}

function FillInvoiceList(supplier_id) {

    var pageUrl = '/Webservice/svr_Voucher.asmx';
    //GetInvoiceBalance(long customer_id)
    $.ajax({
        type: "POST", url: pageUrl + "/GetPurchaseInvoiceBalance", data: "{'supplier_id':'" + supplier_id + "' }",
        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
        success: function (response) {

            $('#tbl_apply_invoices tbody').empty();
            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {

                $("#tbl_apply_invoices tbody").append(ListInvoiceFormat(data[i]['ID'], data[i]['RefNo'], FormatDate(data[i]['CreatedDate']), data[i]['Description'], data[i]['Salesman'], data[i]['Balance']));

            }

            for (var i = 0; i < 20; i++) {
                $("#tbl_apply_invoices tbody").append("<tr><td width='15%'></td></tr>");
            }




        },
        error: function (response) {
        }
    });


}

function ListInvoiceFormat(invoice_id, ref_no, date, description, salesman, balance) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='15%'>" + date + "</td><td width='20%'>" + description + "</td><td width='15%'><span class='spn_balance'>" + balance + "</span></td><td width='15%'><input type='text' class='apply' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
}


function ApplyToAllCheck(me) {

    if (!$(me).is(':checked')) {
        //$(me).closest('tr').find('.apply').val('0');
        $("#tbl_apply_invoices tbody tr").find('td').each(function () {

            if (!isNaN($(this).find('.apply').val())) {
                // alert('x');


                $(this).closest('tr').find('.apply').val('0');
                $(this).find('.chk').prop('checked', false);
            }
        });

    }
    else {
        $("#tbl_apply_invoices tbody tr").find('td').each(function () {

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



}

function ValidateEntry(me) {
    if (!$(me).is(':checked')) {
        $(me).closest('tr').find('.apply').val('0');
        return;
    }

    var current_total = GetCurrentTotal();// Number($('#input_cash_amount').val()) + Number($('#spnCheck').html()) + Number($('#spnCard').html()) + Number($('#spnAccount').html());
    //alert(current_total);
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



}

function GetCurrentTotal() {
    var ret = 0;
    $("#tbl_apply_invoices tbody tr").find('td').each(function () {

        if (!isNaN($(this).find('.apply').val())) {
            ret += Number($(this).find('.apply').val());
        }
    });
    var current_total = Number($('#spnCash').html()) + Number($('#spnCheck').html());

    return current_total - Number(ret);
}

//---------------------------

function FillBank() {
   

    var pageUrl = '/Webservice/svr_CompanyBankAccount.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCompanyBankAccount",
        data: "{'id':'" + 0 + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            $('#bank_account').empty();
            for (var i = 0; i < data.length; i++) {

                $('#bank_account').append("<option value='" + data[i]["ID"] + "'>" + data[i]["AccountName"] + "</option>");
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function FillBankAccountAutoComplete() {
    $("#check tbody tr").find('td').each(function () {

        $(this).find(".bank").autocomplete({
            source: BankAutoCompleteData, minLength: 0, minChars: 0, max: 12, autoFill: true, matchContains: false,
            select: function (a, b) {
                FillBankAccountDetail(b.item.id, this);
            }
        }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); })
            .change(function () { $(this).closest("tr").find(":input").val(''); });


        $(this).closest('tr').find('.amount').change(function () {

            $('#spnCheck').html(CheckAmountTotal().toFixed(2));
        });

    });
}

function CheckAmountTotal() {
    var check_amount = 0;
    $("#check tbody tr").find('td').each(function () {

        if (!isNaN($(this).find(".amount").val())) {
            check_amount += Number($(this).find(".amount").val());
        }
    });
    return check_amount;
}


function CreateDate() {
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);
}

function FillDefaultList() {
    for (var i = 0; i < 20; i++) {
        $("#tbl_apply_invoices tbody").append("<tr><td width='15%'></td><td width='10%'></td><td width='23%'></td><td width='15%'></td><td width='12%'></td><td width='20%'></td></tr>");

        $("#ulSupplier").append("<li><a href='javascript:void(0);'  id='item-1' ><span class='name'>&nbsp;<span class='ym-clearfix'><span class='float-left'>&nbsp;</span><span class='float-right'>&nbsp;</span></span></span></a></li>");
    }

}
