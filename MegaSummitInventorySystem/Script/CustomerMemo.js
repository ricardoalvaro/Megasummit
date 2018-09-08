/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------
var CustomerID = 0;


$(document).ready(function () {

    $('#debit').attr("disabled", "disabled");
    $('#credit').attr("disabled", "disabled");

    $('#btn-save').removeClass('disabled').click(function () {
        InsertCustomerMemo(this);
    });

    $('#btn-new').click(function () {
        if ($(this).hasClass("disabled") == false) {
            location.reload();
        }
    });


    Fill();

});


 

function InsertCustomerMemo(me)
{
    if ($(me).hasClass("disabled") == false) {
        var pageUrl = '/Webservice/svr_InvoiceMemo.asmx';


        var customer_id = CustomerID;
        var ref_no = $('#reference_letter').val();
        var ref_no_serial = $('#reference_number').val();
        var created_date = $('#date').val();
        var account_id = $('#account_name').val();
        var account_name = $('#account_name option:selected').text();
        var debit = ($('#debit').val()=='') ? '0' : $('#debit').val();
        var credit = ($('#credit').val()=='') ? '0' : $('#credit').val();

        var invoiceList = GetApplyToInvoice();
        //InsertInvoiceMemo( 
     
        var data_transfer = "{ 'customerID':'{0}', 'refNo':'{1}', 'refNoSerial':'{2}', 'createdDate':'{3}','accountID':'{4}', 'accountName':'{5}', 'debit':'{6}', 'credit':'{7}',  'invoiceList':'{8}' }"
        .f(customer_id, ref_no, ref_no_serial, created_date, account_id, account_name, debit, credit, invoiceList);

        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertInvoiceMemo",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                //window.location = "aspnetSales.aspx";
                //alert(response.d);
                location.reload();

            },
            error: function (response) {
                alert(response.status);
            }
        });
     

    }
}

function GetApplyToInvoice() {
    var ret = '';
    $("#tbl_apply_invoices tbody tr").find('td').each(function () {

        if (!isNaN($(this).find(".apply").val())) {
            if (Number($(this).find(".apply").val()) > 0) {
                ret += $(this).closest('tr').find(".invoice_id").val() + '^' + $(this).find(".apply").val() + '|';
            }
        }
    });

    return ret;
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

    ComputeOverall();

}


