/// <reference path="../js/jquery-3.3.1.slim.min.js" />
//--------Need refactoring----------

var CustomerID = 0;
var SalesInvoiceID = 0;
var helper = new Helper();

$(document).ready(function () {

    SalesInvoiceID = Number(helper.GetQuerystring()["invoiceID"]);
    if (!$.isNumeric(SalesInvoiceID) || SalesInvoiceID <= 0) {
        SalesInvoiceID = 0;
    }else    {
        $("#void").click(function () {
            VoidSalesInvoice();
        });
    }

    $("#hold").click(function () { alert('Not Working'); });
   
    $("#btn-save").removeClass("disabled").click(function () { SaveInvoice(this); });

    GenerateStaticInvoiceList();
    GenerateDynamicAutoComplete();
    FillSalesOrderDefault();

    $("#customer").change(function (event) {
        ClearCustomerData(this);
    });

    $("#order_number").change(function () {
        FillSalesOrder($(this).val());
    });

    $("#liSalesOrder").click(function () {  $("#liSalesOrder").addClass("active"); if ($(this).hasClass("active") == true) {
            $("#liSalesInvoice").removeClass("active");
            $("#content-sales-order").show();
            $("#content-sales-invoice").hide();
        }

    });

    $("#liSalesInvoice").click(function () {

        $("#liSalesInvoice").addClass("active");
        if ($(this).hasClass("active") == true) {
            $("#liSalesOrder").removeClass("active");
            $("#content-sales-order").hide();
            $("#content-sales-invoice").show();


        }

    });

    $("#slidebtn").click(function () {
        if ($(this).hasClass("down") == true) { $(this).removeClass("down"); $(this).addClass("up"); $("#pane1").removeClass("active"); $("#pane2").addClass("active"); }
    else { $(this).removeClass("up"); $(this).addClass("down"); $("#pane2").removeClass("active"); $("#pane1").addClass("active"); }
    });

    $("#topLink").click(function () {
        if ($(this).hasClass("left") == true) { $(this).removeClass("left"); $(this).addClass("right"); $("#form4").removeClass("active"); $("#form2").addClass("active"); }
        else { $(this).removeClass("right"); $(this).addClass("left"); $("#form2").removeClass("active"); $("#form4").addClass("active"); }
    });

    $("#shipping").change(function () {
        ComputeTotalAmountDue();
    }); //Compute Total Amount Due

    $("#commission_rate").change(function () {

        ComputeCommissionRate();

    });

    $(':input').on('input', function(){ // do not allow single quote and double quote 
        this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
    });

    Fill();
    SelectSaleInvoice();

});

