<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSalesInvoice.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSalesInvoice" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
   
    <div id="main" class="customer-sales">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="container one-column withpad withbg mod-sales-invoice">
                    <div class="inner">
                        <div class="box-holder">
                            <div class="content">
                                <div name="customer_sales_order_form" id="customer_sales_order_form" method="POST" class="ym-form">
                                    <div class="addup">
                                        <div class="heading ym-clearfix">
                                            <h1>Sales Invoice</h1>
                                            <div class="link">
                                                <a href="#" class="left" id="topLink"></a>
                                                <%--<a href="#form2" class="right"></a>--%>
                                            </div>
                                        </div>
                                        <div id="form4" class="form-content h80 active">
                                            <div class="ym-grid grid3">
                                                <div class="left ym-gl">
                                                    <div class="ym-gbox">
                                                        <div class="ym-clearfix">
                                                            <div class="float-left">
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="customer">*Customer</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="customer"  value="" class="long" />       
                                                                          
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl" valign="top">
                                                                            <label for="address">*Address</label></td>
                                                                        <td class="obj">
                                                                            <textarea id="address" name="address" autocorrect="off" spellcheck="false" class="long"></textarea></td>
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
                                                                <td class="lbl">
                                                                    <label for="deliver_to">Deliver To</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow long">
                                                                        <select name="deliver_to" id="deliver_to">
                                                                            <option value=""></option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="salesman">*Salesman</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow long">
                                                                        <select name="salesman" id="salesman">
                                                                            <option value=""></option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="po_number">P.O No.</label></td>
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
                                                                    <td class="lbl">
                                                                        <label for="reference_number">*Reference No.</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <div class="select-arrow xxshort">
                                                                                    <select id="reference_no">
                                                                                        <option value=""></option>
                                                                                    </select>
                                                                                </div>
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
                                                                    <td class="lbl">
                                                                        <label for="date">*Date</label></td>
                                                                    <td class="obj">
                                                                        <div class="dp xmedium">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="delivery_date">*Delivery Date</label></td>
                                                                    <td class="obj">
                                                                        <div class="dp xmedium">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="delivery_date" name="delivery_date" class="date" />
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="form2" class="form-content h80">
                                            <div class="ym-grid grid3">
                                                <div class="left ym-gl">
                                                    <div class="ym-gbox">
                                                        <div class="ym-clearfix">
                                                            <div class="float-left">
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="prepared">&nbsp;&nbsp;&nbsp;Prepared</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow long">
                                                                                <select id="prepared" id="prepared">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="checked">Checked</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow long">
                                                                                <select id="checked" id="checked">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="delivered">Delivered</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow long">
                                                                                <select id="delivered" id="delivered">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
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
                                                                <td class="lbl">
                                                                    <label for="waybill_number">Waybill No.</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="waybill_number" name="waybill_number" class="long" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="container_number">Container No.</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="container_number" name="container_number" class="long" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="lading_bill">Bill of Lading</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="lading_bill" name="lading_bill" class="long" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="right ym-gr">
                                                    <div class="ym-gbox ym-clearfix">
                                                        <div class="float-right">
                                                            <table>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="commission_rate">Commission Rate</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="commission_rate" name="commission_rate" class="xmedium" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="commission_amount">Commission Amt.</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="commission_amount" name="commission_amount" class="xmedium" disabled /></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="space10"></div>
                                    </div>
                                    <div class="subtab-container">
                                        <div class="box-holder">
                                            <ul class="subtabs crossfade withtext">
                                                <li id="liSalesOrder" class="active view">
                                                    <div class="ym-clearfix">
                                                        <a href="#">Sales Order</a>
                                                        <span class="obj">
                                                            <div class="select-arrow">
                                                                <select id="order_number">
                                                                </select>
                                                            </div>
                                                        </span>
                                                    </div>
                                                    </li>
                                                    <li id="liSalesInvoice" class="view">
                                                        <div class="ym-clearfix">
                                                            <a href="#">Sales Invoice</a>
                                                            <span id="spnInvoiceAmount">0.00</span>
                                                        </div>
                                                  </li>
                                            </ul>
                                            <div id="subtab-content-holder" class="subcontainer">
                                                <div id="content-sales-order">
                                                    <div class="content tabular">
                                                        <table class="tblholder unclickable" id="tblSalesOrder">
                                                            <thead>
                                                                <tr>
                                                                    <th width="30%">Product Name</th>
                                                                    <th width="15%">Location</th>
                                                                    <th width="10%">Quantity</th>
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
                                                <div id="content-sales-invoice" style="display:none">
	                                                <div class="content tabular">
                                                        <table class="tblholder unclickable" id="tblSalesInvoice">
                                                            <thead>
                                                                <tr>
                                                                    <th width="20%">Packing</th>
                                                                    <th width="20%">Product Name</th>
                                                                    <th width="10%">Location</th>
                                                                    <th width="10%">Quantity</th>
                                                                    <th width="10%">Unit</th>
                                                                    <th width="10%">Unit Price</th>
                                                                    <th width="10%">Discount</th>
                                                                    <th width="10%">Amount</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody  class="scroll">
                                                                
                                                            </tbody>

                                                       </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space5"></div>
                                    <div class="addup">
                                        <div class="bottom-pane">
                                            <div class="row1">
                                                <div class="slidepane">
                                                    <div class="slideholder">
                                                        <div id="pane1" class="pane-content active">
                                                            <!-- Start of Two Grids -->
                                                            <div class="ym-grid linearize-level-1">
                                                                <div class="pane-left ym-gl">
                                                                    <div class="ym-gbox">
                                                                        <div class="ym-clearfix">
                                                                            <div class="float-left">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td class="lbl" width="19%">
                                                                                            <label for="remarks">Remarks</label></td>
                                                                                        <td class="obj">
                                                                                            <div class="select-arrow long">
                                                                                                <select name="remarks" id="remarks">
                                                                                                    <option value=""></option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="lbl" valign="top">
                                                                                            <label for="notes">Notes</label></td>
                                                                                        <td class="obj">
                                                                                            <textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="long"></textarea></td>
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
                                                                                        <td><input type="text" id="spnSubTotal" value="0.00" style="width: 100%;border: 1px solid transparent;text-align: right;color: #8c8686;"/></td>
                                                                                        <td><a href="#" class="view btnlink">
                                                                                            <img src="http://localhost:8181/megasummit/images/buttons/payment.png" width="71" height="20" alt="Payment" /></a></td>
                                                                                        <td>0.00</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>Tax</td>
                                                                                        <td><span id="spnTax"></span></td>
                                                                                        <td><a href="#" class="form btnlink">
                                                                                            <img src="http://localhost:8181/megasummit/images/buttons/memo.png" width="71" height="20" alt="Memo" /></a></td>
                                                                                        <td>0.00</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><a href="#" class="form btnlink">
                                                                                            <img src="http://localhost:8181/megasummit/images/buttons/shipping.png" width="71" height="21" alt="Shipping" /></a></td>
                                                                                        <td><input type="text" id="shipping" value="0.00" style="width: 100%;border: 1px solid transparent;text-align: right;color: #8c8686;"/></td>
                                                                                        <td><a href="#" class="view btnlink">
                                                                                            <img src="http://localhost:8181/megasummit/images/buttons/adjustment.png" width="71" height="20" alt="Adjustment" /></a></td>
                                                                                        <td>0.00</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- End of Two Grids -->
                                                        </div>
                                                        <div id="pane2" class="pane-content">
                                                            <div class="ym-grid">
                                                                <div class="ym-g50 ym-gl">
                                                                    <div class="ym-gbox">
                                                                        <div class="ym-clearfix">
                                                                            <div class="float-left">
                                                                                <div class="rounded padfull5">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>Credit Limit</td>
                                                                                            <td align="right"> <span id="spnCreditLimit"></span></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Invoice Balance</td>
                                                                                            <td align="right"> <span id="spnInvoiceBalance"></span></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Post Dated Check</td>
                                                                                            <td align="right"> <span id="spnPostDateCheck"></span></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Available Credit</td>
                                                                                            <td align="right"> <span id="spnAvailableCredit"></span></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="ym-g50 ym-gr">
                                                                    <div class="ym-gbox">
                                                                        <div class="ym-clearfix">
                                                                            <div class="float-right">
                                                                                <div class="rounded padfull5">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>Price A</td>
                                                                                                        <td align="right">
                                                                                                            <span id="spnPriceA"></span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Price B</td>
                                                                                                        <td align="right">
                                                                                                            <span id="spnPriceB"></span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Price C</td>
                                                                                                        <td align="right">
                                                                                                            <span id="spaPriceC"></span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Ave. Cost</td>
                                                                                                        <td><span id="spnAveCost"></span></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td valign="top">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td valign="top">Disc A</td>
                                                                                                        <td><span id="spnDiscA"></span></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Disc B</td>
                                                                                                        <td><span id="spnDiscB"></span></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Disc C</td>
                                                                                                        <td><span id="spnDiscC"></span></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="#" class="down" id="slidebtn">&nbsp;</a>
                                                </div>
                                            </div>
                                            <div class="row2">
                                                <!-- Start of Two Grids -->
                                                <div class="ym-grid ym-equalize linearize-level-1">
                                                    <div class="pane-left ym-gl">
                                                        <div class="ym-gbox">
                                                            <a href="#">
                                                                <img src="http://localhost:8181/megasummit/images/buttons/void.png" width="71" height="20" alt="Void" /></a>&nbsp;
                                                    <a href="#">
                                                        <img src="http://localhost:8181/megasummit/images/buttons/hold.png" width="71" height="20" alt="Hold" /></a>
                                                        </div>
                                                    </div>
                                                    <div class="pane-right ym-gr">
                                                        <div class="ym-gbox">
                                                            Amount Due&nbsp;&nbsp;&nbsp;&nbsp;<span id="spnTotalAmount">0.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End of Two Grids -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="addup">
                                        <div class="space15"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        
    </div>

    <script src="Script/SalesInvoice.js"></script>
    <script type="text/javascript">

        


        var ProductAutoCompleteData = <%= ProductVM.AutoCompleteProduct %>;
        var LocationAutoCompleteData = <%= LocationVM.AutoCompleteLocation %>;
        var PackingData = <%= ProductVM.Packings %>;
        var ProductDetailData = <%= ProductVM.ProductDetail %>;
        var UnitData = <%= ProductVM.Units %>;
        var CustomerData = <%= CustomerVM.CustomerAutoComplete %>;
        var ForwarderData = <%= CustomerVM.Forwarders %>;
        var SalesmanData = <%= EmployeeVM.Employees(0, string.Empty, "Salesman") %>;
        var TermData = <%= CustomerVM.Terms %>;
        var RefNoData = <%= SalesVM.SalesSetting %>;
        var RemarksData = <%= SalesVM.Remarks %>; 
        var EmployeeData = <%= EmployeeVM.Employees(0, string.Empty, "Employee") %>;
        var CompanySalesTaxData = <%= CompanyVM.CompanySalesTax %>;

    </script>


</asp:Content>
