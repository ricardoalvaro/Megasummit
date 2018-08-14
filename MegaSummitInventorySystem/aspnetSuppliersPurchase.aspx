<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSuppliersPurchase.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSuppliersPurchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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

        .potab-height {
            height: 128px !important;
        }

        .vmiddle2 {
            width: 660px !important;
            height: 436px !important;
        }

        .vmiddle {
            width: 982.031px !important;
            height: 112px !important;
        }

        .paneholder2 {
            height: 154px !important;
        }

        .box-holder2 {
            height: 155px !important;
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

        .subholder2 {
            height: 112px !important;
        }

        .yform2 {
            width: 660px;
        }

        .sidelists2 {
            height: 181px !important;
        }

        .hmiddle {
            width: 703px !important;
            height: 450px !important;
        }
        tbody.scroll {
            height: 407px !important;
        }
        .slimScrollDiv {
            height: 407px !important;
        }
        #main .ym-wbox {
            padding: 5px 0 10px 0;
        }
    </style>

    <script src="Script/SupplierPurchased.js"></script>
    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class=""><a href="aspnetSuppliers.aspx">Suppliers</a></li>
                                <li class="active"><a href="aspnetSuppliersPurchase.aspx">Purchase</a></li>
                                <li class=""><a href="aspnetSuppliersPurchaseReturn.aspx">Purchase Return</a></li>
                                <li class=""><a href="aspnetSuppliersPurchaseOrder.aspx">Purchase Order</a></li>
                                <li class=""><a href="aspnetSuppliersVoucher.aspx">Voucher</a></li>
                                <li class=""><a href="aspnetSuppliersMemo.aspx">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" onclick="SavingInvoice();">Save</a></li>
                                <li><a id="btn-new" class="new  " onclick="NewSales();">New</a></li>
                                <li><a id="btn-find" class="find " onclick="ActionSearchInvoice();">Find</a></li>
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

    <input id="hdnPurchasedID" type="hidden" value="0" />
    <input id="SupplierID" type="hidden" value="0" />

    <div id="main" class="suppliers-purchase">
        <div class="ym-wrapper">
            <div class="ym-wbox">

                <div class="submenu nopad">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>

                <ul class="suboptions">
                    <li>
                        <%--<a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                    </li>
                </ul>


                <div id="xPurchaseList" style="display: block">
                    <input id="hdnTotalPay" type="hidden" value="0" />
                    <%--<div class="ym-wrapper">
                        <div class="ym-wbox">--%>
                    <div class="container one-column">
                        <div class="inner">
                            <div class="box-holder">

                                <div id="tab-content-holder">
                                    <div class="content tabular">
                                        <table class="tblholder main" id="xPurchaseList_table">
                                            <thead>
                                                <tr onclick="OpenPurchaseForm()">
                                                    <th width="10%">Reference No.</th>
                                                    <th width="10%">Date</th>
                                                    <th width="25%">Supplier Name</th>
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
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
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
                                            <%--<div class="slimScrollDiv height" style="position: relative; overflow: hidden; width: auto; height: 0 !important;">
                                                <tbody class="scroll height" style="overflow: hidden; width: auto; height: 0;">
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;">
                                                </div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
                                                </div>
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
                    <%--</div>
                    </div>--%>
                </div>

                <div id="xPurchaseForm" style="display: none">
                    <%--<div class="ym-wrapper">
                        <div class="ym-wbox">--%>
                    <div class="container one-column withpad withbg mod-purchase-invoice">
                        <div class="inner">
                            <div class="box-holder box-holder2">
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
                                                                        <td class="lbl" width="19%">
                                                                            <label for="supplier">*Supplier</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="supplier" name="supplier" value="" class="long" onblur="LoadSupplierDetails();" />
                                                                            <%--<div class="select-arrow long">
                                                                                        <select name="supplier" id="supplier" onchange="LoadSupplierID();">
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
                                                                <td class="lbl" width="19%">
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
                                                                    <label for="salesman">Salesman</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow long">
                                                                        <select name="salesman" id="salesman">
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
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="refNo" name="title" class="xxshort" />
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
                                                                        <label for="cancel_date">*Cancel Date</label></td>
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
                                            <div class="space10"></div>
                                        </div>
                                        <div class="subtab-container">
                                            <div class="box-holder box-holder2" style="height: 200px !important;">
                                                <ul class="subtabs crossfade withtext" style="width: 411px;">
                                                    <li class="active view" style="width: 195px;" onclick="OpenPurchaseFormOrder()">
                                                        <div class="ym-clearfix">
                                                            <a href="#">Purchase Order</a>
                                                            <span class="obj">
                                                                <div class="select-arrow">
                                                                    <select id="order_number" onclick="LoadSalesOrderDetails()">
                                                                    </select>
                                                                </div>
                                                            </span>
                                                        </div>
                                                    </li>
                                                    <li class="view" style="width: 195px;" onclick="OpenPurchaseFormInvoice()">
                                                        <div class="ym-clearfix"><a href="#">Purchase Invoice</a><span><input id="txtTotalPurchaseInvoice" style='color: gray; text-align: right; border: none; background-color: transparent;' readonly="true" value="0" /></span></div>
                                                    </li>
                                                </ul>
                                                <%--<div id="subtab-content-holder" class="subcontainer">
                                                    <div id="content-holder">--%>
                                                <div id="xPurchaseOrder" style="display: block">
                                                    <div class="content tabular" style="height: 160px;">
                                                        <table class="tblholder main">
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
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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
                                                            <%--<div class="slimScrollDiv height" style="position: relative; overflow: hidden; width: auto; height: 0 !important;">
                                                                <tbody class="scroll height" style="overflow: hidden; width: auto; height: 0;">
                                                                </tbody>
                                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;">
                                                                </div>
                                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;">
                                                                </div>
                                                            </div>--%>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div id="xPurchaseInvoice" style="display: none">
                                                    <div class="content tabular" style="height: 160px;">
                                                        <table class="tblholder main" id="xPurchaseInvoice_table">
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
                                                            <div class="slimScrollDiv height" style="position: relative; overflow: hidden; width: auto; height: 0 !important;">
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

                                                <div id="xPurchasePayment" style="display: none">
                                                    <input id="hdnPaymentID" type="hidden" value="0" />
                                                    <div class="pane-holder rounded paneholder2">
                                                        <div class="ym-column linearize-level-1 subcontainer-height">
                                                            <div id="Div1" class="ym-col1">
                                                                <div class="ym-cbox">
                                                                    <div class="content vmiddle" style="width: 982px !important; height: 202px !important;">
                                                                        <div class="payment-options">
                                                                            <div class="holder rounded no-border">
                                                                                <ul class="potabs">
                                                                                    <li class="active form" onclick="OpenPurchaseFormPaymentCash()"><a href="#"><span class="icon cash">&nbsp;</span>Cash</a><div class="amount">
                                                                                        <input id="txtTotalCash" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                                                    </div>
                                                                                    </li>
                                                                                    <li class="view" onclick="OpenPurchaseFormPaymentCheck()"><a href="#"><span class="icon check">&nbsp;</span>Check</a><div class="amount">
                                                                                        <input id="txtTotalCheck" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
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

                                                                                    <div id="xPurchasePaymentCash" style="display: block">
                                                                                        <div class="content vmiddle">
                                                                                            <div name="customer_sales_cash_form" id="customer_sales_cash_form" method="POST" class="ym-form">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td class="lbl">
                                                                                                            <label for="amount">Amount</label></td>
                                                                                                        <td class="obj">
                                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="short" onblur="ComputeCashPayment()" style="color: gray; text-align: right;" /></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div id="xPurchasePaymentCheck" style="display: none">
                                                                                        <div class="ym-form yform2">
                                                                                            <table class="tblholder plain" style="height: 110px;" id="checkpayment_table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th width="42%">Bank Name</th>
                                                                                                        <th width="15%">Check No.</th>
                                                                                                        <th width="10%">Date</th>
                                                                                                        <th width="15%">Check Type</th>
                                                                                                        <th width="10%">Amount</th>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody class="scroll">
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="42%">
                                                                                                            <input class='bank_name' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_no' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='date_check date' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="15%">
                                                                                                            <input class='check_type' style='color: gray; border: none; background-color: transparent;' /></td>
                                                                                                        <td width="10%">
                                                                                                            <input class='amount_check' style='color: gray; text-align: right; border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                            <div class="ym-col3">
                                                                <div class="ym-cbox">
                                                                    <div class="sidelink">
                                                                        <a href="#" class="plus">New Payment</a>
                                                                    </div>
                                                                    <ul class="sidebar sidelists2 crossfade scroll" id="ulPayment">
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xPurchaseMemo" style="display: none">
                                                    <div class="pane-holder rounded  paneholder2">
                                                        <div class="ym-column linearize-level-1">
                                                            <div id="Div2" class="ym-col1">
                                                                <div class="ym-cbox">
                                                                    <div class="content vmiddle">
                                                                        <form name="customer_sales_memo_form" id="customer_sales_memo_form" method="POST" class="ym-form">
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
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="ym-col3">
                                                                <div class="ym-cbox">
                                                                    <div class="sidelink">
                                                                        <a href="#" class="plus">New Memo</a>
                                                                    </div>
                                                                    <ul class="sidebar sidelists2 crossfade scroll">
                                                                        <li>
                                                                            <a href="javascript:;" id="A1">
                                                                                <span class="name">Banco de Oro
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A2">
                                                                                <span class="name">China Banking Corporation
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A3">
                                                                                <span class="name">Banco de Oro
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A4">
                                                                                <span class="name">China Banking Corporation
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A5">
                                                                                <span class="name">Banco de Oro
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="item-6">
                                                                                <span class="name">China Banking Corporation
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A6">
                                                                                <span class="name">Banco de Oro
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="javascript:;" id="A7">
                                                                                <span class="name">China Banking Corporation
                    	<span>111-068771-0</span>
                                                                                </span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%-- </div>
                                                </div>--%>
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
                                                                            <td>Subtotal</td>
                                                                            <td>
                                                                                <input id="txtSubtotal" style="color: gray; text-align: right; background-color: transparent; border: none; width: 70px;" readonly="true" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td onclick="OpenPurchaseFormPayment()"><a href="payment" class="view btnlink">
                                                                                <img src="image/payment.png" width="71" height="20" alt="Payment" /></a></td>
                                                                            <td>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="txtPaymentAmount" name="amount" class="short" style="color: gray; text-align: right; background-color: transparent; border: none; width: 70px;" readonly="true" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td onclick="OpenPurchaseFormOrderMemo()"><a href="memo" class="form btnlink">
                                                                                <img src="image/memo.png" width="71" height="20" alt="Memo" /></a></td>
                                                                            <td>100,000.00</td>
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
                                                            Amount Due&nbsp;&nbsp;&nbsp;&nbsp;100,000.00
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End of Two Grids -->
                                                <div class="space10"></div>
                                            </div>
                                        </div>
                                        <div class="addup">
                                            <div class="space10"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--</div>
                    </div>--%>
                </div>

                <div id="xPurchasedSearch" style="display: none">
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
                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_purchased_search" name="location" value="" class="long search_class" style='color: gray; outline: none; border: none; background-color: transparent;'></td>
                                    </tr>

                                    <div id="xPurchasedSearchFixContent">
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
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

                        <%--</div>
                </div>--%>
                    </div>
                </div>

                <div id="xPurchasedOpeningBalance" style="display: none;">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">
                            <ul class="suboptions">
                                <li class="active form"><a href="#suboption-opening-balance-invoices" onclick="ShowOpeningBalance();">Invoices</a></li>
                                <li class="form"><a href="#suboption-opening-balance-payments" onclick="ShowOpeningBalancePayment();">Payments</a></li>
                            </ul>
                            <div id="Div3">
                                <div id="xGeneralInfoOpeningBalanceInvoice" style="display: none;">
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
                                                                                        <select id="refOpeningBalance">
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-left">
                                                                                    &nbsp;&nbsp;
                                                                                </div>
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="ref_numberOpeningBalance" name="reference_number" class="xxxmedium" />
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
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="dateOpeningBalance" name="date" class="date" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="salesman">*Salesman</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow medium">
                                                                                <select name="salesman" id="salemanOpeningBalance">
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
                                                                            <label for="amount">*Amount</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="amountOpeningBalance" name="amount" class="xxmedium" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="balance">*Balance</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="balanceOpeningBalance" name="balance" class="xxmedium" /></td>
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

                                <div id="xGeneralInfoOpeningBalancePayment" style="display: block;">
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
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="checkAmount" name="amount" class="xxmedium" /></td>
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
            </div>
        </div>
    </div>

    <script type="text/javascript">

        LoadSupplier();
        LoadForwarded();
        LoadSalesman();
        LoadTerms();
        LoadTableRow();
        BankNameAutoComplete();
        LoadPurchasedInvoiceList();

        function OpenPurchase() {
            $('#xPurchase').show();
            $('#xPurchaseForm').hide();
        }
        function OpenPurchaseForm() {
            $('#xPurchase').hide();
            $('#xPurchaseForm').show();
        }
        function OpenPurchaseFormOrder() {
            $('#xPurchaseOrder').show();
            $('#xPurchaseInvoice').hide();
            $('#xPurchasePayment').hide();
            $('#xPurchaseMemo').hide();
        }
        function OpenPurchaseFormInvoice() {
            $('#xPurchaseOrder').hide();
            $('#xPurchaseInvoice').show();
            $('#xPurchasePayment').hide();
            $('#xPurchaseMemo').hide();
        }
        function OpenPurchaseFormPayment() {
            $('#xPurchaseOrder').hide();
            $('#xPurchaseInvoice').hide();
            $('#xPurchasePayment').show();
            $('#xPurchaseMemo').hide();
        }
        function OpenPurchaseFormPaymentCash() {
            $('#xPurchasePaymentCash').show();
            $('#xPurchasePaymentCheck').hide();
        }
        function OpenPurchaseFormPaymentCheck() {
            $('#xPurchasePaymentCash').hide();
            $('#xPurchasePaymentCheck').show();
        }
        function OpenPurchaseFormOrderMemo() {
            $('#xPurchaseOrder').hide();
            $('#xPurchaseInvoice').hide();
            $('#xPurchasePayment').hide();
            $('#xPurchaseMemo').show();
        }
    </script>

</asp:Content>
