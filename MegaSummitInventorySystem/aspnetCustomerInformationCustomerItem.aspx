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
                        
                        
                            
                                 <table class="tblholder main unclickable" id="tblMain">
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
                            <asp:Repeater runat="server" ID="repMain">
                            <ItemTemplate>
                                <tr>
                                    <td width="18%"><%# Eval("ProductName") %> </td>
                                    <td width="10%"><%# Eval("refNo") %></td>
                                    <td width="18%"><%# DateTime.Parse(Eval("DateCreated").ToString()).ToString("MM/dd/yyyy") %></td>
                                    <td width="10%"><%# Decimal.Parse(Eval("Quantity").ToString()).ToString("N") %></td>
                                    <td width="10%"><%# Eval("UnitName") %>UnitName</td>
                                    <td width="15%"><%# Decimal.Parse(Eval("UnitPrice").ToString()).ToString("N") %></td>
                                    <td width="10%"><%# Eval("Discount") %></td>
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



     <script type="text/javascript">


         $(document).ready(function () {
             FillDefault();
         });

  

         function FillDefault() {
             for (var i = 0; i < 50; i++) {
                 $('#tblMain tbody:last').append("<tr><td width='30%'></td><td width='15%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td><td width='10%'></td></tr>");
             }
         }


    </script>

</asp:Content>
