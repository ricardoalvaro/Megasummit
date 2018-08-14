/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

function LoadCustomer() {

    var pageUrl = '/Webservice/svr_Customer.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCustomer",

        data: "{'id':'0','customer_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#customer_name').empty();
            $('#customer_name').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#customer_name').append("<option value='" + data[i]["ID"] + "'>" + data[i]["CustomerName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function BankNameAutoComplete() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteBank",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#checkpayment_table tbody tr").each(function (i) {
                $(this).find("td .bank_name").autocomplete({
                    source: response.d,
                    minLength: 0,
                    minChars: 0,
                    max: 12,
                    autoFill: true,
                    matchContains: false,
                    select: function (a, b) {
                        ActionCheckType(this);
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

function ActionCheckType(me) {
    $(me).closest("tr").find(".check_type").val("Posdated Check");
}

function LoadCardType() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCardType",
        data: "{ 'id':'0', 'CardTypeName':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#card_type').empty();
            $('#card_type').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#card_type').append("<option value='" + data[i]["ID"] + "'>" + data[i]["CardTypeName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function LoadCardExp() {

    var d = new Date();
    var dYear = d.getFullYear();
    var dYear2 = Number(dYear) + 1;
    var dYear3 = Number(dYear) + 2;
    var dYear4 = Number(dYear) + 3;

    $('#expiration_year').empty();
    $('#expiration_year').append("<option value='" + "0" + "'>" + "</option>");
    $('#expiration_year').append("<option value='" + dYear + "'>" + dYear + "</option>");
    $('#expiration_year').append("<option value='" + dYear2 + "'>" + dYear2 + "</option>");
    $('#expiration_year').append("<option value='" + dYear3 + "'>" + dYear3 + "</option>");
    $('#expiration_year').append("<option value='" + dYear4 + "'>" + dYear4 + "</option>");
}

function LoadPaymentRefDetails() {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectPaymentRefDetails",
        data: "{ 'id':'3'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i]["Automatic"] == true) {
                    $('#reference_number').val(data[i]["NextNo"]);
                }
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadSalesInvoiceList() {
    var pageUrl = '/Webservice/svr_Customer.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceSalesCustomerSelect",
        data: "{'id':'" + $('#customer_name').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xInvoiceTable tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                LoadSalesInvoicePaymentSelect(data[i]["ID"], data[i]["PrefixInitial"], data[i]["RefNoSerial"], ToJavaScriptDate(data[i]["CreatedDate"]), data[i]["CustomerName"], data[i]["Salesman"], data[i]["SubTotalAmt"], data[i]["InvoiceStatus"], data[i]["SubTotalAmt"]);
                //var balanceAmount = Number(data[i]["SubTotalAmt"]) - Number(data[i]["PaymentAmount"]);
                //if (Number(balanceAmount) > 0) {
                //    $('#xInvoiceTable tbody:last').append("<tr><td width=\"15%\"> " + data[i]["PrefixInitial"] + "" + data[i]["RefNoSerial"] + " </td><td width=\"10%\">" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</td><td width=\"23%\">" + data[i]["Notes"] + "</td><td width=\"15%\">" + data[i]["Salesman"] + "</td><td width=\"12%\"><div><input class='balance' style='width: 65px; border: none; background-color: transparent;' value='" + balanceAmount + "'/></div></td><td width=\"12%\"><div onclick=\"getBalance(this);\"><input class='apply' style='width: 65px; border: none; background-color: transparent;' onblur=\"ComputeApply();\"/></div><input class='salesID' style='width: 77px; border: none; background-color: transparent; display: none;' value=" + data[i]["ID"] + " /></td></tr>");
                //}
            }
            LoadSalesInvoicePayment();
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadSalesInvoicePaymentSelect(ID, PrefixInitial, RefNoSerial, CreatedDate, CustomerName, Salesman, SubTotalAmt, InvoiceStatus, SubTotalAmt) {

    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelectTotalAmount",
        data: "{'id':'" + ID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            if (data.length != 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#hdnTotalPay').val(data[i]["applyAmount"]);
                    var balanceAmount = Number(SubTotalAmt) - Number($('#hdnTotalPay').val());
                    $('#xInvoiceTable tbody:last').append("<tr><td width=\"15%\"> " + PrefixInitial + "" + RefNoSerial + " </td><td width=\"10%\">" + CreatedDate + "</td><td width=\"23%\">" + "" + "</td><td width=\"15%\">" + Salesman + "</td><td width=\"12%\"><div><input class='balance' style='width: 65px; border: none; background-color: transparent;' value='" + balanceAmount + "'/></div></td><td width=\"12%\"><div onclick=\"getBalance(this);\"><input class='apply' style='width: 65px; border: none; background-color: transparent;' onblur=\"ComputeApply();\"/></div><input class='salesID' style='width: 77px; border: none; background-color: transparent; display: none;' value=" + ID + " /></td></tr>");
                }
            }
            else {
                $('#xInvoiceTable tbody:last').append("<tr><td width=\"15%\"> " + PrefixInitial + "" + RefNoSerial + " </td><td width=\"10%\">" + CreatedDate + "</td><td width=\"23%\">" + "" + "</td><td width=\"15%\">" + Salesman + "</td><td width=\"12%\"><div><input class='balance' style='width: 65px; border: none; background-color: transparent;' value='" + SubTotalAmt + "'/></div></td><td width=\"12%\"><div onclick=\"getBalance(this);\"><input class='apply' style='width: 65px; border: none; background-color: transparent;' onblur=\"ComputeApply();\"/></div><input class='salesID' style='width: 77px; border: none; background-color: transparent; display: none;' value=" + ID + " /></td></tr>");
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function getBalance(me) {
    $(me).closest("tr").find(".apply").val($(me).closest("tr").find(".balance").val());
}

function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

function LoadSalesInvoicePayment() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoicePaymentSelectByCustomer",
        data: "{'id':'" + $('#customer_name').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ulPayment').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ulPayment").append("<li onclick='actionSelectPayment(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["RefNo"] + "<span><div style='float: left;'>" + data[i]["DatePay"] + "</div><div style='float: right; font-size: 15px;'>" + data[i]["TotalAmount"] + "</div></span></span></a> </li>");
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function actionSelectPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentReferenceSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#txtPaymentRef').val(data[i]["RefereneNo"]);
                $('#hdnPaymentID').val(data[i]["ID"]);
            }
            getCashPayment($('#hdnPaymentID').val());
            getCheckPayment($('#hdnPaymentID').val());
            getCardPayment($('#hdnPaymentID').val());
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function getCashPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentCashSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#amount_cash').val(data[i]["Amount"]);
                $('#txtTotalCash').val(data[i]["Amount"]);

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function getCheckPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentCheckSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var table = $("#checkpayment_table tbody");
            table.empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                table.append(" <tr><td width=\"42%\"><input class='bank_name' style='border: none; background-color: transparent;' value='" + data[i]["BankName"] + "'/></td><td width=\"15%\"><input class='check_no' style='border: none; background-color: transparent;'  value='" + data[i]["CheckNo"] + "'/></td><td width=\"10%\"><input class='date_check date' style='border: none; background-color: transparent;' value='" + data[i]["CheckDate"] + "'/></td><td width=\"15%\"><input class='check_type' style='border: none; background-color: transparent;'  value='" + data[i]["CheckType"] + "'/></td><td width=\"10%\"><input class='amount_check' style='border: none; background-color: transparent;' onblur=\"ComputeCheckPayment();\"   value='" + data[i]["Amount"] + "'/></td></tr>");
                ComputeCheckPayment();
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function getCardPayment(id) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PaymentCardSelect",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#card_type').val(data[i]["CardTypeID"]);
                $('#card_number').val(data[i]["CardNumber"]);
                $('#card_name').val(data[i]["NameOnCard"]);
                $('#expiration_month').val(data[i]["ExpirationMonth"]);
                $('#expiration_year').val(data[i]["ExpirationYear"]);
                $('#approval_code').val(data[i]["ApprovalCode"]);
                $('#card_amount').val(data[i]["Amount"]);
                $('#txtTotalCard').val(data[i]["Amount"]);

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ComputeCashPayment() {
    var amount = $('#amount_cash').val();
    $('#txtTotalCash').val(amount);

    ComputeTotalPayment();
}

function ComputeCheckPayment() {
    var totalAmount = 0;
    $("#checkpayment_table tbody tr").each(function (i) {
        if ($(this).find("td .amount_check").val() != null && $(this).find("td .amount_check").val() != "") {
            totalAmount += Number($(this).find("td .amount_check").val());
        }
    });
    $("#txtTotalCheck").val(totalAmount);
    ComputeTotalPayment();
}

function ComputeCardPayment() {
    var amount = $('#card_amount').val();
    $('#txtTotalCard').val(amount);

    ComputeTotalPayment();
}

function ComputeTotalPayment() {
    var amountCash = $('#txtTotalCash').val();
    var amountCheck = $('#txtTotalCheck').val();
    var amountCard = $('#txtTotalCard').val();
    var amountAccount = $('#txtTotalAccount').val();
    var NewTotal = (Number(amountCash) + Number(amountCheck)) + (Number(amountCard) + Number(amountAccount));
    $('#txtPayment').val(NewTotal);

}

function SavingPayment() {
    var refNo = $('#reference_number').val();
    var amount = $('#amount_cash').val();
    var tableCheck = GenerateCheckTable();
    var cardID = $('#card_type').val();
    var cardNumber = $('#card_number').val();
    var nameCard = $('#card_name').val();
    var expMonth = $('#expiration_month').val();
    var expYear = $('#expiration_year').val();
    var AppCode = $('#approval_code').val();
    var amountCard = $('#card_amount').val();
    var totalAmount = $('#txtPayment').val();
    var salesInvoice = GenerateSalesTable();

    if (amountCard == "") {
        amountCard = "0";
    }
    if (amount == "") {
        amount = "0";
    }
    if (cardID == "") {
        cardID = "0"
    }

    if (refNo != "" && refNo != null) {
        if ($('#hdnPaymentID').val() == "0") {
            var pageUrl = '/Webservice/svr_Invoice.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/SaveInvoicePaymentOfficial",
                data: "{'invoiceid':'0', 'refNo':'" + refNo + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'cardID':'" + cardID + "', 'cardNumber':'" + cardNumber + "', 'nameCard':'" + nameCard + "', 'expMonth':'" + expMonth + "', 'expYear':'" + expYear + "', 'AppCode':'" + AppCode + "', 'amountCard':'" + amountCard + "', 'totalAmount':'" + totalAmount + "', 'salesInvoice':'" + salesInvoice + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    window.location = "aspnetCustomerOfficialReceipt.aspx";
                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }
        else {
            var pageUrl = '/Webservice/svr_Invoice.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateInvoicePaymentOfficial",
                data: "{'id':'" + $('#hdnPaymentID').val() + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'cardID':'" + cardID + "', 'cardNumber':'" + cardNumber + "', 'nameCard':'" + nameCard + "', 'expMonth':'" + expMonth + "', 'expYear':'" + expYear + "', 'AppCode':'" + AppCode + "', 'amountCard':'" + amountCard + "', 'totalAmount':'" + totalAmount + "', 'salesInvoice':'" + salesInvoice + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    window.location = "aspnetCustomerOfficialReceipt.aspx";
                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }
    }
}

function GenerateCheckTable() {

    var counter = 0;
    var productColletion = "";
    $('#checkpayment_table tbody tr').each(function (i) {

        var x1 = $(this).find("td .bank_name").val();
        var x2 = $(this).find("td .check_no").val();
        var x3 = $(this).find("td .date_check").val();
        var x4 = $(this).find("td .check_type").val();
        var x5 = $(this).find("td .amount_check").val();

        if (x1 != "") {
            productColletion += x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "^";

        }

        counter++;
    });

    return productColletion;
}

function GenerateSalesTable() {

    var counter = 0;
    var productColletion = "";
    $('#xInvoiceTable tbody tr').each(function (i) {

        //if (counter > 0) {

        var x1 = $(this).find("td .apply").val();
        var x2 = $(this).find("td .salesID").val();

        if (x1 != "") {

            productColletion += x1 + "," + x2 + "^";
        }
        //}

        counter++;
    });

    return productColletion;
}