<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerInformationSalesOrder.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerInformationSalesOrder" %>
<%@ Register src="include/CustomerSubMenuAjax.ascx" tagname="CustomerSubMenuAjax" tagprefix="uc1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
    <div id="main" class="customer-customers">
        <div class="ym-wrapper">    	   	
            <div class="ym-wbox"> 
       <uc1:CustomerSubMenuAjax ID="CustomerSubMenuAjax1" class="nopad" runat="server" />
  <ul class="suboptions">
            <li><a href="javascript:void(0)" onclick="DisplayData('All')">All</a></li>
            <li><a href="javascript:void(0)" onclick="DisplayData('Posted')">Posted</a></li>
            <li><a href="javascript:void(0)" onclick="DisplayData('Closed')">Closed</a></li>
        </ul>
        <div class="container one-column">
            <div class="inner">                    	
                <div class="box-holder"> 
                    <div id="cotent-holder">
                    	<div class="content tabular">                            	
                            <table class="tblholder main unclickable" id="tblMain">
                                <thead>
                                    <tr>
                                        <th width="15%">Reference No.</th>
                                        <th width="15%">Date</th>
                                        <th width="25%">Salesman</th>
                                        <th width="15%">Amount</th>
                                        <th width="15%">Balance</th>
                                        <th width="15%">Status</th>
                                    </tr>
                                </thead>
                                <tbody class="scroll">
                                    <asp:Repeater runat="server" ID="repMain">
                                      <ItemTemplate>
                                            <tr>
                                                <td width="15%"><%# Eval("RefNo") %> </td>
                                                <td width="15%"><%# DateTime.Parse(Eval("CreatedDate").ToString()).ToString("MM/dd/yyyy") %> </td>
                                                <td width="25%"><%# Eval("Salesman") %> </td>
                                                <td width="15%"><%# Decimal.Parse(Eval("TotalAmount").ToString()).ToString("N") %> </td>
                                                <td width="15%"><%# Decimal.Parse(Eval("Balance").ToString()).ToString("N") %> </td>
                                                <td width="15%"><%# Eval("OrderStatus") %> </td>
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
    <style>
        .padding-0 {
            padding: 0;
        }
    </style>

    <script type="text/javascript">



        $(document).ready(function(){
            FillSalesOrderDefault();
        });


        function DisplayData(status)
        {
            $("#tblMain tbody").empty();
            var data = SalesOrderDetails;
            for (var i = 0; i < data.length; i++) {
                if (data[i]["OrderStatus"] == status) {
                    $("#tblMain tbody").append("<tr><td width='15%'>" + data[i]["RefNo"] + "</td><td width='15%'>" + FormatDate(data[i]["CreatedDate"]) + "</td><td width='25%'>" + data[i]["Salesman"] + "</td><td width='15%'>" + Number(data[i]["TotalAmount"]).toFixed(2) + "</td><td width='15%'>" + Number(data[i]["Balance"]).toFixed(2) + "</td><td width='15%'>" + data[i]["OrderStatus"] + "</td></tr>");
                }
                else if(status == 'All'){
                    $("#tblMain tbody").append("<tr><td width='15%'>" + data[i]["RefNo"] + "</td><td width='15%'>" + FormatDate(data[i]["CreatedDate"]) + "</td><td width='25%'>" + data[i]["Salesman"] + "</td><td width='15%'>" + Number(data[i]["TotalAmount"]).toFixed(2) + "</td><td width='15%'>" + Number(data[i]["Balance"]).toFixed(2) + "</td><td width='15%'>" + data[i]["OrderStatus"] + "</td></tr>");
                }
            }

            FillSalesOrderDefault() ;

        }

        function FillSalesOrderDefault() {
            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
            }
        }

        var SalesOrderDetails =<%= SalesOrderVM.CustomerSalesOrderDetails(long.Parse( (Request["customerID"] == null ? "0" : Request["customerID"])  )) %>;  
    </script>
</asp:Content>
