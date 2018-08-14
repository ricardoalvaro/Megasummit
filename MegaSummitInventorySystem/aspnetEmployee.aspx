<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetEmployee.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .table2 {
            width: 557px;
            height: 383px;
        }

        .box-holder2 {
            height: 406px !important;
        }

        .sublist2 {
            height: 298px !important;
        }

        .tbody2 {
            height: 300px !important;
        }

        .vmiddle2 {
            width: 557px !important;
            height: 405px !important;
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


    <script src="Script/Employee.js"></script>

    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class="active" onclick="OpenEmployeeList()"><a href="#">Employee</a></li>
                                <li class=""><a href="http://localhost:8181/megasummit/employees/time-attendance/">Time Attendance</a></li>
                                <li class=""><a href="http://localhost:8181/megasummit/employees/commission-voucher/">Commission Voucher</a></li>
                                <li class=""><a href="http://localhost:8181/megasummit/employees/payslip/">Payslip</a></li>
                                <li class=""><a href="http://localhost:8181/megasummit/employees/memo/">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" onclick="SavingInvoice();">Save</a></li>
                                <li><a id="btn-new" class="new " onclick="NewEmployee();">New</a></li>
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

    <div id="main" class="employees-employee">

        <input id="hdnEmployeeID" type="hidden" value="0" />

        <div id="xEmployeeList" style="display: block">
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
                    <div class="container one-column">
                        <div class="inner">
                            <div class="box-holder">
                                
                                <div class="content tabular">
                                    <table class="tblholder main" id="tblEmployee">
                                        <thead>
                                            <tr>
                                                <th width="28%">Employee Name</th>
                                                <th width="12%">Employee Type</th>
                                                <th width="12%">Employee Class</th>
                                                <th width="12%">Department</th>
                                                <th width="12%">Cash Bond</th>
                                                <th width="12%">Status</th>
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
        </div>

        <div id="xEmployeeForm" style="display: none">
            <div class="ym-wrapper">
                <div class="ym-wbox">
                    <div class="submenu ajax ">
                        <ul class="crossfade ym-clearfix">
                            <li class="active form" onclick="OpenEmployeeGeneralInfo()"><a href="#" class="save-new-delete">General Info</a></li>
                            <li class=" view" onclick="OpenEmployeeSalesmanCutomer()"><a href="#">Salesman Customer</a></li>
                            <li class=" view" onclick="OpenEmployeeSalesmanItems()"><a href="#">Salesman Items</a></li>
                            <li class=" view" onclick="OpenEmployeeCommission()"><a href="#">Commission</a></li>
                            <li class=" view" onclick="OpenEmployeeTimeCard()"><a href="#">Time Card</a></li>
                            <li class=" view" onclick="OpenEmployeeInvoice()"><a href="#">Invoices</a></li>
                            <li class=" view" onclick="OpenEmployeePayment()"><a href="#">Payments</a></li>
                            <li class=" view" onclick="OpenEmployeeMemo()"><a href="#">Memo</a></li>
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>

                    <div id="xEmployeeGeneralInfo" style="display: block">
                        <div class="container two-column-sidebar mod-employees-employee">
                            <div class="ym-column linearize-level-1">
                                <div class="ym-col1">
                                    <div class="ym-cbox">
                                        <div class="box-holder box-holder2">
                                            <ul class="tabs crossfade">
                                                <li class="active form" onclick="OpenEmployeeDetails()"><a href="#" class="save">Details</a></li>
                                                <li class="form" onclick="OpenEmployeeAttendance()"><a href="#" class="save">Attendance</a></li>
                                                <li class="form" onclick="OpenEmployeeWages()"><a href="#" class="save">Wages</a></li>
                                                <li class="form" onclick="OpenEmployeeBenefits()"><a href="#" class="save">Benefits</a></li>
                                                <li class="form" onclick="OpenEmployeeDeductions()"><a href="#" class="save">Deductions</a></li>
                                                <li class="form" onclick="OpenEmployeeContributions()"><a href="#" class="save">Contributions</a></li>
                                                <li class="form" onclick="OpenEmployeeTaxes()"><a href="#" class="save">Taxes</a></li>
                                            </ul>
                                            <div id="tab-content-holder">

                                                <div id="xEmployeeDetails" style="display: block">
                                                    <div class="content vmiddle">
                                                        <div id="employees_employee_details_form" class="ym-form table2">
                                                            <div class="space55"></div>
                                                            <table>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="employee_type">*Employee Type</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <div class="select-arrow xmedium">
                                                                                    <select name="employee_type" id="employee_type">
                                                                                        <option value="Employee">Employee</option>
                                                                                        <option value="Salesman">Salesman</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="tin_number">*Tax Status</label>
                                                                                <div class="select-arrow xmedium">
                                                                                    <select name="tax_status" id="tax_status">
                                                                                        <option value="0"> </option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="employee_class">*Employee Class</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <div class="select-arrow xmedium">
                                                                                    <select name="employee_class" id="employee_class">
                                                                                        <option value=""></option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="tin_number">TIN No.</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="tin_number" name="tin_number" value="" class="xmedium" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="department">*Department</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <div class="select-arrow xmedium">
                                                                                    <select name="department" id="department">
                                                                                        <option value=""></option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="sss_number">SSS No.</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="sss_number" name="sss_number" value="" class="xmedium" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="status">*Status</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <div class="select-arrow xmedium">
                                                                                    <select name="status" id="status">
                                                                                        <option value="Closed">Closed</option>
                                                                                        <option value="Open">Open</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="philhealth_number">PhilHealth No.</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="philhealth_number" name="philhealth_number" value="" class="xmedium" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="cash_bond">Cash Bond</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="cash_bond" name="cash_bond" value="" class="xmedium" />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="pagibig_number">Pag-Ibig No.</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="pagibig_number" name="pagibig_number" value="" class="xmedium" />
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
                                                                        <label for="total_hours_worked">Total Hours Worked</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_hours_worked" name="total_hours_worked" value="" class="xmedium" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="total_sales">Total Sales</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_sales" name="total_sales" value="" class="xmedium" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="total_hours_absent">Total Hours Absent</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_hours_absent" name="total_hours_absent" value="" class="xmedium" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="total_receivable">Total Receivable</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_receivable" name="total_receivable" value="" class="xmedium" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="salary">Salary</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="salary" name="salary" value="" class="xmedium" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="commission">Commission</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="commission" name="commission" value="" class="xmedium" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="total_salary">Total Salary</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_salary" name="total_salary" value="" class="xmedium" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="total_commission">Total Commission</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_commission" name="total_commission" value="" class="xmedium" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="total_memo">Total Memo</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_memo" name="total_memo" value="" class="xmedium" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="total_memo">Total Memo</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="Text1" name="total_memo" value="" class="xmedium" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xEmployeeAttendance" style="display: none">
                                                    <div class="content vmiddle">
                                                        <div name="employees_employee_attendance_form" id="Div1" method="POST" class="ym-form table2">
                                                            <div class="space55"></div>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="start">*Start</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="start" name="start" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="break_out">Break Out</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="break_out" name="break_out" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="break_in">Break In</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="break_in" name="break_in" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="end">*End</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="end" name="end" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="grace_period">*Grace Period</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="grace_period" name="grace_period" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="time_duration">*Time Duration</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="time_duration" name="time_duration" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="overtime_start">Overtime Start</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="overtime_start" name="overtime_start" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="overtime_end">Overtime End</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="overtime_end" name="overtime_end" value="00:00:00" class="xxmedium" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="44"></td>
                                                                    <td width="">
                                                                        <table>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="employee_id">*Employee ID</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="employee_id" name="employee_id" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="password">*Password</label></td>
                                                                                <td class="obj">
                                                                                    <input type="password" autocorrect="off" spellcheck="false" id="password" name="password" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2">
                                                                                    <div class="horz-divider"></div>
                                                                                    <div class="space2"></div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="joined">*Joined</label></td>
                                                                                <td class="obj">
                                                                                    <div class="dp xxmedium">
                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="joined" name="joined" class="date" />
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="left">*Left</label></td>
                                                                                <td class="obj">
                                                                                    <div class="dp xxmedium">
                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="left" name="left" class="date" />
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="day_off">*Day Off</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow xxmedium">
                                                                                        <select name="day_off" id="day_off">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="late_penalty">*Late Penalty</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="late_penalty" name="late_penalty" class="xxmedium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="undertime_penalty">*Undertime Penalty</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="undertime_penalty" name="undertime_penalty" class="xxmedium" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div id="xEmployeeWages" style="display: none">
                                                    <div class="addup align-center">
                                                        <ul class="sublists">
                                                            <li class="active form" onclick="OpenEmployeeWagesSalary()"><a href="#">Salary</a></li>
                                                            <li class="form" onclick="OpenEmployeeWagesCommission()"><a href="#">Commission</a></li>
                                                        </ul>
                                                        <div class="space5"></div>
                                                    </div>

                                                    <div id="xEmployeeWagesSalary" style="display: block">
                                                        <div id="sublist-content-holder sublist2">
                                                            <div class="addup sublist">
                                                                <div name="employees_employee_wages_form" id="employees_employee_wages_form" method="POST" class="ym-form">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="lbl">
                                                                                <label for="wages_type">*Wages Type</label></td>
                                                                            <td class="obj">
                                                                                <div class="select-arrow fullwidth">
                                                                                    <select id="wages_type">
                                                                                        <option value=""></option>
                                                                                    </select>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lbl">
                                                                                <label for="amount">*Amount</label></td>
                                                                            <td class="obj">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="fullwidth" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                                <div class="space10">&nbsp;</div>
                                                            </div>
                                                            <div class="rounded">
                                                                <table class="tblholder tbody2">
                                                                    <thead>
                                                                        <tr>
                                                                            <th width="85%">Wages</th>
                                                                            <th width="15%">
                                                                                <input type="checkbox" id="apply" class="lblleft" /><label for="apply">Apply</label></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="scroll tbody2">
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="xEmployeeWagesCommission" style="display: none">
                                                        <div class="addup">
                                                            <div class="wage-commission-pane">
                                                                <!-- Start of Two Grids -->
                                                                <div class="ym-grid">
                                                                    <div class="block-left ym-gl">
                                                                        <div class="ym-gbox">
                                                                            <ul class="subsublists crossfade">
                                                                                <li class="active form"><a href="#subsublist-wages-commission-dr-fixed">Delivery Receipt<br />
                                                                                    Fixed</a></li>
                                                                                <li class="form"><a href="#subsublist-wages-commission-si-bracket">Salees Invoice<br />
                                                                                    Bracket</a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="block-right ym-gr">
                                                                        <div id="subsublist-content-holder" class="ym-gbox">
                                                                            <div name="employees_employee_wages_commission_form" id="employees_employee_wages_commission_form" method="POST" class="ym-form">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td class="lbl">
                                                                                            <label for="commission_type">*Commission Type</label></td>
                                                                                        <td class="obj">
                                                                                            <div class="select-arrow long">
                                                                                                <select id="commission_type" name="commission_type">
                                                                                                    <option value=""></option>
                                                                                                    <option value="bracket">Bracket</option>
                                                                                                    <option value="fixed">Fixed</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="lbl">
                                                                                            <label for="commision_rate">*Commmission Rate</label></td>
                                                                                        <td class="obj">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="commision_rate" name="commision_rate" class="short" /></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                            <div class="space5"></div>
                                                                            <div class="rounded tabular-data">
                                                                                <table class="tblholder unclickable custom" id="cheight-50">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th width="33%">Profit From</th>
                                                                                            <th width="33%">Profit To</th>
                                                                                            <th width="33%">Commission</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody class="scroll">
                                                                                        <tr>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                            <td width="33%"></td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="space10">&nbsp;</div>
                                                        </div>
                                                        <div class="rounded">
                                                            <table class="tblholder" style="height: 230px !important;">
                                                                <thead>
                                                                    <tr>
                                                                        <th width="85%">Wages</th>
                                                                        <th width="15%">
                                                                            <input type="checkbox" id="Checkbox5" class="lblleft" /><label for="apply">Apply</label></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="scroll" style="height: 230px !important;">
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="85%"></td>
                                                                        <td width="15%"></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xEmployeeBenefits" style="display: none">
                                                    <div class="content vmiddle vmiddle2">
                                                        <div name="employees_employee_benefits_form" id="employees_employee_benefits_form" method="POST" class="ym-form">
                                                            <div class="rounded">
                                                                <table class="tblholder" style="height: 388px !important;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th width="85%">Benefits</th>
                                                                            <th width="15%">
                                                                                <input type="checkbox" id="Checkbox1" class="lblleft" /><label for="apply">Apply</label></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="scroll" style="height: 388px !important;">
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xEmployeeDeductions" style="display: none">
                                                    <div class="content vmiddle vmiddle2">
                                                        <div name="employees_employee_benefits_form" id="Div2" method="POST" class="ym-form">
                                                            <div class="rounded">
                                                                <table class="tblholder" style="height: 388px !important;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th width="85%">Deductions</th>
                                                                            <th width="15%">
                                                                                <input type="checkbox" id="Checkbox2" class="lblleft" /><label for="apply">Apply</label></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="scroll" style="height: 388px !important;">
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xEmployeeContributions" style="display: none">
                                                    <div class="content vmiddle vmiddle2">
                                                        <div name="employees_employee_benefits_form" id="Div3" method="POST" class="ym-form">
                                                            <div class="rounded">
                                                                <table class="tblholder" style="height: 388px !important;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th width="85%">Contributions</th>
                                                                            <th width="15%">
                                                                                <input type="checkbox" id="Checkbox3" class="lblleft" /><label for="apply">Apply</label></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="scroll" style="height: 388px !important;">
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="xEmployeeTaxes" style="display: none">
                                                    <div class="content vmiddle vmiddle2">
                                                        <div name="employees_employee_benefits_form" id="Div4" method="POST" class="ym-form">
                                                            <div class="rounded">
                                                                <table class="tblholder" style="height: 388px !important;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th width="85%">Taxes</th>
                                                                            <th width="15%">
                                                                                <input type="checkbox" id="Checkbox4" class="lblleft" /><label for="apply">Apply</label></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="scroll" style="height: 388px !important;">
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="85%"></td>
                                                                            <td width="15%"></td>
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
                                        <div class="cleft vmiddle">
                                            <div method="POST" class="ym-form">
                                                <table>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <img src="image/google.jpg" width="157" height="77" alt="Google" class="image" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="employee_name">*Employee Name</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="employee_name" name="employee_name" class="fullwidth" /></td>
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
                                                            <input type="text" autocorrect="off" spellcheck="false" id="contact_person" name="contact_person" value="" class="fullwidth" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="spouse_name">Spouse Name</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="spouse_name" name="spouse_name" value="" class="fullwidth" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="phone">Phone</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="phone" name="phone" value="" class="fullwidth" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="mobile_phone">Mobile Phone</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="mobile_phone" name="mobile_phone" value="" class="fullwidth" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="civil_status">*Civil Status</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <div class="select-arrow short">
                                                                        <select name="civil_status" id="civil_status">
                                                                            <option value="Single">Single</option>
                                                                            <option value="Married">Married</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-right">
                                                                    <label for="birthdate">*Date of Birth</label>
                                                                    <div class="dp short">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="birthdate" name="birthdate" value="" class="short birthdate" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="email">Email</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="email" name="email" class="fullwidth" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl" valign="top">
                                                            <label for="notes">Notes</label></td>
                                                        <td class="obj">
                                                            <textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="xEmployeeSalesmanCutomer" style="display: none">
                        <div class="container one-column">
                            <div class="inner">
                                <div class="box-holder">
                                    <div class="content tabular">
                                        <table class="tblholder main unclickable">
                                            <thead>
                                                <tr>
                                                    <th width="40%">Customer Name</th>
                                                    <th width="20%">Last Transaction Date</th>
                                                    <th width="20%">Receivable</th>
                                                    <th width="20%">Price Level</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td width="40%">here</td>
                                                    <td width="20%">here</td>
                                                    <td width="20%">here</td>
                                                    <td width="20%">here</td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="40%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
                                                    <td width="20%"></td>
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

                    <div id="xEmployeeSalesmanItems" style="display: none">
                        <div class="container one-column">
                            <div class="inner">
                                <div class="box-holder">
                                    <div class="content tabular">
                                        <table class="tblholder main unclickable">
                                            <thead>
                                                <tr>
                                                    <th width="35%">Product Name</th>
                                                    <th width="10%">Reference No.</th>
                                                    <th width="15%">Date of Last Purchase</th>
                                                    <th width="10%">Quantity</th>
                                                    <th width="10%">Unit</th>
                                                    <th width="10%">Cost Per Unit</th>
                                                    <th width="10%">Discount</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="35%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
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

                    <div id="xEmployeeCommission" style="display: none; margin: -28px 0 0 0;">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenEmployeeCommissionAll()"><a href="#">All</a></li>
                            <li><a href="#" onclick="OpenEmployeeCommissionPaid()">Paid</a></li>
                            <li><a href="#" onclick="OpenEmployeeCommissionUnpaid()">Unpaid</a></li>
                        </ul>
                        <div id="xEmployeeCommissionAll" style="display: block">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="content-holder">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Date</th>
                                                            <th width="20%">Customer Name</th>
                                                            <th width="12%">Invoice Amount</th>
                                                            <th width="8%">Rate</th>
                                                            <th width="8%">Days</th>
                                                            <th width="15%">Commission Amount</th>
                                                            <th width="15%">Commission Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="20%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="8%">here</td>
                                                            <td width="8%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="16%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
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
                        <div id="xEmployeeCommissionPaid" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div5">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Date</th>
                                                            <th width="20%">Customer Name</th>
                                                            <th width="12%">Invoice Amount</th>
                                                            <th width="8%">Rate</th>
                                                            <th width="8%">Days</th>
                                                            <th width="15%">Commission Amount</th>
                                                            <th width="15%">Commission Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="20%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="8%">here</td>
                                                            <td width="8%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="16%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
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
                        <div id="xEmployeeCommissionUnpaid" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div6">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Date</th>
                                                            <th width="20%">Customer Name</th>
                                                            <th width="12%">Invoice Amount</th>
                                                            <th width="8%">Rate</th>
                                                            <th width="8%">Days</th>
                                                            <th width="15%">Commission Amount</th>
                                                            <th width="15%">Commission Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="20%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="8%">here</td>
                                                            <td width="8%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="16%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="20%"></td>
                                                            <td width="12%"></td>
                                                            <td width="8%"></td>
                                                            <td width="8%"></td>
                                                            <td width="15%"></td>
                                                            <td width="16%"></td>
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
                    </div>

                    <div id="xEmployeeTimeCard" style="display: none; margin: -28px 0 0 0;">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenEmployeeTimeCardAll()"><a href="#">All</a></li>
                            <li><a href="#" onclick="OpenEmployeeTimeCardAbsences()">Absences</a></li>
                            <li><a href="#" onclick="OpenEmployeeTimeCardOvertime()">Overtime</a></li>
                            <li><a href="#" onclick="OpenEmployeeTimeCardUnderTime()">Undertime</a></li>
                        </ul>
                        <div id="xEmployeeTimeCardAll" style="display: block">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div7">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Date</th>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Time In</th>
                                                            <th width="10%">Break Out</th>
                                                            <th width="10%">Break In</th>
                                                            <th width="10%">Time Out</th>
                                                            <th width="15%">Total Late Hours</th>
                                                            <th width="15%">Total Work Hours</th>
                                                            <th width="10%">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="10%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
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
                        <div id="xEmployeeTimeCardAbsences" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div8">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Date</th>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Time In</th>
                                                            <th width="10%">Break Out</th>
                                                            <th width="10%">Break In</th>
                                                            <th width="10%">Time Out</th>
                                                            <th width="15%">Total Late Hours</th>
                                                            <th width="15%">Total Work Hours</th>
                                                            <th width="10%">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="10%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
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
                        <div id="xEmployeeTimeCardOvertime" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div9">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Date</th>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Time In</th>
                                                            <th width="10%">Break Out</th>
                                                            <th width="10%">Break In</th>
                                                            <th width="10%">Time Out</th>
                                                            <th width="15%">Total Late Hours</th>
                                                            <th width="15%">Total Work Hours</th>
                                                            <th width="10%">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="10%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
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
                        <div id="xEmployeeTimeCardUnderTime" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div10">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Date</th>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Time In</th>
                                                            <th width="10%">Break Out</th>
                                                            <th width="10%">Break In</th>
                                                            <th width="10%">Time Out</th>
                                                            <th width="15%">Total Late Hours</th>
                                                            <th width="15%">Total Work Hours</th>
                                                            <th width="10%">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="10%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="15%"></td>
                                                            <td width="15%"></td>
                                                            <td width="10%"></td>
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
                    </div>

                    <div id="xEmployeeInvoice" style="display: none; margin: -28px 0 0 0;">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenEmployeeInvoiceAll()"><a href="#">All</a></li>
                            <li onclick="OpenEmployeeInvoicePaid()"><a href="#">Paid</a></li>
                            <li onclick="OpenEmployeeTimeCardOvertime()"><a href="#">Unpaid</a></li>
                        </ul>
                        <div id="xEmployeeInvoiceAll" style="display: block;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div11">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Transaction Type</th>
                                                            <th width="25%">Customer Name</th>
                                                            <th width="10%">Days</th>
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
                        <div id="xEmployeeInvoicePaid" style="display: none;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div12">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Transaction Type</th>
                                                            <th width="25%">Customer Name</th>
                                                            <th width="10%">Days</th>
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
                        <div id="xEmployeeInvoiceUnpaid" style="display: none;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div13">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Transaction Type</th>
                                                            <th width="25%">Customer Name</th>
                                                            <th width="10%">Days</th>
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
                    </div>

                    <div id="xEmployeePayment" style="display: none; margin: -28px 0 0 0;">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenEmployeePaymentCash()"><a href="#">Cash</a></li>
                            <li onclick="OpenEmployeePaymentCheck()"><a href="#">Check</a></li>
                            <li onclick="OpenEmployeePaymentCard()"><a href="#">Card</a></li>
                        </ul>
                        <div id="xEmployeePaymentCash" style="display: block;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div14">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="20%">Reference No.</th>
                                                            <th width="20%">Date</th>
                                                            <th width="20%">C.V./Payslip Amount</th>
                                                            <th width="20%">Amount</th>
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
                        <div id="xEmployeePaymentCheck" style="display: none;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div15">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Date</th>
                                                            <th width="12%">C.V./P.S. Amount</th>
                                                            <th width="18%">Bank Name</th>
                                                            <th width="10%">Check No.</th>
                                                            <th width="10%">Check Date</th>
                                                            <th width="10%">Check Type</th>
                                                            <th width="10%">Amount</th>
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
                        <div id="xEmployeePaymentCard" style="display: none;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div16">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="15%">Reference No.</th>
                                                            <th width="15%">Date</th>
                                                            <th width="15%">C.V./Paylsip Amount</th>
                                                            <th width="20%">Bank Name</th>
                                                            <th width="20%">ATM No.</th>
                                                            <th width="15%">Amount</th>
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
                    </div>

                    <div id="xEmployeeMemo" style="display: none; margin: -28px 0 0 0;">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenEmployeeMemoAll()"><a href="#">All</a></li>
                            <li onclick="OpenEmployeeMemoDebit()"><a href="#">Debit</a></li>
                            <li onclick="OpenEmployeeMemoCredit()"><a href="#">Credit</a></li>
                        </ul>
                        <div id="xEmployeeMemoAll" style="display: block;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div17">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Memo Type</th>
                                                            <th width="25%">Account Name</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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
                        <div id="xEmployeeMemoDebit" style="display: none;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div18">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Memo Type</th>
                                                            <th width="25%">Account Name</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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
                        <div id="xEmployeeMemoCredit" style="display: none;">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div19">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Memo Type</th>
                                                            <th width="25%">Account Name</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function OpenEmployeeList() {
            $('#xEmployeeList').show();
            $('#xEmployeeForm').hide();
        }
        function OpenEmployeeForm() {
            $('#xEmployeeList').hide();
            $('#xEmployeeForm').show();
        }
        function OpenEmployeeDetails() {
            $('#xEmployeeDetails').show();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').hide();
            $('#xEmployeeWagesSalary').hide();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeAttendance() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').show();
            $('#xEmployeeWages').hide();
            $('#xEmployeeWagesSalary').hide();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeWages() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').show();
            $('#xEmployeeWagesSalary').show();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeWagesSalary() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').show();
            $('#xEmployeeWagesSalary').show();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeWagesCommission() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').show();
            $('#xEmployeeWagesSalary').hide();
            $('#xEmployeeWagesCommission').show();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeBenefits() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').hide();
            $('#xEmployeeWagesSalary').hide();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').show();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeDeductions() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').hide();
            $('#xEmployeeWagesSalary').hide();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').show();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeContributions() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').hide();
            $('#xEmployeeWagesSalary').hide();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').show();
            $('#xEmployeeTaxes').hide();
        }
        function OpenEmployeeTaxes() {
            $('#xEmployeeDetails').hide();
            $('#xEmployeeAttendance').hide();
            $('#xEmployeeWages').hide();
            $('#xEmployeeWagesSalary').hide();
            $('#xEmployeeWagesCommission').hide();
            $('#xEmployeeBenefits').hide();
            $('#xEmployeeDeductions').hide();
            $('#xEmployeeContributions').hide();
            $('#xEmployeeTaxes').show();
        }

        function OpenEmployeeGeneralInfo() {
            $('#xEmployeeGeneralInfo').show();
            $('#xEmployeeSalesmanCutomer').hide();
            $('#xEmployeeSalesmanItems').hide();
            $('#xEmployeeCommission').hide();
            $('#xEmployeeTimeCard').hide();
            $('#xEmployeeInvoice').hide();
            $('#xEmployeePayment').hide();
            $('#xEmployeeMemo').hide();
        }
        function OpenEmployeeSalesmanCutomer() {
            $('#xEmployeeGeneralInfo').hide();
            $('#xEmployeeSalesmanCutomer').show();
            $('#xEmployeeSalesmanItems').hide();
            $('#xEmployeeCommission').hide();
            $('#xEmployeeTimeCard').hide();
            $('#xEmployeeInvoice').hide();
            $('#xEmployeePayment').hide();
            $('#xEmployeeMemo').hide();
        }
        function OpenEmployeeSalesmanItems() {
            $('#xEmployeeGeneralInfo').hide();
            $('#xEmployeeSalesmanCutomer').hide();
            $('#xEmployeeSalesmanItems').show();
            $('#xEmployeeCommission').hide();
            $('#xEmployeeTimeCard').hide();
            $('#xEmployeeInvoice').hide();
            $('#xEmployeePayment').hide();
            $('#xEmployeeMemo').hide();
        }
        function OpenEmployeeCommission() {
            $('#xEmployeeGeneralInfo').hide();
            $('#xEmployeeSalesmanCutomer').hide();
            $('#xEmployeeSalesmanItems').hide();
            $('#xEmployeeCommission').show();
            $('#xEmployeeTimeCard').hide();
            $('#xEmployeeInvoice').hide();
            $('#xEmployeePayment').hide();
            $('#xEmployeeMemo').hide();
        }
        function OpenEmployeeCommissionAll() {
            $('#xEmployeeCommissionAll').show();
            $('#xEmployeeCommissionPaid').hide();
            $('#xEmployeeCommissionUnpaid').hide();
        }
        function OpenEmployeeCommissionPaid() {
            $('#xEmployeeCommissionAll').hide();
            $('#xEmployeeCommissionPaid').show();
            $('#xEmployeeCommissionUnpaid').hide();
        }
        function OpenEmployeeCommissionUnpaid() {
            $('#xEmployeeCommissionAll').hide();
            $('#xEmployeeCommissionPaid').hide();
            $('#xEmployeeCommissionUnpaid').show();
        }

        function OpenEmployeeTimeCard() {
            $('#xEmployeeGeneralInfo').hide();
            $('#xEmployeeSalesmanCutomer').hide();
            $('#xEmployeeSalesmanItems').hide();
            $('#xEmployeeCommission').hide();
            $('#xEmployeeTimeCard').show();
            $('#xEmployeeInvoice').hide();
            $('#xEmployeePayment').hide();
            $('#xEmployeeMemo').hide();
        }
        function OpenEmployeeTimeCardAll() {
            $('#xEmployeeTimeCardAll').show();
            $('#xEmployeeTimeCardAbsences').hide();
            $('#xEmployeeTimeCardOvertime').hide();
            ('#xEmployeeTimeCardUnderTime').hide();
        }
        function OpenEmployeeTimeCardAbsences() {
            $('#xEmployeeTimeCardAll').hide();
            $('#xEmployeeTimeCardAbsences').show();
            $('#xEmployeeTimeCardOvertime').hide();
            ('#xEmployeeTimeCardUnderTime').hide();
        }
        function OpenEmployeeTimeCardOvertime() {
            $('#xEmployeeTimeCardAll').hide();
            $('#xEmployeeTimeCardAbsences').hide();
            $('#xEmployeeTimeCardOvertime').show();
            ('#xEmployeeTimeCardUnderTime').hide();
        }
        function OpenEmployeeTimeCardUnderTime() {
            $('#xEmployeeTimeCardAll').hide();
            $('#xEmployeeTimeCardAbsences').hide();
            $('#xEmployeeTimeCardOvertime').hide();
            ('#xEmployeeTimeCardUnderTime').show();
        }

        function OpenEmployeeInvoice() {
            $('#xEmployeeGeneralInfo').hide();
            $('#xEmployeeSalesmanCutomer').hide();
            $('#xEmployeeSalesmanItems').hide();
            $('#xEmployeeCommission').hide();
            $('#xEmployeeTimeCard').hide();
            $('#xEmployeeInvoice').show();
            $('#xEmployeePayment').hide();
            $('#xEmployeeMemo').hide();
        }
        function OpenEmployeeInvoiceAll() {
            $('#xEmployeeInvoiceAll').show();
            $('#xEmployeeInvoicePaid').hide();
            $('#xEmployeeTimeCardOvertime').hide();
        }
        function OpenEmployeeInvoicePaid() {
            $('#xEmployeeInvoiceAll').hide();
            $('#xEmployeeInvoicePaid').show();
            $('#xEmployeeTimeCardOvertime').hide();
        }
        function OpenEmployeeTimeCardOvertime() {
            $('#xEmployeeInvoiceAll').hide();
            $('#xEmployeeInvoicePaid').hide();
            $('#xEmployeeTimeCardOvertime').show();
        }

        function OpenEmployeePayment() {
            $('#xEmployeeGeneralInfo').hide();
            $('#xEmployeeSalesmanCutomer').hide();
            $('#xEmployeeSalesmanItems').hide();
            $('#xEmployeeCommission').hide();
            $('#xEmployeeTimeCard').hide();
            $('#xEmployeeInvoice').hide();
            $('#xEmployeePayment').show();
            $('#xEmployeeMemo').hide();
        }
        function OpenEmployeePaymentCash() {
            $('#xEmployeePaymentCash').show();
            $('#xEmployeePaymentCheck').hide();
            $('#xEmployeePaymentCard').hide();
        }
        function OpenEmployeePaymentCheck() {
            $('#xEmployeePaymentCash').hide();
            $('#xEmployeePaymentCheck').show();
            $('#xEmployeePaymentCard').hide();
        }
        function OpenEmployeePaymentCard() {
            $('#xEmployeePaymentCash').hide();
            $('#xEmployeePaymentCheck').hide();
            $('#xEmployeePaymentCard').show();
        }

        function OpenEmployeeMemo() {
            $('#xEmployeeGeneralInfo').hide();
            $('#xEmployeeSalesmanCutomer').hide();
            $('#xEmployeeSalesmanItems').hide();
            $('#xEmployeeCommission').hide();
            $('#xEmployeeTimeCard').hide();
            $('#xEmployeeInvoice').hide();
            $('#xEmployeePayment').hide();
            $('#xEmployeeMemo').show();
        }
        function OpenEmployeeMemoAll() {
            $('#xEmployeeMemoAll').hide();
            $('#xEmployeeMemoDebit').hide();
            $('#xEmployeeMemoCredit').hide();
        }
        function OpenEmployeeMemoDebit() {
            $('#xEmployeeMemoAll').hide();
            $('#xEmployeeMemoDebit').hide();
            $('#xEmployeeMemoCredit').hide();
        }
        function OpenEmployeeMemoCredit() {
            $('#xEmployeeMemoAll').hide();
            $('#xEmployeeMemoDebit').hide();
            $('#xEmployeeMemoCredit').hide();
        }
    </script>
</asp:Content>
