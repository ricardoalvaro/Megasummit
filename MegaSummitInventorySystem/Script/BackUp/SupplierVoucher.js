

function LoadSupplier() {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSupplier",

        data: "{'id':'0','SupplierName':'" + "" + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#supplier').empty();
            $('#supplier').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#supplier').append("<option value='" + data[i]["ID"] + "'>" + data[i]["SupplierName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadPurchasedInvoiceList() {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedInvoiceSelect",
        data: "{'id':'" + $('#supplier').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#xPurchaseList_table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                var invoiceID = data[i]["ID"];
                $('#hdnPurchasedID').val(invoiceID);
                LoadPurchasedInvoicePaymentSelect(data[i]["ID"], data[i]["RefNo"], data[i]["RefNoSerial"], ToJavaScriptDate(data[i]["CreatedDate"]), data[i]["SupplierName"], data[i]["Salesman"], data[i]["SubTotal"], data[i]["SubTotal"]);

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadPurchasedInvoicePaymentSelect(ID, RefNo, RefNoSerial, CreatedDate, SupplierName, Salesman, SubTotal, SubTotal) {

    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedPaymentSelectTotalAmount",
        data: "{'id':'" + $('#hdnPurchasedID').val() + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            if (data.length != 0) {
                for (var i = 0; i < data.length; i++) {
                    $('#hdnTotalPay').val(data[i]["applyAmount"]);
                    var balanceAmount = Number(SubTotal) - Number($('#hdnTotalPay').val());
                    //$('#xInvoiceTable tbody:last').append("<tr><td width=\"15%\"> " + PrefixInitial + "" + RefNoSerial + " </td><td width=\"10%\">" + CreatedDate + "</td><td width=\"23%\">" + "" + "</td><td width=\"15%\">" + Salesman + "</td><td width=\"12%\"><div><input class='balance' style='width: 65px; border: none; background-color: transparent;' value='" + balanceAmount + "'/></div></td><td width=\"12%\"><div onclick=\"getBalance(this);\"><input class='apply' style='width: 65px; border: none; background-color: transparent;' onblur=\"ComputeApply();\"/></div><input class='salesID' style='width: 77px; border: none; background-color: transparent; display: none;' value=" + ID + " /></td></tr>");
                    $('#xPurchaseList_table tbody:last').append("<tr><td width='15%'>" + RefNo + "" + RefNoSerial + "</td><td width='10%'>" + CreatedDate + "</td><td width='23%'>" + "" + "</td><td width='10%'><div><input class='balance' style='width: 65px; border: none; background-color: transparent;' value='" + balanceAmount + "'/></div></td><td width=\"12%\"><div onclick=\"getBalance(this);\"><input class='apply' style='width: 65px; border: none; background-color: transparent;' onblur=\"ComputeApply();\"/></div><input class='salesID' style='width: 77px; border: none; background-color: transparent; display: none;' value=" + ID + " /></td></tr>");
                }
            }
            else {
                $('#xPurchaseList_table tbody:last').append("<tr><td width='15%'>" + RefNo + "" + RefNoSerial + "</td><td width='10%'>" + CreatedDate + "</td><td width='23%'>" + "" + "</td><td width='10%'><div><input class='balance' style='width: 65px; border: none; background-color: transparent;' value='" + SubTotal + "'/></div></td><td width=\"12%\"><div onclick=\"getBalance(this);\"><input class='apply' style='width: 65px; border: none; background-color: transparent;' onblur=\"ComputeApply();\"/></div><input class='salesID' style='width: 77px; border: none; background-color: transparent; display: none;' value=" + ID + " /></td></tr>");
                //$('#xPurchaseList_table tbody:last').append("<tr><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + RefNo + "" + RefNoSerial + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + CreatedDate + "</div></td><td width='25%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SupplierName + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SubTotal + "</div></td><td width='10%'><div onclick=\"ActionSelectInvoice('" + ID + "')\">" + SubTotalAmt + "</div></td></tr>");
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
    LoadPurchasedInvoicePayment($('#supplier').val());
}

function getBalance(me) {
    $(me).closest("tr").find(".apply").val($(me).closest("tr").find(".balance").val());
}

function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

function LoadPurchasedInvoicePayment(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/PurchasedPaymentSupplierSelect",
        data: "{'id':'" + id + "' }",
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
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

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
            getCashPayment(id);
            getCheckPayment(id);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function getCashPayment(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

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
                $('#amount').val(data[i]["Amount"]);
                $('#txtTotalCash').val(data[i]["Amount"]);

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function getCheckPayment(id) {
    var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';

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


function ComputeCashPayment() {
    var amount = $('#amount').val();
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

function ComputeTotalPayment() {
    var amountCash = $('#txtTotalCash').val();
    var amountCheck = $('#txtTotalCheck').val();
    var NewTotal = Number(amountCash) + Number(amountCheck);
    $('#txtPaymentAmount').val(NewTotal);

}


function SavingPayment() {
    alert('1');
    var refNo = $('#txtPaymentRef').val();
    var amount = $('#amount').val();
    var tableCheck = GenerateCheckTable();
    var totalAmount = $('#txtPaymentAmount').val();
    var salesInvoice = GenerateSalesTable();

    if (amount == "") {
        amount = "0";
    }

    if (amount == "0") {

    }
    else {
        if (refNo != "" && refNo != null) {
            if ($('#hdnPaymentID').val() == "0") {
                var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
                $.ajax({
                    type: "POST",
                    url: pageUrl + "/SaveInvoicePayment",
                    data: "{'invoiceid':'0', 'refNo':'" + refNo + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'totalAmount':'" + totalAmount + "', 'salesInvoice':'" + salesInvoice + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
            else {
                //var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
                //$.ajax({
                //    type: "POST",
                //    url: pageUrl + "/UpdateInvoicePayment",
                //    data: "{'id':'" + $('#hdnPaymentID').val() + "', 'amount':'" + amount + "', 'checkTable':'" + tableCheck + "', 'totalAmount':'" + totalAmount + "'}",
                //    contentType: "application/json; charset=utf-8",
                //    dataType: "json",
                //    crossdomain: true,
                //    success: function (response) {
                //    },
                //    error: function (response) {
                //        alert(response.status);
                //    }
                //});
            }
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
    $('#xPurchaseList_table tbody tr').each(function (i) {

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