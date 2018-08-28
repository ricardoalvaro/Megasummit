/// <reference path="js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------
var CustomerID = 0;
var OfficialReceiptID = 0;

$(document).ready(function () {

    var helper = new Helper();
    CustomerID = Number(helper.GetQuerystring()["customerID"]);
    if (!$.isNumeric(CustomerID) || CustomerID <= 0) {
        CustomerID = 0;
    }



    $('#btn-save').removeClass('disabled');

    $('#btn-save').click(function () {
        SaveOfficialReceipt(this);
    });


    $('#btn-new').click(function () {

        if ($(this).hasClass("disabled") == false) {
            window.location = "aspnetOfficialReceipt.aspx";
        }
    });

    $("#input_cash_amount").change(function () {
        $('#spnCash').html(Number($(this).val()).toFixed(2));
    });

    $("#input_credit_card_amount").change(function () {
        $('#spnCard').html(Number($('#input_credit_card_amount').val()).toFixed(2));
    });

    CheckList();

    Fill();

    if (CustomerID > 0) {
        FillCustomerDetails(CustomerID);
    }

});

function SaveOfficialReceipt(me) {

    if ($(me).hasClass("disabled") == false) {
        var pageUrl = '/Webservice/svr_OfficialReceipt.asmx';
        var apply_for = GetApplyToInvoice();
        var cash = ($('#input_cash_amount').val() == '') ? '0' : $('#input_cash_amount').val();
        var check_detail = CheckCollection();
        var credit_card = CreditCard();
        var total_or = Number($('#input_cash_amount').val()) + Number($('#spnCheck').html()) + Number($('#spnCard').html()) + Number($('#spnAccount').html());

        var memo = '';
        var customer_id = CustomerID;
        var ref_no = $('#reference_letter').val();
        var ref_serial = $('#reference_number').val();
        var created_date = $('#date').val();

        if (OfficialReceiptID == 0) {
            var data_transfer = "{'invoices_apply_for':'{0}', 'cash_amount':'{1}',  'check_details':'{2}',  'credi_card_detail':'{3}', 'customerID':'{4}', 'refNo':'{5}', 'refSerial':'{6}', 'createdDate':'{7}',  'total_amount':'{8}'}"
            .f(apply_for, cash, check_detail, credit_card, customer_id, ref_no, ref_serial,
            created_date, total_or);
            $.ajax({
                type: "POST", url: pageUrl + "/InsertOfficialReceipt",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json", crossdomain: true,
                success: function (response) {
                    window.location = "aspnetOfficialReceipt.aspx?customerID=" + response.d;
                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }
        else { // update

        }

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

function CreditCard() {
    if ($('#input_credit_card_amount').val() != '' || $('#input_credit_card_amount').val() == '0') {
        return $('#card_type').val() + '^' + $('#card_number').val() + '^' + $('#card_name').val() + '^' + $('#expiration_date_month').val() + '^' + $('#expiration_date').val() + '^' + $('#approval_code').val() + '^' + $('#input_credit_card_amount').val();
    }
    else {
        return '';
    }
}

function CheckCollection() {
    var col = "";

    $("#check tbody").find('tr').each(function () {
        // !isNaN( $(this).closest('tr').find(".amount").val()) ||
        if ($.trim($(this).closest('tr').find(".amount").val()) != '') {
            col += ($(this).closest('tr').find(".bank").val()) + '^' + ($(this).closest('tr').find(".check_no").val()) + '^' + ($(this).closest('tr').find("._date").val()) + '^' + ($(this).closest('tr').find(".amount").val()) + '|';
        }
    });

    return col;
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

function PaymentType(me, ctrl) {

    if (ctrl == 'cash') {
        $('#cash').show(); $('#check').hide(); $('#card').hide(); $('#account').hide();
    }
    else if (ctrl == 'check') {
        $('#cash').hide(); $('#check').show(); $('#card').hide(); $('#account').hide();
    }
    else if (ctrl == 'card') {
        $('#cash').hide(); $('#check').hide(); $('#card').show(); $('#account').hide();
    }
    else {
        $('#cash').hide(); $('#check').hide(); $('#card').hide(); $('#account').show();
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

function ApplyTo(me, ctrl) {

    if (ctrl == 'invoices') {
        $("#apply_invoices").show(); $("#apply_memo").hide();
    }
    else if (ctrl == 'memo') {
        $("#apply_invoices").hide(); $("#apply_memo").show();
    }

    $(".subtabs li").each(function (index) {


        if ($(me).text() == $(this).text()) {
            $(this).addClass('active');
        }
        else {
            $(this).removeClass('active');
        }

    });
}


//-------------------------------------


function Fill() {
    FillCustomerAutoComplete(); CreateDate(); ExpirationDate(); FillBankAccountAutoComplete(); FillDefaultList();
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

    //load OR raise in this customer
    FillCustomer(customer_id);

    //load all invoices that are not paid
    FillInvoiceList(customer_id);
    //------invoice look up-------
    //sales return
    //official receipt
}

function FillCustomer(customer_id) {
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
    var current_total = Number($('#input_cash_amount').val()) + Number($('#spnCheck').html()) + Number($('#spnCard').html()) + Number($('#spnAccount').html());

    return current_total - Number(ret);
}


function ListInvoiceFormatEdit(invoice_id, ref_no, date, description, salesman, total, payment) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='15%'>" + date + "</td><td width='20%'>" + description + "</td><td width='20%'>" + salesman + "</td><td width='15%'><span class='spn_balance'>" + total + "</span></td><td width='15%'><input type='text' class='apply' value='" + payment + "' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
}


function ListInvoiceFormat(invoice_id, ref_no, date, description, salesman, balance) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='15%'>" + date + "</td><td width='20%'>" + description + "</td><td width='20%'>" + salesman + "</td><td width='15%'><span class='spn_balance'>" + balance + "</span></td><td width='15%'><input type='text' class='apply' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
}




function ListOfficialReceipt(official_receipt_id, customer_name, ref_no, amount) {
    return "<li><a href='javascript:void(0);'  id='item-1' onclick=\"SelectOfficialReceipt('" + official_receipt_id + "')\"><span class='name'>" + customer_name + "<span class='ym-clearfix'><span class='float-left'>" + ref_no + "</span><span class='float-right'>" + ((amount == '0') ? '' : Number(amount).toFixed(2)) + "</span></span></span></a></li>";
}

function ResetPaymentAmounts() {
    $('#spnCash').html('0.00');
    $('#spnCheck').html('0.00');
    $('#spnCard').html('0.00');


    $('#input_cash_amount').val('0');
    $("#check tbody tr").find(':input').empty();
    $('#card_number').val('');
    $('#card_name').val('');
    $('#expiration_date_month').val();
    $('#expiration_date').val();
    $('#approval_code').val('');
    $('#input_credit_card_amount').val('0');

}

function SelectOfficialReceipt(official_receipt_id) {
    $('#btn-save').addClass('disabled');
    $('#btn-new').removeClass('disabled');


    ResetPaymentAmounts();
    OfficialReceiptID = official_receipt_id;
    var pageUrl = '/Webservice/svr_OfficialReceipt.asmx';

    $.ajax({
        type: "POST", url: pageUrl + "/SelectOfficialReceiptDetail", data: "{'official_receipt_id':'" + official_receipt_id + "' }",
        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
        success: function (response) {

            var data = eval(response.d);

            for (var i = 0; i < data.length; i++) {

                var id = data[i]['ID'];
                var customer_id = data[i]['CustomerID'];
                var customer_name = data[i]['CustomerName'];
                var ref_no = data[i]['RefNo'];
                var ref_serial = data[i]['RefNoSerial'];

                //---------
                CustomerID = customer_id;
                $('#customer').val((customer_name == '') ? '' : customer_name);
                $('#reference_letter').val((ref_no == '') ? '' : ref_no);
                $('#reference_number').val((ref_serial == '') ? '' : ref_serial);
                //$('#input_cash_amount').val( (cash_amount=='') ? '0' :  cash_amount ).trigger('change');
                //$('#spnCash').html( (cash_amount=='') ? '0' :  cash_amount  );
                //---------


            }


            var actualarray = $.parseJSON(response.d);
            $.each(actualarray, function (i, v) {
                var _cash = v.Cash;
                for (var i = 0; i < _cash.length; i++) {
                    var id = _cash[i]['ID'];
                    $('#input_cash_amount').val(_cash[i]['Amount']).trigger('change');
                }


                var _check = v.Checks;
                for (var i = 0; i < _check.length; i++) {
                    var id = _check[i]['ID'];
                    var bank_name = _check[i]['BankName'];
                    var check_no = _check[i]['CheckNo'];
                    var check_date = _check[i]['CheckDate'];
                    var check_amount = _check[i]['Amount'];

                    $("#check tbody tr").find('td').each(function () {

                        if ($(this).find('.bank').val() != '') {
                            $(this).closest('tr').find('.bank').val(bank_name);
                            $(this).closest('tr').find('.check_no').val(check_no);
                            $(this).closest('tr').find('._date').val(FormatDate(check_date));
                            $(this).closest('tr').find('.amount').val(Number(check_amount).toFixed(2)).trigger('change');

                            return false;
                        }

                    });

                }



                var _card = v.CrediCard;
                for (var i = 0; i < _card.length; i++) {
                    var id = _card[i]['ID'];
                    var card_type = _card[i]['CardType'];
                    var card_number = _card[i]['CardNumber'];
                    var name_on_card = _card[i]['NameOnCard'];
                    var exp_month = _card[i]['ExpirationMonth'];
                    var exp_year = _card[i]['ExpirationYear'];
                    var approval_code = _card[i]['ApprovalCode'];
                    var card_amount = _card[i]['Amount'];

                    //------------
                    $('#card_type').val(card_type);
                    $('#card_number').val(card_number);
                    $('#card_name').val(name_on_card);
                    $('#expiration_date_month').val(exp_month);
                    $('#expiration_date').val(exp_year);
                    $('#approval_code').val(approval_code);
                    $('#input_credit_card_amount').val(card_amount).trigger('change');
                    //------------
                }


                var _pay = v.Payments

                $('#tbl_apply_invoices tbody').empty();
                for (var i = 0; i < _pay.length; i++) {

                    $("#tbl_apply_invoices tbody").append(ListInvoiceFormatEdit(_pay[i]['ID'], _pay[i]['RefNo'], FormatDate(_pay[i]['CreatedDate']), _pay[i]['Description'], _pay[i]['Salesman'], _pay[i]['TotalAmount'], _pay[i]['TotalPayment']));

                }

                //$("#tbl_apply_invoices tbody tr").empty();
                //for (var i = 0; i < _pay.length; i++) 
                //{
                //    var id = _pay[i]['ID'];
                //    var invoice_id = _pay[i]['InvoiceID'];
                //    var customer_id = _pay[i]['CustomerID'];
                //    var payment_amount = _pay[i]['Amount'];


                //    $("#tbl_apply_invoices tbody tr").find('td').each(function () {
                //        //if( $(this).find('.bank').val() != '')
                //        if( $(this).find('.apply').val() != '' )
                //        {
                //            $(this).closest('tr').find('.invoice_id').val(invoice_id);
                //            $(this).closest('tr').find('.apply').val( Number(payment_amount).toFixed(2));

                //            return false;
                //        }
                //    });

                //}





            });
        },
        error: function (response) {
        }
    });
}

function CheckList() {
    $("#check tbody").empty();

    for (var i = 0; i < 20; i++) {
        $("#check tbody").append(" <tr><td width='30%'><input type='text' class='bank' /><input type='hidden' class='bank_id' /></td> <td width='20%'><input type='text' class='check_no' /></td> <td width='15%'><input type='text' name='date' class='date _date' /></td> <td width='15%'><input type='text' class='amount' /></td></tr>");
    }
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

function FillBankAccountDetail(account_id, me) {
   // var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
   // $(me).closest("tr").find("._date").val("0" + month + "/" + day + "/" + year);
}

function ExpirationDate() {
    var currentDate = new Date(); var year = currentDate.getFullYear() - 1;
    for (var i = 0; i < 20; i++) {

        var exp_year = year + i;
        $("#expiration_date").append("<option value='" + exp_year + "'>" + exp_year + "</option>");
        if (i > 0 && i <= 12) {
            var exp_month = i;
            $("#expiration_date_month").append("<option value='" + exp_month + "'>" + exp_month + "</option>");

        }
    }
}

function CreateDate() {
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);
}

function FillDefaultList() {
    for (var i = 0; i < 20; i++) {
        $("#tbl_apply_invoices tbody").append("<tr><td width='15%'></td><td width='10%'></td><td width='23%'></td><td width='15%'></td><td width='12%'></td><td width='20%'></td></tr>");

        $("#ulCustomer").append("<li><a href='javascript:void(0);'  id='item-1' ><span class='name'>&nbsp;<span class='ym-clearfix'><span class='float-left'>&nbsp;</span><span class='float-right'>&nbsp;</span></span></span></a></li>");
    }

}