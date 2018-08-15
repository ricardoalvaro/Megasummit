<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductInformation.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductInformation" %>
<%@ Register Src="~/include/ProductSubMenu.ascx" TagPrefix="uc1" TagName="ProductSubMenu" %>
<%@ Register src="include/ProductSubMenuAjax.ascx" tagname="ProductSubMenuAjax" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .uploadFile {
            visibility: hidden;
        }
        
    </style>
    <uc1:ProductSubMenu runat="server" ID="ProductSubMenu" />
    <div id="main" class="products-product"><div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
        <uc2:ProductSubMenuAjax ID="ProductSubMenuAjax1" runat="server" />
        	    <div class="container one-column withbg">
            <div class="inner">                    	
                <div class="box-holder">                        
                	<div id="content-holder">
                    	<div class="content vmiddle">
                            <div name="products_product_form" id="products_product_form" class="ym-form">
                                <table>
                                	<tr>
                                    	<td>
                                            <table>                                            	
                                            	<tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                            <div class="uploadBox">
                                                                <a href="javascript:void(0)" id="uploadIcon" href="">
                                                                    <img id="img_company" src="image/google.jpg" width="157" height="77" alt="Google" class="image" />
                                                                </a>
                                                                <input type="file" value="upload" id="uploadFile" class="uploadFile" onchange="ShowPreview(this)" />
                                                    </div>

                                                        </td>
                                                </tr>                                                
                                                <tr>
                                                    <td class="lbl"><label for="product_name">*Product Name</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="product_name" name="product_name" value="" class="fullwidth" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="brand">Brand</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="brand" name="brand" value="" class="fullwidth" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="upc_sku">UPC/SKU</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="upc_sku" name="upc_sku" value="" class="fullwidth" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="product_department">*Product Department</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select name="product_department" id="product_department" onchange="LoadProductClass()">
                                                                <option value=""></option>                                                                
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="product_class">*Product Class</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select name="product_class" id="product_class">
                                                                <option value=""></option>                                                                
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="location">*Location</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select name="location" id="location">
                                                                <option value=""></option>                                                                
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>                                                                                     
                                                <tr>
                                                    <td class="lbl"><label for="qty_on_hand">Qty. on Hand</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="qty_on_hand" name="qty_on_hand" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="qty_available">Qty. Available</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="qty_available" name="qty_available" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="qty_so">Qty. S.O.</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="qty_so" name="qty_so" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="qty_po">Qty. P.O.</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="qty_po" name="qty_po" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="reorder_product">*Reorder Point</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="reorder_product" name="reorder_product" value="" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="reorder_qty">*Reorder Qty.</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="reorder_qty" name="reorder_qty" value="" class="short" />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl" valign="top"><label for="notes">Notes</label></td>
                                                    <td class="obj"><textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                </tr>                                       
                                            </table>
                                        </td>
                                        <td width="44"></td>
                                        <td width=>
                                            <table>
                                            	<tr>
                                                	<td colspan="2">
                                                    	<div class="space81"></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="packing">Packing</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select name="packing" id="packing">
                                                                <option value=""></option>                                                             
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="units">*Units</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <div class="select-arrow short">
                                                                    <select name="units" id="units">
                                                                        <option value=""></option>                                                             
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="ave_payable">Sub Units</label>
                                                                <div class="select-arrow short">
                                                                    <select name="sub_units" id="sub_units">
                                                                        <option value=""></option>                                                             
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="price_a">Price A</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="price_a" name="price_a" value="" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="ave_payable">Discount A</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="discount_a" name="discount_a" value="" class="short" />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="price_b">Price B</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="price_b" name="price_b" value="" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="ave_payable">Discount B</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="discount_b" name="discount_b" value="" class="short" />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="price_c">Price C</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="price_c" name="price_c" value="" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="ave_payable">Discount C</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="discount_c" name="discount_c" value="" class="short" />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><div class="horz-divider"></div><div class="space2"></div></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="cost">Cost</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="cost" name="cost" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="last_discount">Last Discount</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_discount" name="last_discount" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="average_cost">Average Cost</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="average_cost" name="average_cost" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="sub_average_cost">Sub Average Cost</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="sub_average_cost" name="sub_average_cost" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <td class="lbl"><label for="total_units_in">Total Units In</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_units_in" name="total_units_in" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="total_units_out">Total Units Out</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_units_out" name="total_units_out" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="date_last_received">Date Last Received</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="date_last_received" name="date_last_received" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="date_last_sold">Date Last Sold</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="date_last_sold" name="date_last_sold" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="qty_difference">Qty. Difference</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="qty_difference" name="qty_difference" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <button type="button" id="btn-opening-balance" class="submit small">Opening Balance</button>
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>	
                        </div>
                    </div>	    
                </div>
            </div>      			
        </div>	

    </div>
