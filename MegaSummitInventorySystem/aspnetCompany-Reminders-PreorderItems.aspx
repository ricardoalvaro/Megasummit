<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Reminders-PreorderItems.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Reminders_PreorderItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .ym-form .submit {
            color:#858585;
        }
        .ym-form .obj select {
            padding: 2px 5px 1px 5px;
        }
        .ym-form .obj input[type="text"], .ym-form .obj input[type="password"], .ym-form .obj .dp {
            padding: 2px 5px 1px 5px;
        }
        .ym-form .obj textarea {
            padding: 2px 5px 1px 5px;
        }
        .ym-form .obj .dp input[type="text"] {
            padding: 2px 5px 1px 0;
        }
    </style>
    <div id="subheader" class="hassubmenu">
    <div class="ym-wrapper">
    	<div class="ym-wbox">
        	<!-- Start of Two Grids -->
            <div class="ym-grid linearize-level-1">
                <div class="block-left ym-gl">
                    <div class="ym-gbox">
                        <ul class="menu ym-clearfix">
                            <li class=""><a href="aspnetCompany.aspx">Company</a></li>
                            <li class=""><a href="aspnetCompany-Summary.aspx">Summary</a></li>
                            <li class="active"><a href="aspnetCompany-Reminders.aspx">Reminders</a></li>
                            <li class=""><a href="aspnetCompany-History.aspx">History</a></li>		
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>
                </div>
                <div class="block-right ym-gr">
    <div class="ym-gbox">
        <ul id="toolbar" class="">
            <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
            <li><a id="btn-new" class="new disabled " href="">New</a></li>
            <li><a id="btn-find" class="find disabled" href="javascript:;">Find</a></li>
            <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
            <li><a id="btn-print" class="print " href="javascript:;">Print</a></li>
        </ul>	
    </div>
</div>            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div><div id="main" class="company-reminders-preorder-items">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="submenu ">
    <ul class="crossfade ym-clearfix">
        <li class=""><a href="aspnetCompany-Reminders.aspx">Due Invoices</a></li>
        <li class=""><a href="aspnetCompany-Reminder-UndepositFunds.aspx">Undeposit Funds</a></li>
        <li class=""><a href="aspnetCompany-Reminders-ReturnedCheck.aspx">Returned Checks</a></li>
        <li class="active"><a href="aspnetCompany-Reminders-PreorderItems.aspx">Preorder Items</a></li>
        <li class=""><a href="aspnetCompany-Reminders-SalesOrder.aspx">Sales Order</a></li>
        <li class=""><a href="aspnetCompany-Reminders-PurchaseOrder.aspx">Purchase Order</a></li>
        <li class=""><a href="aspnetCompany-Reminders-TodoList.aspx">To Do List</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>
</div>        	<div class="container">
            	<div class="one-column">
                	<div class="inner">                    	
                        <div class="box-holder">
                            <div class="content tabular">                            	
                                <table class="tblholder unclickable">
                                    <thead>
                                        <tr>
                                            <th width="35%">Product Name</th>
                                            <th width="15%">Quantity on Hand</th>
                                            <th width="15%">Reorder Quantity</th>
                                            <th width="15%">Quantity Demand</th>
                                            <th width="15%">Quantity to Order</th>
                                        </tr>
                                    </thead>
                                    <tbody class="scroll">                                        
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
                                        </tr>
                                        <tr>
                                            <td width="35%"></td>
                                            <td width="20%"></td> 
											<td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>
                                            <td width="15%"></td>                                                                                       
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
</div>

</asp:Content>
