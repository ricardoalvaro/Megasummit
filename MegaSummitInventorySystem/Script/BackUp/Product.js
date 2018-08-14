/// <reference path="https://code.jquery.com/jquery-3.3.1.js" />
/// <reference path="ValidateEntry.js" />

// ****************************************************************************************
// ---------------------------------- LOAD SYSTEM DEFAULT DATA ----------------------------
// ****************************************************************************************



var result;
var sta = 0;
var elements_per_page = 25;
var limit = elements_per_page;
var max_size = 0;

ShowActiveTab('initial');
LoadAllProduct();   

// ----------------------------------------- Show Active Tab
function ShowActiveTab(me) {

    //hide all action
    $('.block-right').each(function myfunction() {
        $(this).find(".ym-gbox").hide();
    });

    //hide all div container
    
    $('#main').each(function myfunction() {
        $(this).find("._cont").hide();
    });

    $('#submenu').each(function myfunction() {
        $(this).find("li").removeClass("active form view");
    });

    $('.submenu').hide();

    if (me == 'initial') {
        $("#action_product").show();
        $("#xProductList").show();
       // $('.submenu').show();


        //action default 
        $('#action_product .save').addClass('disabled');
        $('#action_product .delete').addClass('disabled');
        $('#action_product .new').removeClass('disabled');
        $('#action_product .find').removeClass('disabled');
    }
    else if (me == 'general_info') {
        $('.submenu').show();
        $("#general_info").addClass("active form");
        $("#xGeneralInfo").show();
        $("#action_product").show();


        $('#action_product .save').addClass('disabled');
        $('#action_product .delete').addClass('disabled');
        $('#action_product .new').removeClass('disabled');
        $('#action_product .find').removeClass('disabled');

    }

    else if (me == 'stock_card') {
        $('.submenu').show();
        $("#stock_card").addClass("active form");
        $("#xStockCards").show();
        $("#action_stock_card").show();

        $('#action_stock_card .save').removeClass('disabled');
        $('#action_stock_card .delete').addClass('disabled');
        $('#action_stock_card .new').addClass('disabled');
        $('#action_stock_card .find').addClass('disabled');

    }
    else if (me == 'customer_item') {
        $('.submenu').show();
        $("#customer_item").addClass("active form");
        $("#xCustomerItems").show();
        $("#action_customer_item").show();

        $('#action_customer_item .save').removeClass('disabled');
        $('#action_customer_item .delete').addClass('disabled');
        $('#action_customer_item .new').addClass('disabled');
        $('#action_customer_item .find').addClass('disabled');

    }
    else if (me == 'supplier_item') {
        $('.submenu').show();
        $("#supplier_item").addClass("active form");
        $("#xSupplierItems").show();
        $("#action_supplier_item").show();

        $('#action_supplier_item .save').removeClass('disabled');
        $('#action_supplier_item .delete').addClass('disabled');
        $('#action_supplier_item .new').addClass('disabled');
        $('#action_supplier_item .find').addClass('disabled');


    }
    else if (me == 'location_tab') {
        $('.submenu').show();
        $("#location_tab").addClass("active form");
        $("#xLocation").show();
        $("#action_location").show();

        $('#action_location .save').removeClass('disabled');
        $('#action_location .delete').addClass('disabled');
        $('#action_location .new').addClass('disabled');
        $('#action_location .find').addClass('disabled');

    }
}

// ----------------------------------------- Create New Product
function ActionNewProduct(me) {

    if ($(me).hasClass("disabled") == false) {

        LoadProductDepartment();
        LoadLocation();
        LoadPacking();
        LoadUnits();
        LoadSubUnit();

        $('.submenu').show();
        $("#hdn_product_id").val('0');

        //clear product data

        $('#action_product .save').removeClass('disabled');
        $('#action_product .delete').addClass('disabled');
        $('#action_product .new').addClass('disabled');
        $('#action_product .find').addClass('disabled');


        $('#main').each(function myfunction() {
            $(this).find("._cont").hide();
        });

        $('.block-right').each(function myfunction() {
            $(this).find(".ym-gbox").hide();
        });


        $("#xGeneralInfo").show();
        $("#xProductSubMenu").show();
        $("#action_product").show();

    }

}
    
