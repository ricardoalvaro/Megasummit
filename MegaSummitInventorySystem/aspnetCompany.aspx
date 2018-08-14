<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .uploadFile {
            visibility: hidden;
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
        .ym-form .obj .dp input[type="text"] {
            padding: 2px 5px 1px 0;
        }
    </style>

    <div id="subheader" class="hassubmenu">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class="active"><a href="aspnetCompany.aspx">Company</a></li>
                                <li class=""><a href="aspnetCompany-Summary.aspx">Summary</a></li>
                                <li class=""><a href="aspnetCompany-Reminders.aspx">Reminders</a></li>
                                <li class=""><a href="aspnetCompany-History.aspx">History</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <div id="action_accounting">
                                <ul id="toolbar" class="">
                                    <li><a id="btn-save" onclick="UpdateAccounting()" class="save ">Save</a></li>
                                    <li><a id="btn-new" class="new disabled " href="">New</a></li>
                                    <li><a id="btn-find" class="find disabled" href="javascript:;">Find</a></li>
                                    <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
                                    <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>
                            <div id="action_sales_tax" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a class="save " onclick="UpdateSalesTax()">Save</a></li>
                                    <li><a class="new disabled " href="">New</a></li>
                                    <li><a class="find disabled" href="javascript:;">Find</a></li>
                                    <li><a class="delete disabled" href="javascript:;">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_bank_account" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateBankAccount(this)" class="save ">Save</a></li>
                                    <li><a onclick="ActionNewBankAccount(this)" class="new disabled " href="">New</a></li>
                                    <li><a onclick="ActionSearchBankAccount(this)" class="find disabled" href="javascript:;">Find</a></li>
                                    <li><a onclick="ActionDeleteBankAccount(this)" class="delete disabled" href="javascript:;">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_tax_exmption" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a class="save" onclick="ActionSaveUpdateTax(this)">Save</a></li>
                                    <li><a class="new" onclick="ActionNewTax(this)">New</a></li>
                                    <li><a class="find" onclick="ActionSearchTax(this)">Find</a></li>
                                    <li><a class="delete" onclick="ActionDeleteTax(this)">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>



                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>
    <div id="main" class="company-company-company">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="submenu">
                    <ul class="crossfade ym-clearfix">
                        <li class="active"><a href="aspnetCompany.aspx">Company</a></li>
                        <li class=""><a href="aspnetCompany-User.aspx">Users</a></li>
                        <li class=""><a href="aspnetCompany-List.aspx">Lists</a></li>
                        <li class=""><a href="aspnetCompany-Settings.aspx">Settings</a></li>
                        <li class=""><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
                        <li class=""><a href="hspnetCompany-Calendar.aspx">Calendar</a></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <div class="container two-column-sidebar mod-company-company">
                    <div class="ym-column linearize-level-1">
                        <div class="ym-col1">
                            <div class="ym-cbox">
                                <div class="box-holder">
                                    <ul class="tabs crossfade">
                                        <li id="accnt" class="active form"><a onclick="SubMenuDisplay('accnt')" class="save" style="cursor: default">Accounting</a>
                                            <li id="sales" class="form"><a onclick="SubMenuDisplay('sales')" class="save" style="cursor: default">Sales Tax</a>
                                                <li id="bank_account" class="view"><a onclick="SubMenuDisplay('bank_account')" class="new-find" style="cursor: default">Bank Account</a>
                                                    <li id="tax_exemption" class="view"><a onclick="SubMenuDisplay('tax_exemption')" class="new-find" style="cursor: default">Tax Exemption</aSubMenuDisplay('bank_account')">
                                                        <li class="form"><a class="save">Back Up</a>
                                    </ul>
                                    <div id="tab-content-holder">

                                        <%-- ------------- --%>

                                        <div id="xAccounting" style="display: none">

                                            <div class="content vmiddle">
                                                <div class="ym-form">
                                                    <table>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="current_financial_year">*Current Financial Year</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="current_financial_year" name="current_financial_year" class="medium" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="last_month_financial_year">*Last Month Financial Year</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select id="last_month_financial_year">
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
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="conversion_month">*Conversion Month</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select id="converstion_month">
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
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>

                                        </div>

                                        <%-- ------------- --%>

                                        <div id="xSalesTax" style="display: none">
                                            <div class="content vmiddle" style="width: 558px; height: 241px;">
                                                <div class="ym-form">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="tax_type">*Tax Type</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow fullwidth">
                                                                        <select id="tax_type">
                                                                            <option value="VAT Exclusive">VAT Exclusive</option>
                                                                            <option value="VAT inclusive">VAT inclusive</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="rate">*Rate</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="rate" name="rate" class="fullwidth"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="tax_collected_account">*Tax Collected Account</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow fullwidth">
                                                                        <select id="tax_collected_account">
                                                                            <option value="General Cheque Account 1">General Cheque Account 1</option>
                                                                            <option value="General Cheque Account 2">General Cheque Account 2</option>
                                                                            <option value="Petty Cash">Petty Cash</option>
                                                                            <option value="Clearwater Provision Account">Clearwater Provision Account</option>
                                                                            <option value="Clearwater Investment Account">Clearwater Investment Account</option>
                                                                            <option value="Electronic Cleaning Account">Electronic Cleaning Account</option>
                                                                            <option value="Payroll Cheque Account">Payroll Cheque Account</option>
                                                                            <option value="Less Provision for Doubtful Debt">Less Provision for Doubtful Debt</option>
                                                                            <option value="Inventory">Inventory</option>
                                                                            <option value="Prepaid Insurance">Prepaid Insurance</option>
                                                                            <option value="Deposits with Supplier">Deposits with Supplier</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="tax_paid_account">*Tax Paid Account</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow fullwidth">
                                                                        <select id="tax_paid_account">
                                                                            <option value="Petty Cash">Petty Cash</option>
                                                                            <option value="Clearwater Provision Account">Clearwater Provision Account</option>
                                                                            <option value="Clearwater Investment Account">Clearwater Investment Account</option>
                                                                            <option value="Electronic Cleaning Account">Electronic Cleaning Account</option>
                                                                            <option value="Payroll Cheque Account">Payroll Cheque Account</option>
                                                                            <option value="Less Provision for Doubtful Debt">Less Provision for Doubtful Debt</option>
                                                                            <option value="Inventory">Inventory</option>
                                                                            <option value="Prepaid Insurance">Prepaid Insurance</option>
                                                                            <option value="Deposits with Supplier">Deposits with Supplier</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <%-- ------------- --%>

                                        <div id="xBankAccount" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Bank Name</th>
                                                            <th>Account type</th>
                                                            <th>Account Number</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xBankAccountManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank_name">*Bank Name</label></td>
                                                            <td class="obj">
                                                                <input type="hidden" id="hdn_bank_account_id" value="0" />
                                                                <div class="select-arrow long">
                                                                    <select id="bank_name">
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="account_name">*Account Name</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="account_name" name="account_name" value="JG Narvaez" class="long"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="account_type">*Account Type</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow long">
                                                                    <select id="account_type">
                                                                        <option value="Savings Account">Savings Account</option>
                                                                        <option value="Current Account">Current Account</option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="account_number">*Account No.</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="account_number" name="account_number" value="123456" class="long"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="branch">Branch</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="branch" name="branch" value="123" class="long"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="opening_balance">Opening Balance</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="opening_balance" name="opening_balance" value="122313.00" class="long"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xBankAccountSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Bank Account</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_bank_account_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="xLocationSearchFixContent">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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

                                        <%-- -------------- --%>

                                        <%-- Start Tax Exemption --%>

                                        <div id="xTaxExemption" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Tax</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        </tbody>
                                                    <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>--%>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xTaxExemptionManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Tax Code</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_tax_id" valu="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_tax_code" name="tax_code" value="" class="long"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Description</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_description" name="description" value="" class="long"></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Amount</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_amount" name="amount" value="" class="long"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xTaxExemptionSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Tax Exemption</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_tax_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div4">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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

                                        <%-- End Tax Exemption --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <div class="cleft vmiddle">
                                    <div class="ym-form">
                                        <table>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <input id="hdn_company_id" type="hidden" />
                                                    <div class="uploadBox">
                                                        <a href="javascript:void(0)" id="uploadIcon" href="">
                                                            <img id="img_company" src="image/google.jpg" width="157" height="77" alt="Google" class="image" />
                                                        </a>
                                                        <input type="file" value="upload" id="uploadFile" class="uploadFile" onchange="ShowPreview(this)" />
                                                    </div>



                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl">
                                                    <label for="company_name">*Company Name</label></td>
                                                <td class="obj">
                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_company_name" name="company_name" value="Megasummit Steel Distributor" class="fullwidth" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl" valign="top">
                                                    <label for="address">*Address</label></td>
                                                <td class="obj">
                                                    <textarea id="txt_address" name="address" autocorrect="off" spellcheck="false" class="xlong"></textarea></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl">
                                                    <label for="phone">*Telephone</label></td>
                                                <td class="obj">
                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_phone" name="phone" value="(02) 123-4567 / 789-0000" class="fullwidth" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl">
                                                    <label for="fax">Fax</label></td>
                                                <td class="obj">
                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_fax" name="fax" value="" class="fullwidth" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl">
                                                    <label for="vat_number">Vat. No.</label></td>
                                                <td class="obj">
                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_vat_number" name="vat_number" class="fullwidth" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl">
                                                    <label for="tin_number">TIN No.</label></td>
                                                <td class="obj">
                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_tin_number" name="tin_number" class="fullwidth" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl">
                                                    <label for="company_name">Website</label></td>
                                                <td class="obj">
                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_website" name="website" class="fullwidth" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl">
                                                    <label for="email">Email</label></td>
                                                <td class="obj">
                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_email" name="email" class="fullwidth" /></td>
                                            </tr>
                                            <tr>
                                                <td></td>

                                                <td>
                                                    <ul id="toolbar" class="">
                                                        <li><a class="save " onclick="UpdateCompany()">Save</a></li>
                                                    </ul>
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
    <script src="Script/Company.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            SubMenuDisplay('accnt');
        });


        function SubMenuDisplay(display) {

            $("#xAccounting").hide();
            $("#xSalesTax").hide();

            $("#xBankAccount").hide();
            $("#xBankAccountManage").hide();
            $("#xBankAccountSearch").hide();

            $("#xTaxExemption").hide();
            $("#xTaxExemptionManage").hide();
            $("#xTaxExemptionSearch").hide();



            $("#action_bank_account").hide();
            $("#action_sales_tax").hide();
            $("#action_accounting").hide();
            $("#action_tax_exmption").hide();

            if (display == 'accnt') {
                LoadAccounting()
                $("#action_accounting").show();
                $("#xAccounting").show();
            }
            else if (display == 'sales') {
                LoadSalesTax();
                $("#action_sales_tax").show();
                $("#xSalesTax").show();



            }
            else if (display == 'bank_account') {
                $("#action_bank_account").show();
                $("#xBankAccount").show();
                LoadBankAccount();
                $('#action_bank_account .save').addClass('disabled');
                $('#action_bank_account .delete').addClass('disabled');
                $('#action_bank_account .new').removeClass('disabled');
                $('#action_bank_account .find').removeClass('disabled');

            }
            else if (display == 'tax_exemption') {
                $("#xTaxExemption").show();
                $("#action_tax_exmption").show();
                LoadTax();
                $('#action_tax_exmption .save').addClass('disabled');
                $('#action_tax_exmption .delete').addClass('disabled');
                $('#action_tax_exmption .new').removeClass('disabled');
                $('#action_tax_exmption .find').removeClass('disabled');
            }

        }


        $("#uploadIcon").click(function () {
            $(this).next().trigger('click');
        });

        function ShowPreview(input) {
            if (input.files && input.files[0]) {
                var ImageDir = new FileReader();
                ImageDir.onload = function (e) {
                    $('#img_company').attr('src', e.target.result);
                    //upload sync here

                    UploadData();

                }

                ImageDir.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
