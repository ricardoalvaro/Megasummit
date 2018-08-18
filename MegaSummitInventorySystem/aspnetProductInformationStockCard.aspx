<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductInformationStockCard.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductInformationStockCard" %>
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
        	    	 <div class="container one-column">
            <div class="inner">                    	
                <div class="box-holder">                        
                	<div class="content tabular">        
                        
                        <asp:Repeater ID="repMain" runat="server">
                            <HeaderTemplate>
                                <table class="tblholder main unclickable">
                                    <thead>
                                        <tr>
                                            <th width="7%">Ref. No.</th>
                                            <th width="8%">Date</th>
                                            <th width="12%">Transaction Type</th>
                                            <th width="18%">Customer/Supplier Name</th>
                                            <th width="9%">Location</th>
                                            <th width="5%">In</th>
                                            <th width="5%">Out</th>
                                            <%--<th width="5%">Qty.</th>--%>
                                            <th width="5%">Cost</th>
                                            <th width="8%">Discount</th>
                                            <th width="9%">Net Price</th>
                                            <th width="9%">Ave. Cost</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tblMain" class="scroll">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td width="7%"><%# Eval("ReferenceNo") %></td>
                                    <td width="8%"><%# DateTime.Parse(Eval("DateTransaction").ToString()).ToString("MM/dd/yyyy") %></td>
                                    <td width="12%"><%# Eval("TransactionType") %></td>
                                    <td width="18%"><%# Eval("CustomerSupplier") %></td>
                                    <td width="9%"><%# Eval("LocationName") %></td>
                                    <td width="5%"><%# Decimal.Parse(Eval("QtyIN").ToString()).ToString("N") %></td>
                                    <td width="5%"><%# Decimal.Parse(Eval("QtyOUT").ToString()).ToString("N") %></td>
                                   <%-- <td width="5%"><%# Decimal.Parse(Eval("QtyOUT").ToString()).ToString("N") %></td>--%><%--need to edit--%>
                                    <td width="5%"><%# Decimal.Parse(Eval("ProductCost").ToString()).ToString("N") %></td>
                                    <td width="8%"><%# Eval("Discount").ToString() %></td>
                                    <td width="9%"><%# ProductVM.ReturnNetPrice(Eval("Discount").ToString(),Decimal.Parse(Eval("ProductCost").ToString())) %></td>
                                    <td width="9%"><%# Decimal.Parse(Eval("AveCost").ToString()).ToString("N") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>	
                            </FooterTemplate>
                        </asp:Repeater>

                    </div>  
                    <div class="addup"><div class="space20"></div></div>  
                </div>
            </div>      			
        </div>	

    </div>
</div></div>
    <script src="Script/Helper.js"></script>
    <script type="text/javascript">
        /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
        //--------Need refactoring----------


        $(document).ready(function () {

            
            var table = $("#tblMain");        
            table.append(defaultTableRow());


        });




        function defaultTableRow() {

            var temp = "<tr>   <td width='100%'></td></tr>";
            var result = "";

            for (var i = 0; i < 30; i++) {
                result += temp;
            }

            return result;
        }

    </script>

</asp:Content>
