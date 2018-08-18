<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductAdjustment.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductAdjustment" %>
<%@ Register src="include/ProductSubMenu.ascx" tagname="ProductSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     

    <uc1:ProductSubMenu ID="ProductSubMenu1" runat="server" />
    <div id="main" class="products-product">
    
         <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
            <div class="container two-column-sidebar style2">
                <div class="ym-column linearize-level-1">
                    <div id="content-holder" class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                              <h1>Inventory Adjustment</h1>
                              <div class="content vmiddle">
                              	<div name="inventory_adjustment_form" id="inventory_adjustment_form" class="ym-form">
                                    <table>
                                        <tr>
                                            <td>
                                                <table>                                           
                                                    <tr>
                                                        <td class="lbl"><label for="product_name">*Product Name</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="product_name"  value="" class="long" />
                                                             <%--<div class="select-arrow long">
                                                               <select name="product_name" id="product_name">
                                                                    <option value=""></option>                                                             
                                                                </select>
                                                            </div>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="location">*Location</label></td>
                                                        <td class="obj">
                                                            <div class="select-arrow medium">
                                                                <select name="location" id="location" onchange="LocationChange()">
                                                                    <option value=""></option>                                                             
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="current_quantity">Current Quantity</label></td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="current_quantity" name="current_quantity" value="" class="short" disabled /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="new_quantity">*New Quantity</label></td>
                                                        <td class="obj"><input type="text" onchange="ComputeDifference()" autocorrect="off" spellcheck="false" id="new_quantity" name="new_quantity" value="" class="short" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="quantity_difference">Quantity Difference</label></td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="quantity_difference" name="quantity_difference" value="" class="short" disabled /></td>
                                                    </tr>
                                                    <tr style="visibility:hidden">
                                                        <td class="lbl"><label for="unit_price">*Unit Price</label></td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="unit_price" name="unit_price" value="" class="short" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="reason_adjustment">*Reason of Adjustment</label></td>
                                                        <td class="obj">
                                                            <div class="select-arrow long">
                                                                <select name="reason_adjustment" id="reason_adjustment">
                                                                    <option value=""></option>                                                             
                                                                </select>
    
                                                            </div>
                                                        </td>
                                                    </tr>                                      
                                                </table>
                                            </td>
                                            <td width="50"></td>
                                            <td valign="top">
                                                <table>
                                                    <tr>
                                                    <td class="lbl"><label for="reference_number">*Reference No.</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" value="IA" disabled />
                                                                </div>
                                                                <div class="col-left">
                                                                    &nbsp;&nbsp;
                                                                </div>
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_number"  name="reference_number" class="xxxmedium" />
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="reference_number">*Date</label></td>
                                                        <td class="obj">
                                                            <div class="dp xmedium">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                            </div>
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

                    <div class="ym-col3">
                        <div class="ym-cbox"> 
                            <asp:Repeater runat="server" ID="repList">
                                <HeaderTemplate>
                                    <ul id="ulSidebar" class="sidebar sidelists2 crossfade scroll">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <a href="javascript:;" id="item-1" onclick="SelectFromList('<%# Eval("ID") %>')">
                                            <span class="name"><%# Eval("ProductName")  %>
                                                <span class="float-right" style="font-size: 12px">IA<%# Eval("ID") %></span>
                    	                    <span><%#Eval("ReasonName") %></span>
                                            </span>
                                        </a>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>		
            </div>	
        </div>
    </div>


