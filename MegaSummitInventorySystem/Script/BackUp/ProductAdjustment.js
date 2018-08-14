

// ***************************************************************************************
// ------------------------------------- SELECTING DATA ----------------------------------
// ***************************************************************************************

// ------------------------------------------- Create New Adjustment
function NewAdjustment() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    $('#hdnAdjustmentID').val("0");

    LoadProduct();
    LoadLocation();
    LoadReason();
    LoadReference();

    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    $('#date').val(month + "." + day + "." + year);

}

// ------------------------------------------- Load All Product
function LoadProduct() {

    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProduct",
        data: "{'id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#product').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#product').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ProductName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Location
function LoadLocation() {

    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectLocation",
        data: "{'id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#location').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#location').append("<option value='" + data[i]["ID"] + "'>" + data[i]["LocationName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Reason Of Adjustment
function LoadReason() {

    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReason",
        data: "{'id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#reason_adjustment').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#reason_adjustment').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ReasonName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load All Reason Of Adjustment
function LoadProductStock() {

    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductStock",
        data: "{'productID':'" + $('#product').val() + "', 'locationID':'" + $('#location').val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {

                    $('#current_quantity').val(data[i]["StockValue"]);

                }
            }
            else {
                $('#current_quantity').val("0");
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Reference Initial
function LoadReference() {
    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReference",
        data: "{'referenceID':'13'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#reference_letter').val(data[i]["Prefix"]);
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

// ------------------------------------------- Load All Inventory Adjustment
function LoadInventoryAdjustment(id) {
    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectInventoryAdjustment",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            $('#ulInvAdjustment').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ulInvAdjustment").append("<li onclick='LoadInventoryAdjustmentDetails(" + data[i]["ID"] + ");'><a><span class='ym-clearfix'><span class='name'> " + data[i]["Prefix"] + "" + data[i]["RefNumber"] + "<span><div style='float: left;'>" + ToJavaScriptDate(data[i]["DateCreated"]) + "</div></span></span></a> </li>");
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Inventory Adjustment Details
function LoadInventoryAdjustmentDetails(id) {

    LoadProduct();
    LoadLocation();
    LoadReason();
    LoadReference();

    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectInventoryAdjustment",
        data: "{'id':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#toolbar .save').removeClass('disabled');
            $('#toolbar .new').addClass('disabled');
            $('#toolbar .find').addClass('disabled');

            $('#hdnAdjustmentID').val(id);

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#reference_letter').val(data[i]["Prefix"]);
                $('#reference_number').val(data[i]["RefNumber"]);
                $('#product').val(data[i]["ProductID"]);
                $('#location').val(data[i]["LocationID"]);
                $('#current_quantity').val(data[i]["CurrQty"]);
                $('#new_quantity').val(data[i]["NewQty"]);
                $('#quantity_difference').val(data[i]["DiffQty"]);
                $('#unit_price').val(data[i]["ID"]);
                $('#reason_adjustment').val(data[i]["ReasonAd"]);
                $('#date').val(ToJavaScriptDate(data[i]["DateCreated"]));
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ***************************************************************************************
// -------------------------------------- COMPUTATION ------------------------------------
// ***************************************************************************************

// ------------------------------------------- Compute Quantity Defference
function ComputeQuantityDifference() {
    var QtyDiff = 0;
    var QtyCurr = Number($("#current_quantity").val());
    var QtyNew = Number($("#new_quantity").val());
    //if (QtyCurr > QtyNew) {
        QtyDiff = QtyNew - QtyCurr;
    //}
    //else {
    //    QtyDiff = QtyNew - QtyCurr;
    ///}
    $("#quantity_difference").val(QtyDiff);
}

// ***************************************************************************************
// -------------------------------------- SAVING DATA ------------------------------------
// ***************************************************************************************

// ------------------------------------------- Saving Customer Sales Invoice
function SavingAdjustment() {

    var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

    var refNO = $('#reference_letter').val();
    var referenceNumber = $('#reference_number').val();
    var productID = $('#product').val();
    var locationID = $('#location').val();
    var CurrQty = $('#current_quantity').val();
    var NewQty = $('#new_quantity').val();
    var DiffQty = $('#quantity_difference').val();
    var NewPrice = $('#unit_price').val();
    var reasonID = $('#reason_adjustment').val();

    if ($('#hdnAdjustmentID').val() != 0) {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateInventoryAdjustment",
            data: "{'id':'" + $('#hdnAdjustmentID').val() + "','refNO':'" + refNO + "', 'referenceNumber':'" + referenceNumber + "', 'productID':'" + productID + "', 'locationID':'" + locationID + "', 'CurrQty':'" + CurrQty + "', 'NewQty':'" + NewQty + "', 'DiffQty':'" + DiffQty + "', 'NewPrice':'" + NewPrice + "', 'reasonID':'" + reasonID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadInventoryAdjustment("0");
            },
            error: function (response) {
                alert(response.status);
            }
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertInventoryAdjustment",
            data: "{'refNO':'" + refNO + "', 'referenceNumber':'" + referenceNumber + "', 'productID':'" + productID + "', 'locationID':'" + locationID + "', 'CurrQty':'" + CurrQty + "', 'NewQty':'" + NewQty + "', 'DiffQty':'" + DiffQty + "', 'NewPrice':'" + NewPrice + "', 'reasonID':'" + reasonID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadInventoryAdjustment("0");
            },
            error: function (response) {
                alert(response.d);
            }
        });
    }
}

// ***************************************************************************************
// --------------------------------- PROCESSING USER DATA --------------------------------
// ***************************************************************************************

// -------------------------------------------------- Converting Date Format
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}