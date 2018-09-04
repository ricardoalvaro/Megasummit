<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-List-PayrollItem.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_List_PayrollItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .search_class {
            border: 0;
            width: 100%;
        }

            .search_class:focus {
                outline: none;
            }

        .range {
            width: 97% !important;
            border: none;
            background: transparent;
        }

        .employee {
            width: 97% !important;
            border: none;
            background: transparent;
        }

        .employer {
            width: 97% !important;
            border: none;
            background: transparent;
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


                            <div id="action_wages" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateWages(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewWages(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchWages(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteWages(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_benefits" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateBenefits(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewBenefits(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchBenefits(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteBenefits(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_deductions" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateDeduction()" class="save">Save</a></li>
                                    <li><a onclick="ActionNewDeduction(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchDeduction(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteDeduction(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_contributions" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateContribution(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewContribution(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchContribution(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteContribution(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_taxes" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateTaxes(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewTaxes(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchTaxes(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteTaxes(this)" class="delete">Delete</a></li>
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
    <div id="main" class="company-company-lists-payroll-items">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="submenu">
                    <ul class="crossfade ym-clearfix">
                        <li class=""><a href="aspnetCompany.aspx">Company</a></li>
                        <li class=""><a href="aspnetCompany-User.aspx">Users</a></li>
                        <li class="active"><a href="aspnetCompany-List.aspx">Lists</a></li>
                        <li class=""><a href="aspnetCompany-Settings.aspx">Settings</a></li>
                        <li class=""><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
                        <li class=""><a href="aspnetCompany-Calendar.aspx">Calendar</a></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <div class="container two-column-sidebar mod-company-lists">
                    <div class="ym-column linearize-level-1">
                        <div class="ym-col1">
                            <div class="ym-cbox">
                                <div class="box-holder">
                                    <ul class="tabs crossfade">
                                        <li class="active view" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('wages')" class="new-find" style="cursor: default">Wages</a></li>
                                        <li class="view" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('benefits')" class="new-find" style="cursor: default">Benefits</a></li>
                                        <li class="view" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('deduction')" class="new-find" style="cursor: default">Deductions</a></li>
                                        <li class="view" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('contribution')" class="new-find" style="cursor: default">Contributions</a></li>
                                        <li class="view" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('taxes')" style="cursor: default">Taxes</a></li>
                                    </ul>
                                    <div id="tab-content-holder">

                                        <%-- ------------- --%>

                                        <div id="xWages" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Wages</th>
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
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xWagesManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Wages</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_wages_id" value="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_wages" value="" class="long">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Wage Type</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select id="ddl_wages_type">
                                                                        <option value="Hourly">Hourly</option>
                                                                        <option value="Daily">Daily</option>
                                                                        <option value="Monthly">Monthly</option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Multiplied By</label></td>
                                                            <td class="obj">

                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_wages_multiply" value="" class="short">
                                                            </td>
                                                        </tr>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                        <div id="xWagesSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Wages</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_wages_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div5">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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

                                        <%-- --------------- --%>

                                        <div id="xBenefits" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Benefits</th>
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
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xBenefitsManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">*Benefits</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_benefits_id" value="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_benefits" value="" class="long">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">*Days Allocatted</label></td>
                                                            <td class="obj">

                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_days_allocated" value="" class="short">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Add to Year</label></td>
                                                            <td class="obj">

                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_add_to_year" value="" class="short">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Used Leave</label></td>
                                                            <td class="obj">

                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_used_leave" value="" class="short">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Balance</label></td>
                                                            <td class="obj">

                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_balance" value="" class="short">
                                                            </td>
                                                        </tr>


                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Accumulation</label></td>
                                                            <td class="obj">
                                                                <input type="checkbox" id="chk_accumulation" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9; opacity: 1;">
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Cash Converstion</label></td>
                                                            <td class="obj">
                                                                <input type="checkbox" id="chk_cash_convertion" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9; opacity: 1;">
                                                            </td>
                                                        </tr>

                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                        <div id="xBenefitsSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Benefits</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_benefit_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div5">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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

                                        <%-- --------------- --%>

                                        <div id="xDeduction" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Deduction Name</th>
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
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xDeductionManage" style="display: none">

                                            <div class="content vmiddle" style="width: 757px; height: 141px;">
                                                <div class="addup moveup5">
                                                    <div class="ym-form" style="height: 30px !important; width: 757px">
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="deduction_name">Deduction Name</label></td>
                                                                    <td class="obj">
                                                                        <input id="hdn_deduction_id" type="hidden" />
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="deduction_name" name="deduction_name" value="Name here" class="long"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                    <div class="space5"></div>
                                                </div>
                                                <div class="rounded">
                                                    <table id="deduction_range" class="tblholder unclickable">
                                                        <thead>
                                                            <tr>
                                                                <th width="33%">Salary Range</th>
                                                                <th width="33%">Employee</th>
                                                                <th width="33%">Employer</th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 87px;">
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 34.7202px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>
                                                </div>
                                            </div>


                                        </div>

                                        <div id="xDeductionSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Deduction</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_deduction_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div2">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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

                                        <%-- --------------- --%>


                                        <div id="xContribution" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Contribution</th>
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
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xContributionManage" style="display: none">

                                            <div class="content vmiddle" style="width: 757px; height: 141px;">
                                                <div class="addup moveup5">
                                                    <div class="ym-form" style="height: 30px !important; width: 757px">
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="deduction_name">Contribution Name</label></td>
                                                                    <td class="obj">
                                                                        <input id="hdn_contribution_id" type="hidden" />
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="contribution_name" value="Name here" class="long"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                    <div class="space5"></div>
                                                </div>
                                                <div class="rounded">
                                                    <table id="contribution_range" class="tblholder unclickable">
                                                        <thead>
                                                            <tr>
                                                                <th width="33%">Salary Range</th>
                                                                <th width="33%">Employee</th>
                                                                <th width="33%">Employer</th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 87px;">
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 34.7202px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>
                                                </div>
                                            </div>


                                        </div>

                                        <div id="xContributionSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Contribution</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_contribution_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div2">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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


                                        <%-- --------------- --%>


                                        <div id="xTax" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Taxes</th>
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
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xTaxManage" style="display: none">

                                            <div class="content vmiddle" style="width: 757px; height: 141px;">
                                                <div class="addup moveup5">
                                                    <div class="ym-form" style="height: 30px !important; width: 757px">
                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="deduction_name">Taxes</label></td>
                                                                    <td class="obj">
                                                                        <input id="hdn_taxes_id" type="hidden" />
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="taxes_name" value="Name here" class="long"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                    <div class="space5"></div>
                                                </div>
                                                <div class="rounded">
                                                    <table id="tax_range" class="tblholder unclickable">
                                                        <thead>
                                                            <tr>
                                                                <th width="33%">Tax Bracket</th>
                                                                <th width="33%">Tax Based</th>
                                                                <th width="33%">Tax Rate</th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 87px;">
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 34.7202px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>
                                                </div>
                                            </div>


                                        </div>

                                        <div id="xTaxSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Taxes</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_taxes_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div1">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
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

                                        <%-- --------------- --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar crossfade">
                                    <li class=""><a href="aspnetCompany-List.aspx"><span class="item general"></span>General</a></li>
                                    <li class=""><a href="aspnetCompany-List-Group.aspx"><span class="item groups"></span>Groups</a></li>
                                    <li class="active"><a href="aspnetCompany-List-PayrollItem.aspx"><span class="item payroll-items"></span>Payroll Items</a></li>
                                    <li class=""><a href="aspnetCompany-List-Field.aspx"><span class="item fields"></span>Fields</a></li>
                                    <li class=""><a href="aspnetCompany-List-PaymentType.aspx"><span class="item payment-type"></span>Payment Type</a></li>
                                    <li class=""><a href="aspnetCompany-List-Others.aspx"><span class="item others"></span>Others</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="Script/CompanyListPayrollItem.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SubMenuDisplay('wages');
        });


        //onclick = 'ActivateForm(this);'
        function ActivateForm(me) {
            $(me).closest('ul').find('li').each(function () {
                $(this).removeClass('active');

            });

            $(me).addClass('active');

        }


        function SubMenuDisplay(display) {
            $("#xWages").hide();
            $("#xWagesManage").hide();
            $("#xWagesSearch").hide();
            $("#action_wages").hide();

            $("#xBenefits").hide();
            $("#xBenefitsManage").hide();
            $("#xBenefitsSearch").hide();
            $("#action_benefits").hide();

            $("#xDeduction").hide();
            $("#xDeductionManage").hide();
            $("#xDeductionSearch").hide();
            $("#action_deductions").hide();

            $("#xContribution").hide();
            $("#xContributionManage").hide();
            $("#xContributionSearch").hide();
            $("#action_contributions").hide();

            $("#xTax").hide();
            $("#xTaxManage").hide();
            $("#xTaxSearch").hide();
            $("#action_taxes").hide();


            if (display == 'wages') {
                $("#xWages").show();
                $("#action_wages").show();

                LoadWages();

                $('#action_wages .save').addClass('disabled');
                $('#action_wages .delete').addClass('disabled');
                $('#action_wages .new').removeClass('disabled');
                $('#action_wages .find').removeClass('disabled');

            }
            else if (display == 'benefits') {
                $("#xBenefits").show();
                $("#action_benefits").show();

                LoadBenefits();

                $('#action_benefits .save').addClass('disabled');
                $('#action_benefits .delete').addClass('disabled');
                $('#action_benefits .new').removeClass('disabled');
                $('#action_benefits .find').removeClass('disabled');

            }
            else if (display == 'deduction') {
                $("#xDeduction").show();
                $("#action_deductions").show();

                LoadDeduction();

                $('#action_deductions .save').addClass('disabled');
                $('#action_deductions .delete').addClass('disabled');
                $('#action_deductions .new').removeClass('disabled');
                $('#action_deductions .find').removeClass('disabled');

            }
            else if (display == 'contribution') {
                $("#xContribution").show();
                $("#action_contributions").show();

                LoadContribution();

                $('#action_contributions .save').addClass('disabled');
                $('#action_contributions .delete').addClass('disabled');
                $('#action_contributions .new').removeClass('disabled');
                $('#action_contributions .find').removeClass('disabled');

            }
            else if (display == 'taxes') {
                $("#xTax").show();
                $("#action_taxes").show();

                LoadTaxes()

                $('#action_taxes .save').addClass('disabled');
                $('#action_taxes .delete').addClass('disabled');
                $('#action_taxes .new').removeClass('disabled');
                $('#action_taxes .find').removeClass('disabled');

            }
            else {

                alert('just a template for now');
            }



        }

        ///////////////////////////////////////




    </script>


</asp:Content>
