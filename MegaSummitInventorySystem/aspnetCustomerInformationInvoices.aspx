<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerInformationInvoices.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerInformationInvoices" %>
<%@ Register src="include/CustomerSubMenuAjax.ascx" tagname="CustomerSubMenuAjax" tagprefix="uc1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
    <div id="main" class="customer-customers">
        <div class="ym-wrapper">    	   	
            <div class="ym-wbox"> 
       <uc1:CustomerSubMenuAjax ID="CustomerSubMenuAjax1" class="nopad" runat="server" />
  
            <ul class="suboptions">
            <li class="active"><a href="#suboption-all">All</a></li>
            <li><a href="#suboption-paid">Paid</a></li>
            <li><a href="#suboption-unpaid">Unpaid</a></li>
        </ul>
        <div class="container one-column">
            <div class="inner">                    	
                <div class="box-holder"> 
                    <div class="content tabular">                            	
                        <table class="tblholder main unclickable" id="tblInvoices">
                            <thead>
                                <tr>
                                    <th width="12%">Reference No.</th>
                                    <th width="12%">Date</th>
                                    <th width="15%">Transaction Type</th>
                                    <th width="25%">Salesman</th>
                                    <th width="10%">Days</th>
                                    <th width="10%">Amount</th>
                                    <th width="10%">Balance</th>
                                </tr>
                            </thead>

                           

                            <tbody class="scroll">
                                 <asp:Repeater runat="server" ID="repMain">
                                <ItemTemplate>
                            	    <tr>
                                        <td width="12%"><%# Eval("RefNo").ToString() %></td>
                                        <td width="12%"><%# DateTime.Parse(Eval("CreatedDate").ToString()).ToString("MM/dd/yyyy") %></td>
                                        <td width="15%"><%# Eval("Description").ToString() %></td>
                                        <td width="25%"><%# Eval("Salesman").ToString() %></td>
                                        <td width="10%"></td>
                                        <td width="10%"><%# Decimal.Parse(Eval("TotalAmount").ToString()).ToString("N") %></td>
                                        <td width="10%"><%# Decimal.Parse(Eval("Balance").ToString()).ToString("N") %></td>
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

    <style>
        .padding-0 {
            padding: 0;
        }
    </style>

    <script type="text/javascript">

        $(document).ready(function () {
            FillCustomerInvoicesDefault();
        });

        function FillCustomerInvoicesDefault() {
            for (var i = 0; i < 50; i++) {
                $('#tblInvoices tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
            }
        }

    </script>
</asp:Content>


