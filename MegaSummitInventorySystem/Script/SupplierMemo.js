/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------

var SupplierID = 0;
var VoucherID = 0;

$(document).ready(function () {

    var helper = new Helper();
  
    $('#btn-save').removeClass('disabled');

    $('#btn-save').click(function () {
        //SaveVoucher(this);
    });

    $('#btn-new').click(function () {

        if ($(this).hasClass("disabled") == false) {
            window.location = "aspnetSupplierMemo.aspx";
        }
    });


    Fill();



});


function InsertSupplierMemo()
{
    //insert now



}

function CheckType(me) {
    $('#debit').attr("disabled", "disabled");
    $('#credit').attr("disabled", "disabled");
    var data = Account;
    for (var i = 0; i < data.length; i++) {
        // $('#account_name').append("<option value='" + data[i]['ID'] + "'>" + data[i]['AccountName'] + "</option>");
        if ($(me).val() == data[i]['ID']) {
            if (data[i]['isDebit']) {
                $('#debit').removeAttr('disabled');
            }
            else {
                $('#credit').removeAttr('disabled');
            }

            break;
        }
    }


}

//----------------
function Fill() {
    FillSupplierAutoComplete(); CreateDate();
    $('#debit').attr("disabled", "disabled");
    $('#credit').attr("disabled", "disabled");
}




function FillSupplierAutoComplete() {
    $("#supplier").autocomplete({
        source: SupplierData, minLength: 0, minChars: 0, max: 12, autoFill: true,
        matchContains: false, select: function (a, b) {
            //supplier information
            FillSupplierDetails(b.item.id);
            //FillBank();
            SupplierID = b.item.id;
        }
    }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
}

function FillSupplierDetails(supplier_id) {

    //load OR raise in this customer
    //FillSupplier(supplier_id);

    //load all invoices that are not paid
    FillInvoiceList(supplier_id);
    FillAccounts();
    //------invoice look up-------
    //sales return
    //official receipt
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

                $("#tbl_apply_invoices tbody").append(ListInvoiceFormat(data[i]['ID'], data[i]['RefNo'], FormatDate(data[i]['CreatedDate']), data[i]['Description'],  data[i]['Balance']));

            }

            for (var i = 0; i < 20; i++) {
                $("#tbl_apply_invoices tbody").append("<tr><td width='15%'></td></tr>");
            }




        },
        error: function (response) {
        }
    });


}

function ListInvoiceFormat(invoice_id, ref_no, date, description, balance) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='10%'>" + date + "</td><td width='50%'>" + description + "</td><td width='10%'><span class='spn_balance'>" + balance + "</span></td><td width='12%'><input type='text' class='apply' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
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

    var debit = ($('#debit').val() == '') ? '0' : Number($('#debit').val());
    var credit = ($('#credit').val() == '') ? '0' : Number($('#credit').val());

    var current_total = debit + credit;

    return current_total - Number(ret);

}


function CreateDate() {
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);
}


function FillAccounts() {
    var data = Account;

    $('#account_name').empty();
    $('#account_name').append("<option value='0'>" + "</option>");
    for (var i = 0; i < data.length; i++) {
        $('#account_name').append("<option value='" + data[i]['ID'] + "'>" + data[i]['AccountName'] + "</option>");
    }
}