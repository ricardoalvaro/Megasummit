<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomer.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomer1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

        input {
             outline: none;
        }

    </style>

    <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
     <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
            <div class="container one-column">
                <div class="inner">                    	
                    <div class="box-holder">                        
                        <div class="addup">
                            <div class="pagination">
                               <%-- <a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                            </div>
                        </div>
                        <div class="content tabular">      
                            
                            
                            <asp:Repeater runat="server" ID="repList">
                                <HeaderTemplate>
                                     <table  class="tblholder main">
                                        <thead>
                                            <tr>
                                                <th width="20%">Customer Name</th>
                                                <th width="15%">Region Province</th>
                                                <th width="10%">Status</th>
                                                <th width="10%">Credit Limit</th>
                                                <th width="10%">Salesman</th>
                                                <th width="10%">Balance</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tblMain" class="scroll" >
                                </HeaderTemplate>
                                <ItemTemplate>
                                            <tr id="rec-1"  onclick="RedirectToGeneralInfomation(<%# Eval("ID") %>)">
                                                <td width="20%"><%# Eval("CustomerName") %></td>
                                                <td width="15%"><%# Eval("RegionName") %></td>
                                                <td width="10%"><%# Eval("Status") %></td>
                                                <td width="10%"><%# decimal.Parse(Eval("CreditLimit").ToString()).ToString("N") %></td>
                                                <td width="10%"><%# Eval("Salesman") %></td>
                                                <td width="10%"><%# decimal.Parse(Eval("Balance").ToString()).ToString("N") %> </td>
                                            </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                             </tbody>
                                   </table>    
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="addup"><div class="space20">
                            
                            </div></div>
                    </div>
                </div>      			
            </div>	
        </div>
    </div>

    <script src="Script/Customer.js"></script>
    

</asp:Content>