function CheckType(me)
{
    $('#debit').attr("disabled", "disabled");
    $('#credit').attr("disabled", "disabled");
    var data = Account;
    for (var i = 0; i < data.length; i++) {
       // $('#account_name').append("<option value='" + data[i]['ID'] + "'>" + data[i]['AccountName'] + "</option>");
        if ($(me).val() == data[i]['ID'])
        {
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

//------------------

function Fill() {
    FillCustomerAutoComplete(); CreateDate(); FillDefaultList(); CustomerMemoUlList();
}

function FillCustomerAutoComplete() {
    $("#customer").autocomplete({
        source: CustomerData, minLength: 0, minChars: 0, max: 12, autoFill: true,
        matchContains: false, select: function (a, b) {
            //customer information
            FillCustomerDetails(b.item.id);
            FillAccounts();
            CustomerID = b.item.id;
        }
    }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
}

function FillCustomerDetails(customer_id) {

    //console.log(customer_id);
    FillInvoiceList(customer_id);
}

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

                $("#tbl_apply_invoices tbody").append(ListInvoiceFormat(data[i]['ID'], data[i]['RefNo'], FormatDate(data[i]['CreatedDate']), data[i]['Description'], data[i]['Balance']));

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
   // alert(current_total);
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

    ComputeOverall();


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


    //alert(debit + "--" + credit);
    var current_total = Number(debit) + Number(credit);

    return current_total - Number(ret);

}

function CreateDate() {
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);
}

function FillDefaultList() {
    for (var i = 0; i < 20; i++) {
        $("#tbl_apply_invoices tbody").append("<tr><td width='15%'></td><td width='10%'></td><td width='23%'></td><td width='15%'></td><td width='12%'></td><td width='20%'></td></tr>");

      //  $("#ulMemoList").append(ListOfficialReceipt('&nbsp;', '&nbsp;', '0'));
    }

}

function FillAccounts() {
    var data = Account;
    $('#account_name').empty();
    $('#account_name').append("<option value='0'>" +  "</option>");
    for (var i = 0; i < data.length; i++) {
        $('#account_name').append("<option value='" + data[i]['ID'] + "'>" + data[i]['AccountName'] + "</option>");
    }
}

function CustomerMemoUlList()
{
    var data = CustomerMemoList;

    $('#ulMemoList').empty();
    for (var i = 0; i < data.length; i++) {

        $("#ulMemoList").append(ListOfficialReceipt(data[i]["ID"], data[i]['CustomerName'], data[i]['RefNo'] + data[i]['ID'], data[i]['Debit']));
    }

    for (var i = 0; i < 20; i++) {
        $("#ulMemoList").append("<li><a href='javascript:void(0);'  id='item-1' ><span class='name'>&nbsp;<span class='ym-clearfix'><span class='float-left'>&nbsp;</span><span class='float-right'>&nbsp;</span></span></span></a></li>");
    }


}

function ListOfficialReceipt(memo_id,customer_name, ref_no, amount) {

    return "<li onclick=\"SelectSingleMemo('" +  memo_id + "')\"><a href='javascript:;' id='item-1'><span class='name'>" + customer_name + "<span class='ym-clearfix'><span class='float-left'>" + ref_no + "</span><span class='float-right'>" + Number(amount).toFixed(2) + "</span></span></span></a></li>";
}

function SelectSingleMemo(memo_id)
{
    var data = CustomerMemoList;
    for (var i = 0; i < data.length; i++) {

        if (data[i]['ID'] == memo_id)
        {

            FillAccounts();

            $('#customer').val(data[i]['CustomerName']).trigger('change');
            $('#reference_letter').val( data[i]['RefNo'] );
            $('#reference_number').val(data[i]['ID']);
            $('#date').val(FormatDate(data[i]['CreatedDate']));
            $('#account_name').val(data[i]['AccountID']);
            $('#debit').val(Number(data[i]['Debit']).toFixed(2));
            $('#credit').val(Number(data[i]['Credit']).toFixed(2));

            //get script
            //SelectCustomerMemoPerCustomer(long invoice_memo_id)



            var pageUrl = '/Webservice/svr_InvoiceMemo.asmx';
            //GetInvoiceBalance(long customer_id)
            $.ajax({
                type: "POST", url: pageUrl + "/SelectCustomerMemoPerCustomer", data: "{'invoice_memo_id':'" + memo_id + "' }",
                contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
                success: function (response) {

                    $('#tbl_apply_invoices tbody').empty();
                    var data = eval(response.d);
                    for (var i = 0; i < data.length; i++) {

                        $("#tbl_apply_invoices tbody").append(ListInvoiceFormatEdit(0, data[i]['RefNo'], FormatDate(data[i]['InvoiceDate']), data[i]['InvoiceType'], data[i]['Balance'], data[i]['ApplyAmount']));

                    }

                    for (var i = 0; i < 20; i++) {
                        $("#tbl_apply_invoices tbody").append("<tr><td width='15%'></td></tr>");
                    }
                },
                error: function (response) {
                }
            });


            $('#btn-save').addClass('disabled');
            $('#btn-new').removeClass('disabled');

            break;
        }
    }
}

function ListInvoiceFormatEdit(invoice_id, ref_no, date, description, balance, applyAmount) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='10%'>" + date + "</td><td width='50%'>" + description + "</td><td width='10%'><span class='spn_balance'>" + balance + "</span></td><td width='12%'><input type='text' class='apply' value='" + applyAmount + "' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
}


function isDebit()
{

    var account_id = $('#account_name').val();

    var data = Account;

    for (var i = 0; i < data.length; i++) {
        if (account_id == data[i]['ID'])
        {
            if (data[i]['isDebit']) {
                return true;
            }
            else {
                return false;
            }
        }
    }
    

    return false;
}

function ComputeOverall()
{
    var invoice_amt = 0;
    var apply_amt = 0;
    var balance = 0;

    $("#tbl_apply_invoices tbody tr").find('td').each(function () {

        if (!isNaN($(this).find('.apply').val())) {
         
            if ($(this).find('.chk').is(':checked')) {
                invoice_amt += Number($(this).closest('tr').find('.spn_balance').html());
                apply_amt += Number($(this).closest('tr').find('.apply').val());
            }
        }


    });

    $('#spnInvoiceAmt').html(invoice_amt.toFixed(2));
    $('#spnApplyAmt').html(apply_amt.toFixed(2));

    if (isDebit()) {
        balance = invoice_amt - apply_amt;
        $('#spnBalance').html(balance.toFixed(2));

    }
    else {
        balance = invoice_amt + apply_amt;
        $('#spnBalance').html(balance.toFixed(2));
    }


    
}


