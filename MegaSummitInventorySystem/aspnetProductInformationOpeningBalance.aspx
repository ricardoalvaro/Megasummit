<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductInformationOpeningBalance.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductInformationOpeningBalance" %>

<%@ Register Src="~/include/ProductSubMenu.ascx" TagPrefix="uc1" TagName="ProductSubMenu" %>
<%@ Register Src="include/ProductSubMenuAjax.ascx" TagName="ProductSubMenuAjax" TagPrefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ProductSubMenu runat="server" ID="ProductSubMenu" />
    <div id="main" class="products-product">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <uc2:ProductSubMenuAjax ID="ProductSubMenuAjax1" runat="server" />
                <div class="container two-column-sidebar style2">
                    <div class="ym-column linearize-level-1">
                        <div id="Div1" class="ym-col1">
                            <div class="ym-cbox padtop9">
                                <div class="box-holder">
                                    <h1>Product Opening Balance</h1>
                                    <div class="addup">
                                        <div name="products_product_opening_balance_form" id="products_product_opening_balance_form" class="ym-form">
                                            <div class="content vmiddle">
                                                <div class="ym-form">
                                                    <table>
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="product_name">*Product Name</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="product_name" value="" class="long" disabled />
                                                                            <%--<div class="select-arrow long">
                                                                                <select name="product_name" id="product_name">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="location">*Location</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow medium">
                                                                                <select name="location" id="location">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="quantity">*Quantity</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="quantity" name="quantity" value="" class="short" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="unit">*Unit</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="unit" name="unit" value="" class="short" disabled /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="unit_price">*Unit Price</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="unit_price" name="unit_price" value="" class="short" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="discount">Discount</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="discount" name="discount" value="" class="short" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="amount">Amount</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" value="" class="short" disabled /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="44"></td>
                                                            <td width="">
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="reference_number">*Reference No.</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" value="OP" disabled />
                                                                                </div>
                                                                                <div class="col-left">
                                                                                    &nbsp;&nbsp;
                                                                                </div>
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_number" name="reference_number" class="xxxmedium" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="reference_number">*Date</label></td>
                                                                        <td class="obj">
                                                                            <div class="dp xmedium">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
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

                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 199px;">


                                    <asp:Repeater runat="server" ID="repList">
                                        <HeaderTemplate>
                                            <ul id="ulSidebar" class="sidebar sidelists2 crossfade scroll">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <a href="javascript:;" id="item-1" onclick="SelectFromList('<%# Eval("ID") %>')">

                                                    <span class="name"><%# Eval("ProductName") %>
                                                        <span class="float-right" style="font-size: 12px">OP<%# Eval("ID") %></span>
                                                        <span><%#Eval("LocationName") %></span>
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
       <%-- <script src="Script/Helper.js"></script>--%>
        <script type="text/javascript">

      
            /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
            //--------Need refactoring----------
            var opening_id = 0;
            var product_id = 0;
            var location_id = 0;
            var unit_id = 0;

            $(document).ready(function () {
                
                var helper = new Helper();
                product_id = Number(helper.GetQuerystring()["productID"]);
                if (!$.isNumeric(product_id) || product_id <= 0) { product_id = 0; }


                $("#btn-save").removeClass("disabled");
                CreateDate();
                ProductAutoComplete();
                LocationAutoComplete();
       
                $("#ulSidebar").append(defaultTableRow());

                $("#btn-new").click(function(){
                    $("#btn-new").addClass("disabled");
                    $("#btn-save").removeClass("disabled");
                    opening_id = 0;
                });

                $("#btn-save").click(function(){
                
                    SaveOpeningBalance();
                    $("#btn-new").removeClass("disabled");
                    $("#btn-save").addClass("disabled");
                });
            });

            function SaveOpeningBalance()
            {
         
                var save = $("#btn-save");
                if ((save).hasClass("disabled") == false)
                {

                    var pageUrl = '/Webservice/svr_ProductOpeningBalance.asmx';

                    var refNO = $('#reference_letter').val();
                    var referenceNumber = $('#reference_number').val();
                    var location_id = $('#location').val();
                    var qty = ($('#quantity').val()=='') ? '0' : $('#quantity').val();
                    var unit_price = ($('#unit_price').val()=='') ? '0' : $('#unit_price').val();
                    var discount = ($('#discount').val()=='') ? '0' : $('#discount').val();
                    var amount = ($('#amount').val()=='') ? '0' : $('#amount').val();
                    var date = $('#date').val();
                    //( refNo, productID, locationID, quantity, unitID, unitPrice, discount, amount, transactionDate)

                    $.ajax({
                        type: "POST", url: pageUrl + "/InsertOpeningBalance",
                        data: "{'refNo':'{0}', 'productID':'{1}', 'locationID':'{2}', 'quantity':'{3}', 'unitID':'{4}', 'unitPrice':'{5}', 'discount':'{6}', 'amount':'{7}', 'transactionDate':'{8}'}"
                            .f(referenceNumber, product_id, location_id, qty, unit_id, unit_price, discount, amount, date),
                        contentType: "application/json; charset=utf-8", dataType: "json", crossdomain: true,
                        success: function (response) {
                            window.location = "aspnetProductInformationOpeningBalance.aspx?productID=" + product_id;
                        },
                        error: function (response) {
                            alert(response.d);
                        }
                    });
                    
                }
            }

            function SelectFromList(id)
            {
                opening_id = id;
                //alert(opening_id);
                var pageUrl = '/Webservice/svr_ProductOpeningBalance.asmx';
                $.ajax({
                    type: "POST",
                    url: pageUrl + "/SelectOpeningBalance",
                    data: "{'opening_id':'" + opening_id + "' }", contentType: "application/json; charset=utf-8",dataType: "json", crossdomain: true,
                    success: function (response) {
                        var data = eval(response.d);
                        var obj = "";
                        for (var i = 0; i < data.length; i++) {
                      
                            $('#reference_number').val(data[i]["ID"]);
                            $('#location').val(data[i]["LocationID"]);
                            $('#quantity').val(data[i]["Quantity"]);
                            $('#unit_price').val(data[i]["UnitPrice"])
                            $('#discount').val(data[i]["Discount"])
                            $('#amount').val(data[i]["Amount"])
                            $('#date').val(ToJavaScriptDate(parseJsonDate(data[i]["TransactionDate"])));

                            //alert(ToJavaScriptDate(parseJsonDate(data[i]["TransactionDate"])));
                        
                        }

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });

                //$("#btn-new").addClass("disabled");
                //$("#btn-save").removeClass("disabled");
                //$("#btn-delete").addClass("disabled");
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
                //$("#product_name").autocomplete({source: ProductAutoCompleteData,minLength: 0,minChars: 0,max: 12,autoFill: true,matchContains: false,
                //    select: function (a, b) {
                //        product_id = Number(b.item.id);
                //        location_id = Number($("#location").val());
                //        ActionSelectProductDetails();
                //    }
                //})


                var product = ProductData ;

                for (var i = 0; i < product.length; i++) {
                    if(product[i]["ID"] == product_id)
                    {
                        $("#product_name").val(product[i]["ProductName"]);
                        $("#unit").val(product[i]["UnitName"]);
                        $("#amount").val(product[i]["PriceA"]);
                        unit_id = product[i]["UnitID"];
                        break;
                    }
                }

            }

          
            function LocationAutoComplete() {
                $('#location').empty();
                var data = LocationAutoCompleteData;
                for (var i = 0; i < data.length; i++) {

                    $('#location').append("<option value='" + data[i]["id"] + "'>" + data[i]["label"] + "</option>");

                }
            }


   

       

            function LocationChange()
            {
            
                location_id = Number($("#location").val());
               
            }

            function parseJsonDate(jsonDateString){
                return new Date(parseInt(jsonDateString.replace('/Date(', '')));
            }

            function ToJavaScriptDate(value) {
                var date = new Date(value);
                var jsonDate = (date.getMonth() + 1) + '/' + date.getDate() + '/' + date.getFullYear();
                return jsonDate;
            }


            var LocationAutoCompleteData = <%= AutoCompleteLocation() %>;
            var ProductAutoCompleteData = <%= AutoCompleteProduct() %>;
            var ProductData = <%= ProductDetail()%>;

        </script>
</asp:Content>
