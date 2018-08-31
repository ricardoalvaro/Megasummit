<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetPurchaseReturn.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetPurchaseReturn" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />
    <div id="main" class="suppliers-purchase-order">
        <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="container one-column">
      			<div class="inner">                    	
                    <div class="box-holder">
                        <div class="addup">
                            <div class="pagination">
                                
                            </div>
                        </div>
                        <div id="tab-content-holder">
                            <div class="content tabular">                            	
                                <table id="tblMain"  class="tblholder main">
                                    <thead>
                                        <tr>
                                            <th width="10%">Reference No.</th>
                                            <th width="10%">Date</th>
                                            <th width="25%">Supplier Name</th>
                                            <th width="10%">Amount</th>
                                            <th width="10%">Balance</th>
                                            <th width="10%">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody class="scroll">                                            
                                           <asp:Repeater runat="server" ID="repMain">   
                                                <ItemTemplate>
                                                        <tr id="rec-1" onclick="SelectPurchaseReturn('<%# Eval("ID").ToString() %> ')">
                                                            <td width="10%"><%# Eval("RefNo").ToString() %> </td>
                                                            <td width="10%"><%# DateTime.Parse(Eval("CreatedDate").ToString()).ToString("MM/dd/yyyy") %></td>
                                                            <td width="30%"><%# Eval("SupplierName").ToString() %></td>
                                                            <td width="10%"><%# decimal.Parse( Eval("TotalAmount").ToString()).ToString("N") %></td>
                                                            <td width="10%"><%# decimal.Parse( Eval("Balance").ToString()).ToString("N") %></td>
                                                            <td width="10%"><%# Eval("Status").ToString() %></td>
                                                        </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>                    
                                    </tbody>
                               </table>	
                            </div>
                            <div class="addup"><div class="space20"></div></div>
                        </div>
                    </div>
                </div>	
            </div>	
        </div>
    </div>

    </div>

    <script type="text/javascript">


        $(document).ready(function () {
            $('#btn-new').removeClass('disabled').click(function () {
                window.location = "aspnetPurchaseReturnInformation.aspx";
            });
            FillSalesReturnDefault();
        });

        function SelectPurchaseReturn(id) {
            window.location = "aspnetPurchaseReturnInformation.aspx?purchaseReturnID=" + id;
        }


        function FillSalesReturnDefault() {
            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
            }
        }


    </script>

</asp:Content>
