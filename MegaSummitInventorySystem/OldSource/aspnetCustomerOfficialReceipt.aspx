<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerOfficialReceipt.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerOfficialReceipt" %>

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
    </style>
    <input id="hdnPaymentID" type="hidden" value="0" />
    <input id="hdnTotalPay" type="hidden" value="0" />
    <input id="txtPayment" type="hidden" value="0" />

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
                                <li class=""><a href="aspnetCustomerSalesReturn.aspx">Sales Return</a></li>
                                <li class=""><a href="aspnetCustomerSalesOrder.aspx">Sales Order</a></li>
                                <li class="active"><a href="aspnetCustomerOfficialReceipt.aspx">Official Receipt</a></li>
                                <li class=""><a href="aspnetCustomerMemo.aspx">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save" href="javascript:;" onclick="SavingPayment();">Save</a></li>
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

    <div id="main" class="customer-official-receipt">
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


                <div class="container two-column-sidebar style2">
                    <div class="ym-column linearize-level-1">
                        <div id="content-holder" class="ym-col1">
                            <div class="ym-cbox padtop9">
                                <div class="box-holder">
                                    <div name="customer_official_receipt_form" id="customer_official_receipt_form" method="POST" class="ym-form">
                                        <div class="addup">
                                            <h1>Official Receipt</h1>
                                            <div class="ym-clearfix">
                                                <div class="float-left">
                                                    <table>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="customer_name">*Customer Name</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow long">
                                                                    <select name="customer_name" id="customer_name" onchange="LoadSalesInvoiceList();">
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
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" value="OR" />
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
                                                                <label for="date">*Date</label>
                                                            </td>
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
                                                <li class="active form" onclick="OpenOfficialReceiptCash()"><a href="#"><span class="icon cash">&nbsp;</span>Cash</a><div class="amount">
                                                    <input id="txtTotalCash" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                </div>
                                                </li>
                                                <li class="view"><a href="#" onclick="OpenOfficialReceiptCheck()"><span class="icon check">&nbsp;</span>Check</a><div class="amount">
                                                    <input id="txtTotalCheck" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                </div>
                                                </li>
                                                <li class="form"><a href="#" onclick="OpenOfficialReceiptCard()"><span class="icon card">&nbsp;</span>Card</a><div class="amount">
                                                    <input id="txtTotalCard" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                </div>
                                                </li>
                                                <li class="form"><a href="#" onclick="OpenOfficialReceiptAccount()"><span class="icon accounts">&nbsp;</span>Account</a><div class="amount">
                                                    <input id="txtTotalAccount" style="background-color: transparent; border: none; width: 70px; color: gray; text-align: center;" readonly="true" value="0" />
                                                </div>
                                                </li>
                                                <%--<li class="active form" onclick="OpenOfficialReceiptCash()"><a href="#potab-cash"><span class="icon cash">&nbsp;</span>Cash</a><div class="amount">1,200.00</div>
                                                </li>
                                                <li class="view" onclick="OpenOfficialReceiptCheck()"><a href="#potab-check"><span class="icon check">&nbsp;</span>Check</a><div class="amount">500.00</div>
                                                </li>
                                                <li class="form" onclick="OpenOfficialReceiptCard()"><a href="#potab-card"><span class="icon card">&nbsp;</span>Card</a><div class="amount">0.00</div>
                                                </li>
                                                <li class="form" onclick="OpenOfficialReceiptAccount()"><a href="#potab-account"><span class="icon accounts">&nbsp;</span>Account</a><div class="amount">0.00</div>
                                                </li>--%>
                                            </ul>
                                            <div class="space5"></div>
                                            <div id="potab-content-holder" class="subholder rounded">

                                                <div id="xOfficialReceiptCash" style="display: block">
                                                    <div class="content vmiddle">
                                                        <div name="customer_official_receipt_cash_form" id="customer_official_receipt_cash_form" method="POST" class="ym-form">
                                                            <table>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="amount">Amount</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="amount_cash" name="amount" class="short" onblur="ComputeCashPayment()" /></td>
                                                                </tr>

                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xOfficialReceiptCheck" style="display: none">
                                                    <table class="tblholder plain" id="checkpayment_table">
                                                        <thead>
                                                            <tr>
                                                                <th width="20%">Bank Name</th>
                                                                <th width="15%">Check No.</th>
                                                                <th width="10%">Date</th>
                                                                <th width="15%">Check Type</th>
                                                                <th width="10%">Amount</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="scroll tbody2">
                                                            <tr>
                                                                <td width="20%">
                                                                    <input class='bank_name' style='border: none; background-color: transparent;' /></td>
                                                                <td width="10%">
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

                                                <div id="xOfficialReceiptCard" style="display: none">
                                                    <div class="content vmiddle">
                                                        <div name="customer_official_receipt_card_form" id="customer_official_receipt_card_form" method="POST" class="ym-form">
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

                                                <div id="xOfficialReceiptAccount" style="display: none">
                                                    <div class="content vmiddle">
                                                        <div name="customer_official_receipt_account_form" id="customer_official_receipt_account_form" method="POST" class="ym-form">
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
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text2" name="amount" class="xxmedium" /></td>
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
                                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="Text3" name="reference_letter" class="xxshort" />
                                                                                                </div>
                                                                                                <div class="col-left">
                                                                                                    &nbsp;&nbsp;
                                                                                                </div>
                                                                                                <div class="col-left">
                                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="Text4" name="reference_number" class="xxxmedium" />
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
                                                                                                <input type="text" autocorrect="off" spellcheck="false" id="Text5" name="date" class="date" />
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

                                    <div class="subtab-container">
                                        <div class="box-holder">
                                            <ul class="subtabs crossfade">
                                                <li class="active view" onclick="OpenxApplyToInvoice()"><a href="#subtab-apply-to-invoices">Apply to Invoices</a>
                                                    <li class="form" onclick="OpenxApplyToMemo()"><a href="#subtab-apply-to-memo">Apply to Memo</a>
                                            </ul>
                                            <div id="subtab-content-holder">

                                                <div id="xApplyToInvoice" >
                                                    <div class="content tabular">
                                                        <table class="tblholder unclickable" id="xInvoiceTable">
                                                            <thead>
                                                                <tr>
                                                                    <th width="15%">Reference No.</th>
                                                                    <th width="10%">Date</th>
                                                                    <th width="23%">Description</th>
                                                                    <th width="15%">Salesman</th>
                                                                    <th width="12%">Balance</th>
                                                                    <th width="12%">
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
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div id="xApplyToMemo" style="display: block">
                                                    <div class="content vmiddle">
                                                        <div name="customer_official_receipt_apply_to_memo_form" id="customer_official_receipt_apply_to_memo_form" method="POST" class="ym-form">
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
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text6" name="reference_letter" class="xxshort" />
                                                                                        </div>
                                                                                        <div class="col-left">
                                                                                            &nbsp;&nbsp;
                                                                                        </div>
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text7" name="reference_number" class="xxxmedium" />
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
                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="Text8" name="date" class="date" />
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
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar sidelists2 crossfade scroll" id="ulPayment">
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                    <li>&nbsp; </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="Script/OfficialReceipt.js"></script>

    <script type="text/javascript">

        LoadCustomer();
        LoadCardType();
        LoadCardExp();
        BankNameAutoComplete();
        LoadPaymentRefDetails();
        function OpenOfficialReceiptCash() {
            $("#xOfficialReceiptCash").show();
            $("#xOfficialReceiptCheck").hide();
            $("#xOfficialReceiptCard").hide();
            $("#xOfficialReceiptAccount").hide();
        }

        function OpenOfficialReceiptCheck() {
            $("#xOfficialReceiptCash").hide();
            $("#xOfficialReceiptCheck").show();
            $("#xOfficialReceiptCard").hide();
            $("#xOfficialReceiptAccount").hide();
        }

        function OpenOfficialReceiptCard() {
            $("#xOfficialReceiptCash").hide();
            $("#xOfficialReceiptCheck").hide();
            $("#xOfficialReceiptCard").show();
            $("#xOfficialReceiptAccount").hide();
        }

        function OpenOfficialReceiptAccount() {
            $("#xOfficialReceiptCash").hide();
            $("#xOfficialReceiptCheck").hide();
            $("#xOfficialReceiptCard").hide();
            $("#xOfficialReceiptAccount").show();
        }

        function OpenxApplyToInvoice() {
            $("#xApplyToInvoice").show();
            $("#xApplyToMemo").hide();
        }

        function OpenxApplyToMemo() {
            $("#xApplyToInvoice").hide();
            $("#xApplyToMemo").show();
        }
    </script>

</asp:Content>
