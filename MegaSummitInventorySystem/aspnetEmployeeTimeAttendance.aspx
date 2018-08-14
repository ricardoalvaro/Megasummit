<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetEmployeeTimeAttendance.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetEmployeeTimeAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class=""><a href="http://localhost:8181/megasummit/employees/employee/">Employee</a></li>
                                <li class="active"><a href="http://localhost:8181/megasummit/employees/time-attendance/">Time Attendance</a></li>
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
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
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

    <div id="main" class="employees-time-attendance">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="container two-column-sidebar style2">
                    <div class="ym-column linearize-level-1">
                        <div id="content-holder" class="ym-col1">
                            <div class="ym-cbox padtop9">
                                <div class="box-holder">
                                    <div class="addup">
                                        <h1>Time Attendance</h1>
                                    </div>
                                    <div class="content vmiddle">
                                        <div name="employees_time_attendance_form" id="employees_time_attendance_form" method="POST" class="ym-form">
                                            <table>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="employee_name">*Employee Name</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow medium">
                                                            <select id="employee_name" name="employee_name">
                                                                <option value=""></option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="department">*Department</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="department" name="department" class="medium" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="time_in">*Time In</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="time_in" name="time_in" class="short" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="break_out">Break Out</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="break_out" name="break_out" class="short" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="break_in">Break In</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="break_in" name="break_in" class="short" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="time_out">*Time Out</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="time_out" name="time_out" class="short" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="overtime_in">Overtime In</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="overtime_in" name="overtime_in" class="short" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="overtime_out">Overtime Out</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="overtime_out" name="overtime_out" class="short" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="late_hours">Late Hours</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="late_hours" name="late_hours" class="short" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="total_hours">Total Hours</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="total_hours" name="total_hours" class="short" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3 sidebar-time-attendance">
                            <div class="ym-cbox">
                                <div class="searchbox-container">
                                    <div class="searchbox">
                                        <form id="searchbox" name="searchbox" method="POST">
                                            <div class="ym-clearfix">
                                                <div class="searchfield">
                                                    <input type="text" id="searchkeyword" name="searchkeyword" /></div>
                                                <div class="btndatepicker">
                                                    <button type="button" id="btndatepicker">&nbsp;</button></div>
                                            </div>
                                            <div class="ym-ie-clearing">&nbsp;</div>
                                        </form>
                                    </div>
                                </div>
                                <ul class="sidebar sidelists2 crossfade scroll">
                                    <li>
                                        <a href="javascript:;" id="item-1">
                                            <span class="name">Edgar Ong
                    	<span class="ym-clearfix"><span class="float-left">Sales</span>
                            <span class="float-right">12 hours</span>
                        </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" id="item-2">
                                            <span class="name">Richard Cruz
                    	<span class="ym-clearfix"><span class="float-left">Human Resource</span>
                            <span class="float-right">7 hours</span>
                        </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" id="item-3">
                                            <span class="name">Charles Go
                    	<span class="ym-clearfix"><span class="float-left">Purchasing</span>
                            <span class="float-right">5 hours</span>
                        </span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" id="item-4">
                                            <span class="name">Arlene Sim
                    	<span class="ym-clearfix"><span class="float-left">Sales</span>
                            <span class="float-right">6 hours</span>
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
    </div>

</asp:Content>
