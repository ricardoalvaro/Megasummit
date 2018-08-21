<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSalesReturnInformation.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSalesReturnInformation" %>

<%@ Register Src="include/CustomerSubMenu.ascx" TagName="CustomerSubMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
    <div id="main" class="customer-sales-order">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="container one-column withpad withbg mod-sales-invoice">
                    <div class="inner">
                        <div class="box-holder">
                            <div id="content-holder">
                                <div class="content">
                                    <div name="customer_sales_order_form" id="customer_sales_order_form" class="ym-form">
                                        <div class="addup">
                                            <h1>Sales Return</h1>
                                            <div class="ym-grid grid3">
                                                <div class="left ym-gl">
                                                    <div class="ym-gbox">
                                                        <div class="ym-clearfix">
                                                            <div class="float-left">
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl" width="19%">
                                                                            <label for="customer">*Customer</label></td>
                                                                        <td class="obj">
                                                                             <input type="text" autocorrect="off" spellcheck="false" id="customer"  value="" class="long" />       
                                                                          
                                                                         <%--   <div class="select-arrow long">
                                                                                <select name="customer" id="customer">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>--%>
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
                                                                    <label for="deliver_to">*Deliver To</label></td>
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
                                                                    <label for="salesman">Salesman</label></td>
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
                                                                    <td class="lbl">
                                                                        <label for="reference_number">*Reference No.</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" value="SR" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" disabled />
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
                                                                    <td class="lbl"></td>
                                                                     
                                                                    <td class="obj">
                                                                        
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
                                            <table class="tblholder unclickable" id="tblSalesOrder">
                                                <thead>
                                                    <tr>
                                                        <th width="20%">Product Name</th>
                                                        <th width="10%">Location</th>
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
                                                                            <td class="lbl" valign="top">
                                                                                <label for="notes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notes</label></td>
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
                                                                            <td>Total Amount</td>
                                                                            <td><span id="spnTotal">0.00</span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <a href="apply-to-invoice" class="view btnlink"><img src="http://localhost:8181/megasummit/images/buttons/apply-invoice.png" width="87" height="20" alt="Void"></a>
                                                                            </td>
                                                                            <td> <span id="spnServed">0.00</span> </td>
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
                                                        <div class="ym-gbox"> &nbsp;
                                                           <%-- <a href="">
                                                                <img src="http://localhost:8181/megasummit/images/buttons/close.png" width="71" height="20" alt="Void" /></a>&nbsp;
                                                    <a href="">
                                                        <img src="http://localhost:8181/megasummit/images/buttons/hold.png" width="71" height="20" alt="Hold" /></a>--%>
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

    </div>

    <script src="Script/SalesREturn.js"></script>

    <script type="text/javascript">

        var ProductAutoCompleteData = <%= ProductVM.AutoCompleteProduct %>;
        var LocationAutoCompleteData = <%= LocationVM.AutoCompleteLocation %>;
        var ProductDetailData = <%= ProductVM.ProductDetail %>;
        var UnitData = <%= ProductVM.Units %>;
        var CustomerData = <%= CustomerVM.CustomerAutoComplete %>;
        var ForwarderData = <%= CustomerVM.Forwarders %>;
        var SalesmanData = <%= EmployeeVM.Employees(0, string.Empty, "Salesman") %>;
        var TermData = <%= CustomerVM.Terms %>;

    </script>

</asp:Content>
