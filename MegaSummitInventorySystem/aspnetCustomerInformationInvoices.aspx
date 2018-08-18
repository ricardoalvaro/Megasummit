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
                        <table class="tblholder main unclickable">
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
                            	<tr>
                                    <td width="12%">here</td>
                                    <td width="12%">here</td>
                                    <td width="15%">here</td>
                                    <td width="25%">here</td>
                                    <td width="10%">here</td>
                                    <td width="10%">here</td>
                                    <td width="10%">here</td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
                                <tr>
                                    <td width="12%"></td>
                                    <td width="12%"></td>
                                    <td width="15%"></td>
                                    <td width="25%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                </tr>
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
</asp:Content>


