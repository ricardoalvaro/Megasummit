<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetOfficialReceipt.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetOfficialReceipt" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
    <div id="main" class="customer-official-receipt">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="container two-column-sidebar style2" style="height: 237px;">
                    <div class="ym-column linearize-level-1">
                        <div id="content-holder" class="ym-col1">
                            <div class="ym-cbox padtop9">
                                <div class="box-holder" style="height: 207px;">
                                    <div name="customer_official_receipt_form" id="customer_official_receipt_form" method="POST" class="ym-form">
                                        <div class="addup">
                                            <h1>Official Receipt</h1>
                                            <div class="ym-clearfix">
                                                <div class="float-left">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="customer_name">*Customer Name</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="customer"  value="" class="long" />       
                                                                          
                                                                   <%-- <div class="select-arrow long">
                                                                        <select name="customer_name" id="customer_name">
                                                                            <option value=""></option>
                                                                        </select>
                                                                    </div>--%>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="float-right">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="reference_number">*Reference No.</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" value="OR">
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
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space5"></div>
                                    <div class="addup payment-options">
                                        <div class="holder rounded">
                                            <ul class="potabs">
                                                <li class="active form" onclick="PaymentType(this, 'cash')"><a href="#potab-cash"><span class="icon cash">&nbsp;</span>Cash</a><span id="spnCash" class="amount">0.00</span>
                                                </li>
                                                <li class="view" onclick="PaymentType(this, 'check')"><a href="#potab-check"><span class="icon check">&nbsp;</span>Check</a><span id="spnCheck" class="amount">0.00</span>
                                                </li>
                                                <li class="view" onclick="PaymentType(this, 'card')"><a href="#potab-card"><span class="icon card">&nbsp;</span>Card</a><span id="spnCard" class="amount">0.00</span>
                                                </li>
                                                <li class="view" onclick="PaymentType(this, 'account')"><a href="#potab-account"><span class="icon accounts">&nbsp;</span>Account</a><span id="spnAccount" class="amount">0.00</span>
                                                </li>
                                            </ul>
                                            <div class="space5"></div>
                                            <div id="potab-content-holder" class="subholder rounded" style="height: 77px;">
                                                <div class="content vmiddle" style="display: table-cell;" id="cash">
                                                    <div name="customer_official_receipt_cash_form" id="customer_official_receipt_cash_form" method="POST" class="ym-form">
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="amount">Amount</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="input_cash_amount" name="amount" class="short"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <table class="tblholder plain" style="display: none" id="check">
                                                    <thead>
                                                        <tr>
                                                            <th width="30%">Bank Name</th>
                                                            <th width="20%">Check No.</th>
                                                            <th width="15%">Date</th>
                                                            <th width="15%">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                       
                                                    </tbody>
                                                </table>
                                                
                                                <div class="content vmiddle" style="display: none" id="card">
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
                                                                                        <option value="VISA">VISA</option>
                                                                                        <option value="Master Card">Master Card</option>
                                                                                        <option value="Chase">Chase</option>
                                                                                        <option value="American Express">American Express</option>
                                                                                        <option value="Discover">Discover</option>
                                                                                        <option value="Citibank">Citibank</option>
                                                                                        <option value="Capitan One">Capitan One</option>
                                                                                        <option value="Bank of America">Bank of America</option>
                                                                                        <option value="Wells Fargo">Wells Fargo</option>
                                                                                        <option value="US Bank">US Bank</option>
                                                                                        <option value="USAA">USAA</option>
                                                                                        <option value="Credit One">Credit One</option>
                                                                                        <option value="Barclays US">Barclays US</option>
                                                                                        <option value="First PREMIER Bank">First PREMIER Bank</option>
                                                                                        <option value="PNC">PNC</option>
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
                                                                                             <select id="expiration_date_month" name="expiration_date">
                                                                                               
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-right">
                                                                                        <div class="select-arrow xxshort">
                                                                                          
                                                                                             <select id="expiration_date" name="expiration_date">
                                                                                                
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
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="input_credit_card_amount" name="amount" class="xxmedium" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div class="content vmiddle" style="display: none" id="account">
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
                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="input_account_amount" name="amount" class="xxmedium" /></td>
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
                                                                                        <label for="date">*Date</label></td>
                                                                                    <td class="obj">
                                                                                        <div class="dp xmedium">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="Text8" name="date" class="date" />
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
                                    <div class="subtab-container">
                                        <div class="box-holder" style="height: 0px;">
                                            <ul class="subtabs crossfade" style="width: 254px;">
                                                <li class="view active" style="width: 127px;" onclick="ApplyTo(this, 'invoices')"><a href="#subtab-apply-to-invoices">Apply to Invoices</a>
                                                </li>
                                                <li class="form" style="width: 127px;" onclick="ApplyTo(this ,'memo')"><a href="#subtab-apply-to-memo">Apply to Memo</a>
                                                </li>
                                            </ul>
                                            <div id="subtab-content-holder">
                                                <div class="content tabular" id="apply_invoices">
                                                    <table class="tblholder unclickable" id="tbl_apply_invoices">
                                                        <thead>
                                                            <tr>
                                                                <th width="15%">Reference No.</th>
                                                                <th width="15%">Date</th>
                                                                <th width="20%">Description</th>
                                                                <th width="20%">Salesman</th>
                                                                <th width="15%">Balance</th>
                                                                <th width="15%">
                                                                <input type="checkbox" id="applied" class="lblleft" style="display:block;opacity:1" onchange="ApplyToAllCheck(this)"><label for="apply">Apply</label></th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                               
                                                               
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>
                                                </div>

                                                <div class="content vmiddle" style="display: none" id="apply_memo">
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
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 237px;">
                                    <ul id="ulCustomer" class="sidebar sidelists2 crossfade scroll" style="overflow: hidden; width: auto; height: 237px;">
                                    </ul>
                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 237px;"></div>
                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="Script/OfficialReceipt.js"></script>

    <script type="text/javascript">

        var CustomerData = <%= CustomerVM.CustomerAutoComplete %>;
        var BankAutoCompleteData = <%=CompanyVM.CompanyBankAutoComplete %>;
        
    </script>

    <style>
        input[type="radio"], input[type="checkbox"] {
            display: inline !important;
    opacity: 0 !important;
    float: right !important;
        }
        .bank {
            border: none;
            background: none;
            width: 96%;
        }

        .check_no {
            border: none;
            background: none;
            width: 96%;
        }

        ._date {
            border: none;
            background: none;
            width: 96%;
        }

        .check_type {
            border: none;
            background: none;
            width: 96%;
        }

        .amount {
            border: none;
            background: none;
            width: 96%;
        }
        input.apply {
    width: 68%;
    float: left;
}
        .apply {
            border:none;
            background:none;
        }
        input.chk {
    opacity: 1 !important;
    margin: 3.5px 7px;
}
    </style>

</asp:Content>