</div>

   


    <script type="text/javascript">

      
        /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
        //--------Need refactoring----------
        var adjustment_id = 0;
        var product_id = 0;
        var location_id = 0;

        $(document).ready(function () {
            $("#btn-new").removeClass("disabled");
            CreateDate();
            ProductAutoComplete();
            LocationAutoComplete();
            ReasonAdjustmentAutoComplete();

            $("#ulSidebar").append(defaultTableRow());

            $("#btn-new").click(function(){
                $("#btn-new").addClass("disabled");
                $("#btn-save").removeClass("disabled");
                adjustment_id = 0;
            });

            $("#btn-save").click(function(){
                
                SaveAdjustment();
                $("#btn-new").removeClass("disabled");
                $("#btn-save").addClass("disabled");
            });
        });

        function SaveAdjustment()
        {
         
            var save = $("#btn-save");
            if ((save).hasClass("disabled") == false)
            {

                var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

                var refNO = $('#reference_letter').val();
                var referenceNumber = $('#reference_number').val();
                var productID =product_id;
                var locationID = $('#location').val();
                var CurrQty = ($('#current_quantity').val()=='') ? '0' : $('#current_quantity').val();
                var NewQty = ($('#new_quantity').val()=='') ? '0' : $('#new_quantity').val();
                var DiffQty = $('#quantity_difference').val();
                var NewPrice = ($('#unit_price').val()=='') ? '0' : $('#unit_price').val();
                var reasonID = $('#reason_adjustment').val();

                if (adjustment_id != 0) {
                    $.ajax({
                        type: "POST", url: pageUrl + "/UpdateInventoryAdjustment",
                        data: "{'id':'" + adjustment_id + "','refNO':'" + refNO + "', 'referenceNumber':'" + referenceNumber + "', 'productID':'" + productID + "', 'locationID':'" + locationID + "', 'CurrQty':'" + CurrQty + "', 'NewQty':'" + NewQty + "', 'DiffQty':'" + DiffQty + "', 'NewPrice':'" + NewPrice + "', 'reasonID':'" + reasonID + "'}",
                        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
                        success: function (response) {
                            window.location = "aspnetProductAdjustment.aspx";
                        },
                        error: function (response) {
                           // alert(response.status);
                        }
                    });
                }
                else {

                 
                    $.ajax({
                        type: "POST", url: pageUrl + "/InsertInventoryAdjustment",
                        data: "{'refNO':'" + refNO + "', 'referenceNumber':'" + referenceNumber + "', 'productID':'" + productID + "', 'locationID':'" + locationID + "', 'CurrQty':'" + CurrQty + "', 'NewQty':'" + NewQty + "', 'DiffQty':'" + DiffQty + "', 'NewPrice':'" + NewPrice + "', 'reasonID':'" + reasonID + "'}",
                        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
                        success: function (response) {
                            window.location = "aspnetProductAdjustment.aspx";
                        },
                        error: function (response) {
                           // alert(response.d);
                        }
                    });
                }
            }
        }

        function SelectFromList(id)
        {
            adjustment_id = id;
            var pageUrl = '/Webservice/svr_ProductAdjustment.asmx';

            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectInventoryAdjustment",
                data: "{'id':'" + adjustment_id + "' }", contentType: "application/json; charset=utf-8",dataType: "json", crossdomain: true,
                success: function (response) {
                    var data = eval(response.d);
                    var obj = "";
                    for (var i = 0; i < data.length; i++) {
                      
                        $('#reference_letter').val('IA');
                        $('#reference_number').val(data[i]["RefNoID"]);


                        var product_detail = ProductAutoCompleteData;

                        for (var x = 0; x < product_detail.length; x++) {
                        
                            if(product_detail[x]["id"] == data[i]["ProductID"])
                            {
                                product_id = product_detail[x]["id"];
                                $('#product_name').val(product_detail[x]["value"]);
                                break;
                            }
                        }
                       
                        
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

            $("#btn-new").addClass("disabled");
            $("#btn-save").removeClass("disabled");
            $("#btn-delete").addClass("disabled");
        }

        function CreateDate()
        {
            var currentDate = new Date();
            var day = currentDate.getDate();
            var month = currentDate.getMonth() + 1;
            var year = currentDate.getFullYear();
            $('#date').val("0" + month + "/" + day + "/" + year);
        }

        function defaultTableRow()
        {

            var temp = "<li><a href='javascript:;' id='item-2' onclick=\"SelectFromList('0')\"><span class='name'>&nbsp;<span>&nbsp;</span></span></a><li><a href='javascript:;' id='item-2'><span class='name'>&nbsp;<span>&nbsp;</span></span></a></li></li>";
            var result = "";

            for (var i = 0; i < 30; i++) {
                result += temp;
            }

            return result;
        }

        function ProductAutoComplete()
        {
            $("#product_name").autocomplete({source: ProductAutoCompleteData,minLength: 0,minChars: 0,max: 12,autoFill: true,matchContains: false,
                select: function (a, b) {
                    product_id = Number(b.item.id);
                    location_id = Number($("#location").val());
                    ActionSelectProductDetails();
                }
            }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
        }

        function ComputeDifference()
        {
            var result = ( parseFloat($("#new_quantity").val()) - parseFloat(($("#current_quantity").val() == '') ? '0' :  $("#current_quantity").val()));

            $("#quantity_difference").val(result);
        }

        function LocationAutoComplete() {
            $('#location').empty();
            var data = LocationAutoCompleteData;
            for (var i = 0; i < data.length; i++) {

                $('#location').append("<option value='" + data[i]["id"] + "'>" + data[i]["label"] + "</option>");

            }
        }


        function ReasonAdjustmentAutoComplete() {
            $('#reason_adjustment').empty();
            var data = ReasonAdjustmentData;
            for (var i = 0; i < data.length; i++) {

                $('#reason_adjustment').append("<option value='" + data[i]["id"] + "'>" + data[i]["label"] + "</option>");

            }
        }

       

        function LocationChange()
        {
            
            location_id = Number($("#location").val());
            ActionSelectProductDetails();
        }

        function ActionSelectProductDetails()
        {
            var pageUrl = '/Webservice/svr_Product.asmx';

            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectProductStock",
                data: "{ 'product_id':'" + product_id + "', 'location_id':'" + location_id+"'}",
                contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
                success: function (response) {

                    var data = eval(response.d);
                    if(data.length > 0)
                    {
                        for (var i = 0; i < data.length; i++) {
                            $("#current_quantity").val(data[i]["StockValue"]);
                        }

                    }
                    else
                    {
                        $("#current_quantity").val('0');
                    }
                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }

        function ToJavaScriptDate(value) {
            var date = new Date(value);
            var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
            return jsonDate;
        }


        var LocationAutoCompleteData = <%= AutoCompleteLocation() %>;
        var ProductAutoCompleteData = <%= AutoCompleteProduct() %>;
        var ReasonAdjustmentData = <%= AutoCompleteReasonAdjustment() %>;


    </script>

</asp:Content>
