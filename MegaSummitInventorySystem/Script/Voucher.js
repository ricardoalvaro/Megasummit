/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------

var SupplierID = 0;
var VoucherID = 0;

$(document).ready(function () {

    var helper = new Helper();
    SupplierID = Number(helper.GetQuerystring()["supplierID"]);
    if (!$.isNumeric(SupplierID) || SupplierID <= 0) {
        SupplierID = 0;
    }

    $('#btn-save').removeClass('disabled');

    $('#btn-save').click(function () {
        SaveVoucher(this);
    });


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
    //alert(SupplierID);
    if (SupplierID > 0) {
        //alert(SupplierID);
        FillSupplierDetails(SupplierID);
    }

});



function SaveVoucher(me)
{


    if ($(me).hasClass("disabled") == false) {
        var pageUrl = '/Webservice/svr_Voucher.asmx';
        var apply_for = GetApplyToInvoice();
        var cash = ($('#input_cash_amount').val() == '') ? '0' : $('#input_cash_amount').val();
        var company_account_id = $('#bank_account').val();
        var company_account_name = $('#bank_account option:selected').text();

        var check_detail = CheckCollection();
        var total_or = Number($('#input_cash_amount').val()) + Number($('#spnCheck').html());

        var memo = '';
        var supplier_id = SupplierID;
        var ref_no = $('#reference_letter').val();
        var ref_serial = $('#reference_number').val();
        var created_date = $('#date').val();

        if (VoucherID == 0) {

            var data_transfer = "{ 'invoices_apply_for':'{0}',  'supplierID':'{1}',  'refNo':'{2}',  'refSerial':'{3}',  'createdDate':'{4}',  'totalAmount':'{5}',  'cash_amount':'{6}',  'companyBankAccountID':'{7}',  'accountName':'{8}',  'check_details':'{9}'}"
            .f(apply_for, supplier_id, ref_no, ref_serial,
            created_date, total_or, cash, company_account_id,
            company_account_name, check_detail);



            $.ajax({
                type: "POST", url: pageUrl + "/InsertVoucher",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json", crossdomain: true,
                success: function (response) {
                    window.location = "aspnetVoucher.aspx?supplierID=" + response.d;
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
    FillSupplier(supplier_id);

    //load all invoices that are not paid
    FillInvoiceList(supplier_id);
    //------invoice look up-------
    //sales return
    //official receipt
}

function FillSupplier(supplier_id) {
    var pageUrl = '/Webservice/svr_Voucher.asmx';

    $.ajax({
        type: "POST", url: pageUrl + "/GetVoucherSupplier", data: "{'id':'0', 'supplier_id':'" + supplier_id + "' }",
        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
        success: function (response) {

            $('#ulSupplier').empty();
            var data = eval(response.d);
            for (var i = 0; i < data.length; i++) {

                $('#supplier').val(data[i]['SupplierName']).trigger('change');

                //alert(data[i]['Supplier']);
                $("#ulSupplier").append(ListOfficialReceipt(data[i]["ID"], data[i]['SupplierName'], data[i]['RefNo'], data[i]['TotalAmount']));
            }

            for (var i = 0; i < 20; i++) {
                $("#ulSupplier").append("<li><a href='javascript:void(0);'  id='item-1' ><span class='name'>&nbsp;<span class='ym-clearfix'><span class='float-left'>&nbsp;</span><span class='float-right'>&nbsp;</span></span></span></a></li>");
            }
        },
        error: function (response) {
        }
    });
}

function ListOfficialReceipt(voucher_id, customer_name, ref_no, amount) {
    return "<li><a href='javascript:void(0);'  id='item-1' onclick=\"SelectVoucher('" + voucher_id + "')\"><span class='name'>" + customer_name + "<span class='ym-clearfix'><span class='float-left'>" + ref_no + "</span><span class='float-right'>" + ((amount == '0') ? '' : Number(amount).toFixed(2)) + "</span></span></span></a></li>";
}


function SelectVoucher(voucher_id) {
    $('#btn-save').addClass('disabled');
    $('#btn-new').removeClass('disabled');


    ResetPaymentAmounts();
    VoucherID = voucher_id;
    var pageUrl = '/Webservice/svr_Voucher.asmx';

    $.ajax({
        type: "POST", url: pageUrl + "/SelectVoucherDetail", data: "{'voucher_id':'" + VoucherID + "' }",
        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
        success: function (response) {

            var data = eval(response.d);

            for (var i = 0; i < data.length; i++) {

                //var id = data[i]['ID'];
                var supplier_id = data[i]['SupplierID'];
                var supplier_name = data[i]['SupplierName'];
                var ref_no = data[i]['RefNo'];
                var ref_serial = data[i]['RefNoSerial'];

                //---------
                SupplierID = supplier_id;
                $('#supplier').val(supplier_name);
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
                    $('#bank_account').val(id);
                    $('#input_cash_amount').val(_cash[i]['Amount']).trigger('change');
                }


                var _check = v.Checks;
                //alert(_check);
                for (var i = 0; i < _check.length; i++) {
                    var id = _check[i]['ID'];
                    var bank_name = _check[i]['BankName'];
                    var check_no = _check[i]['CheckNo'];
                    var check_date = _check[i]['CheckDate'];
                    var check_amount = _check[i]['Amount'];

                    $("#check tbody tr").find('td').each(function () {

                        if ($(this).find('.bank').val() == '') {
                            $(this).closest('tr').find('.bank').val(bank_name);
                            $(this).closest('tr').find('.check_no').val(check_no);
                            $(this).closest('tr').find('._date').val(FormatDate(check_date));
                            $(this).closest('tr').find('.amount').val(Number(check_amount).toFixed(2)).trigger('change');

                            return false;
                        }

                    });

                }



                var _pay = v.Payments

                $('#tbl_apply_invoices tbody').empty();
                for (var i = 0; i < _pay.length; i++) {

                    $("#tbl_apply_invoices tbody").append(ListInvoiceFormatEdit(_pay[i]['ID'], _pay[i]['RefNo'], FormatDate(_pay[i]['CreatedDate']), _pay[i]['Description'], _pay[i]['Salesman'], _pay[i]['TotalAmount'], _pay[i]['TotalPayment']));

                }



            });
        },
        error: function (response) {
        }
    });
}


function ResetPaymentAmounts() {
    $('#spnCash').html('0.00');
    $('#spnCheck').html('0.00');


    $('#input_cash_amount').val('0');
    $("#check tbody tr").find(':input').empty();
   

}


function ListInvoiceFormatEdit(invoice_id, ref_no, date, description, salesman, total, payment) {
    return "<tr><td width='15%'><input type='hidden' class='invoice_id' value='" + invoice_id + "'/> " + ref_no + "</td><td width='15%'>" + date + "</td><td width='20%'>" + description + "</td><td width='20%'>" + salesman + "</td><td width='15%'><span class='spn_balance'>" + total + "</span></td><td width='15%'><input type='text' class='apply' value='" + payment + "' /><input type='checkbox' class='chk' style='display:block;opacity:1;' onchange='ValidateEntry(this)'/> </td></tr>";
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
               // FillBankAccountDetail(b.item.id, this);
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
