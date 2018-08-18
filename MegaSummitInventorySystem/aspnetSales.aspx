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
                                        <table class="tblholder main">
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
                                            <tr id="rec-1">
                                                <td width="10%"><%# Eval("").ToString() %> </td>
                                                <td width="10%"><%# Eval("").ToString() %></td>
                                                <td width="30%"><%# Eval("").ToString() %></td>
                                                <td width="15%"><%# Eval("").ToString() %></td>
                                                <td width="10%"><%# Eval("").ToString() %></td>
                                                <td width="10%"><%# Eval("").ToString() %></td>
                                                <td width="10%"><%# Eval("").ToString() %></td>
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



        $('#btn-new').removeClass('disabled').click(function () {
            window.location = "aspnetSalesInvoice.aspx";
        });


    </script>


</asp:Content>
