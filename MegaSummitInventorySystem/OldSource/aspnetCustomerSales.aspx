<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerSales.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerSales" %>

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
        .slimScrollDiv2 {
            height: 0 !important;
        }
        .ui-menu .ui-menu-item a {
            height: 12px;
            line-height: 10px;
            color: #858585;
            font-size: 12px;
        }

            .ui-menu .ui-menu-item a:hover {
                background: #1e90ff;
                color: #fff;
                border: none;
                border-radius: 0;
            }

        .ym-column {
            padding-left: 240px;
        }

        .ym-col3 {
            width: 240px;
            right: 240px;
        }

            .ym-col3 .sidelink .plus {
                color: #858585;
                display: block;
                padding: 7px 10px 7px 25px;
                background: #FFF url(image/plus.png) no-repeat 10px center !important;
            }

                .ym-col3 .sidelink .plus:hover {
                    background: #4ca1ff url(images/plus.png) no-repeat 10px center !important;
                    color: #FFF;
                }

        .newpayment {
            width: 660.013px !important;
            height: 111px;
        }

        .tabular, .rounded {
            border: 1px solid #e5e5e5 !important;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            overflow: hidden;
        }

        .height {
            height: 178px !important;
        }

        .vmiddle2 {
            width: 982px !important;
            height: 179px !important;
        }

        .hmiddle {
            width: 703px !important;
            height: 450px;
        }

        .no-border {
            border: none !important;
        }

        .subcontainer-height {
            height: 202px !important;
        }

        .pane-holder-height {
            height: 200px !important;
        }

        .yform2 {
            width: 660px;
        }

        .subholder2 {
            height: 112px !important;
        }

        .tbody2 {
            height: 99px !important;
        }

        .box-holder2 {
            height: 193px !important;
        }

        .custom-table {
            width: 100% !important;
        }

            .custom-table tbody {
                overflow: hidden !important;
                width: auto !important;
                height: 284px !important;
            }

                .custom-table tbody tr td {
                    padding: 7px 10px 7px 10px !important;
                    border-bottom: 1px solid #f7f7f7 !important;
                }

                .custom-table tbody tr:hover td {
                    background: #4ca1ff !important;
                    color: #FFF !important;
                }

                    .custom-table tbody tr:hover td a {
                        color: #858585 !important;
                    }

                    .custom-table tbody tr:hover td a {
                        color: #FFF !important;
                    }

        .a {
            color: #858585 !important;
        }

            .a:hover {
                color: #FFF !important;
            }

        .scrollbar {
            height: 160px;
            overflow-y: scroll;
        }

        .force-overflow {
            min-height: 240px;
        }

        #wrapper {
            text-align: center;
            width: auto;
            margin: auto;
        }

        #style-1::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #F5F5F5;
        }

        #style-1::-webkit-scrollbar {
            width: 12px;
            background-color: #F5F5F5;
        }

        #style-1::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #555;
        }

        .potabs li {
            margin: 0 27px 0 27px;
        }

        .GeneralInfo {
            width: 1024px !important;
        }

        .padtop {
            padding: 28px 0 0 0;
        }

        /*.content {
            height: 196px !important;
        }*/

        .content2 {
            height: 436px !important;
        }

        .style2 {
            height: 475px !important;
        }

        #main .ym-wbox {
            padding: 5px 0 5px 0;
        }
        tbody.scroll {
            height: 407px !important;
        }
        .slimScrollDiv {
            height: 407px !important;
        }
        #main .ym-wbox {
            padding: 4px 0 0px 0;
        }
        .container.one-column {
            height: 432px !important;
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
                                <li class=""><a href="aspnetCustomer.aspx">Customers</a></li>
                                <li class="active"><a href="aspnetCustomerSales.aspx">Sales</a></li>
                                <li class=""><a href="aspnetCustomerSalesReturn.aspx">Sales Return</a></li>
                                <li class=""><a href="aspnetCustomerSalesOrder.aspx">Sales Order</a></li>
                                <li class=""><a href="aspnetCustomerOfficialReceipt.aspx">Official Receipt</a></li>
                                <li class=""><a href="aspnetCustomerMemo.aspx">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">

                                <li><a id="btn-save" class="save disabled" onclick="SavingInvoice('Posted')">Save</a></li>
                                <li><a onclick="NewSales()" id="btn-new" class="new  ">New</a></li>
                                <li><a id="btn-find" class="find" onclick="ActionSearchInvoice()">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>

    <div id="main" class="customer-sales">
        <div class="ym-wrapper">
            <div class="ym-wbox">

                <input id="hdnInvoiceID" type="hidden" value="0" />
                <input id="hdnSalesOrder" type="hidden" value="0" />
                <input id="hdnPaymentID" type="hidden" value="0" />
                <input id="hndSalesInvoiceID" type="hidden" value="0" />
                <input id="hdnTotalPay" type="hidden" value="0" />
                <input id="hdnCustomerID" type="hidden" value="0" />
                <input id="hdnPriceLevel" type="hidden" value="" />
                <input id="ProductUnitID" type="hidden" value="0" />

                <input id="hdnOpeningPaymentID" type="hidden" value="0" />

                <div class="submenu nopad" style="display: normal">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>

                <div id="xSalesList" style="display: block">
                    <ul class="suboptions">
                        <li>
                            <%--<a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                        </li>
                    </ul>
                    <div id="main" class="customer-customers">
                        <div class="container one-column" style="height: 206px;">
                            <div class="inner">
                                <div class="box-holder" style="height: 206px;">
                                    <div id="tab_content_holder">
                                        <div class="content tabular">
                                            <table class="tblholder main" id="tblCustomer">
                                                <thead>
                                                    <tr>
                                                        <th width="10%">Reference No.</th>
                                                        <th width="10%">Date</th>
                                                        <th width="30%">Customer Name</th>
                                                        <th width="15%">Salesman</th>
                                                        <th width="10%">Amount</th>
                                                        <th width="10%">Balance</th>
                                                        <th width="10%">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll" style="height: 460px">
                                                   
                                                </tbody>
                                                <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                        <tr>
                                                            <th width="10%"></th>
                                                            <th width="10%"></th>
                                                            <th width="30%"></th>
                                                            <th width="15%"></th>
                                                            <th width="10%"></th>
                                                            <th width="10%"></th>
                                                            <th width="10%"></th>
                                                        </tr>
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 157px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>--%>
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
                </div>

                <div id="xSalesForm" style="display: none">
                    

                    <ul class="suboptions">
                        <li>
                            <%--<a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                        </li>
                    </ul>
                    <div id="Div3" class="customer-customers">
                        <div class="container one-column withpad withbg mod-sales-invoice" style="height: 460px !important;">
                        <div class="inner">
                            <div class="box-holder box-holder2" style="height: 460px !important;">
                                <div class="content">
                                    <div name="customer_sales_order_form" id="customer_sales_order_form" method="POST" class="ym-form">
                                        <div class="addup">
                                            <div class="heading ym-clearfix">
                                                <h1>Sales Invoice</h1>
                                                <div class="">
                                                    <div onclick="OpenSalesForm1()"><a id="xSalesForm1Btn" style="background: url(image/sprite.png) no-repeat -1133px -183px; width: 10px; height: 10px; float: right; display: block" href="#"></a></div>
                                                    <div onclick="OpenSalesForm2()"><a id="xSalesForm2Btn" style="background: url(image/sprite.png) no-repeat -1123px -183px; width: 10px; height: 10px; float: right; display: none" href="#"></a></div>
                                                </div>
                                            </div>
                                            <div id="xSalesForm1" class="form-content active h80">
                                                <div class="ym-grid grid3">
                                                    <div class="left ym-gl">
                                                        <div class="ym-gbox">
                                                            <div class="ym-clearfix">
                                                                <div class="float-left">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="customer">*Customer</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="customer" name="customer" value="" class="long" />

                                                                                </td>
                                                                                <input id="hdn_customerID" type="hidden" />
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl" valign="top">
                                                                                    <label for="address">*Address</label></td>
                                                                                <td class="obj">
                                                                                    <textarea id="address" name="address" autocorrect="off" spellcheck="false" class="long"></textarea></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="middle ym-gl">
                                                        <div class="ym-gbox">
                                                            <table>
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="deliver_to">Deliver To</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow long">
                                                                                <select name="deliver_to" id="deliver_to" onchange="LoadDelivertoID();">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                                <input id="hdn_deliverTo" type="hidden" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="salesman">*Salesman</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow long">
                                                                                <select name="salesman" id="salesman" onchange="LoadSalesmanID();">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                                <input id="hdn_salesman" type="hidden" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="po_number">P.O No.</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="po_number" name="po_number" value="" class="short">
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="terms">*Terms</label>
                                                                                    <div class="select-arrow short">
                                                                                        <select name="terms" id="terms" onchange="LoadTermID();">
                                                                                            <option value="COD">COD</option>
                                                                                            <option value="30">30</option>
                                                                                            <option value="60">60</option>
                                                                                            <option value="90">90</option>
                                                                                            <option value="120">120</option>
                                                                                            <option value="150">150</option>
                                                                                            <option value="180">180</option>
                                                                                        </select>
                                                                                        <input id="hdn_termID" type="hidden" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="right ym-gr">
                                                        <div class="ym-gbox ym-clearfix">
                                                            <div class="float-right">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="lbl">
                                                                                <label for="reference_number">*Reference No.</label></td>
                                                                            <td class="obj">
                                                                                <div class="grid ym-clearfix">
                                                                                    <div class="col-left">
                                                                                        <div class="select-arrow xxshort">
                                                                                            <select id="referenceNo" onchange="LoadMaximumLines();">
                                                                                                <option value=""></option>
                                                                                            </select>
                                                                                            <input id="hdn_refNo" type="hidden" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-left">
                                                                                        &nbsp;&nbsp;
                                                                                    </div>
                                                                                    <div class="col-left">
                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="reference_number" name="reference_number" class="xxxmedium">
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
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date">
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lbl">
                                                                                <label for="delivery_date">*Delivery Date</label></td>
                                                                            <td class="obj">
                                                                                <div class="dp xmedium">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="delivery_date" name="delivery_date" class="date">
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="xSalesForm2" class="form-content h80">
                                                <div class="ym-grid grid3">
                                                    <div class="left ym-gl">
                                                        <div class="ym-gbox">
                                                            <div class="ym-clearfix">
                                                                <div class="float-left">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="prepared">&nbsp;&nbsp;&nbsp;Prepared</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow long">
                                                                                        <select id="prepared" onchange="LoadPerparedID();">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                        <input id="hdn_perparedID" type="hidden" />
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="checked">Checked</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow long">
                                                                                        <select id="checked" onchange="LoadCheckedID();">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                        <input id="hdn_check" type="hidden" />
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="delivered">Delivered</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow long">
                                                                                        <select id="delivered" onchange="LoadDeliveredID();">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                        <input id="hdn_delivered" type="hidden" />
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="middle ym-gl">
                                                        <div class="ym-gbox" style="padding: 0 0 0 16px;">
                                                            <table>
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="waybill_number">Waybill No.</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="waybill_number" name="waybill_number" class="long"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="container_number">Container No.</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="container_number" name="container_number" class="long"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="lading_bill">Bill of Lading</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="lading_bill" name="lading_bill" class="long"></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="right ym-gr">
                                                        <div class="ym-gbox ym-clearfix">
                                                            <div class="float-right">
                                                                <table>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="lbl">
                                                                                <label for="commission_rate">Commission Rate</label></td>
                                                                            <td class="obj">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="commission_rate" name="commission_rate" class="xmedium" style="text-align: right;"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lbl">
                                                                                <label for="commission_amount">Commission Amt.</label></td>
                                                                            <td class="obj">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="commission_amount" name="commission_amount" class="xmedium" style="text-align: right;"></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="space10"></div>
                                        </div>
                                        <div class="subtab-container">
                                            <div class="box-holder box-holder2">
                                                <ul class="subtabs crossfade withtext" style="width: 411px !important;">
                                                    <li class="active" style="width: 185px;">
                                                        <%--<div class="ym-clearfix">--%>
                                                        <div onclick="OpenSalesOrderList()">
                                                            <a href="#">Sales Order</a>
                                                            <span class="obj">
                                                                <div class="select-arrow" id="salesorder">
                                                                    <select id="order_number" onchange="LoadSalesOrderDetails()">
                                                                    </select>
                                                                </div>
                                                            </span>
                                                        </div>
                                                        <%--</div>--%>
                                                    </li>
                                                    <li style="width: 195px;">
                                                        <%--<div class="ym-clearfix">--%>
                                                        <div onclick="OpenSalesInvoiceList()"><a href="#">Sales Invoice</a><span><input id="txtTotalSalesInvoice" style='border: none; background-color: transparent; text-align: right; vertical-align: bottom; color: gray;' readonly="true" value="0.00" /></span></div>
                                                        <%--</div>--%>
                                                    </li>
                                                </ul>

                                                <div id="xSalesOrderList">
                                                    <div class="content tabular" style="height: 196px;">
                                                        <table class="tblholder main" id="salesorderTable">
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
                                                            <div class="slimScrollDiv height" style="position: relative; overflow: hidden; width: auto; height: 0 !important;">
                                                                <tbody class="scroll height" style="overflow: hidden; width: auto; height: 0;">
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
                                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;">
                                                                </div>
                                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
                                                                </div>
                                                            </div>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div id="xSalesAdjustment" style="display: none">
                                                    <div class="content tabular" style="height: 0px;">
                                                        <table class="tblholder main" id="xSalesAdjusment_Table">
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
                                                            <div class="slimScrollDiv height" style="position: relative; overflow: hidden; width: auto; height: 0 !important;">
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
                                                                <tbody class="scroll height" style="overflow: hidden; width: auto; height: 0;">
                                                                </tbody>
                                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;">
                                                                </div>
                                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
                                                                </div>
                                                            </div>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div id="xSalesInvoiceList" style="display: none;">
                                                    <div class="content tabular">
                                                        <table id="salesInvoice_table" class="tblholder main" cellspacing="0px 0px 0px 0px" cellpadding="0" style="height: 194px !important">
                                                            <thead>
                                                                <tr>
                                                                    <th width="10%">Packing</th>
                                                                    <th width="20%">Product Name</th>
                                                                    <th width="15%">Location</th>
                                                                    <th width="10%">Quantity</th>
                                                                    <th width="10%">Unit</th>
                                                                    <th width="10%">Unit Price</th>
                                                                    <th width="10%">Discount</th>
                                                                    <th width="10%">Amount</th>
                                                                    <th width="5%"></th>
                                                                </tr>
                                                            </thead>
                                                            <div id="height" class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0 !important">
                                                                <tbody class="scroll height" style="overflow: hidden; width: auto; height: 0;">
                                                                </tbody>
                                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;">
                                                                </div>
                                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
                                                                </div>
                                                            </div>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div id="xSalesNewShipping" style="display: none">
                                                    <div class="pane-holder rounded" style="height: 200px;">
                                                        <div class="ym-column linearize-level-1">
                                                            <div id="content-holder" class="ym-col1">
                                                                <div class="ym-cbox">
                                                                    <div class="content vmiddle">
                                                                        <div name="customer_sales_memo_form" id="customer_sales_memo_form" method="POST" class="ym-form">
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="account_name">Account Name</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="select-arrow long">
                                                                                                        <select name="account_name" id="account_name">
                                                                                                            <option value=""></option>
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="debit">Debit</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="grid ym-clearfix">
                                                                                                        <div class="col-left">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="debit" name="debit" class="short" />
                                                                                                        </div>
                                                                                                        <div class="col-right">
                                                                                                            <label for="credit">Credit</label>
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="credit" name="credit" class="short" />
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="50"></td>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="reference_number">Reference No.</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="grid ym-clearfix">
                                                                                                        <div class="col-left">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" />
                                                                                                        </div>
                                                                                                        <div class="col-left">
                                                                                                            &nbsp;&nbsp;
                                                                                                        </div>
                                                                                                        <div class="col-left">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text1" name="reference_number" class="xxxmedium" />
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="reference_number">Date</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="dp xmedium">
                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="Text2" name="date" class="date" />
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="ym-col3">
                                                                <div class="ym-cbox">
                                                                    <div class="sidelink">
                                                                        <a href="#" class="plus">New Shipping</a>
                                                                    </div>
                                                                    <ul class="sidebar sidelists1 crossfade scroll">
                                                                        <li>
                                                                            <a href="javascript:;" id="item-1">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">China Banking Corporation
                    	                                                            <span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="item-2">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">Bank of the Philippine Islands
                    	                                                            <span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xSalesNewPayment" style="display: none">
                                                    <div class="pane-holder rounded">
                                                        <div class="ym-column linearize-level-1 subcontainer-height">
                                                            <div class="ym-col1">
                                                                <div class="ym-cbox">
                                                                    <div class="content vmiddle">
                                                                        <div class="payment-options">
                                                                            <div class="holder rounded no-border">
                                                                                <ul class="potabs">
                                                                                    <li class="active form" onclick="OpenSalesNewPaymentCash()"><a href="#"><span class="icon cash">&nbsp;</span>Cash</a><div class="amount">
                                                                                        <input id="txtTotalCash" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                                                    </div>
                                                                                    </li>
                                                                                    <li class="view"><a href="#" onclick="OpenSalesNewPaymentCheck()"><span class="icon check">&nbsp;</span>Check</a><div class="amount">
                                                                                        <input id="txtTotalCheck" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                                                    </div>
                                                                                    </li>
                                                                                    <li class="form"><a href="#" onclick="OpenSalesNewPaymentCard()"><span class="icon card">&nbsp;</span>Card</a><div class="amount">
                                                                                        <input id="txtTotalCard" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                                                    </div>
                                                                                    </li>
                                                                                    <li class="form"><a href="#" onclick="OpenSalesNewPaymentAccount()"><span class="icon accounts">&nbsp;</span>Account</a><div class="amount">
                                                                                        <input id="txtTotalAccount" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                                                    </div>
                                                                                    </li>
                                                                                    <li class="form" style="padding: 19px 0 0 0;">Reference
                                                                                        <div class="obj">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txtPaymentRef" name="amount" class="short" />
                                                                                        </div>
                                                                                    </li>
                                                                                </ul>
                                                                                <div class="space5"></div>
                                                                                <div id="potab-content-holder" class="subholder subholder2">

                                                                                    <div id="xSalesNewPaymentCash" style="display: none">
                                                                                        <div class="content vmiddle">
                                                                                            <div name="customer_sales_cash_form" id="customer_sales_cash_form" method="POST" class="ym-form yform2">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td class="lbl">
                                                                                                            <label for="amount">Amount</label></td>
                                                                                                        <td class="obj">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="amount_cash" name="amount" class="short" onblur="ComputeCashPayment()" style="color: gray; text-align: right;" /></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div id="xSalesNewPaymentCheck" style="display: none">
                                                                                        <div class="ym-form yform2">
                                                                                            <table class="tblholder plain" id="checkpayment_table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th width="42%">Bank Name</th>
                                                                                                        <th width="15%">Check No.</th>
                                                                                                        <th width="10%">Date</th>
                                                                                                        <th width="15%">Check Type</th>
                                                                                                        <th width="10%">Amount</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody class="scroll tbody2">
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='border: none; background-color: transparent; color: gray; text-align: right;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div id="xSalesNewPaymentCard" style="display: none">
                                                                                        <div class="content vmiddle">
                                                                                            <div name="customer_sales_card_form" id="customer_sales_card_form" method="POST" class="ym-form yform2">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <table>
                                                                                                                <tr>
                                                                                                                    <td class="lbl">
                                                                                                                        <label for="card_type">*Card Type</label></td>
                                                                                                                    <td class="obj" width="50%">
                                                                                                                        <div class="select-arrow medium">
                                                                                                                            <select name="card_type" id="card_type">
                                                                                                                                <option value=""></option>
                                                                                                                            </select>
                                                                                                                        </div>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td class="lbl">
                                                                                                                        <label for="card_number">*Card Number</label></td>
                                                                                                                    <td class="obj">
                                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="card_number" name="card_number" class="medium" /></td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td class="lbl">
                                                                                                                        <label for="card_name">*Name on Card</label></td>
                                                                                                                    <td class="obj">
                                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="card_name" name="card_name" class="medium" /></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td width="10"></td>
                                                                                                        <td>
                                                                                                            <table>
                                                                                                                <tr>
                                                                                                                    <td class="lbl">
                                                                                                                        <label for="expiration_date">*Expiration Date</label></td>
                                                                                                                    <td class="obj">
                                                                                                                        <div class="grid ym-clearfix">
                                                                                                                            <div class="col-left">
                                                                                                                                <div class="select-arrow xxshort">
                                                                                                                                    <select id="expiration_month" name="expiration_date">
                                                                                                                                        <option value="January">January</option>
                                                                                                                                        <option value="February">February</option>
                                                                                                                                        <option value="March">March</option>
                                                                                                                                        <option value="April">April</option>
                                                                                                                                        <option value="May">May</option>
                                                                                                                                        <option value="June">June</option>
                                                                                                                                        <option value="July">July</option>
                                                                                                                                        <option value="August">August</option>
                                                                                                                                        <option value="September">September</option>
                                                                                                                                        <option value="October">October</option>
                                                                                                                                        <option value="November">November</option>
                                                                                                                                        <option value="December">December</option>
                                                                                                                                    </select>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                            <div class="col-right">
                                                                                                                                <div class="select-arrow xxshort">
                                                                                                                                    <select id="expiration_year" name="expiration_date">
                                                                                                                                        <option value=""></option>
                                                                                                                                    </select>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td class="lbl">
                                                                                                                        <label for="approval_code">*Approval Code</label></td>
                                                                                                                    <td class="obj" width="50%">
                                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="approval_code" name="approval_code" class="xxmedium" /></td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td class="lbl">
                                                                                                                        <label for="amount">*Amount</label></td>
                                                                                                                    <td class="obj">
                                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="card_amount" name="amount" class="xxmedium" onblur="ComputeCardPayment();" /></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div id="xSalesNewPaymentAccount" style="display: block">
                                                                                        <div class="content vmiddle">
                                                                                            <div name="customer_sales_account_form" id="customer_sales_account_form" method="POST" class="ym-form yform2">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <div class="ym-clearfix">
                                                                                                                <div class="float-left">
                                                                                                                    <table>
                                                                                                                        <tr>
                                                                                                                            <td class="lbl">
                                                                                                                                <label for="employee_name">*Employee Name</label></td>
                                                                                                                            <td class="obj" width="50%">
                                                                                                                                <div class="select-arrow medium">
                                                                                                                                    <select name="employee_name" id="employee_name">
                                                                                                                                        <option value=""></option>
                                                                                                                                    </select>
                                                                                                                                </div>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td class="lbl">
                                                                                                                                <label for="amount">*Amount</label></td>
                                                                                                                            <td class="obj">
                                                                                                                                <input type="text" autocorrect="off" spellcheck="false" id="Text9" name="amount" class="xxmedium" /></td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </td>
                                                                                                        <td width="40"></td>
                                                                                                        <td>
                                                                                                            <div class="ym-clearfix">
                                                                                                                <div class="float-right">
                                                                                                                    <table>
                                                                                                                        <tr>
                                                                                                                            <td class="lbl">
                                                                                                                                <label for="reference_number">*Reference No.</label></td>
                                                                                                                            <td class="obj">
                                                                                                                                <div class="grid ym-clearfix">
                                                                                                                                    <div class="col-left">
                                                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="Text10" name="reference_letter" class="xxshort" />
                                                                                                                                    </div>
                                                                                                                                    <div class="col-left">
                                                                                                                                        &nbsp;&nbsp;
                                                                                                                                    </div>
                                                                                                                                    <div class="col-left">
                                                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="Text11" name="reference_number" class="xxxmedium" />
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
                                                                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="Text12" name="date" class="date" />
                                                                                                                                </div>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </div>
                                                                                                            </div>
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
                                                            </div>
                                                            <div class="ym-col3">
                                                                <div class="ym-cbox">
                                                                    <div class="sidelink" onclick="NewPayment();">
                                                                        <a href="#" class="plus">New Payment</a>
                                                                    </div>
                                                                    <ul class="sidebar sidelists2 crossfade scroll" id="ulPayment">
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xSalesNewMemo" style="display: none">
                                                    <div class="pane-holder rounded" style="height: 200px;">
                                                        <div class="ym-column linearize-level-1">
                                                            <div id="Div2" class="ym-col1">
                                                                <div class="ym-cbox">
                                                                    <div class="content vmiddle">
                                                                        <div class="ym-form">
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="account_name">Account Name</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="select-arrow long">
                                                                                                        <select name="account_name" id="Select1">
                                                                                                            <option value=""></option>
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="debit">Debit</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="grid ym-clearfix">
                                                                                                        <div class="col-left">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text3" name="debit" class="short" />
                                                                                                        </div>
                                                                                                        <div class="col-right">
                                                                                                            <label for="credit">Credit</label>
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text4" name="credit" class="short" />
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="50"></td>
                                                                                    <td>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="reference_number">Reference No.</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="grid ym-clearfix">
                                                                                                        <div class="col-left">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text5" name="reference_letter" class="xxshort" />
                                                                                                        </div>
                                                                                                        <div class="col-left">
                                                                                                            &nbsp;&nbsp;
                                                                                                        </div>
                                                                                                        <div class="col-left">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text6" name="reference_number" class="xxxmedium" />
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="lbl">
                                                                                                    <label for="reference_number">Date</label></td>
                                                                                                <td class="obj">
                                                                                                    <div class="dp xmedium">
                                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="Text7" name="date" class="date" />
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="ym-col3">
                                                                <div class="ym-cbox">
                                                                    <div class="sidelink">
                                                                        <a href="#" class="plus">New Memo</a>
                                                                    </div>
                                                                    <ul class="sidebar sidelists1 crossfade scroll">
                                                                        <li>
                                                                            <a href="javascript:;" id="A2">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">China Banking Corporation
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A3">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">Bank of the Philippine Islands
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A4">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">Banco de Oro
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A5">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">China Banking Corporation
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A6">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">Bank of the Philippine Islands
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A7">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">Banco de Oro
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A8">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">China Banking Corporation
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A9">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">Bank of the Philippine Islands
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A10">
                                                                                <span class="ym-clearfix">
                                                                                    <span class="name">Banco de Oro
                    	<span>111-068771-0</span>
                                                                                    </span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
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
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td class="lbl" width="19%">
                                                                                                        <label for="remarks">Remarks</label></td>
                                                                                                    <td class="obj">
                                                                                                        <div class="select-arrow long">
                                                                                                            <select name="remarks" id="remarks" onchange="LoadRemarksID();">
                                                                                                                <option value=""></option>
                                                                                                            </select>

                                                                                                            <input type="hidden" id="hdn_remarks" />
                                                                                                        </div>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="lbl" valign="top">
                                                                                                        <label for="notes">Notes</label></td>
                                                                                                    <td class="obj">
                                                                                                        <textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="long"></textarea></td>
                                                                                                </tr>
                                                                                            </tbody>
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
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td>Subtotal</td>
                                                                                                    <td>
                                                                                                        <input id="txtSubtotal" style="background-color: transparent; border: none; width: 70px; text-align: right; vertical-align: bottom; color: gray;" readonly="true" /></td>
                                                                                                    <td>
                                                                                                        <div onclick="OpenSalesInvoiceNewPayment()">
                                                                                                            <a href="#" class="view btnlink">
                                                                                                                <img src="image/payment.png" width="71" height="20" alt="Payment"></a>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <input id="txtPayment" style="background-color: transparent; border: none; width: 70px; text-align: right; vertical-align: bottom; color: gray;" readonly="true" /></td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Tax</td>
                                                                                                    <td>
                                                                                                        <input id="txtTax" style="background-color: transparent; border: none; width: 70px; text-align: right; vertical-align: bottom; color: gray;" readonly="true" /></td>
                                                                                                    <td>
                                                                                                        <div onclick="OpenSalesInvoiceNewMemo()">
                                                                                                            <a href="memo" class="form btnlink">
                                                                                                                <img src="image/memo.png" width="71" height="20" alt="Memo"></a>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <input id="txtMemo" style="background-color: transparent; border: none; width: 70px; text-align: right; vertical-align: bottom; color: gray;" readonly="true" /></td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <div onclick="OpenSalesInvoiceNewShipping()">
                                                                                                            <a href="#" class="form btnlink">
                                                                                                                <img src="image/shipping.png" width="71" height="21" alt="Shipping"></a>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <input id="txtShipping" style="background-color: transparent; border: none; width: 70px; text-align: right; vertical-align: bottom; color: gray;" readonly="true" /></td>
                                                                                                    <td>
                                                                                                        <div onclick="OpenSalesAdjustmentList()">
                                                                                                            <a href="adjustment" class="view btnlink">
                                                                                                                <img src="image/adjustment.png" width="71" height="20" alt="Adjustment"></a>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <input id="txtAdjustment" style="background-color: transparent; border: none; width: 70px; text-align: right; vertical-align: bottom; color: gray;" readonly="true" /></td>
                                                                                                </tr>
                                                                                            </tbody>
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
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td>Credit Limit</td>
                                                                                                        <td align="right">
                                                                                                            <input id="txtCreditLimit" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Invoice Balance</td>
                                                                                                        <td align="right">
                                                                                                            <input id="txtInvoiceBalance" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Post Dated Check</td>
                                                                                                        <td align="right">
                                                                                                            <input id="txtPostDated" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>Available Credit</td>
                                                                                                        <td align="right">
                                                                                                            <input id="txtAvailableCredit" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                    </tr>
                                                                                                </tbody>
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
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <table>
                                                                                                                <tbody>
                                                                                                                    <tr>
                                                                                                                        <td>Price A</td>
                                                                                                                        <td align="right">
                                                                                                                            <input id="txtRpriceA" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td>Price B</td>
                                                                                                                        <td align="right">
                                                                                                                            <input id="txtRpriceB" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td>Price C</td>
                                                                                                                        <td align="right">
                                                                                                                            <input id="txtRpriceC" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td>Ave. Cost</td>
                                                                                                                        <td>
                                                                                                                            <input id="Text16" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0.00" /></td>
                                                                                                                    </tr>
                                                                                                                </tbody>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td valign="top">
                                                                                                            <table>
                                                                                                                <tbody>
                                                                                                                    <tr>
                                                                                                                        <td valign="top">Disc A</td>
                                                                                                                        <td>
                                                                                                                            <input id="txtRdiscA" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0" /></td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td>Disc B</td>
                                                                                                                        <td>
                                                                                                                            <input id="txtRdiscB" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0" /></td>
                                                                                                                    </tr>
                                                                                                                    <tr>
                                                                                                                        <td>Disc C</td>
                                                                                                                        <td>
                                                                                                                            <input id="txtRdiscC" style="background-color: transparent; border: none; text-align: right; vertical-align: bottom; color: gray; width: 50px;" readonly="true" value="0" /></td>
                                                                                                                    </tr>
                                                                                                                </tbody>
                                                                                                            </table>
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
                                                            </div>
                                                            <a href="#pane2" class="down" id="slidebtn">&nbsp;</a>
                                                        </div>
                                                    </div>
                                                    <div class="row2">
                                                        <!-- Start of Two Grids -->
                                                        <div class="ym-grid ym-equalize linearize-level-1">
                                                            <div class="pane-left ym-gl">
                                                                <div class="ym-gbox">
                                                                    <input id="hdn_InvoiceStatus" type="hidden" />
                                                                    <div onclick="SavingInvoice('Void')" style="float: left; margin: 0 10px 0 0;">
                                                                        <a href="#">
                                                                            <img src="image/void.png" width="71" height="20" alt="Void"></a>
                                                                    </div>
                                                                    <div onclick="SavingInvoice('Pending')">
                                                                        <a href="#">
                                                                            <img src="image/hold.png" width="71" height="20" alt="Hold"></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="pane-right ym-gr">
                                                                <div class="ym-gbox">
                                                                    <div style="float: right; margin: 0 10px 0 0;">
                                                                        <input id="txtAmountDue" style="background-color: transparent; border: none; width: 80px; text-align: right; vertical-align: bottom; color: gray;" readonly="true" value="0.00" />
                                                                    </div>
                                                                    <div style="float: right; margin: 0 10px 0 0;">
                                                                        Amount Due
                                                                    </div>


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

                <div id="xSalesOpeningBalance" style="display: none;">
                    <ul class="suboptions">
                        <li class="active form"><a href="#suboption-opening-balance-invoices" onclick="ShowOpeningBalance();">Invoices</a></li>
                        <li class="form"><a href="#suboption-opening-balance-payments" onclick="ShowOpeningBalancePayment();">Payments</a></li>
                    </ul>
                    <div id="Div1">
                        <div id="xSalesOpeningBalanceInvoice" style="display: block;">
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
                                                                                <select id="SalesRef" onclick="LoadRefDetails();" disabled="disabled">
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-left">
                                                                            &nbsp;&nbsp;
                                                                        </div>
                                                                        <div class="col-left">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="referenceOpening" name="reference_number" class="xxxmedium" readonly="true" />
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
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="dateOpening" name="date" class="date" readonly="true" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="salesman">*Salesman</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow medium">
                                                                        <select name="salesman" id="salesmanOpeningBalance" disabled="disabled">
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
                                                                        <select name="terms" id="termOpeningBalance" disabled="disabled">
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="commmission">*Commission %</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="commmission" name="commmission" class="xxmedium" readonly="true" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="amount">*Amount</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="xxmedium" readonly="true" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="balance">*Balance</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="BalanceOpeningBalance" name="balance" class="xxmedium" readonly="true" /></td>
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
                        <div id="xSalesOpeningBalancePayment" style="display: none;">
                            <div class="container two-column-sidebar style2 withbg">
                                <div class="ym-column linearize-level-1">
                                    <div class="ym-col1">
                                        <div class="ym-cbox padtop9">
                                            <div class="box-holder">
                                                <div class="ym-form">
                                                    <div class="addup">
                                                        <h1>Opening Balance - Payments</h1>
                                                    </div>
                                                    <div class="content content2 vmiddle vmiddle2 hmiddle">
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
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="OpeningDate" name="date" class="date" />
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
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="OpeningAmount" name="amount" class="xxmedium" /></td>
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

                <div id="xLSalesInvoiceSearch" style="display: none">
                    <div class="content tabular">
                        <table class="tblholder">
                            <thead>
                                <tr>
                                    <th>Reference No.</th>
                                </tr>
                            </thead>
                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                    <tr>
                                        <td>
                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_sales_search" name="location" value="" class="long search_class" style='color: gray; outline: none; border: none; background-color: transparent;'></td>
                                    </tr>
                                    <div id="xSalesInvoiceSearchFixContent">
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
                                    </div>
                                </tbody>
                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                            </div>
                        </table>
                    </div>
                </div>

            </div>
        </div>
        <script src="Script/Sales.js">
        </script>
        <script type="text/javascript">

         

            LoadSalesInvoiceList();
            BankNameAutoComplete();
            loadBlankSalesInvoice();
            loadBlankSalesOrder();
            LoadBankOpeningBalance();
            LoadChecktypeOpeningBalance();


            function OpenSalesForm1() {
                $("#xSalesForm1").hide();
                $("#xSalesForm2").show();
                $("#xSalesForm1Btn").hide();
                $("#xSalesForm2Btn").show();
            }

            function OpenSalesForm2() {
                $("#xSalesForm1").show();
                $("#xSalesForm2").hide();
                $("#xSalesForm1Btn").show();
                $("#xSalesForm2Btn").hide();
            }

            function OpenSalesOrderList() {
                $("#xSalesAdjustment").hide();
                $("#xSalesOrderList").show();
                $("#xSalesInvoiceList").hide();
                $("#xSalesNewShipping").hide();
                $("#xSalesNewMemo").hide();
                $("#xSalesNewPayment").hide();
            }

            function OpenSalesAdjustmentList() {
                FillingAdjustmentTable();
                $("#xSalesAdjustment").show();
                $("#xSalesOrderList").hide();
                $("#xSalesInvoiceList").hide();
                $("#xSalesNewShipping").hide();
                $("#xSalesNewMemo").hide();
                $("#xSalesNewPayment").hide();

            }

            function OpenSalesInvoiceList() {
                
                //alert("x");
                $("#xSalesAdjustment").hide();
                $("#xSalesOrderList").hide();
                $("#xSalesInvoiceList").show();
                $("#xSalesNewShipping").hide();
                $("#xSalesNewMemo").hide();
                $("#xSalesNewPayment").hide();
            }

            function OpenSalesInvoiceNewShipping() {
                $("#xSalesOrderList").hide();
                $("#xSalesNewShipping").show();
                $("#xSalesInvoiceList").hide();
                $("#xSalesNewMemo").hide();
                $("#xSalesNewPayment").hide();
            }

            function OpenSalesInvoiceNewMemo() {
                $("#xSalesOrderList").hide();
                $("#xSalesNewShipping").hide();
                $("#xSalesInvoiceList").hide();
                $("#xSalesNewMemo").show();
                $("#xSalesNewPayment").hide();
            }

            function OpenSalesInvoiceNewPayment() {
                $("#xSalesOrderList").hide();
                $("#xSalesNewShipping").hide();
                $("#xSalesInvoiceList").hide();
                $("#xSalesNewMemo").hide();
                $("#xSalesNewPayment").show();
                $("#xSalesNewPaymentCash").show();
                $("#xSalesNewPaymentCheck").hide();
                $("#xSalesNewPaymentCard").hide();
                $("#xSalesNewPaymentAccount").hide();
            }

            function OpenSalesNewPaymentCash() {
                $("#xSalesNewPaymentCash").show();
                $("#xSalesNewPaymentCheck").hide();
                $("#xSalesNewPaymentCard").hide();
                $("#xSalesNewPaymentAccount").hide();
            }

            function OpenSalesNewPaymentCheck() {
                $("#xSalesNewPaymentCash").hide();
                $("#xSalesNewPaymentCheck").show();
                $("#xSalesNewPaymentCard").hide();
                $("#xSalesNewPaymentAccount").hide();
            }

            function OpenSalesNewPaymentCard() {
                $("#xSalesNewPaymentCash").hide();
                $("#xSalesNewPaymentCheck").hide();
                $("#xSalesNewPaymentCard").show();
                $("#xSalesNewPaymentAccount").hide();
            }

            function OpenSalesNewPaymentAccount() {
                $("#xSalesNewPaymentCash").hide();
                $("#xSalesNewPaymentCheck").hide();
                $("#xSalesNewPaymentCard").hide();
                $("#xSalesNewPaymentAccount").show();
            }

            function OpenSalesVoid() {
                $("#xSalesList").show();
                $("#xSalesForm").hide();
            }

            function OpenSalesInvoice() {
                $("#xSalesList").hide();
                $("#xSalesForm").show();
            }

            function NewPayment() {
                $('#txtPaymentRef').val("");
                $('#amount_cash').val("");
                $('#card_type').val("");
                $('#card_number').val("");
                $('#card_name').val("");
                $('#expiration_month').val("");
                $('#expiration_year').val("");
                $('#approval_code').val("");
                $('#card_amount').val("");
                $('#txtPayment').val("0");
                $('#hdnPaymentID').val("0");
                $("#checkpayment_table tbody").empty();
                for (var i = 0; i < 10; i++) {

                    $('#xSalesNewPaymentCheck tbody').append(" <tr><td width=\"42%\"><input class='bank_name' style='border: none; background-color: transparent;' /></td><td width=\"15%\"><input class='check_no' style='border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='date_check date' style='border: none; background-color: transparent;' /></td><td width=\"15%\"><input class='check_type' style='border: none; background-color: transparent;' /></td><td width=\"10%\"><input class='amount_check' style='border: none; background-color: transparent;' onblur=\"ComputeCheckPayment();\" /></td></tr>");
                }
                BankNameAutoComplete();
            }



            var ProductAutoCompleteData = <%= AutoCompleteProduct() %>;
            var LocationAutoCompleteData = <%= AutoCompleteLocation() %>;
            var BankAutoCompleteData = <%= AutoCompleteBank() %>;
            var InvoicePaymentData = <%=InvoicePaymentSelectTotalAmountAll() %>;
        </script>
</asp:Content>
