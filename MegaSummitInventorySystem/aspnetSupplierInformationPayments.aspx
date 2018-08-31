<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierInformationPayments.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetaspnetSupplierInformationPayments" %>
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
                <li><a href="javascript:void(0)" onclick="DisplayData('Cash')">Cash</a></li>
                <li><a href="javascript:void(0)" onclick="DisplayData('Check')">Check</a></li>
                <li><a href="javascript:void(0)" onclick="DisplayData('Card')">Card</a></li>
            </ul>
        <div class="ym-ie-clearing">&nbsp;</div>
        </div>

        
        <div class="container one-column" >
            <div class="inner">                    	
                <div class="box-holder"> 
                    <div id="content-holder">
                    	<div class="content tabular">                            	
                            <table class="tblholder main unclickable" id="tblMain">
                               <thead>
                                    <tr>
                                        <th width="20%">Reference No.</th>
                                        <th width="20%">Date</th>
                                        <th width="20%">Voucher Amount</th>
                                        <th width="20%">Amount</th>
                                    </tr>
                                </thead>
                                <tbody class="scroll">
                                       <asp:Repeater runat="server" ID="repMain">
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
            FillSalesOrderDefault();
        });

        function DisplayData(status) {
            $("#tblMain tbody").empty();
            var data = SalesOrderDetails;
            for (var i = 0; i < data.length; i++) {
                if (data[i]["OrderStatus"] == status) {
                    $("#tblMain tbody").append("<tr><td width='15%'>" + data[i]["RefNo"] + "</td><td width='15%'>" + FormatDate(data[i]["CreatedDate"]) + "</td><td width='25%'>" + data[i]["Salesman"] + "</td><td width='15%'>" + Number(data[i]["TotalAmount"]).toFixed(2) + "</td><td width='15%'>" + Number(data[i]["Balance"]).toFixed(2) + "</td><td width='15%'>" + data[i]["OrderStatus"] + "</td></tr>");
                }
                else {
                    $("#tblMain tbody").append("<tr><td width='15%'>" + data[i]["RefNo"] + "</td><td width='15%'>" + FormatDate(data[i]["CreatedDate"]) + "</td><td width='25%'>" + data[i]["Salesman"] + "</td><td width='15%'>" + Number(data[i]["TotalAmount"]).toFixed(2) + "</td><td width='15%'>" + Number(data[i]["Balance"]).toFixed(2) + "</td><td width='15%'>" + data[i]["OrderStatus"] + "</td></tr>");
                }
            }

            FillSalesOrderDefault();

        }

        function FillSalesOrderDefault() {
            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
            }
        }

        var SalesOrderDetails =<%= SalesOrderVM.CustomerSalesOrderDetails(long.Parse( (Request["customerID"] == null ? "0" : Request["customerID"])  )) %>;  

    </script>


    <style>
        .padding-0 {
            padding: 0;
        }
    </style>
</asp:Content>
