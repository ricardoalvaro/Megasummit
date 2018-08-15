<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSuppliersPurchaseOrder.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSuppliersPurchaseOrder" %>

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
            .theight {
            height: 250px !important;
        }
    </style>

    <script src="Script/SupplierPurchasedOrder.js"></script>

    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class=""><a href="aspnetSuppliers.aspx">Suppliers</a></li>
                                <li class=""><a href="aspnetSuppliersPurchase.aspx">Purchase</a></li>
                                <li class=""><a href="aspnetSuppliersPurchaseReturn.aspx">Purchase Return</a></li>
                                <li class="active"><a href="aspnetSuppliersPurchaseOrder.aspx">Purchase Order</a></li>
                                <li class=""><a href="aspnetSuppliersVoucher.aspx">Voucher</a></li>
                                <li class=""><a href="aspnetSuppliersMemo.aspx">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" onclick="SavingPurchaseOrder();">Save</a></li>
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

    <input id="hdnPurchasedOrderID" type="hidden" value="0" />
    <input id="SupplierID" type="hidden" value="0" />

    <div id="main" class="suppliers-purchase-order">
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


                <div id="xPurchaseOrderList" style="display: block">
                    <div class="container one-column">
                        <div class="inner">
                            <div class="box-holder">
                                <div id="tab-content-holder">
                                    <div class="content tabular">
                                        <table class="tblholder main" id="xPurchaseOrderList_table">
                                            <thead>
                                                <tr>
                                                    <th width="10%">Reference No.</th>
                                                    <th width="10%">Date</th>
                                                    <th width="25%">Supplier Name</th>
                                                    <th width="10%">Cancel Date</th>
                                                    <th width="10%">Amount</th>
                                                    <th width="10%">Balance</th>
                                                    <th width="10%">Status</th>
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
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
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

                <div id="xPurchaseOrderForm" style="display: none">
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
                                                                        <td class="lbl" width="19%">
                                                                            <label for="supplier">*Supplier</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="supplier" name="supplier" value="" class="long" onblur="LoadSupplierDetails();" />
                                                                            <%--<div class="select-arrow long">
                                                                                <select name="supplier" id="supplier">
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
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="refNo" name="reference_letter" class="xxshort" />
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
                                            <div class="space5"></div>
                                        </div>
                                        <div class="rounded" style="height: 214px !important;">
                                            <div class="content tabular">
                                            <table class="tblholder unclickable" id="xPurchaseOrder_Table">
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
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                        <td width="10%"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                                </div>
                                        </div>
                                        <div class="space5"></div>
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
                                                                            <td>
                                                                                <input id="txtSubtotal" style="color: gray; text-align: right; background-color: transparent; border: none; width: 70px;" readonly="true" /></td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Total Served</td>
                                                                            <td>
                                                                                <input id="txtTotalServed" style="color: gray; text-align: right; background-color: transparent; border: none; width: 70px;" readonly="true" /></td>
                                                                            </td>
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
                                                            <div style="float: left; margin: 0 6px 0 0;" onclick="OpenPurchaseOrderList()">
                                                                <a href="#">
                                                                    <img src="image/close.png" width="71" height="20" alt="Void" /></a>
                                                            </div>
                                                            <div onclick="OpenPurchaseOrderList()">
                                                                <a href="#">
                                                                    <img src="image/hold.png" width="71" height="20" alt="Hold" /></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="pane-right ym-gr">
                                                        <div class="ym-gbox">
                                                            <div class="ym-clearfix">
                                                                <div class="float-right">
                                                                    <table>
                                                                        <tr>
                                                                            <td>Balance&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                            <td>1,000.00</td>
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
                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_purchased_search" name="location" value="" class="long search_class" style='border: none; background-color: transparent;'></td>
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
        LoadPurchasedOrderList();

        function OpenPurchaseOrderForm() {
            $('#xPurchaseOrderList').hide();
            $('#xPurchaseOrderForm').show();
        }
        function OpenPurchaseOrderList() {
            $('#xPurchaseOrderList').show();
            $('#xPurchaseOrderForm').hide();
        }
    </script>

</asp:Content>
