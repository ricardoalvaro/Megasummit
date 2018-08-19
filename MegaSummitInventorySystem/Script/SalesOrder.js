/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------
var CustomerID = 0;
var SalesOrderID = 0;
var helper = new Helper();


$(document).ready(function () {

    SalesOrderID = Number(helper.GetQuerystring()["salesOrderID"]);
    if (!$.isNumeric(SalesOrderID) || SalesOrderID <= 0) {
        SalesOrderID = 0;
    } 

    $("#hold").click(function () { alert('Not Working'); });

    $("#btn-save").removeClass("disabled").click(function () { SaveInvoice(this); });

    GenerateStaticInvoiceList();
    GenerateDynamicAutoComplete();

    $("#customer").change(function (event) {
        ClearCustomerData(this);
    });

    

    $(':input').on('input', function () { // do not allow single quote and double quote 
        this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
    });

    Fill();
});



function ClearCustomerData(me) {
    if ($(me).val() == '') {
        CustomerID = 0;
        $('#address').val('');
    }
}

function GenerateDynamicAutoComplete() {
    $("#tblSalesOrder tbody tr").find('td').each(function () {

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

        $(this).find(".served").change(function () { ComputeComponentAmount(this); });
    });
}



function GenerateStaticInvoiceList() {

    
    var ret = "";
    for (var i = 0; i < 20; i++) {
        $("#tblSalesOrder tbody").append("<tr><td width='20%'><input type='text' class='product' /><input type='hidden' class='product_id' /></td><td width='10%'><input type='text' class='location' /><input type='hidden' class='location_id' /></td><td width='10%'><input type='text' class='quantity' /></td><td width='10%'><input type='text' class='served' /></td><td width='10%'><input type='text' class='unit' /></td><td width='10%'><input type='text' class='price' /></td><td width='10%'><input type='text' class='discount' /></td><td width='10%'><input type='text' class='amount' /></td></tr>");
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
    $("#tblSalesOrder tbody tr").find('td').each(function () {
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

            serve  += Number(ComputeAmount(Number(_serve) * Number(price), dis))
        }
    });

    
    //alert(total_amount);
    $("#spnTotal").html(total);
    $("#spnServed").html(serve);
    $("#spnBalance").html(total - serve);
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