// *****************************************************************************************
// ------------------------------------ ACCESSING DATABASE ---------------------------------
// *****************************************************************************************

// ------------------------------------------ Load Products (AutoComplete)
function ProductAutoCompleteByName() {
    

    var pageUrl = '/Webservice/svr_Product.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteProduct",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_product_search").autocomplete({
                source: response.d,
                minLength: 0,
                minChars: 0,
                max: 12,
                autoFill: true,
                matchContains: false
            })

                .on('focus', function (event) {
                    var self = this;
                    $(self).autocomplete("search", "");
                });
        },

        error: function (response) {
            alert(response.status);
        }

    });


    $("#txt_product_search").autocomplete({
        select: function (a, b) {

            ActionSelectSingleProduct(b.item.id)
        }
    });
}

// ------------------------------------------ Search Product
function ActionSearchCustomer(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_product .save').addClass('disabled');
        $('#action_product .delete').addClass('disabled');
        $('#action_product .new').addClass('disabled');
        $('#action_product .find').addClass('disabled');

  
        $('#main').each(function myfunction() {
            $(this).find("._cont").hide();
        });

        $("#xProductSearch").show();

        $('#txt_product_search').val('');
        $('#txt_product_search').focus();
        ProductAutoCompleteByName();
    }
}

//------------------------------------------- Load Product Department
function LoadProductDepartment() {

    var pageUrl = '/Webservice/svr_ProductDepartment.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductDepartment",
        data: "{'id':'0','product_department_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#product_department').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#product_department').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ProductDepartmentName"] + "</option>");

            }

            LoadProductClass();
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------ Load Product Class
function LoadProductClass() {

    var id = $("#product_department").val();

    var pageUrl = '/Webservice/svr_ProductClass.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductClass",
        data: "{ 'id':'0', 'product_department_id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#product_class");
            table.empty();
            var range_data = data;

            //alert(range_data);
            for (var i = 0; i < range_data.length; i++) {

                table.append("<option value='" + data[i]["ID"] + "' >" + data[i]["ProductClassName"] + "</option>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------ Load List of Location
function LoadLocation() {

    var pageUrl = '/Webservice/svr_Location.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectLocation",
        data: "{'id':'0','location_name':'' }",
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

// ------------------------------------------ Load Product Packing
function LoadPacking() {

    var pageUrl = '/Webservice/svr_Packing.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectPacking",
        //(long id, long packing,long unit_id,long packing2,long sub_unit_id)
        data: "{ 'id':'0', 'packing':'0', 'unit_id':'0','packing2':'0','sub_unit_id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#packing').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#packing').append("<option value='" + data[i]["ID"] + "'>" + data[i]["Packing"] +"</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------ Load Product Units
function LoadUnits() {
    var pageUrl = '/Webservice/svr_Unit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectUnit",
        data: "{ 'id':'0', 'unit':'', 'plural':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#units').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#units').append("<option value='" + data[i]["ID"] + "'>" + data[i]["UnitName"] +  "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------ Load PRoduct Sub-Units
function LoadSubUnit() {

    var pageUrl = '/Webservice/svr_SubUnit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSubUnit",
        data: "{ 'id':'0', 'sub_unit_name':'', 'plural':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#sub_units').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#sub_units').append("<option value='" + data[i]["ID"] + "'>" + data[i]["SubUnitName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------ Load All Products
function LoadAllProduct() {
    var pageUrl = '/Webservice/svr_Product.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProduct",

        data: "{'id':'0','product_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            result = eval(response.d);

            //------------paging---------------------
            max_size = result.length;

            if (max_size < limit) {
                limit = max_size;
            }

            goFun(sta, limit);
            //----------------------------

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------ Load Product Stock Cards
function LoadStockCard() {
    var pageUrl = '/Webservice/svr_Product.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectStockCard",
        data: "{'id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#StockCard_Table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#StockCard_Table tbody:last').append("<tr><td width='9%'><div>" + data[i]["ReferenceNo"] + "</div></td><td width='8%'><div>" + data[i]["DateTransaction"] + "</div></td><td width='12%'><div>" + data[i]["TransactionType"] + "</div></td><td width='20%'><div>" + data[i]["CustomerSupplier"] + "</div></td><td width='5%'><div>" + data[i]["QtyIN"] + "</div></td><td width='5%'><div>" + data[i]["QtyOUT"] + "</div></td><td width='5%'><div>" + data[i]["ProductCost"] + "</div></td><td width='8%'><div>" + data[i]["Discount"] + "</div></td><td width='8%'><div>" + "0" + "</div></td></tr>");

            }
            for (var i = 0; i < 20; i++) {
                $('#StockCard_Table tbody:last').append("<tr><td width='9%'><div></div></td><td width='8%'><div></div></td><td width='12%'><div></div></td><td width='20%'><div></div></td><td width='5%'><div></div></td><td width='5%'><div></div></td><td width='5%'><div></div></td><td width='8%'><div></div></td><td width='8%'><div></div></td></tr>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------ Load Customer Items
function LoadCustomerItem(id) {
    for (var i = 0; i < 25; i++) {
        $('#CustomerItem_Table tbody:last').append("<tr><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='35%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td></tr>");

    }
    var pageUrl = '/Webservice/svr_Product.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCustomerItem",
        data: "{'productID':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#CustomerItem_Table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#CustomerItem_Table tbody:last').append("<tr><td width='12%'><div>" + data[i]["ReferenceNo"] + "</div></td><td width='12%'><div>" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></td><td width='35%'><div>" + data[i]["CustomerName"] + "</div></td><td width='12%'><div>" + data[i]["Quantity"] + "</div></td><td width='12%'><div>" + data[i]["UnitPrice"] + "</div></td><td width='12%'><div>" + data[i]["Discount"] + "</div></td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#CustomerItem_Table tbody:last').append("<tr><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='35%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td></tr>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------ Load Supplier Items
function LoadSupplierItem(id) {
    for (var i = 0; i < 25; i++) {
        $('#SupplierItem_Table tbody:last').append("<tr><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='35%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td></tr>");

    }

    var pageUrl = '/Webservice/svr_Product.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSupplierItem",
        data: "{'productID':'" + id + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#SupplierItem_Table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#SupplierItem_Table tbody:last').append("<tr><td width='12%'><div>" + data[i]["ReferenceNo"] + "</div></td><td width='12%'><div>" + ToJavaScriptDate(data[i]["CreatedDate"]) + "</div></td><td width='35%'><div>" + data[i]["SupplierName"] + "</div></td><td width='12%'><div>" + data[i]["Quantity"] + "</div></td><td width='12%'><div>" + data[i]["UnitPrice"] + "</div></td><td width='12%'><div>" + data[i]["Discount"] + "</div></td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#SupplierItem_Table tbody:last').append("<tr><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='35%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td></tr>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
    for (var i = 0; i < 50; i++) {
        $('#SupplierItem_Table tbody:last').append("<tr><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='35%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td></tr>");

    }
}


// ------------------------------------------ Load Supplier Items
function LoadPreOrder() {

    var pageUrl = '/Webservice/svr_Product.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductPreOrder",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#preOder_table tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#preOder_table tbody:last').append("<tr><td width='30%'> " + data[i]["ProductName"] + "</td><td width='12%'>" + data[i]["QtyOnHand"] + "</td><td width='12%'>" + data[i]["ReOrderQty"] + "</td><td width='12%'>" + data[i]["QtyDemand"] + "</td><td width='12%'>0</td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#preOder_table tbody:last').append("<tr><td width='30%'></td><td width='12%'></td><td width='12%'></td><td width='12%'></td><td width='12%'></td></tr>");

            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
    for (var i = 0; i < 50; i++) {
        $('#preOder_table tbody:last').append("<tr><td width='30%'></td><td width='12%'></td><td width='12%'></td><td width='12%'></td><td width='12%'></td></tr>");

    }
}


// ------------------------------------------ Put Product in the List
function goFun(sta, limit) {

    $('#tblProduct tbody').empty();

    for (var i = sta ; i < limit; i++) {

        var $nr = $("<tr onclick=\"ActionSelectSingleProduct('" + result[i]['ID'] + "')\" ><td width='35%'>" + result[i]['ProductName'] + "</td><td width='10%'>" + "0" + "</td><td width='10%'>" + "0" + "</td><td width='8%'>" + result[i]['UnitID'] + "</td><td width='8%'>" + "0.00" + "</td><td width='8%'>" + "0.00" + "</td><td width='10%'>" + "0.00" + "</td><td width='10%'>" + result[i]['QtyDiff'] + "</td></tr>");

        $('#tblProduct tbody:last').append($nr);
    }


    for (var i = 0 ; i < 50; i++) {
        $('#tblProduct tbody:last').append("<tr><td width='20%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
    }

}

// ------------------------------------------ Next Page of Product List
$('#nextValue').click(function () {

    var next = limit;
    if (max_size > next) {
        limit = limit + elements_per_page;
        $('#tblProduct tbody').empty();
        goFun(next, limit);
    }
});

// ------------------------------------------ Previous Page of Product List
$('#PreeValue').click(function () {
    var pre = limit - (2 * elements_per_page);
    if (pre >= 0) {
        limit = limit - elements_per_page;
        $('#tblProduct tbody').empty();
        goFun(pre, limit);
    }
});

LoadProductOpeningBalance();
LoadLocationOpeningBalance();
LoadProductOpeningBalanceRef();

// ------------------------------------------ Load List of Product
function LoadProductOpeningBalance() {

    var pageUrl = '/Webservice/svr_Product.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductOpeningBalance",
        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#productOpening').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#productOpening').append("<option value='" + data[i]["ID"] + "'>" + data[i]["ProductName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------ Load List of Location
function LoadLocationOpeningBalance() {

    var pageUrl = '/Webservice/svr_Location.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectLocation",
        data: "{'id':'0','location_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#locationOpeningBalance').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#locationOpeningBalance').append("<option value='" + data[i]["ID"] + "'>" + data[i]["LocationName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------ Load Product Opening Balance Reference
function LoadProductOpeningBalanceRef() {

    var pageUrl = '/Webservice/svr_Product.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductOpeningBalanceRef",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#locationOpening').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i]["Automatic"]) {
                    $('#reference_letter').val(data[i]["Prefix"]);
                    $('#reference_number').val(data[i]["NextNo"]);
                }
                else {
                    $('#reference_letter').val(data[i]["Prefix"]);
                    $('#reference_number').val("");
                }

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Load Product Information Details
function ActionSelectProductDetails() {
    var pageUrl = '/Webservice/svr_CustomerSales.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProductDetails",
        data: "{ 'id':'" + $('#productOpening').val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#unit').val(data[i]["UnitName"]);
                
            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Compute Product Price Amount
function ActionComputeAmount() {
    var qty = $("#quantity").val();
    var price = $("#unit_price").val();
    var total = Number(price) * Number(qty);
    $("#amount").val(total.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));

}


// *****************************************************************************************
// -------------------------------- PROCESSING USER DATA -----------------------------------
// *****************************************************************************************

// ------------------------------------------ Saving or Updating Product Information
function ActionSaveUpdateProduct(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Product.asmx';
        var id = $("#hdn_product_id").val();
        var product_picture = "";
        var product_name = $("#product_name").val();
        var brand = $("#brand").val();
        var upc_sku = $("#upc_sku").val();
        var product_department = $("#product_department").val();
        var product_class = $("#product_class").val();
        var location = $("#location").val();
        var qty_on_hand = $("#qty_on_hand").val();
        var qty_available = $("#qty_available").val();
        var qty_so = $("#qty_so").val();
        var qty_po = $("#qty_po").val();
        var reorder_product = $("#reorder_product").val();
        var reorder_qty = $("#reorder_qty").val();
        var notes = $("#notes").val();
        var packing = $("#packing").val();

        var units = $("#units").val();
        var sub_units = $("#sub_units").val();

        var price_a = $("#price_a").val();
        var price_c = $("#price_c").val();
        var price_b = $("#price_b").val();

        var discount_a = $("#discount_a").val();
        var discount_b = $("#discount_b").val();
        var discount_c = $("#discount_c").val();

        // alert(packing);


        if (id == '0') {


            //==================
            var fileUpload = $("#uploadFile").get(0);
            var files = fileUpload.files;
            var data = new FormData();
            var hasValue = false;
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
                hasValue = true;
            }

            if (hasValue) {
                $.ajax({
                    url: "/Webservice/ProductUpload.ashx",
                    type: "POST",
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function (result) {


                        product_picture = result;

                        var pageUrl = '/Webservice/svr_Product.asmx';
                        var data_transfer = "{'product_picture':'{0}','product_name':'{1}','brand':'{2}','upc_sku':'{3}','product_department_id':'{4}','product_class_id':'{5}','reorder_point':'{6}','reorder_qty':'{7}','notes':'{8}','packing_id':'{9}','unit_id':'{10}','sub_unit_id':'{11}','price_a':'{12}','price_b':'{13}','price_c':'{14}','discount_a':'{15}','discount_b':'{16}','discount_c':'{17}'}"
                            .f(
                            product_picture,
                            product_name,
                            brand,
                            upc_sku,
                            product_department,
                            product_class,
                            reorder_product,
                            reorder_qty,
                            notes,
                            packing,
                            units,
                            sub_units,
                            price_a,
                            price_b,
                            price_c,
                            discount_a,
                            discount_b,
                            discount_c);


                        $.ajax({
                            type: "POST",
                            url: pageUrl + "/InsertProduct",
                            data: data_transfer,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            crossdomain: true,
                            success: function (response) {
                                ActionSaveUpdateProduct();
                                window.location.href = "aspnetProduct.aspx";

                            },
                            error: function (response) {
                                alert(response.status);
                            }
                        });

                    },
                    error: function (err) {
                        alert(err.statusText)
                    }
                });
            }
            else {
                var pageUrl = '/Webservice/svr_Product.asmx';
                //InsertProduct(string product_picture, string product_name, string brand, string upc_sku, long product_department_id, long product_class_id, decimal reorder_point, decimal reorder_qty, string notes, long packing_id, long unit_id, long sub_unit_id, decimal price_a, decimal price_b, decimal price_c, decimal discount_a, decimal discount_b, decimal discount_c)
                var data_transfer = "{'product_picture':'{0}','product_name':'{1}','brand':'{2}','upc_sku':'{3}','product_department_id':'{4}','product_class_id':'{5}','reorder_point':'{6}','reorder_qty':'{7}','notes':'{8}','packing_id':'{9}','unit_id':'{10}','sub_unit_id':'{11}','price_a':'{12}','price_b':'{13}','price_c':'{14}','discount_a':'{15}','discount_b':'{16}','discount_c':'{17}'}"
                   .f(
                   product_picture,
                   product_name,
                   brand,
                   upc_sku,
                   product_department,
                   product_class,
                   reorder_product,
                   reorder_qty,
                   notes,
                   packing,
                   units,
                   sub_units,
                   price_a,
                   price_b,
                   price_c,
                   discount_a,
                   discount_b,
                   discount_c);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertProduct",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {
                        ActionSaveUpdateProduct();
                        window.location.href = "aspnetProduct.aspx";

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });

            }

            //====================

        } else {

            //UpdateProduct(long id,string product_picture, string product_name, string brand, string upc_sku, long product_department_id, long product_class_id, decimal reorder_point, decimal reorder_qty, string notes, long packing_id, long unit_id, long sub_unit_id, decimal price_a, decimal price_b, decimal price_c, decimal discount_a, decimal discount_b, decimal discount_c)

            var pageUrl = '/Webservice/svr_Product.asmx';

            var data_transfer = "{'id':'{0}','product_picture':'{1}','product_name':'{2}','brand':'{3}','upc_sku':'{4}','product_department_id':'{5}','product_class_id':'{6}','reorder_point':'{7}','reorder_qty':'{8}','notes':'{9}','packing_id':'{10}','unit_id':'{11}','sub_unit_id':'{12}','price_a':'{13}','price_b':'{14}','price_c':'{15}','discount_a':'{16}','discount_b':'{17}','discount_c':'{18}'}"
                .f(id, product_picture, product_name, brand, upc_sku, product_department, product_class, reorder_product, reorder_qty, notes, packing, units, sub_units, price_a, price_b, price_c, discount_a, discount_b, discount_c);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateProduct",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    ActionSaveUpdateProduct();
                    window.location.href = "aspnetProduct.aspx";
                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }



    }

}

// ------------------------------------------ Load Product Information
function ActionSelectSingleProduct(id) {

    $("#hdn_product_id").val(id);

    LoadProductDepartment();
    LoadLocation();
    LoadPacking();
    LoadUnits();
    LoadSubUnit();

    $('#action_product .save').removeClass('disabled');
    $('#action_product .delete').removeClass('disabled');
    $('#action_product .new').addClass('disabled');
    $('#action_product .find').addClass('disabled');


    var pageUrl = '/Webservice/svr_Product.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectProduct",
        data: "{ 'id':'" + id + "', 'product_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {


                
                $("#hdnProductID").val(data[i]["ID"]);
                $("#img_company").attr("src", "/image/" + data[i]["ProductPicture"]);
                $("#product_name").val(data[i]["ProductName"]);
                $("#brand").val(data[i]["Brand"]);
                $("#upc_sku").val(data[i]["UPCSKU"]);
                $("#product_department").val(data[i]["ProductDepartmentID"]);
                $("#product_class").val(data[i]["ProductClassID"]);
                $("#reorder_product").val(data[i]["ReOrderPoint"]);
                $("#reorder_qty").val(data[i]["ReOrderQty"]);
                $("#notes").val(data[i]["Notes"]);
                $("#packing").val(data[i]["PackingID"]);
                $("#units").val(data[i]["UnitID"]);
                $("#sub_units").val(data[i]["SubUnitID"]);
                $("#price_a").val(data[i]["PriceA"]);
                $("#price_b").val(data[i]["PriceB"]);
                $("#price_c").val(data[i]["PriceC"]);
                $("#discount_a").val(data[i]["DiscountA"]);
                $("#discount_b").val(data[i]["DiscountB"]);
                $("#discount_c").val(data[i]["DiscountC"]);
                LoadCustomerItem(data[i]["ID"]);
                LoadSupplierItem(data[i]["ID"]);
            }
            

        },
        error: function (response) {
            alert(response.status);
        }
    });

    $('#main').each(function myfunction() {
        $(this).find("._cont").hide();
    });

    

    $("#xGeneralInfo").show();
    $("#xProductSubMenu").show();
    $("#action_product").show();

}

// ------------------------------------------ Delete Product Information
function ActionDeleteProduct(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_product_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Product.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteProduct",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    window.location.href = "aspnetProduct.aspx";

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

// ------------------------------------------ Converting System Date to Javascript Date
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}

// ------------------------------------------ Saving or Updating Product Information
function ActionSaveUpdateProduct() {
    
    var pageUrl = '/Webservice/svr_Product.asmx';

    var productID = $('#productOpening').val();
    var locationID = $('#locationOpeningBalance').val();
    var qty = $('#quantity').val();
    var refNo = $('#reference_letter').val() + "" + $('#reference_number').val();
    var dateCreated = $('#date').val();
    var price = $('#unit_price').val();
    var discount = $('#discount').val();

    $.ajax({
        type: "POST",
        url: pageUrl + "/InsertProductOpeningBalance",
        data: "{'productID':'" + productID + "', 'locationID':'" + locationID + "', 'qty':'" + qty + "', 'refNo':'" + refNo + "', 'dateCreated':'" + dateCreated + "', 'price':'" + price + "', 'discount':'" + discount + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
            window.location.href = "aspnetProduct.aspx";
        },
        error: function (response) {
            alert(response.status);
        }
    });
}