</div></div>

    <script src="Script/Helper.js"></script>
    <script type="text/javascript">
        /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
        //--------Need refactoring----------
        var ProductID = 0;

        $(document).ready(function () {
            var helper = new Helper();
           
            ProductID = Number(helper.GetQuerystring()["productID"]);
            if (!$.isNumeric(ProductID) || ProductID <= 0) {
                ProductID = 0; }
            else {
                $('#btn-delete').removeClass('disabled');
                $('#btn-delete').click(function () { DeleteProducts(ProductID, this); });
            }

            LoadProductDepartment();
            LoadLocation();
            LoadPacking();
            LoadUnits();
            LoadSubUnit();


            if ($.trim(ProductID) != 0) { ActionSelectSingleProduct(ProductID); }

            $('#btn-save').removeClass('disabled');

            $('#btn-save').click(function () { SaveProducts(ProductID, this); });


            $("#btn-opening-balance").click(function () {
                if (ProductID > 0) {
                    window.location = "aspnetProductInformationOpeningBalance.aspx?productID=" + ProductID;
                }
            });



        });

        function SaveProducts(productID, me)
        {
            
            if ($(me).hasClass("disabled") == false) {

                var pageUrl = '/Webservice/svr_Product.asmx';
                var id = productID;
                var product_picture = "";
                var product_name = $("#product_name").val();
                var brand = $("#brand").val();
                var upc_sku = $("#upc_sku").val();
                var product_department = ($("#product_department").val() == '') ? "0" : $("#product_department").val();
                var product_class = $("#product_class").val();
                var location = $("#location").val();
                var qty_on_hand = $("#qty_on_hand").val();
                var qty_available = $("#qty_available").val();
                var qty_so = $("#qty_so").val();
                var qty_po = $("#qty_po").val();

            
                var reorder_product = ($("#reorder_product").val() == '') ? '0' : $("#reorder_product").val();
                var reorder_qty = ($("#reorder_qty").val() == '') ? '0' : $("#reorder_qty").val();
                var notes = $("#notes").val();
                var packing = $("#packing").val();

                var units = $("#units").val();
                var sub_units = $("#sub_units").val();

                var price_a = ($("#price_a").val() == '') ? '0' : $("#price_a").val();
                var price_c = ($("#price_c").val() == '') ? '0' : $("#price_c").val();
                var price_b = ($("#price_b").val() == '') ? '0' : $("#price_b").val();

                var discount_a = ($("#discount_a").val() == '') ? '0' : $("#discount_a").val();
                var discount_b = ($("#discount_b").val() == '') ? '0' : $("#discount_b").val();
                var discount_c = ($("#discount_c").val() == '') ? '0' : $("#discount_c").val();


                if (id == 0) {


                    //==================
                    var pageUrl = '/Webservice/svr_Product.asmx';
                    var data_transfer = "{'product_picture':'{0}','product_name':'{1}','brand':'{2}','upc_sku':'{3}','product_department_id':'{4}','product_class_id':'{5}', 'location_id':'{6}' ,'reorder_point':'{7}','reorder_qty':'{8}','notes':'{9}','packing_id':'{10}','unit_id':'{11}','sub_unit_id':'{12}','price_a':'{13}','price_b':'{14}','price_c':'{15}','discount_a':'{16}','discount_b':'{17}','discount_c':'{18}'}"
                    .f(filepath, product_name, brand, upc_sku, product_department, product_class, location, reorder_product, reorder_qty, notes, packing, units, sub_units, price_a, price_b, price_c, discount_a, discount_b, discount_c);

                    $.ajax({
                        type: "POST",
                        url: pageUrl + "/InsertProduct",
                        data: data_transfer,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        crossdomain: true,
                        success: function (response) {
                            window.location.href = "aspnetProductInformation.aspx?productID=" + response.d;

                        },
                        error: function (response) {
                            alert(response.status);
                        }
                    });

                    //====================

                } else {

                    var pageUrl = '/Webservice/svr_Product.asmx';

                    var data_transfer = "{'id':'{0}','product_picture':'{1}','product_name':'{2}','brand':'{3}','upc_sku':'{4}','product_department_id':'{5}','product_class_id':'{6}','location_id':'{7}','reorder_point':'{8}','reorder_qty':'{9}','notes':'{10}','packing_id':'{11}','unit_id':'{12}','sub_unit_id':'{13}','price_a':'{14}','price_b':'{15}','price_c':'{16}','discount_a':'{17}','discount_b':'{17}','discount_c':'{19}'}"
                        .f(id, product_picture, product_name, brand, upc_sku, product_department, product_class, location, reorder_product, reorder_qty, notes, packing, units, sub_units, price_a, price_b, price_c, discount_a, discount_b, discount_c);


                    $.ajax({
                        type: "POST",
                        url: pageUrl + "/UpdateProduct",
                        data: data_transfer,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        crossdomain: true,
                        success: function (response) {
                            window.location.href = "aspnetProductInformation.aspx?productID=" + response.d;
                        },
                        error: function (response) {
                            alert(response.status);
                        }
                    });
                }



            }
        }

        function DeleteProducts(productID, me)
        {
         

            if ($(me).hasClass("disabled") == false) {
                
                if (productID != 0) {

                    var pageUrl = '/Webservice/svr_Product.asmx';

                    var data_transfer = "{'id':'{0}'}"
                        .f(productID);


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

            window.location = "aspnetProduct.aspx";
        }

        //Load Product single item
        function ActionSelectSingleProduct(id) {

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

                        //alert(data[i]["ProductPicture"]);
                        if ($.trim(data[i]["ProductPicture"]) != '') { $("#img_company").attr("src", "/image/" + data[i]["ProductPicture"]); }
                        $("#product_name").val(data[i]["ProductName"]);
                        $("#brand").val(data[i]["Brand"]);
                        $("#upc_sku").val(data[i]["UPCSKU"]);
                        $("#product_department").val(data[i]["ProductDepartmentID"]);
                        $("#product_class").val(data[i]["ProductClassID"]);

                        $("#qty_on_hand").val(data[i]["QtyOnHand"]);
                        $("#qty_available").val(data[i]["QtyAvailable"]);
                        $("#qty_so").val(data[i]["QtySO"]);
                        $("#qty_po").val(data[i]["QtyOrder"]);
                        

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

                        $("#cost").val(data[i]["Cost"]);
                        $("#last_discount").val(data[i]["Discount"]);
                        $("#total_units_in").val(data[i]["TotalUnitsIn"]);
                        $("#total_units_out").val(data[i]["TotalUnitsOut"]);
                        

                        var dateLastReceived = FormatDate(data[i]["DateLastReceived"]);
                        if (dateLastReceived != '5.27.1988') {
                            $("#date_last_received").val(dateLastReceived);
                        } else {
                            $("#date_last_received").val('');
                        }
                        
                        var dateLastSold = FormatDate(data[i]["DateLastSold"]);
                      
                        if (dateLastSold != '5.27.1988') {
                            $("#date_last_sold").val(dateLastSold);
                        }
                        else{
                            $("#date_last_sold").val('');
                        }
                       
                        
                        $("#average_cost").val("wala pa data");
                        $("#sub_average_cost").val("wala pa data");
                        $("#qty_difference").val("wala pa data");


                    }


                },
                error: function (response) {
                    alert(response.status);
                }
            });

            


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

                        $('#packing').append("<option value='" + data[i]["ID"] + "'>" + data[i]["Packing"] + "</option>");

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

                        $('#units').append("<option value='" + data[i]["ID"] + "'>" + data[i]["UnitName"] + "</option>");

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



        $("#uploadIcon").click(function () {
            $(this).next().trigger('click');
        });
        function ShowPreview(input) {
            if (input.files && input.files[0]) {
                var ImageDir = new FileReader();
                ImageDir.onload = function (e) {
                    $('#img_company').attr('src', e.target.result);
                    //upload sync here
                    //if (ProductID != 0) {
                        //alert(ProductID);
                        UploadData();
                    //}
                }

                ImageDir.readAsDataURL(input.files[0]);
            }
        }

        var filepath = "";

        function UploadData() {
            var fileUpload = $("#uploadFile").get(0);
            var files = fileUpload.files;

            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }

            $.ajax({
                url: "/Webservice/ProductUpload.ashx",
                type: "POST",
                data: data,
                contentType: false,
                processData: false,
                success: function (result) {
                    filepath = result;
                    //alert(filepath);
                    if (ProductID != 0)//update
                    {

                        var pageUrl = '/Webservice/svr_Product.asmx';


                        $.ajax({
                            type: "POST",
                            url: pageUrl + "/UpdateProductPicture",
                            data: "{'id':'{0}', 'product_picture':'{1}'}"
                            .f(ProductID, result),
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

                },
                error: function (err) {
                    alert(err.statusText)
                }
            });

        }

    </script>
</asp:Content>
