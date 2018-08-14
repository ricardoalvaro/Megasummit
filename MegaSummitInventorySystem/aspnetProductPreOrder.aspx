<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductPreOrder.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductPreOrder" %>
<%@ Register src="include/ProductSubMenu.ascx" tagname="ProductSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ProductSubMenu ID="ProductSubMenu1" runat="server" />
    <div id="main" class="products-product">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="container one-column" style="height: 144px;">
       			<div class="inner">                    	
                    <div class="box-holder" style="height: 144px;">

                        <div class="content tabular">           
                            <asp:Repeater runat="server" ID="repProduct">
                                <HeaderTemplate>
                                    <table  class="tblholder main">
                                         <thead>
                                                <tr>
                                                    <th width="30%">Product Name</th>
                                                    <th width="12%">Quantity on Hand</th>
                                                    <th width="12%">Reorder Quantity</th>
                                                    <th width="12%">Quantity Demand</th>
                                                    <th width="12%">Quantity to Order</th>
                                                </tr>
                                            </thead>
                                <div   class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; ">
                                    <tbody id="tblMain" class="scroll" style="overflow: hidden; width: auto; height: 95px;">
                                </HeaderTemplate>
                            <ItemTemplate>
                               <tr id="rec-1" >
                                        <td width="30%"><%# Eval("ProductName") %></td>
                                        <td width="12%"><%# decimal.Parse(Eval("QtyOnHand").ToString()).ToString("N") %></td>
                                        <td width="12%"><%# decimal.Parse(Eval("ReOrderQty").ToString()).ToString("N") %></td>
                                        <td width="12%"><%# decimal.Parse(Eval("QtySO").ToString()).ToString("N") %></td>
                                        <td width="12%"><%# (decimal.Parse(Eval("QtySO").ToString()) + decimal.Parse(Eval("ReOrderQty").ToString())).ToString("N") %></td>
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


        /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
        //--------Need refactoring----------

        $(document).ready(function(){
        
            $("#tblMain").append(defaultTableRow());

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
