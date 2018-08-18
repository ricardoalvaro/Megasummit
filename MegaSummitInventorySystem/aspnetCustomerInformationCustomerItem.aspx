<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerInformationCustomerItem.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerInformationCustomerItem" %>
<%@ Register src="include/CustomerSubMenuAjax.ascx" tagname="CustomerSubMenuAjax" tagprefix="uc1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />

    <div id="main" class="customer-customers">
        <div class="ym-wrapper">    	   	
            <div class="ym-wbox"> 
       <uc1:CustomerSubMenuAjax ID="CustomerSubMenuAjax1" runat="server" />
           <div class="container one-column">
            <div class="inner">                    	
                <div class="box-holder">                        
                	<div class="content tabular">                            	
                        <table class="tblholder main unclickable">
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
                            	<tr>
                                    <td width="18%">here</td>
                                    <td width="10%">here</td>
                                    <td width="18%">here</td>
                                    <td width="10%">here</td>
                                    <td width="10%">here</td>
                                    <td width="15%">here</td>
                                    <td width="10%">here</td>
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

</asp:Content>