function VoidSalesInvoice()
{
    var pageUrl = '/Webservice/svr_Invoice.asmx';
    var data_transfer = "{'ID':'{0}'}".f(SalesInvoiceID);
    //InvoiceVoid(long ID )
    $.ajax({
        type: "POST",
        url: pageUrl + "/InvoiceVoid",
        data: data_transfer,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            window.location = "aspnetSales.aspx";

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function SelectSaleInvoice()
{
    if (SalesInvoiceID > 0)
    {
        $("#btn-save").addClass("disabled");
        $("#btn-new").removeClass("disabled").click(function () { window.location = 'aspnetSalesInvoice.aspx'; });

        var data = SingleInvoiceData;

        for (var i = 0; i < data.length; i++)
        {
            
            if (data[i]["ID"] == SalesInvoiceID) {

                $("#customer").val(data[i]["CustomerName"]);
                $('#address').val(data[i]["Address"]);
                $('#deliver_to').val(data[i]["ForwarderToID"]);
                $('#salesman').val(data[i]["SalesmanID"]);
                $('#po_number').val(data[i]["PONo"]);
                $('#terms').val(data[i]["TermID"]);

                //$('#reference_no').text().attr('selected',data[i]["RefNo"];

                $("#reference_no option").filter(function() {return $(this).text() == data[i]["RefNo"]; }).prop('selected', true);

                $('#reference_number').val(data[i]["RefNoSerial"]);

                $('#date').val(FormatDate(data[i]["CreatedDate"]));
                $('#delivery_date').val(FormatDate(data[i]["DeliveryDate"]));

                $('#prepared').val(data[i]["PreparedBy"]);
                $('#checked').val(data[i]["CheckedBy"]);
                $('#delivered').val(data[i]["DeliveredBy"]);


                $('#waybill_number').val(data[i]["WayBillNo"]);
                $('#container_number').val(data[i]["ContainerNo"]);
                $('#lading_bill').val(data[i]["BillOfLanding"]);

                $('#commission_rate').val(data[i]["CommissionRate"]);
                $('#commission_amount').val(data[i]["CommissionAmt"]);


                $('#remarks').val(data[i]["RemarksID"]);
                $('#notes').val(data[i]["Notes"]);
                $('#spnInvoiceAmount').html(data[i]["SubTotalAmt"]);
                $('#spnSubTotal').val(data[i]["SubTotalAmt"]);
            
                if (data[i]["TaxAmt"] == '0') {
                    $('#spnTax').html(TaxDefault + '%');
                }
                else {
                    $('#spnTax').html(data[i]["TaxAmt"]);
                }
                


                $('#shipping').val(data[i]["ShippingAmt"]);


                $('#spnPayment').html(Number(data[i]["Payment"]).toFixed(2));
                $('#spnSalesReturn').html(Number(data[i]["SalesReturn"]).toFixed(2));
                $('#spnTotalAmount').html((Number(data[i]["TotalAmount"]) - (Number(data[i]["SalesReturn"]) + Number(data[i]["Payment"]))).toFixed(2));


                var detail = SingleInvoiceDetailsData;

                for (var d = 0; d < detail.length; d++) {

                    $('#tblSalesInvoice tbody tr').each(function (i) {

                        var x2 = $(this).find("td .product").val();
                        if (x2 == "") {

                            $(this).find("td .sales_order_detail_id").val(detail[d]["ID"]);
                            $(this).find("td .packing").val(detail[d]["Packing"]).attr("disabled", "disabled");
                            $(this).find("td .packing_id").val(detail[d]["PackingID"]);
                            $(this).find("td .product").val(detail[d]["ProductName"]).attr("disabled", "disabled");
                            $(this).find("td .product_id").val(detail[d]["ProductID"]);
                            $(this).find("td .location").val(detail[d]["LocationName"]).attr("disabled", "disabled");
                            $(this).find("td .location_id").val(detail[d]["LocationID"]);
                            $(this).find("td .quantity").val(detail[d]["Quantity"]).attr("disabled", "disabled");
                            $(this).find("td .unit").val(detail[d]["UnitName"]).attr("disabled", "disabled");
                            $(this).find("td .price").val(detail[d]["UnitPrice"]).attr("disabled", "disabled");
                            $(this).find("td .discount").val(detail[d]["Discount"]).attr("disabled", "disabled");
                            $(this).find("td .amount").val(detail[d]["Amount"]).attr("disabled", "disabled");
                            return false;
                        }
                    });


                }
            }
        }

    }
}

function SaveInvoice(me)
{
    if ($(me).hasClass("disabled") == false)
    {
        var pageUrl = '/Webservice/svr_Invoice.asmx';

        var invoice_status = "Posted";
        var address = $('#address').val();
        var forwarder_to_id = $('#deliver_to').val();
        var salesman_id = $('#salesman').val();
        var po_no = $('#po_number').val();
        var term_id = $('#terms').val();
        var ref_no = $('#reference_no option:selected').text();
        var ref_no_serial = $('#reference_number').val();
        var created_date = $('#date').val();
        var delivery_date = $('#delivery_date').val();
        var prepared_by = $('#prepared').val();
        var checked_by = $('#checked').val();
        var delivered_by = $('#delivered').val();
        var way_bill_no = $('#waybill_number').val();
        var container_no = $('#container_number').val();
        var bill_of_landing = $('#lading_bill').val();
        var commission_rate = ($('#commission_rate').val() == '') ? '0' : $('#commission_rate').val();
        var commission_amt = ($('#commission_amount').val() == '') ? '0' : $('#commission_amount').val();
        var remarks_id = $('#remarks').val();
        var notes = $('#notes').val();
        var sub_total_amt = $('#spnInvoiceAmount').html().replace(",", "");
        var tax_amt = $('#spnTax').html();
        var shipping_amt = $('#shipping').val();
        var total_amount = $('#spnTotalAmount').html();
        var productList = GetSalesInvoiceDetails();

        //var x = "{'invoice_status':'{0}',  'customer_id':'{1}','address':'{2}', 'forwarder_to_id':'{3}','salesman_id':'{4}',  'po_no':'{5}','term_id':'{6}','ref_no':'{7}','ref_no_serial':'{8}','created_date':'{9}','delivery_date':'{10}','prepared_by':'{11}','checked_by':'{12}','delivered_by':'{13}','way_bill_no':'{14}','container_no':'{15}','bill_of_landing':'{16}','commission_rate':'{17}','commission_amt':'{18}','remarks_id':'{19}','notes':'{20}','sub_total_amt':'{21}','tax_amt':'{22}','total_amount':'{23}','productList':'{24}'}"
        //    .f(invoice_status, CustomerID, address,
        //    forwarder_to_id, salesman_id,
        //    po_no, term_id, ref_no,
        //    ref_no_serial,created_date,
        //    delivery_date, prepared_by,
        //    checked_by, delivered_by,
        //    way_bill_no, container_no,
        //    bill_of_landing, commission_rate,
        //    commission_amt,remarks_id,notes,sub_total_amt,tax_amt,total_amount,productList);

        if (SalesInvoiceID == 0) {//insert 

            var data_transfer = "{'invoice_status':'{0}',  'customer_id':'{1}','address':'{2}', 'forwarder_to_id':'{3}','salesman_id':'{4}',  'po_no':'{5}','term_id':'{6}','ref_no':'{7}','ref_no_serial':'{8}','created_date':'{9}','delivery_date':'{10}','prepared_by':'{11}','checked_by':'{12}','delivered_by':'{13}','way_bill_no':'{14}','container_no':'{15}','bill_of_landing':'{16}','commission_rate':'{17}','commission_amt':'{18}','remarks_id':'{19}','notes':'{20}','sub_total_amt':'{21}','tax_amt':'{22}', 'shipping_amt':'{23}','total_amount':'{24}','productList':'{25}'}"
            .f(invoice_status, CustomerID, address,
            forwarder_to_id, salesman_id,
            po_no, term_id, ref_no,
            ref_no_serial, created_date,
            delivery_date, prepared_by,
            checked_by, delivered_by,
            way_bill_no, container_no,
            bill_of_landing, commission_rate,
            commission_amt, remarks_id, notes, sub_total_amt, tax_amt, shipping_amt, total_amount, productList);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertInvoice",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    window.location = "aspnetSales.aspx";
                    //alert(response.d);

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

function ClearCustomerData(me)
{
    if ($(me).val() == '') {
        CustomerID = 0;
        $('#address').val('');
        $('#spnCreditLimit').html('0');
    }
}

function GetSalesInvoiceDetails()
{
    var list = "";
    $('#tblSalesInvoice tbody tr').each(function (i) {

        var sales_order_detail_id =  ($(this).find("td .sales_order_detail_id").val() == '') ? '0' : $(this).find("td .sales_order_detail_id").val();
        var packing =                $(this).find("td .packing").val();
        var packing_id =             $(this).find("td .packing_id").val();
        var product =                $(this).find("td .product").val();
        var product_id =             $(this).find("td .product_id").val();
        var location =               $(this).find("td .location").val();
        var location_id =            $(this).find("td .location_id").val();
        var quantity =               $(this).find("td .quantity").val();
        var unit =                   $(this).find("td .unit").val();
        var price =                  $(this).find("td .price").val();
        var discount =               ($(this).find("td .discount").val() == '') ? '0' : $(this).find("td .discount").val();
        var amount =                 $(this).find("td .amount").val();


        if (product_id != "") {

            list += sales_order_detail_id + "," + packing + "," + packing_id + "," + product + "," + product_id + "," + location + "," + location_id + "," + quantity + "," + unit + "," + price + "," + discount + "," + amount + "^";
        }
    });

    return list;
}

function FillSalesOrder(customer_id)
{
    if (customer_id != 0)
    {
        //var ret = "<tr><td width='30%'>here</td><td width='15%'>here</td><td width='10%'>here</td><td width='10%'>here</td><td width='10%'>here</td><td width='10%'>here</td><td width='10%'>here</td></tr>";


        var pageUrl = '/Webservice/svr_CustomerSales.asmx';

        $.ajax({
            type: "POST",
            url: pageUrl + "/SalesOrderDetailsInvoiceSelect",
            data: "{'id':'" + $('#order_number').val() + "' }",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                $('#tblSalesOrder tbody').empty();
          
                var data = eval(response.d);
                var obj = "";
                for (var i = 0; i < data.length; i++) {
                    //$('#tblSalesOrder tbody:last').append("<tr><td width='30%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["ProductName"] + "</div></td><td width='15%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["LocationName"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["Quantity"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["UnitName"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["UnitPrice"] + "</td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["Discount"] + "</div></td><td width='10%'><div class='actioncClick' onclick=\"ServerdOrder('" + data[i]["ID"] + "')\">" + data[i]["Amount"] + "</div></td></tr>");
                    $('#tblSalesOrder tbody:last').append("<tr onclick=\"FillSalesInvoiceDetail('" + data[i]["ID"] + "')\"><td width='30%'>" + data[i]["ProductName"] + "</td><td width='15%'>" + data[i]["LocationName"] + "</td><td width='10%'>" + data[i]["Balance"] + "</td><td width='10%'>" + data[i]["UnitName"] + "</td><td width='10%'>" + data[i]["UnitPrice"] + "</td><td width='10%'>" + data[i]["Discount"] + "</td><td width='10%'>" + data[i]["Amount"] + "</td></tr>");
                }

                FillSalesOrderDefault();
                
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
    
}

function FillSalesInvoiceDetail(ID) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderDetailsSelectToIV",
        data: "{'id':'" + ID + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var y = 0; y < data.length; y++) {
                $('#tblSalesInvoice tbody tr').each(function (i) {
               
                    //var x1 = $(this).find("td .packing").val();
                    var x2 = $(this).find("td .product").val();
                    //var x3 = $(this).find("td .location").val();
                    //var x4 = $(this).find("td .qty_product").val();
                    //var x5 = $(this).find("td .unit").val();
                    //var x6 = $(this).find("td .price").val();
                    //var x7 = $(this).find("td .discount").val();
                    //var x8 = $(this).find("td .total_amount").val();
                    if (x2 == "") {

                        $(this).find("td .sales_order_detail_id").val(data[y]["ID"]);
                        $(this).find("td .packing").val(data[y]["PackingName"]);
                        $(this).find("td .packing_id").val(data[y]["PackingID"]);
                        $(this).find("td .product").val(data[y]["ProductName"]);
                        $(this).find("td .product_id").val(data[y]["ProductID"]);
                        $(this).find("td .location").val(data[y]["LocationName"]);
                        $(this).find("td .location_id").val(data[y]["LocationID"]);
                        $(this).find("td .unit").val(data[y]["UnitName"]);
                        $(this).find("td .price").val(data[y]["UnitPrice"]);
                        $(this).find("td .discount").val(data[y]["Discount"]);
                        $(this).find("td .quantity").val(data[y]["Quantity"]).trigger('change');
                        return false;
                    }
                });
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function FillSalesOrderDefault()
{
    for (var i = 0; i < 20; i++) {
        $('#tblSalesOrder tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
    }
}

function GenerateDynamicAutoComplete()
{
    $("#tblSalesInvoice tbody tr").find('td').each(function () {

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
    });
}

function GetProductDetails(product_id, me)
{
    var data = ProductDetailData;

    for (var i = 0; i < data.length; i++) {
        if (product_id == data[i]["ID"]) {

            $(me).closest("tr").find(".price").val(data[i]["Cost"]);
            $(me).closest("tr").find(".product_id").val(product_id);
            $(me).closest("tr").find(".unit").val(data[i]["UnitName"]);

            $(me).closest("tr").find(".location").val(data[i]["LocationName"]);
            $(me).closest("tr").find(".location_id").val(data[i]["LocationID"]);

            var pack = PackingData;
            for (var x = 0; x < pack.length; x++) {
                if (data[i]["PackingID"] == pack[x]["ID"])
                {
                    $(me).closest("tr").find(".packing").val(pack[x]["Packing"]);
                    $(me).closest("tr").find(".packing_id").val(pack[x]["ID"]);
                }
            }

            //------bottom reference
            $('#spnPriceA').html(data[i]["PriceA"]);
            $('#spnPriceB').html(data[i]["PriceB"]);
            $('#spnPriceC').html(data[i]["PriceC"]);
            $('#spnDiscA').html(data[i]["DiscountA"]);
            $('#spnDiscB').html(data[i]["DiscountB"]);
            $('#spnDiscC').html(data[i]["DiscountC"]);

            

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


    $(me).closest("tr").find(".amount").val(ComputeAmount(Number(qty) * Number(price), dis));

    var total = 0;
    $("#tblSalesInvoice tbody tr").find('td').each(function () {
        if (!isNaN($(this).find(".amount").val())) {
            var component_amount = $(this).find(".amount").val();

            total = Number(total) + Number(component_amount);
            //console.log(total);
        }
    });

    $("#spnInvoiceAmount").html((total).toFixed(2));
    $("#spnSubTotal").val((total).toFixed(2)).trigger('change');

    var total_amount = 0;
    var tax =  $("#spnTax").html(); 
    var shipping = ($("#shipping").val() == '') ? '0' : $("#shipping").val();

    if (tax.indexOf('%') != -1) { total_amount = Number(total)  + Number(shipping); }
    else { total_amount = Number(total) + Number(tax) + Number(shipping); }


    //alert(total_amount);
    $("#spnTotalAmount").html(total_amount);
    ComputeCommissionRate();
}

function ComputeCommissionRate()
{
    var rate = ($("#commission_rate").val() == '') ? '0' : Number($("#commission_rate").val());
    var total_amount = ($("#spnTotalAmount").html() == '') ? '0' : Number($("#spnTotalAmount").html());

    var comm_amount = (rate / 100) * total_amount;

    $("#commission_amount").val(comm_amount.toFixed(2));
}

function ComputeTotalAmountDue() {

    ComputeCommissionRate();
    var total = Number($("#spnSubTotal").val());

    var total_amount = 0;
    var tax = $("#spnTax").html();
    var shipping = ($("#shipping").val() == '') ? '0' : $("#shipping").val();

    if (tax.indexOf('%') != -1) { total_amount = Number(total) + Number(shipping); }
    else { total_amount = Number(total) + Number(tax) + Number(shipping); }

    $("#spnTotalAmount").html((total_amount));
    ComputeCommissionRate();
}

function ComputeAmount(total, dis) {
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

function GenerateStaticInvoiceList() {
    var ret = "";
    for (var i = 0; i < 20; i++) {
        $("#tblSalesInvoice tbody").append("<tr><td width='20%'><input type='hidden' class='sales_order_detail_id' /><input type='text' class='packing' /><input type='hidden' class='packing_id' /></td><td width='20%'><input type='text' class='product' /><input type='hidden' class='product_id' /></td><td width='10%'><input type='text' class='location' /><input type='hidden' class='location_id' /></td><td width='10%'><input type='text' class='quantity' /></td><td width='10%'><input type='text' class='unit' /></td><td width='10%'><input type='text' class='price' /></td><td width='10%'><input type='text' class='discount' /></td><td width='10%'><input type='text' class='amount' /></td></tr>");
    }
}

    //----------------------------------------------------------
function Fill() {
    FillCustomerAutoComplete(); FillForwarder(); FillSalesman(); FillTerm(); FillDate(); FillRemarks(); FillEmployee(); FillReference(); FillDate(); FillCompanyTax();
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

function FillCustomerDetails(customer_id)
{
    //customer address
    //credit limit
    //invoice balance
    //post dated check
    //available credit

    $('#po_number').val(''); $('#spnCreditLimit').html(''); $('#spnCreditLimit').html('');
    $('#spnCreditLimit').html(''); $('#spnInvoiceBalance').html(''); $('#spnInvoiceBalance').html(''); $('#spnPostDateCheck').html(''); $('#spnAvailableCredit').html('');
    

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
                $('#spnCreditLimit').html(data[i]["CreditLimit"]);

                LoadSalesOrder(customer_id);
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function LoadSalesOrder(CustomerID) {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SalesOrderRefSelect",
        data: "{ 'id':'" + CustomerID + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#order_number').empty();
            $('#order_number').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#order_number').append("<option value='" + data[i]["ID"] + "'>" + data[i]["refNumber"] + "</option>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function FillForwarder()
{

    $('#deliver_to').empty(); //$('#deliver_to').append("<option value='" + "0" + "'>" + "</option>");
    var data = ForwarderData;
    for (var i = 0; i < data.length; i++) { $('#deliver_to').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ForwardedName"] + "</option>"); }

}

function FillSalesman()
{
    $('#salesman').empty(); //$('#salesman').append("<option value='" + "0" + "'>" + "</option>");
    var data = SalesmanData;
    for (var i = 0; i < data.length; i++) { $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>"); }
}

function FillTerm()
{
    $('#terms').empty();// $('#terms').append("<option value='" + "0" + "'>" + "</option>");
    var data = TermData;
    for (var i = 0; i < data.length; i++) { $('#terms').append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>"); }
}

function FillRemarks()
{
    $('#remarks').empty(); //$('#remarks').append("<option value='" + "0" + "'>" + "</option>");
    var data = RemarksData;
    for (var i = 0; i < data.length; i++) { $('#remarks').append("<option value='" + data[i]["ID"] + "'>" + data[i]["RemarksName"] + "</option>"); }
}

function FillReference()
{
    $('#reference_no').empty(); //$('#remarks').append("<option value='" + "0" + "'>" + "</option>");
    var data = RefNoData;
    for (var i = 0; i < data.length; i++) { $('#reference_no').append("<option value='" + data[i]["ID"] + "'>" + data[i]["PrefixInitial"] + "</option>"); }
    
}

function FillEmployee() {
    var data = EmployeeData;

    $('#prepared').empty(); $('#prepared').append("<option value='" + "0" + "'>" + "</option>");
    $('#checked').empty(); $('#checked').append("<option value='" + "0" + "'>" + "</option>");
    $('#delivered').empty(); $('#delivered').append("<option value='" + "0" + "'>" + "</option>");
    
    for (var i = 0; i < data.length; i++)
    {
        $('#prepared').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");
        $('#checked').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");
        $('#delivered').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");
    }
}

function FillCompanyTax()
{
    $("#spnSubTotal").on('change', function () {
        var data = CompanySalesTaxData;

        for (var i = 0; i < data.length; i++) {
            if (data[i]["TaxType"] == 'VAT Inclusive') {

                $('#spnTax').html(Number(data[i]["Rate"]).toFixed(0) + '%');

            }
            else {



                var total = Number($("#spnSubTotal").val());
                var dis_rate = Number(data[i]["Rate"]) / 100;
                var discount = (Number(total) * Number(dis_rate));


                $('#spnTax').html(Number(discount).toFixed(2));




            }
        }
    });
}

function FillDate()
{
    var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
    $('#date').val("0" + month + "/" + day + "/" + year);
    $('#delivery_date').val("0" + month + "/" + day + "/" + year);
    
}

