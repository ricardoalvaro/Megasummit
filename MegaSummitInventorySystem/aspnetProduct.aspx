<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProduct.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProduct1" %>
<%@ Register src="include/ProductSubMenu.ascx" tagname="ProductSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ProductSubMenu ID="ProductSubMenu1" runat="server" />
    <div id="main" class="products-product">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="container one-column" style="height: 144px;">
       			<div class="inner">                    	
                    <div class="box-holder" style="height: 144px;">
                        <%--<div class="addup">
                            <div class="pagination">
                                <a href="">&lt;&lt;</a> | <a href="">&lt; Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next &gt;</a> | <a href="">&gt;&gt;</a>
                            </div>
                        </div>--%>
                        <div class="content tabular">             
                            
                          

                            <asp:Repeater runat="server" ID="repProduct">
                                <HeaderTemplate>
                                    <table  class="tblholder main">
                                <thead>
                                    <tr>
                                        <th width="35%">Product Name</th>
                                        <th width="10%">Qty on Hand</th>
                                        <th width="10%">Qty Order</th>
                                        <th width="8%">Units</th>
                                        <th width="8%">Cost</th>
                                        <th width="8%">Discount</th>
                                        <th width="10%">Average Cost</th>
                                        <th width="10%">Qty Diff.</th>
                                    </tr>
                                </thead>
                                <div   class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; ">
                                    <tbody id="tblMain" class="scroll" style="overflow: hidden; width: auto; height: 95px;">
                                </HeaderTemplate>
                            <ItemTemplate>
                               <tr id="rec-1" onclick="RedirectToGeneralInfomation(<%# Eval("ID") %>)">
                                        <td width="35%"><%# Eval("ProductName") %></td>
                                        <td width="10%"><%# Decimal.Parse(Eval("QtyOnHand").ToString()).ToString("N") %></td>
                                        <td width="10%"><%# Decimal.Parse(Eval("QtyOrder").ToString()).ToString("N") %></td>
                                        <td width="8%"><%# Eval("UnitName") %></td>
                                        <td width="8%"><%# Decimal.Parse(Eval("Cost").ToString()).ToString("N") %></td>
                                        <td width="8%"><%# Decimal.Parse(Eval("Discount").ToString()).ToString("N") %></td>
                                        <td width="10%">Ave cost</td>
                                        <td width="10%"><%# Decimal.Parse(Eval("QtyDiff").ToString()).ToString("N") %></td>
                                    </tr>
                            </ItemTemplate>
                                           	
                            <FooterTemplate>
                             
                                 </tbody><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 46.5053px;"></div><div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                           </table>	
                            </FooterTemplate>
                                   
                            </asp:Repeater>

                        </div>
                        <div class="addup"><div class="space20"></div></div>
                    </div>
                </div>	
            </div>	
        </div>
    </div>
</div>

   


    <script type="text/javascript">

        var productAutoCompleteData = <%= AutoCompleteProduct() %>;

        /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
        //--------Need refactoring----------

        $(document).ready(function(){
        
            $('#btn-new').removeClass('disabled');
            $('#btn-find').removeClass('disabled');
            var table =  $("#tblMain");
            table.append(defaultTableRow());
        });


        $("#btn-find").click(function () {
            var table =  $("#tblMain");
            table.html(""); //Clear 
            
            table.append("<tr id='rec-1'><td width='100%'><input type='text'  id='txt_search_product'  class='long search_class ui-autocomplete-input' /></td></tr>");

            table.append(defaultTableRow());

            ProductAutoComplete();
        });


        function ProductAutoComplete() {

            $("#txt_search_product").autocomplete({
                source: productAutoCompleteData,
                minLength: 0,
                minChars: 0,
                max: 12,
                autoFill: true,
                matchContains: false,
                select: function (a, b) {
                    RedirectToGeneralInfomation(b.item.id)
                }
            })

        }


        function RedirectToGeneralInfomation(productID)
        {
            window.location = "aspnetProductInformation.aspx?productID=" + productID;
        }

        //--------------------------

        $("#btn-new").click(function ()
        {
            window.location = "aspnetProductInformation.aspx";
        });

        

        function defaultTableRow()
        {

            var temp = "<tr>   <td width='100%'></td></tr>";
            var result = "";

            for (var i = 0; i < 30; i++) {
                result += temp;
            }

            return result;
        }

    </script>

</asp:Content>
