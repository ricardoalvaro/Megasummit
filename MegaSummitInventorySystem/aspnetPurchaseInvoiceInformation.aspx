<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetPurchaseInvoiceInformation.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetPurchaseInvoiceInformation" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />
      <div id="main" class="suppliers-purchase-order">

          <div class="ym-wrapper">    	   	
            <div class="ym-wbox"> 
                <div class="container one-column withpad withbg mod-purchase-invoice">
                    <div class="inner">                    	
                        <div class="box-holder">                        
                	        <div class="content">
                                <div name="suppliers_purchase_form" id="suppliers_purchase_form" method="POST" class="ym-form">
                                    <div class="addup">
                                        <h1>Purchase Invoice</h1>
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
                                                           
                                                                       <%-- <div class="select-arrow long">
                                                                            <select name="supplier" id="supplier">
                                                                                <option value=""></option>                                                                                                                                     
                                                                            </select>
                                                                        </div>--%>
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
                                                                 <div class="select-arrow long">
                                                                    <select name="salesman" id="salesman">
                                                                        <option value=""></option>                                                               
                                                                    </select>
                                                                </div>
                                                                <%--<input type="text" autocorrect="off" spellcheck="false" id="salesman" name="salesman" class="long" />--%>

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
                                                                                <option value="COD">COD</option>
                                                                                <option value="30">30</option>
                                                                                <option value="60">60</option>
                                                                                <option value="90">90</option>
                                                                                <option value="120">120</option>
                                                                                <option value="150">150</option> 
                                                                                <option value="180">180</option>                                                                  
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
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" value="PI" />
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
                                                                <td class="lbl"><label for="date">*Date</label></td>
                                                                <td class="obj">
                                                                    <div class="dp xmedium">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date"  />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl"><label for="cancel_date">*Cancel Date</label></td>
                                                                <td class="obj">
                                                                    <div class="dp xmedium">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="cancel_date" name="cancel_date" class="date"  />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>   
                                                    </div>
                                                </div>    
                                            </div>
                                        </div>
                                        <div class="space15"></div>
                                    </div>                                
                                    <div class="subtab-container">
                                        <div class="box-holder">
                                            <ul class="subtabs crossfade withtext">
                                            <li id="liPurchaseOrder" class="active view">
                                                <div class="ym-clearfix">
                                                    <a href="javascript:void(0)">Purchase Order</a>
                                                    <span class="obj">
                                                        <div class="select-arrow">
                                                            <select id="order_number">
                                                               
                                                            </select>
                                                        </div>
                                                    </span>
                                                </div>
                                            <li id="liPurchaseInvoice" class="view"><div class="ym-clearfix"><a href="javascript:void(0)">Purchase Invoice</a><span id="spnPurchaseInvoiceAmount">0.00</span></div>
                                            </ul>
                                            <div id="subtab-content-holder" class="subcontainer">
                                                <div id="content-holder">
                                                    <div id="purchase_order_holder">
                                                        <div class="content tabular">
                                                        <table class="tblholder unclickable" id="tblPurchaseOrder">
                                                            <thead>
                                                                <tr>
                                                                    <th width="15%">Product Name</th>
                                                                    <th width="15%">Location</th>
                                                                    <th width="10%">Quantity</th>
                                                                    <th width="10%">Bonus</th>
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

                                                    </div>
                                                    <div id="purchase_invoice_holder" style="display:none">
                                                        <div class="content tabular">
                                                                <table class="tblholder unclickable" id="tblPurchaseInvoice">
                                                                    <thead>
                                                                        <tr>
                                                                            <th width="15%">Product Name</th>
                                                                            <th width="15%">Location</th>
                                                                            <th width="10%">Quantity</th>
                                                                            <th width="10%">Bonus</th>
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

                                                    </div>
                                        	        
                                                </div>
                                            </div>                          
                                        </div>
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
                                                                        <td>Subtotal</td>
                                                                        <td><span id="spnSubTotal">0.00</span></td>
                                                                    </tr>
                                                                    <tr>                                                                    
                                                                        <td><a href="payment" class="view btnlink"><img src="image/payment.png" width="71" height="20" alt="Payment" /></a></td>
                                                                        <td><span id="spnTotalPayment">0.00</span></td>
                                                                    </tr> 
                                                                    <tr>
                                                                        <td><a href="memo" class="form btnlink"><img src="image/memo.png" width="71" height="20" alt="Memo" /></a></td>
                                                                        <td><span id="spnMemo">0.00</span></td>
                                                                    </tr>                                                                                                           
                                                                </table>
                                                            </div>   
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of Two Grids -->		
                                        </div>
                                        <div class="row2">
                                            <!-- Start of Two Grids -->
                                            <div class="ym-grid linearize-level-1">                                            
                                                <div class="pane-right ym-gr">
                                                    <div class="ym-gbox">
                                                        Amount Due&nbsp;&nbsp;&nbsp;&nbsp;<span id="spnAmountDue">0.00</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End of Two Grids -->		
                                            <div class="space10"></div>
                                        </div>
                                    </div>  
                                    <div class="addup"><div class="space10"></div></div>                              
                                </div>	
                            </div>    
                        </div>
                    </div>      			
                </div>	
            </div>
        </div>

      </div>

    <style>
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

    <script src="Script/PurchaseInvoice.js"></script>
    <script type="text/javascript">
        var SinglePurchaseInvoiceData = <%= SupplierVM.SinglePurchaseInvoice(long.Parse( (Request["purchaseInvoiceID"] == null ? "0" : Request["purchaseInvoiceID"])  )) %>;
        var SinglePurchaseInvoiceDetailsData = <%= SupplierVM.SinglePurchaseInvoiceDetails(long.Parse( (Request["purchaseInvoiceID"] == null ? "0" : Request["purchaseInvoiceID"])  )) %>;

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
