<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierInformationInvoices.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSupplierInformationInvoices" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<%@ Register src="include/SupplierSubMenuAjax.ascx" tagname="SupplierSubMenuAjax" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />

    <div id="main" class="suppliers-suppliers">
    <div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
         <uc2:SupplierSubMenuAjax ID="SupplierSubMenuAjax1" runat="server" />
         <div class="padding-0">
             <ul class="suboptions">
                <li><a href="javascript:void(0)" onclick="DisplayData('All')">All</a></li>
                <li><a href="javascript:void(0)" onclick="DisplayData('Paid')">Paid</a></li>
                <li><a href="javascript:void(0)" onclick="DisplayData('Unpaid')">Unpaid</a></li>
            </ul>
        </div>
        <div class="container one-column">
            <div class="inner">                    	
                <div class="box-holder"> 
                    <div id="content-holder">
                    	<div class="content tabular">                            	
                            <table class="tblholder main unclickable" id="tblMain">
                                <thead>
                                    <tr>
                                        <th width="12%">Reference No.</th>
                                        <th width="12%">Date</th>
                                        <th width="15%">Transaction Type</th>
                                        <th width="10%">Days</th>
                                        <th width="10%">Amount</th>
                                        <th width="10%">Balance</th>
                                    </tr>
                                </thead>

                                <tbody class="scroll">
                                      <%-- <asp:Repeater runat="server" ID="repMain">
                                      <ItemTemplate>
                                            <tr>
                                                <td width="12%"><%# Eval("RefNo") %> </td>
                                                <td width="12%"><%# DateTime.Parse(Eval("DateCreated").ToString()).ToString("MM/dd/yyyy") %> </td>
                                                <td width="12%"><%# DateTime.Parse(Eval("CreatedDate").ToString()).ToString("MM/dd/yyyy") %>  </td>
                                                <td width="12%"><%# (Eval("CancelDate").ToString()) %> </td>
                                                <td width="12%"><%# Decimal.Parse(Eval("TotalAmount").ToString()).ToString("N") %> </td>
                                                <td width="12%"><%# Decimal.Parse(Eval("Balance").ToString()).ToString("N") %> </td>
                                                <td width="12%"><%# Eval("PurchasedOrderStatus") %> </td>
                                            </tr>
                                   </ItemTemplate>
                                    </asp:Repeater>--%>
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
            DisplayData('All');
            FillSalesOrderDefault();
        });

        function DisplayData(status) {
            $("#tblMain tbody").empty();
            var data = SalesOrderDetails;
            for (var i = 0; i < data.length; i++) {
                if ( status == 'Paid' ) {
                    if(Number(data[i]["Balance"]) == 0)
                    {
                        $("#tblMain tbody").append("<tr><td width='12%'>" + data[i]["RefNo"] + "</td><td width='12%'>" + FormatDate(data[i]["CreatedDate"]) + "</td><td width='15%'>" + 'Purchase' + "</td><td width='10%'>" + data[i]["Days"] + "</td><td width='10%'>" + Number(data[i]["Amount"]).toFixed(2) + "</td><td width='10%'>" + Number(data[i]["Balance"]).toFixed(2) + "</td></tr>");
                    }
                }
                else if ( status == 'Unpaid' ) {
                    if(Number(data[i]["Balance"]) > 0)
                    {
                        $("#tblMain tbody").append("<tr><td width='12%'>" + data[i]["RefNo"] + "</td><td width='12%'>" + FormatDate(data[i]["CreatedDate"]) + "</td><td width='15%'>" + 'Purchase' + "</td><td width='10%'>" + data[i]["Days"] + "</td><td width='10%'>" + Number(data[i]["Amount"]).toFixed(2) + "</td><td width='10%'>" + Number(data[i]["Balance"]).toFixed(2) + "</td></tr>");
                    }
                }
                else if(status == 'All'){
                    $("#tblMain tbody").append("<tr><td width='12%'>" + data[i]["RefNo"] + "</td><td width='12%'>" + FormatDate(data[i]["CreatedDate"]) + "</td><td width='15%'>" + 'Purchase' + "</td><td width='10%'>" + data[i]["Days"] + "</td><td width='10%'>" + Number(data[i]["Amount"]).toFixed(2) + "</td><td width='10%'>" + Number(data[i]["Balance"]).toFixed(2) + "</td></tr>");
                }
            }

            FillSalesOrderDefault();

        }

        function FillSalesOrderDefault() {
            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
            }
        }

        var SalesOrderDetails =<%= PurchaseInvoiceVM.SupplierPurchaseInvoice (long.Parse( (Request["supplierID"] == null ? "0" : Request["supplierID"])  )) %>;  

    </script>

    
    <style>
        .padding-0 {
            padding: 0;
        }
    </style>
</asp:Content>
