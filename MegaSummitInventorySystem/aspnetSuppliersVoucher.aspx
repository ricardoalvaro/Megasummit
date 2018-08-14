<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSuppliersVoucher.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSuppliersVoucher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="Script/SupplierVoucher.js"></script>

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
                                <li class=""><a href="aspnetSuppliersPurchaseOrder.aspx">Purchase Order</a></li>
                                <li class="active"><a href="aspnetSuppliersVoucher.aspx">Voucher</a></li>
                                <li class=""><a href="aspnetSuppliersMemo.aspx">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save " onclick="SavingPayment();">Save</a></li>
                                <li><a id="btn-new" class="new disabled" href="javascript:;">New</a></li>
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
    <div id="main" class="suppliers-voucher">

        <input id="hdnSupplierID" type="hidden" value="0" />
        <input id="hdnPaymentID" type="hidden" value="0" />
        <input id="txtPayment" type="hidden" value="0" />
        <input id="hdnPurchasedID" type="hidden" value="0" />

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
                    </li>
                </ul>

                <div class="container two-column-sidebar style2">
                    <div class="ym-column linearize-level-1">
                        <div id="content-holder" class="ym-col1">
                            <div class="ym-cbox padtop9">
                                <div class="box-holder">
                                    <div name="suppliers_voucher_form" id="suppliers_voucher_form" method="POST" class="ym-form">
                                        <div class="addup">
                                            <h1>Voucher</h1>
                                            <div class="ym-clearfix">
                                                <div class="float-left">
                                                    <table>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="supplier_name">*Supplier Name</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow long">
                                                                    <select name="supplier_name" id="supplier" onchange="LoadPurchasedInvoiceList();">
                                                                        <option value=""></option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
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
                                                                <label for="date">*Date</label></td>
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
                                    <div class="addup payment-options">
                                        <div class="holder rounded">
                                            <ul class="potabs">
                                                <li class="active form" onclick="OpenVoucherCash()"><a href="#"><span class="icon cash">&nbsp;</span>Cash</a><div class="amount">
                                                    <input id="txtTotalCash" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                </div>
                                                </li>
                                                <li class="view" onclick="OpenVoucherCheck()"><a href="#"><span class="icon check">&nbsp;</span>Check</a><div class="amount">
                                                    <input id="txtTotalCheck" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                </div>
                                                </li>
                                            </ul>
                                            <div class="space5"></div>
                                            <div id="potab-content-holder" class="subholder rounded">
                                                <div class="content vmiddle">
                                                    <div name="suppliers_voucher_cash_form" id="suppliers_voucher_cash_form" method="POST" class="ym-form">
                                                        <div id="xVoucherCash" style="display: block">
                                                            <table>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="amount">*Amount</label>
                                                                    </td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="short" onblur="ComputeCashPayment()" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>

                                                        <div id="xVoucherCheck" style="display: none">
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
                                                                            <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                        <td width="15%">
                                                                            <input class='check_no' style='border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='date_check date' style='border: none; background-color: transparent;' /></td>
                                                                        <td width="15%">
                                                                            <input class='check_type' style='border: none; background-color: transparent;' /></td>
                                                                        <td width="10%">
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
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
                                                                            <input class='amount_check' style='border: none; background-color: transparent;' onblur="ComputeCheckPayment();" /></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="subtab-container">
                                        <div class="box-holder">
                                            <ul class="subtabs crossfade">
                                                <li class="active view" onclick="OpenVoucherApplyInvoice()"><a href="#">Apply to Invoices</a>
                                                    <li class="form" onclick="OpenxVoucherApplyMemo()"><a href="#">Apply to Memo</a>
                                            </ul>
                                            <div id="subtab-content-holder">
                                                <div class="content tabular">

                                                    <input id="hdnTotalPay" type="hidden" value="0" />

                                                    <div id="xVoucherApplyInvoice" style="display: block">
                                                        <table class="tblholder unclickable" id="xPurchaseList_table">
                                                            <thead>
                                                                <tr>
                                                                    <th width="15%">Reference No.</th>
                                                                    <th width="10%">Date</th>
                                                                    <th width="30%">Description</th>
                                                                    <th width="10%">Balance</th>
                                                                    <th width="15%">
                                                                        <input type="checkbox" id="applied" class="lblleft" /><label for="apply">Apply</label></th>
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
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div id="xVoucherApplyMemo" style="display: none">
                                                        <div class="content vmiddle">
                                                            <div name="suppliers_voucher_apply_to_memo_form" id="suppliers_voucher_apply_to_memo_form" method="POST" class="ym-form">
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
                                                                                                <input type="text" autocorrect="off" spellcheck="false" id="Text1" name="reference_letter" class="xxshort" />
                                                                                            </div>
                                                                                            <div class="col-left">
                                                                                                &nbsp;&nbsp;
                                                                                            </div>
                                                                                            <div class="col-left">
                                                                                                <input type="text" autocorrect="off" spellcheck="false" id="Text2" name="reference_number" class="xxxmedium" />
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
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text3" name="date" class="date" />
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar sidelists2 crossfade scroll" id="ulPayment">
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        LoadSupplier();

        function OpenVoucherCash() {
            $('#xVoucherCash').show();
            $('#xVoucherCheck').hide();
        }
        function OpenVoucherCheck() {
            $('#xVoucherCash').hide();
            $('#xVoucherCheck').show();
        }
        function OpenVoucherApplyInvoice() {
            $('#xVoucherApplyInvoice').show();
            $('#xVoucherApplyMemo').hide();
        }
        function OpenxVoucherApplyMemo() {
            $('#xVoucherApplyInvoice').hide();
            $('#xVoucherApplyMemo').show();
        }
    </script>

</asp:Content>
