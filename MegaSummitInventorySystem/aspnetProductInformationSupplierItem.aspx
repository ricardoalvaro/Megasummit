<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductInformationSupplierItem.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductInformationSupplierItem" %>

<%@ Register Src="~/include/ProductSubMenu.ascx" TagPrefix="uc1" TagName="ProductSubMenu" %>
<%@ Register src="include/ProductSubMenuAjax.ascx" tagname="ProductSubMenuAjax" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                                            <th width="12%">Reference No.</th>
                                            <th width="12%">Date</th>
                                            <th width="15%">Supplier Name</th>
                                            <th width="12%">Quantity</th>
                                            <th width="12%">Cost</th>
                                            <th width="12%">Discount</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tblMain" class="scroll">
                            </HeaderTemplate>
                            <ItemTemplate>

                                <tr>
                                    <td width="12%"><%# Eval("ReferenceNo") %></td>
                                    <td width="12%"><%# DateTime.Parse( Eval("CreatedDate").ToString()).ToString("mm/dd/yyyy") %></td>
                                    <td width="15%"><%# Eval("SupplierName") %></td>
                                    <td width="12%"><%# decimal.Parse(Eval("Quantity").ToString()).ToString("N") %></td>
                                    <td width="12%"><%# decimal.Parse(Eval("UnitPrice").ToString()).ToString("N") %></td>
                                    <td width="12%"><%# Eval("Discount") %></td>
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
    <%--<script src="Script/Helper.js"></script>--%>
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