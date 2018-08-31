<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierInformationSupplierItem.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSupplierInformationSupplierItem" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<%@ Register src="include/SupplierSubMenuAjax.ascx" tagname="SupplierSubMenuAjax" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />

    <div id="main" class="suppliers-suppliers">
    <div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
         <uc2:SupplierSubMenuAjax ID="SupplierSubMenuAjax1" runat="server" />
         <div class="container one-column">
            <div class="inner">                    	
                <div class="box-holder">                        
                	<div class="content tabular">                            	
                        <table class="tblholder main unclickable" id="tblMain">
                            <thead>
                                <tr>
                                    <th width="18%">Product Name</th>
                                    <th width="10%">Reference No.</th>
                                    <th width="18%">Date of Last Purchase</th>
                                    <th width="10%">Quantity</th>
                                    <th width="10%">Unit</th>
                                    <th width="15%">Cost Per Unit</th>
                                    <th width="10%">Discount</th>
                                </tr>
                            </thead>
                            <tbody class="scroll">
                            	 <asp:Repeater runat="server" ID="repMain">
                                    <ItemTemplate>
                                        <tr>
                                            <td width="18%"><%# Eval("ProductName") %> </td>
                                            <td width="10%"><%# Eval("refNo") %></td>
                                            <td width="18%"><%# DateTime.Parse(Eval("DateCreated").ToString()).ToString("MM/dd/yyyy") %></td>
                                            <td width="10%"><%# Decimal.Parse(Eval("Quantity").ToString()).ToString("N") %></td>
                                            <td width="10%"><%# Eval("UnitName") %></td>
                                            <td width="15%"><%# Decimal.Parse(Eval("UnitPrice").ToString()).ToString("N") %></td>
                                            <td width="10%"><%# Eval("Discount") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                       </table>	
                    </div>    
                </div>
                <div class="addup"><div class="space20"></div></div>
            </div>      			
        </div>	
        
        
        	
    </div>
</div>
    </div>


    <script type="text/javascript">

        $(document).ready(function () {
            FillDefault();
        });



        function FillDefault() {
            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
            }
        }

    </script>

</asp:Content>
