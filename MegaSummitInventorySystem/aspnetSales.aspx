<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSales.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSales" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
    
<div id="main" >
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="container one-column">
      			<div class="inner">                    	
                    <div class="box-holder">
                        <div class="addup">
                           <%-- <div class="pagination">
                                <a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>
                                
                            </div>--%>
                        </div>
                        <div id="tab-content-holder">
                            <div class="content tabular">        
                                 
                                <asp:Repeater runat="server" ID="repMain">
                                    <HeaderTemplate>
                                        <table id="tblMain" class="tblholder main">
                                            <thead>
                                                <tr>
                                                    <th width="10%">Reference No.</th>
                                                    <th width="10%">Date</th>
                                                    <th width="30%">Customer Name</th>
                                                    <th width="15%">Salesman</th>
                                                    <th width="10%">Amount</th>
                                                    <th width="10%">Balance</th>
                                                    <th width="10%">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                            <tr id="rec-1" onclick="SelectInvoice('<%# Eval("ID").ToString() %> ')">
                                                <td width="10%"><%# Eval("RefNo").ToString() %> </td>
                                                <td width="10%"><%# DateTime.Parse(Eval("CreatedDate").ToString()).ToString("MM/dd/yyyy") %></td>
                                                <td width="30%"><%# Eval("CustomerName").ToString() %></td>
                                                <td width="15%"><%# Eval("Salesman").ToString() %></td>
                                                <td width="10%"><%# decimal.Parse( Eval("TotalAmount").ToString()).ToString("N") %></td>
                                                <td width="10%"><%# decimal.Parse(Eval("Balance").ToString()).ToString("N") %></td>
                                                <td width="10%"><%# Eval("Status").ToString() %></td>
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
        </div>
    </div>
</div>

    <script type="text/javascript">


        $(document).ready(function () {
            $('#btn-new').removeClass('disabled').click(function () {
                window.location = "aspnetSalesInvoice.aspx";
            });
            FillSalesInvoiceDefault();
        });

        function SelectInvoice(id)
        {
            window.location = "aspnetSalesInvoice.aspx?invoiceID=" + id;
        }


        function FillSalesInvoiceDefault() {
            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
            }
        }
      

    </script>


</asp:Content>
