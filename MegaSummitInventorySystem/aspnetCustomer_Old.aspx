<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomer_Old.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /*.GeneralInfo {
            width: 1024px !important;
        }

        .padtop {
            padding: 28px 0 0 0;
        }*/
        .box-holder2 {
            height: 160px !important;
        }

        .suboptions2 {
            margin: 7px 0 3px 14px;
            padding: 0;
        }

        .hmiddle {
            width: 703px !important;
            height: 450px;
        }
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
        tbody.scroll {
            height: 407px !important;
        }
        .slimScrollDiv {
            height: 407px !important;
        }
        #main .ym-wbox {
            padding: 6px 0 4px 0;
        }
        .container.one-column {
            height: 432px !important;
        }
        .withbg {
    height: 423px !important;
}
    </style>
    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class="active"><a href="aspnetCustomer.aspx">Customers</a></li>
                                <li class=""><a href="aspnetCustomerSales.aspx">Sales</a></li>
                                <li class=""><a href="aspnetCustomerSalesReturn.aspx">Sales Return</a></li>
                                <li class=""><a href="aspnetCustomerSalesOrder.aspx">Sales Order</a></li>
                                <li class=""><a href="aspnetCustomerOfficialReceipt.aspx">Official Receipt</a></li>
                                <li class=""><a href="aspnetCustomerMemo.aspx">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div id="action_general_info" class="ym-gbox" style="display: block">
                            <ul id="toolbar" class="form-main">
                                <li><a onclick="ActionSaveUpdateCustomer(this)" class="save disabled">Save</a></li>
                                <li><a onclick="ActionNewCustomer(this)" class="new">New</a></li>
                                <li><a onclick="ActionSearchCustomer(this)" class="find ">Find</a></li>
                                <li><a onclick="ActionDeleteCustomer(this)" class="delete disabled">Delete</a></li>
                                <li><a class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>

                        <div id="action_customer_item" class="ym-gbox" style="display: none">
                            <ul id="toolbar" class="form-main">
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new  " href="">New</a></li>
                                <li><a id="btn-find" class="find " href="javascript:;">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>

                        <div id="action_sales_order" class="ym-gbox" style="display: none">
                            <ul id="toolbar" class="form-main">
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new  " href="">New</a></li>
                                <li><a id="btn-find" class="find " href="javascript:;">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>

                        <div id="action_invoices" class="ym-gbox" style="display: none">
                            <ul id="toolbar" class="form-main">
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new  " href="">New</a></li>
                                <li><a id="btn-find" class="find " href="javascript:;">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>

                        <div id="action_payment" class="ym-gbox" style="display: none">
                            <ul id="toolbar" class="form-main">
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new  " href="">New</a></li>
                                <li><a id="btn-find" class="find " href="javascript:;">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>

                        <div id="action_memo" class="ym-gbox" style="display: none">
                            <ul id="toolbar" class="form-main">
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new  " href="">New</a></li>
                                <li><a id="btn-find" class="find " href="javascript:;">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>

    <div id="main" class="customer-customers">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="submenu nopad" id="subMenuID">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <div id='mnu_submenu' class="submenu " style="display: none; padding: 0">
                    <ul class="crossfade ym-clearfix" style="width: 501px;">
                        <li id="liGeneralInfo" class="active form" onclick="ShowActiveTab('general_info')"><a class="save-new-delete" href="#">General Info</a></li>
                        <li id="liCustomerItem" class="view" onclick="ShowActiveTab('customer_item')"><a href="#">Customer Items</a></li>
                        <li id="liSalesOrder" class="view" onclick="ShowActiveTab('sales_order')"><a href="#">Sales Order</a></li>
                        <li id="liInvoices" class="view" onclick="ShowActiveTab('invoices')"><a href="#">Invoices</a></li>
                        <li id="liPayment" class="view" onclick="ShowActiveTab('payment')"><a href="#">Payments</a></li>
                        <li id="liMemo" class="view" onclick="ShowActiveTab('memo')"><a href="#">Memo</a></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <ul class="suboptions suboptions2" id="NextPageID">
                    <li>
                        <%--<a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                        <%--</div><%--</div>--%>
                    </li>
                </ul>
                <!--Submenu-END-->

                <div id="xGeneralInfo" style="display: block">
                    <div id="main" class="customer-customers">

                        <input id="hdnInvoiceID" type="hidden" value="0" />
                        <input id="hdnCheckTypeID" type="hidden" value="0" />

                        <div id="xGeneralInfoList" style="display: block;">
                            <div class="container one-column" style="height: 292px;">
                                <div class="inner">
                                    <div class="box-holder" style="height: 292px;">
                                        <div id="tab-content-holder">
                                                <div class="content tabular" id="tblCustomer">
                                            <table class="tblholder main">
                                                <thead>
                                                    <tr>
                                                        <th width="20%">Customer Name</th>
                                                        <th width="15%">Region Province</th>
                                                        <th width="10%">Status</th>
                                                        <th width="10%">Credit Limit</th>
                                                        <th width="10%">Salesman</th>
                                                    </tr>
                                                </thead>
                                                
                                                <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                </tbody>
                                                   
                                                <!--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; ">
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 157px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>-->
                                            </table>
                                        </div>
                                            <div class="addup">
                                                <div class="space20"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="xGeneralInfoForm" style="display: none;" class="padtop">
                            <div class="container one-column withbg mod-sales-invoice" style="">
                                <div class="inner">
                                    <div class="box-holder box-holder2" style="height: 411px !important;">
                                        <div id="content-holder">
                                            <div class="content vmiddle GeneralInfo" style="width: 1024px; height: 411px !important;">
                                                <div class="space40"></div>
                                                <div name="customer_customers_form" id="customer_customers_form" method="POST" class="ym-form">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <input id="hdn_customer_id" value="0" type="hidden" />
                                                                                    <label for="customer_name">*Customer Name</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="customer_name" name="customer_name" value="" class="fullwidth"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl" valign="top">
                                                                                    <label for="address">*Address</label></td>
                                                                                <td class="obj">
                                                                                    <textarea id="address" name="address" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="contact_person">Contact Person</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="contact_person" name="contact_person" value="" class="fullwidth"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="region_province">*Region Province</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow fullwidth">
                                                                                        <select name="region_province" id="region_province" onchange="LoadMunicipalityPerRegion()">
                                                                                            <%-- <option value="Abra">Abra</option>
                                                                                                        <option value="Agusan del Norte">Agusan del Norte</option>
                                                                                                        <option value="Agusan del Sur">Agusan del Sur</option>--%>
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="municipality">*Municipality</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow fullwidth">
                                                                                        <select name="municipality" id="municipality">
                                                                                            <%--   <option value=""></option>--%>
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="business_phone">Business Phone</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="business_phone" name="business_phone" value="" class="fullwidth"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="home_phone">Home Phone</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="home_phone" name="home_phone" value="" class="fullwidth"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="fax">Fax</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="fax" name="fax" value="" class="short">
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="mobile_phone">Mobile Phone</label>
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="mobile_phone" name="mobile_phone" value="" class="short">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl" valign="top">
                                                                                    <label for="notes">Notes</label></td>
                                                                                <td class="obj">
                                                                                    <textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td width="44"></td>
                                                                <td width="">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="ship_to">Ship To</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow fullwidth">
                                                                                        <select name="ship_to" id="ship_to">
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="price_level">*Price Level</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <div class="select-arrow short">
                                                                                                <select name="price_level" id="price_level">
                                                                                                    <option value="A">A</option>
                                                                                                    <option value="B">B</option>
                                                                                                    <option value="C">C</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="status">*Status</label>
                                                                                            <div class="select-arrow short">
                                                                                                <select name="status" id="status">
                                                                                                    <option value="Open">Open</option>
                                                                                                    <option value="Close">Close</option>
                                                                                                    <option value="Limit">Limit</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="tin_number">TIN No.</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="tin_number" name="tin_number" value="" class="short">
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="vat_number">VAT No.</label>
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="vat_number" name="vat_number" value="" class="short">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="salesman">*Salesman</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow fullwidth">
                                                                                        <select name="salesman" id="salesman">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="terms">*Terms</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <div class="select-arrow short">
                                                                                                <select name="terms" id="terms">
                                                                                                    <%--  <option value="COD">COD</option>
                                                                                                                <option value="30">30</option>
                                                                                                                <option value="60">60</option>
                                                                                                                <option value="90">90</option>
                                                                                                                <option value="120">120</option>
                                                                                                                <option value="150">150</option>
                                                                                                                <option value="180">180</option>--%>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="credit_limit">*Credit Limit</label>
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="credit_limit" name="credit_limit" value="" class="short">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2">
                                                                                    <div class="horz-divider"></div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="customer_since">Customer Since</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="customer_since" name="customer_since" value="" class="short" disabled="">
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="ave_receivables">Ave. Receivables</label>
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="ave_receivables" name="ave_receivables" value="" class="short" disabled="">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="last_invoice_date">Last Invoice Date</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="last_invoice_date" name="last_invoice_date" value="" class="short" disabled="">
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="last_invoice_amt">Last Invoice Amt</label>
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="last_invoice_amt" name="last_invoice_amt" value="" class="short" disabled="">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="last_payment_date">Last Payment Date</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="last_payment_date" name="last_payment_date" value="" class="short" disabled="">
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="last_payment_amt">Last Payment Amt</label>
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="last_payment_amt" name="last_payment_amt" value="" class="short" disabled="">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="total_cleared">Total Cleared</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="total_cleared" name="total_cleared" value="" class="short" disabled="">
                                                                                        </div>
                                                                                        <div class="col-right">
                                                                                            <label for="total_uncleared">Total Uncleared</label>
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="total_uncleared" name="total_uncleared" value="" class="short" disabled="">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="balance">Balance</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="balance" name="balance" value="" class="short" disabled="">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <div class="space10"></div>
                                                                    <div class="ym-clearfix">
                                                                        <div class="float-right">
                                                                            <button type="button" id="btn-opening-balance" class="submit small" onclick="LoadOpeningBalance();">Opening Balance</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="space5"></div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="xGeneralInfoSearch" style="display: none">
                            <div class="container one-column" style="height: 206px;">
                                <div class="inner">
                                    <div class="box-holder" style="height: 206px;">
                                        <div class="addup">
                                            <div class="pagination">
                                                <%--<a href="">&lt;&lt;</a> | <a href="#" id="A1">&lt; Previous</a>&nbsp;&nbsp;&nbsp;<a id='A2' href="#">Next &gt;</a> | <a href="">&gt;&gt;</a>--%>
                                            </div>
                                        </div>
                                        <div class="content tabular">
                                            <table class="tblholder main" id="Table1">
                                                <thead>
                                                    <tr>
                                                        <th width="100%">Customer Name</th>

                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 157px;">
                                                        <tr id="rec-1">
                                                            <td width="100%">
                                                                <input type="text" id="txt_customer_search" /></td>
                                                        </tr>
                                                        <tr id="Tr1">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr2">
                                                            <td width="100%"></td>

                                                        </tr>
                                                        <tr id="Tr3">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr4">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr5">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr6">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr7">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr8">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr9">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr10">
                                                            <td width="100%"></td>
                                                        </tr>
                                                        <tr id="Tr11">
                                                            <td width="100%"></td>
                                                        </tr>
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 157px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>
                                            </table>
                                        </div>
                                        <div class="addup">
                                            <div class="space20"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="xGeneralInfoOpeningBalance" style="display: none;">
                            <ul class="suboptions">
                                <li class="active form"><a href="#suboption-opening-balance-invoices" onclick="ShowOpeningBalance();">Invoices</a></li>
                                <li class="form"><a href="#suboption-opening-balance-payments"  onclick="ShowOpeningBalancePayment();">Payments</a></li>
                            </ul>
                            <div id="Div1">
                                <div id="xGeneralInfoOpeningBalanceInvoice" style="display: block;">
                                    <div class="container two-column-sidebar style2 withbg">
                                        <div class="ym-column linearize-level-1">
                                            <div class="ym-col1">
                                                <div class="ym-cbox padtop9">
                                                    <div class="box-holder">
                                                        <div class="ym-form">
                                                            <div class="addup">
                                                                <h1>Opening Balance - Invoices</h1>
                                                            </div>
                                                            <div class="content vmiddle hmiddle">
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="reference_number">*Reference No.</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <div class="select-arrow xxshort">
                                                                                        <select id="SalesRef" onclick="LoadRefDetails();">
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
                                                                            <label for="reference_number">*Date</label></td>
                                                                        <td class="obj">
                                                                            <div class="dp xmedium">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="salesman">*Salesman</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow medium">
                                                                                <select name="salesman" id="salesmanOpeningBalance">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="terms">*Terms</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow xxmedium">
                                                                                <select name="terms" id="termOpeningBalance">
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="commmission">*Commission %</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="commmission" name="commmission" class="xxmedium" value="0"/></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="amount">*Amount</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="xxmedium" value="0"/></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="balance">*Balance</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="BalanceOpeningBalance" name="balance" class="xxmedium" value="0"/></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ym-col3">
                                                <div class="ym-cbox">
                                                    <ul class="sidebar sidelists2 crossfade scroll" id="ULOpeningBalance">
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="xGeneralInfoOpeningBalancePayment" style="display: none;">
                                    <div class="container two-column-sidebar style2 withbg">
                                        <div class="ym-column linearize-level-1">
                                            <div class="ym-col1">
                                                <div class="ym-cbox padtop9">
                                                    <div class="box-holder">
                                                        <div class="ym-form">
                                                            <div class="addup">
                                                                <h1>Opening Balance - Payments</h1>
                                                            </div>
                                                            <div class="content vmiddle hmiddle">
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="bank_name">*Bank Name</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow long">
                                                                                <select id="bank_name">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="check_number">*Check No.</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="check_number" name="check_number" class="medium" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="date">*Date</label></td>
                                                                        <td class="obj">
                                                                            <div class="dp xxmedium">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="checkDate" name="date" class="date" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="check_type">*Check Type</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow xxmedium">
                                                                                <select id="check_type">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="amount">*Amount</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="checkAmount" name="amount" class="xxmedium" value="0" /></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ym-col3">
                                                <div class="ym-cbox">
                                                    <ul class="sidebar sidelists2 crossfade scroll" id="UlPaymentOpening">
                                                        
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--General-Info-END-->

                <div id="xCustomerItems" style="display: none; padding: 0 0 0 0">
                    <div class="container one-column" style="height: 292px;">
                        <div class="inner">
                            <div class="box-holder" style="height: 292px;">
                                <div class="content tabular">
                                    <table class="tblholder main unclickable" id="customerItemTable">
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
                                        <tbody class="scroll" style="height: 460px">
                                            <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                        </tbody>
                                        <!--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                            <tbody class="scroll" style="overflow: hidden; width: auto;">
                                            </tbody>
                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 272px;"></div>
                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                        </div>-->
                                    </table>
                                </div>
                                <div class="addup">
                                    <div class="space20"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Customer-Items-END-->

                <div id="xSalesOrder" style="display: none">
                    <ul class="suboptions">
                        <li class="active" onclick="OpenSalesOrderAll()"><a href="#">All</a></li>
                        <li onclick="OpenSalesOrderClosed()"><a href="#">Open</a></li>
                        <li onclick="OpenSalesOrderOpen()"><a href="#">Closed</a></li>
                    </ul>
                    <div class="container one-column" style="height: 270px;">
                        <div class="inner">
                            <div class="box-holder" style="height: 270px;">
                                <div>
                                    <div class="content tabular">
                                        <div id="xSalesOrderAll" style="display: none">
                                            <table class="tblholder main unclickable" id="SalesOrderTable">
                                                <thead>
                                                    <tr>
                                                        <th width="15%">Reference No.</th>
                                                        <th width="15%">Date</th>
                                                        <th width="25%">Salesman</th>
                                                        <th width="15%">Amount</th>
                                                        <th width="15%">Balance</th>
                                                        <th width="15%">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                                <!--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 174.402px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>-->
                                            </table>
                                        </div>

                                        <div id="xSalesOrderOpen" style="display: none">
                                            <table class="tblholder main unclickable">
                                                <thead>
                                                    <tr>
                                                        <th width="15%">Reference No.</th>
                                                        <th width="15%">Date</th>
                                                        <th width="25%">Salesman</th>
                                                        <th width="15%">Amount</th>
                                                        <th width="15%">Balance</th>
                                                        <th width="15%">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                                <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 250px;">
                                                        <tr>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 174.402px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>--%>
                                            </table>
                                        </div>

                                        <div id="xSalesOrderClosed" style="display: none">
                                            <table class="tblholder main unclickable">
                                                <thead>
                                                    <tr>
                                                        <th width="15%">Reference No.</th>
                                                        <th width="15%">Date</th>
                                                        <th width="25%">Salesman</th>
                                                        <th width="15%">Amount</th>
                                                        <th width="15%">Balance</th>
                                                        <th width="15%">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                                <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 270px;">
                                                        <tr>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                        </tr>
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 174.402px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>--%>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="addup">
                                        <div class="space20"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Sales-Order-END-->

                <div id="xInvoices" style="display: none">
                    <ul class="suboptions">
                        <li class="active" onclick="OpenInvoicesAll()"><a href="#">All</a></li>
                        <li onclick="OpenInvoicesPaid()"><a href="#">Paid</a></li>
                        <li onclick="OpenInvoicesUnpaid()"><a href="#">Unpaid</a></li>
                    </ul>
                    <div class="container one-column" style="height: 205px;">
                        <div class="inner">
                            <div class="box-holder" style="height: 205px;">
                                <div id="cotent-holder">
                                    <div class="content tabular">
                                        <div id="xInvoicesAll" style="display: none">
                                            <table class="tblholder main unclickable" id="xInvoiceAllTable">
                                                <thead>
                                                    <tr>
                                                        <th width="12%">Reference No.</th>
                                                        <th width="12%">Date</th>
                                                        <th width="25%">Salesman</th>
                                                        <th width="10%">Days</th>
                                                        <th width="10%">Amount</th>
                                                        <th width="10%">Balance</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll" style="height: 460px">
                                            <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                        </tbody>
                                                <!--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>-->
                                            </table>
                                        </div>

                                        <div id="xInvoicesPaid" style="display: none">
                                            <table class="tblholder main unclickable" id="xInvoicePaidTable">
                                                <thead>
                                                    <tr>
                                                        <th width="12%">Reference No.</th>
                                                        <th width="12%">Date</th>
                                                        <th width="25%">Salesman</th>
                                                        <th width="10%">Days</th>
                                                        <th width="10%">Amount</th>
                                                        <th width="10%">Balance</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                                <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>--%>
                                            </table>
                                        </div>

                                        <div id="xInvoicesUnpaid" style="display: none">
                                            <table class="tblholder main unclickable" id="xInvoiceUnPaidTable">
                                                <thead>
                                                    <tr>
                                                        <th width="12%">Reference No.</th>
                                                        <th width="12%">Date</th>
                                                        <th width="25%">Salesman</th>
                                                        <th width="10%">Days</th>
                                                        <th width="10%">Amount</th>
                                                        <th width="10%">Balance</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                                <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>--%>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Invoices-END-->

                <div id="xPayment" style="display: none">
                    <ul class="suboptions">
                        <li class="active" onclick="OpenPaymentCash()"><a href="#">Cash</a></li>
                        <li onclick="OpenPaymentCheck()"><a href="#">Check</a></li>
                        <li onclick="OpenPaymentCard()"><a href="#">Card</a></li>
                    </ul>
                    <div class="container one-column" style="height: 205px;">
                        <div class="inner">
                            <div class="box-holder" style="height: 205px;">
                                <div class="content tabular">
                                    <div id="xPaymentCash" style="display: none">
                                        <table class="tblholder main unclickable" id="xPaymentCashTable">
                                            <thead>
                                                <tr>
                                                    <th width="25%">Reference No.</th>
                                                    <th width="25%">Date</th>
                                                    <th width="25%">O.R Amount</th>
                                                    <th width="25%">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll" style="height: 460px">
                                            <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                        </tbody>
                                            <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>--%>
                                        </table>
                                    </div>

                                    <div id="xPaymentCheck" style="display: none">
                                        <table class="tblholder main unclickable" id="xPaymentCheckTable">
                                            <thead>
                                                <tr>
                                                    <th width="25%">Reference No.</th>
                                                    <th width="25%">Date</th>
                                                    <th width="25%">O.R Amount</th>
                                                    <th width="25%">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>--%>
                                        </table>
                                    </div>

                                    <div id="xPaymentCard" style="display: none">
                                        <table class="tblholder main unclickable" id="xPaymentCardTable">
                                            <thead>
                                                <tr>
                                                    <th width="25%">Reference No.</th>
                                                    <th width="25%">Date</th>
                                                    <th width="25%">O.R Amount</th>
                                                    <th width="25%">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll" style="height: 460px">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>--%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Payment-END-->

                <div id="xMemo" style="display: none">
                    <ul class="suboptions">
                        <li class="active" onclick=""><a href="#">All</a></li>
                        <li onclick=""><a href="#">Debit</a></li>
                        <li onclick=""><a href="#">Credit</a></li>
                    </ul>
                    <div class="container one-column" style="height: 205px;">
                        <div class="inner">
                            <div class="box-holder" style="height: 205px;">

                                <div class="content tabular">
                                    <div id="xMemoAll" style="display: none">
                                        <table class="tblholder main unclickable">
                                            <thead>
                                                <tr>
                                                    <th width="14%">Reference No.</th>
                                                    <th width="17%">Date</th>
                                                    <th width="14%">Memo Type</th>
                                                    <th width="25%">Account Name</th>
                                                    <th width="12%">Amount</th>
                                                    <th width="12%">Balance</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll" style="height: 460px">
                                            <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                        </tbody>
                                            <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>--%>
                                        </table>
                                    </div>

                                    <div id="xMemoDebit" style="display: none">
                                        <table class="tblholder main unclickable">
                                            <thead>
                                                <tr>
                                                    <th width="14%">Reference No.</th>
                                                    <th width="17%">Date</th>
                                                    <th width="14%">Memo Type</th>
                                                    <th width="25%">Account Name</th>
                                                    <th width="12%">Amount</th>
                                                    <th width="12%">Balance</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>
                                        </table>
                                    </div>

                                    <div id="xMemoCredit" style="display: none">
                                        <table class="tblholder main unclickable">
                                            <thead>
                                                <tr>
                                                    <th width="14%">Reference No.</th>
                                                    <th width="17%">Date</th>
                                                    <th width="14%">Memo Type</th>
                                                    <th width="25%">Account Name</th>
                                                    <th width="12%">Amount</th>
                                                    <th width="12%">Balance</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">here</td>
                                                        <td width="17%">here</td>
                                                        <td width="14%">here</td>
                                                        <td width="25%">here</td>
                                                        <td width="12%">here</td>
                                                        <td width="12%">here</td>
                                                    </tr>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 270px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!--Payment-END-->
            </div>
        </div>
    </div>  
     
    <script type="text/javascript" >
        var RegionData = <%= SelectRegion() %>
          //  LoadRegionTest();
    </script>
   <script src="Script/Customer.js"></script>

  

</asp:Content>
