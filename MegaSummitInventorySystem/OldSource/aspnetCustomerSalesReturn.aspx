<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerSalesReturn.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerSalesReturn" %>

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
            height: 216px !important;
        }
        .box-holder2 {
            height: 160px !important;
        }
        
    </style>

    <input id="hdnReturnID" type="hidden" />

    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class=""><a href="aspnetCustomer.aspx">Customers</a></li>
                                <li class=""><a href="aspnetCustomerSales.aspx">Sales</a></li>
                                <li class="active"><a href="aspnetCustomerSalesReturn.aspx">Sales Return</a></li>
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
                                <li><a class="save disabled" onclick="SavingSalesReturn('Posted')">Save</a></li>
                                <li><a onclick="NewSalesReturn()" class="new  ">New</a></li>
                                <li><a class="find ">Find</a></li>
                                <li><a class="delete disabled">Delete</a></li>
                                <li><a class="print disabled">Print</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>

    <div id="main" class="customer-sales-return">
        <div class="ym-wrapper">
            <div class="ym-wbox">

                <div class="submenu nopad">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                
                 <ul class="suboptions">
                    <li><%--<div class="addup">--%>
                            <%--<div class="pagination">--%>
                                <%--<a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                            <%--</div><%--</div>--%>
                    </li>
                </ul>

                <div id="xSalesReturnList" style="display: block">

                    <div class="container one-column">
                        <div class="inner">
                            <div class="box-holder">
                                
                                <div id="tab-content-holder">
                                    <div class="content tabular">
                                        <table class="tblholder main" id="xSalesReturnList">
                                            <thead>
                                                <tr>
                                                    <th width="10%">Reference No.</th>
                                                    <th width="10%">Date</th>
                                                    <th width="30%">Customer Name</th>
                                                    <th width="15%">Salesman</th>
                                                    <th width="10%">Amount</th>
                                                    <th width="10%">Balance</th>
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

                <div id="xSalesReturnForm" style="display: none">
                    <%--<div class="ym-wrapper">
                        <div class="ym-wbox">--%>
                            <div class="container one-column withpad withbg mod-sales-invoice return">
                                <div class="inner">
                                    <div class="box-holder box-holder2">
                                        <div class="content">
                                            <div name="customer_sales_return_form" id="customer_sales_return_form" method="POST" class="ym-form">
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
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="customer" name="customer" value="" class="long" />
                                                                                    <%--<div class="select-arrow long">
                                                                                <select name="customer" id="customer" onchange="LoadSalesInvoiceList();">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>--%>
                                                                                </td>
                                                                                <input id="hdn_customerID" type="hidden" />
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
                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" />
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
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="space5"></div>
                                                </div>
                                                <div id="content-holder" class="pane-holder">
                                                    <div id="xSalesReturnFormList" style="display: block">
                                                        <div class="rounded theight" id="returnDetails">
                                                            <table class="tblholder unclickable" id="xProductTable">
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
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="20%">
                                                                            <input class='product' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='location' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='qty' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' onblur='ActionComputeAmount(this)' /></td>
                                                                        <td width="10%">
                                                                            <input class='unit' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='price' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='discount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount' style='color: gray; outline: none; width: 100%; border: none; background-color: transparent;' /></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    <div id="xSalesReturnFormApplayToInvoice" style="display: none">
                                                        <div class="addup rounded scroll-half movedown5">
                                                            <table class="tblholder unclickable" id="xInvoiceTable">
                                                                <thead>
                                                                    <tr>
                                                                        <th width="10%">Reference No.</th>
                                                                        <th width="10%">Date</th>
                                                                        <th width="30%">Description</th>
                                                                        <th width="12%">Balance</th>
                                                                        <th width="10%">Apply</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="scroll">
                                                                </tbody>
                                                            </table>
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
                                                                                        <input style='color: gray; text-align: right; border: none; background-color: transparent;' value="0" id="totalAmount" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div onclick="OpenSalesReturnFormApplayToInvoice()">
                                                                                            <a href="apply-to-invoice" class="view btnlink">
                                                                                                <img src="image/apply-invoice.png" width="87" height="20" alt="Void" /></a>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input style='color: gray; border: none; background-color: transparent;' id="txtApplyAmount" /></td>
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
                                                                    &nbsp;
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
                                                </div>
                                                <div class="addup">
                                                    <div class="space15"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <%--</div>
                    </div>--%>
                </div>

            </div>
        </div>
    </div>
    <script src="Script/SalesReturn.js"></script>
    <script type="text/javascript">
        LoadSalesReturnList();
        function OpenSalesReturnForm() {
            $("#xSalesReturnList").hide();
            $("#xSalesReturnForm").show();
        }

        function OpenSalesReturnFormApplayToInvoice() {
            $("#xSalesReturnFormList").hide();
            $("#xSalesReturnFormApplayToInvoice").show();
        }

    </script>
</asp:Content>
