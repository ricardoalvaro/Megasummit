<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-User.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_User" %>
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
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" onclick="SaveEvent(this)">Save</a></li>
                                <li><a id="btn-new" class="new  " onclick="NewEvent()">New</a></li>
                                <li><a id="btn-find" class="find " onclick="FindEvent(this)">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled" onclick="DeleteEvent(this)">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" onclick="PrintEvent(this)">Print</a></li>

                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>
    <div id="main" class="company-company-users">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="submenu">
                    <ul class="crossfade ym-clearfix">
                        <li class=""><a href="aspnetCompany.aspx">Company</a></li>
                        <li class="active"><a href="aspnetCompany-User.aspx">Users</a></li>
                        <li class=""><a href="aspnetCompany-List.aspx">Lists</a></li>
                        <li class=""><a href="aspnetCompany-Settings.aspx">Settings</a></li>
                        <li class=""><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
                        <li class=""><a href="aspnetCompany-Calendar.aspx">Calendar</a></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <div class="container two-column-sidebar mod-company-users">
                    <div class="ym-column linearize-level-1">
                        <div id="content-holder" class="ym-col1">
                            <div class="ym-cbox">
                                <div class="box-holder">
                                    <div class="content vmiddle">
                                        
                                        <%--user form--%>
                                        
                                        <div id="user_form" class="ym-form" style="display: block">
                                            <table>
                                                <tr>
                                                    <input id="hdn_user_id" type="hidden" value="0" />
                                                    <td class="lbl">
                                                        <label for="name">*Name</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="txt_name" name="name" class="medium" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="username">*Username</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="txt_username" name="username" class="medium" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="password">*Password</label></td>
                                                    <td class="obj">
                                                        <input type="password" id="txt_password" name="password" class="medium" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="user_type">*User Type</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow medium">
                                                            <select id="ddl_user_type">
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="position">*Position</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow medium">
                                                            <select id="ddl_position">
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="status">*Status</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow medium">
                                                            <select id="ddl_status">
                                                                <option value="Open">Open</option>
                                                                <option value="Closed">Closed</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"></td>
                                                    <td class="obj">
                                                        <div class="space20"></div>
                                                        <button type="button" class="submit small" id="btn-access-privileges" onclick="LoadAccessPrivilage()">Access Privileges</button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <%--access privilage--%>

                                        <div id="access_privilage" style="display: none">
                                            <ul class="tabs crossfade" style="width: 679px;">
                                                <li class="view active" style="width: 75px;"><a onclick="ShowTableSelected('company')" class="new-find" style="cursor:pointer">Company</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('customer')" class="new-find"  style="cursor:pointer">Customers</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('supplier')" class="new-find"  style="cursor:pointer">Suppliers</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('employee')" class="new-find"  style="cursor:pointer">Employees</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('product')" class="new-find"   style="cursor:pointer">Products</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('banking')" class="new-find"   style="cursor:pointer">Banking</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('accounts')" class="new-find"  style="cursor:pointer">Accounts</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('accessories')" class="new-find"  style="cursor:pointer">Accessories</a></li>
                                                <li class="view" style="width: 75px;"><a onclick="ShowTableSelected('report')" class="new-find"  style="cursor:pointer">Reports</a></li>
                                            </ul>
                                            <div id="tab-content-holder">
                                                <div id="tbl_company" class="content tabular" style="display:none">

                                                    <table class="tblholder">
                                                        <thead>
                                                            <tr>
                                                                <th>
                                                                <input type="radio" id="company_module" name="company_module" checked=""><label for="company_module">Company Module</label></th>
                                                                <th width="12%" class="align-center">New</th>
                                                                <th width="12%" class="align-center">Edit</th>
                                                                <th width="12%" class="align-center">Delete</th>
                                                                <th width="12%" class="align-center">Print</th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 217px;">
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="company_module_company" id="company_module_company"><label for="company_module_company">Company</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="company_module_summary" id="company_module_summary"><label for="company_module_summary">Summary</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="company_module_reminders" id="company_module_reminders"><label for="company_module_reminders">Reminders</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="company_module_history" id="company_module_history"><label for="company_module_history">History</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 155.924px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>

                                                </div>
                                                
                                                <table id='tbl_customer' class="tblholder content tabular" style="display: none">
                                                        <thead>
                                                            <tr>
                                                                <th>
                                                                    <input type="radio" id="customer_module" name="customer_module" checked=""><label for="customer_module">Customer Module</label></th>
                                                                <th width="12%" class="align-center">New</th>
                                                                <th width="12%" class="align-center">Edit</th>
                                                                <th width="12%" class="align-center">Delete</th>
                                                                <th width="12%" class="align-center">Print</th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="customer_module_customer" id="customer_module_customer"><label for="customer_module_customer">Customer</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="customer_module_sales" id="customer_module_sales"><label for="customer_module_sales">Sales</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="customer_module_sales_return" id="customer_module_sales_return"><label for="customer_module_sales_return">Sales Return</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="customer_module_sales_order" id="customer_module_sales_order"><label for="customer_module_sales_order">Sales Order</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="customer_module_official_receipt" id="customer_module_official_receipt"><label for="customer_module_official_receipt">Official Receipt</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="radio" name="customer_module_memo" id="customer_module_memo"><label for="customer_module_memo">Memo</label></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                </tr>
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 54.7219px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>
                                                <table id='tbl_supplier' class="tblholder content tabular" style="display:none">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="radio" id="supplier_module" name="supplier_module" checked=""><label for="supplier_module">Supplier Module</label></th>
                                                            <th width="12%" class="align-center">New</th>
                                                            <th width="12%" class="align-center">Edit</th>
                                                            <th width="12%" class="align-center">Delete</th>
                                                            <th width="12%" class="align-center">Print</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="supplier_module_supplier" id="supplier_module_supplier"><label for="supplier_module_supplier">Supplier</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="supplier_module_purchase" id="supplier_module_purchase"><label for="supplier_module_purchase">Purchase</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="supplier_module_purchase_return" id="supplier_module_purchase_return"><label for="supplier_module_purchase_return">Purchase Return</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="supplier_module_purchase_order" id="supplier_module_purchase_order"><label for="supplier_module_purchase_order">Purchase Order</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="supplier_module_voucher" id="supplier_module_voucher"><label for="supplier_module_voucher">Voucher</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="supplier_module_memo" id="supplier_module_memo"><label for="supplier_module_memo">Memo</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 54.7219px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>
                                                </table>
                                                <table id='tbl_employee' class="tblholder content tabular" style="display:none">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="radio" id="employee_module" name="employee_module" checked=""><label for="employee_module">Employee Module</label></th>
                                                            <th width="12%" class="align-center">New</th>
                                                            <th width="12%" class="align-center">Edit</th>
                                                            <th width="12%" class="align-center">Delete</th>
                                                            <th width="12%" class="align-center">Print</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="employee_module_employee" id="employee_module_employee"><label for="employee_module_employee">Employee</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="employee_module_time_attendance" id="employee_module_time_attendance"><label for="employee_module_time_attendance">Time Attendance</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="employee_module_commission_voucher" id="employee_module_commission_voucher"><label for="employee_module_commission_voucher">Commission Voucher</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="employee_module_payslip" id="employee_module_payslip"><label for="employee_module_payslip">Payslip</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="employee_module_memo" id="employee_module_memo"><label for="employee_module_memo">Memo</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 57.8px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>
                                                </table>
                                                <table id="tbl_product" class="tblholder content tabular" style="display:none">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="radio" id="product_module" name="product_module" checked=""><label for="product_module">Product Module</label></th>
                                                            <th width="12%" class="align-center">New</th>
                                                            <th width="12%" class="align-center">Edit</th>
                                                            <th width="12%" class="align-center">Delete</th>
                                                            <th width="12%" class="align-center">Print</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="product_module_product" id="product_module_product"><label for="product_module_product">Product</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="product_module_assembly" id="product_module_assembly"><label for="product_module_assembly">Assembly</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="product_module_preorder" id="product_module_preorder"><label for="product_module_preorder">Preorder</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="product_module_inventory_adjustment" id="product_module_inventory_adjustment"><label for="product_module_inventory_adjustment">Inventory Adjustment</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 61.245px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>
                                                </table>
                                                <table id='tbl_banking' class="tblholder content tabular" style="display:none">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="radio" id="banking_module" name="banking_module" checked=""><label for="banking_module">Banking Module</label></th>
                                                            <th width="12%" class="align-center">New</th>
                                                            <th width="12%" class="align-center">Edit</th>
                                                            <th width="12%" class="align-center">Delete</th>
                                                            <th width="12%" class="align-center">Print</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="banking_module_bank_account" id="banking_module_bank_account"><label for="banking_module_bank_account">Bank Account</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="banking_module_deposits" id="banking_module_deposits"><label for="banking_module_deposits">Deposits</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="banking_module_withrawal" id="banking_module_withrawal">
                                                                    <label for="banking_module_withrawal">Withdrawal</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="banking_module_return" id="banking_module_return"><label for="banking_module_return">Return</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="banking_module_discounting" id="banking_module_discounting"><label for="banking_module_discounting">Discounting</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="banking_module_reconcile" id="banking_module_reconcile"><label for="banking_module_reconcile">Reconcile</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="banking_module_memo" id="banking_module_memo"><label for="banking_module_memo">Memo</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 51.9551px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>
                                                </table>
                                                <table id='tbl_accounts' class="tblholder content tabular" style="display:none">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="radio" id="accounts_module" name="accounts_module" checked=""><label for="accounts_module">Accounts Module</label></th>
                                                            <th width="12%" class="align-center">New</th>
                                                            <th width="12%" class="align-center">Edit</th>
                                                            <th width="12%" class="align-center">Delete</th>
                                                            <th width="12%" class="align-center">Print</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="accounts_module_chart_accounts" id="accounts_module_chart_accounts"><label for="accounts_module_chart_accounts">Chart of Accounts</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="accounts_module_journal_voucher" id="accounts_module_journal_voucher"><label for="accounts_module_journal_voucher">Journal Voucher</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 69.2734px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>
                                                </table>
                                                <table id='tbl_accessories' class="tblholder content tabular" style="display:none">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="radio" id="accessories_module" name="accessories_module" checked=""><label for="accessories_module">Accessories Module</label></th>
                                                            <th width="12%" class="align-center">New</th>
                                                            <th width="12%" class="align-center">Edit</th>
                                                            <th width="12%" class="align-center">Delete</th>
                                                            <th width="12%" class="align-center">Print</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="accessories_module_directory" id="accessories_module_directory"><label for="accessories_module_directory">Directory</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="accessories_module_packing_list" id="accessories_module_packing_list"><label for="accessories_module_packing_list">Packing List</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="accessories_module_pickup_slip" id="accessories_module_pickup_slip"><label for="accessories_module_pickup_slip">Pickup Slip</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="accessories_module_counter_receipt" id="accessories_module_counter_receipt"><label for="accessories_module_counter_receipt">Counter Receipt</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="accessories_module_label" id="accessories_module_label"><label for="accessories_module_label">Label</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 57.8px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>
                                                </table>
                                                <table id='tbl_report' class="tblholder content tabular" style="display:none">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <input type="radio" id="reports_module" name="reports_module" checked=""><label for="reports_module">Reports Module</label></th>
                                                            <th width="12%" class="align-center">New</th>
                                                            <th width="12%" class="align-center">Edit</th>
                                                            <th width="12%" class="align-center">Delete</th>
                                                            <th width="12%" class="align-center">Print</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 136px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="reports_module_company" id="reports_module_company"><label for="reports_module_company">Company</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="reports_module_customers" id="reports_module_customers">
                                                                    <label for="reports_module_customers">Customers</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="reports_module_suppliers" id="reports_module_suppliers">
                                                                    <label for="reports_module_suppliers">Suppliers</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="reports_module_employees" id="reports_module_employees"><label for="reports_module_employees">Employees</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="reports_module_products" id="reports_module_products"><label for="reports_module_products">Products</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="reports_module_banking" id="reports_module_banking"><label for="reports_module_banking">Banking</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="radio" name="reports_module_accounts" id="reports_module_accounts"><label for="reports_module_accounts">Accounts</label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                        </tbody>
                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 51.9551px;"></div>
                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                    </div>
                                                </table>
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar userlists crossfade scroll" id="ulUserAccount">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Script/UserAccount.js"></script>
    <script type="text/javascript">


        LoadUserType();
        LoadPosition();
        LoadAllUsers();
    </script>

</asp:Content>
