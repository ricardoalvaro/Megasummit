<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetPurchaseOrderInformation.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetPurchaseOrderInformation" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />
    <div id="main" class="suppliers-purchase-order">
     <div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
        <div class="container one-column withpad withbg mod-sales-invoice">
            <div class="inner">                    	
                <div class="box-holder">                        
                	<div id="content-holder">
                    	<div name="customer_purchase_order_form" id="customer_purchase_order_form" method="POST" class="ym-form">
                            <div class="addup">
                                <h1>Purchase Order</h1>
                                <div class="ym-grid grid3">
                                    <div class="left ym-gl">
                                        <div class="ym-gbox">
                                            <div class="ym-clearfix">
                                                <div class="float-left">
                                                    <table>
                                                        <tr>
                                                            <td class="lbl" width="19%"><label for="supplier">*Supplier</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="supplier"  value="" class="long" />       
                                                           
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl" valign="top"><label for="address">*Address</label></td>
                                                            <td class="obj"><textarea id="address" name="address" autocorrect="off" spellcheck="false" class="long"></textarea></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>	    
                                    </div>
                                    <div class="middle ym-gl">
                                        <div class="ym-gbox">
                                            <table>
                                            	<tr>
                                                    <td class="lbl" width="19%"><label for="deliver_to">Deliver To</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow long">
                                                            <select name="deliver_to" id="deliver_to">
                                                                <option value=""></option>                                                               
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="salesman">Salesman</label></td>
                                                    <td class="obj">
                                                     <%--   <input type="text" autocorrect="off" spellcheck="false" id="salesman" name="salesman" class="long" />--%>
                                                              <div class="select-arrow long">
                                                            <select name="salesman" id="salesman">
                                                                <option value=""></option>                                                               
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="po_number">P.O No.</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="po_number" name="po_number" value="" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="terms">*Terms</label>
                                                                <div class="select-arrow short">
                                                                    <select name="terms" id="terms">
                                                                                                                            
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>      
                                                    </td>
                                                </tr>
                                            </table>	
                                        </div>    
                                    </div>
                                    <div class="right ym-gr">
                                        <div class="ym-gbox ym-clearfix">
                                            <div class="float-right">
                                                <table>
                                                	<tr>
                                                        <td class="lbl"><label for="reference_number">*Reference No.</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" value="PO" />
                                                                </div>
                                                                <div class="col-left">
                                                                    &nbsp;&nbsp;
                                                                </div>
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_number" name="reference_number" class="xxxmedium" />
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                        </td>
                                                    </tr>    
                                                    <tr>
                                                        <td class="lbl"><label for="reference_number">*Date</label></td>
                                                        <td class="obj">
                                                            <div class="dp xmedium">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="cancel_date">*Cancel Date</label></td>
                                                        <td class="obj">
                                                            <div class="dp xmedium">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="cancel_date" name="cancel_date" class="date" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                            	</table>	
                                            </div>
                                        </div>    
                                    </div>
                                </div>
                                <div class="space5"></div>
                            </div>                                
                            <div class="rounded">
                                <table class="tblholder unclickable" id="tblPurchaseOrder">
                                    <thead>
                                        <tr>
                                            <th width="20%">Product Name</th>
                                            <th width="10%">Location</th>
                                            <th width="10%">Quantity</th>
                                            <th width="10%">Bonus</th>
                                            <th width="10%">Served</th>
                                            <th width="10%">Unit</th>
                                            <th width="10%">Unit Price</th>
                                            <th width="10%">Discount</th>
                                            <th width="10%">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody class="scroll">
                                        
                                    </tbody>
                               </table>
                            </div>
                            <div class="space10"></div>
                            <div class="addup bottom-pane">
                                <div class="row1">
                                    <!-- Start of Two Grids -->
                                    <div class="ym-grid linearize-level-1">
                                        <div class="pane-left ym-gl">
                                            <div class="ym-gbox">
                                                <div class="ym-clearfix">
                                                    <div class="float-left">
                                                        <table>
                                                            <tr>
                                                                <td class="lbl" valign="top"><label for="notes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notes</label></td>
                                                                <td class="obj"><textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="long"></textarea></td>
                                                            </tr>
                                                        </table>
                                                    </div>                                                        
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pane-right ym-gr">
                                            <div class="ym-gbox">
                                                <div class="ym-clearfix">
                                                    <div class="float-right">
                                                        <table>
                                                            <tr>
                                                                <td>Total Amount</td>
                                                                <td><span id="spnTotal">0.00</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Total Served</td>
                                                                <td><span id="spnServed">0.00</span> </td>
                                                            </tr>                                                  
                                                        </table>
                                                    </div>
                                                </div>	
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Two Grids -->  
                                    <div class="space5">&nbsp;</div>                                     
                                </div>
                                <div class="row2">
                                    <!-- Start of Two Grids -->
                                    <div class="ym-grid ym-equalize linearize-level-1">
                                        <div class="pane-left ym-gl">
                                            <div class="ym-gbox">
                                                <a href="javascript:void(0)" onclick="CloseStatus()"><img src="image/close.png" width="71" height="20" alt="Void" /></a>&nbsp;
                                              <%--  <a href=""><img src="http://localhost:8181/megasummit/images/buttons/hold.png" width="71" height="20" alt="Hold" /></a>--%>
                                            </div>
                                        </div>
                                        <div class="pane-right ym-gr">
                                            <div class="ym-gbox">
                                                <div class="ym-clearfix">
                                                    <div class="float-right">
                                                        <table>
                                                            <tr>
                                                                <td>Balance&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                <td><span id="spnBalance">0.00</span></td>
                                                            </tr>                                                 
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Two Grids -->		
                                </div>
                                <div class="space10"></div>
                            </div>
                        </div>
                    </div>	    
                </div>
            </div>      			
        </div>	
    </div>
</div>
    </div>

    <style>
        .ym-form input[type="text"]:disabled, .ym-form textarea:disabled {
            background: none;
        }
        .product {
            border: none;
            background: none;
        }
        .location {
            border: none;
            background: none;
        }
        .quantity {
            border: none;
            background: none;
        }
        .bonus {
            border: none;
            background: none;
        }
        .served {
            border: none;
            background: none;
        }
        .unit {
            border: none;
            background: none;
        }
        .price {
            border: none;
            background: none;
        }
        .discount {
            border: none;
            background: none;
        }
        .amount {
            border: none;
            background: none;
        }
    </style>

    <script src="Script/SupplierPurchaseOrder.js"></script>
    <script type="text/javascript">

        var SinglePurchaseOrderData = <%= SupplierVM.SinglePurchaseOrder(long.Parse( (Request["purchaseOrderID"] == null ? "0" : Request["purchaseOrderID"])  )) %>;
        var SinglePurchaseOrderDetailsData = <%= SupplierVM.SinglePurchaseOrderDetails(long.Parse( (Request["purchaseOrderID"] == null ? "0" : Request["purchaseOrderID"])  )) %>;

        var ProductAutoCompleteData = <%= ProductVM.AutoCompleteProduct %>;
        var LocationAutoCompleteData = <%= LocationVM.AutoCompleteLocation %>;
        var ProductDetailData = <%= ProductVM.ProductDetail %>;
        var UnitData = <%= ProductVM.Units %>;
        var SupplierData = <%= SupplierVM.AutoCompleteSupplier %>;
        var ForwarderData = <%= CustomerVM.Forwarders %>;
        var SalesmanData = <%= EmployeeVM.Employees(0, string.Empty, "Salesman") %>;
        var TermData = <%= CustomerVM.Terms %>;


    </script>
</asp:Content>
