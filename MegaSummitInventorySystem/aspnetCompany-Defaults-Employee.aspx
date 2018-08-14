<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Defaults-Employee.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Defaults_Employee" %>
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
            <li><a id="btn-save" class="save " href="javascript:;">Save</a></li>
            <li><a id="btn-new" class="new disabled " href="">New</a></li>
            <li><a id="btn-find" class="find disabled" href="javascript:;">Find</a></li>
            <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
            <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
        </ul>	
    </div>
</div>            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div><div id="main" class="company-company-defaults-employee">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="submenu">
    <ul class="crossfade ym-clearfix">
        <li class=""><a href="aspnetCompany.aspx">Company</a></li>
        <li class=""><a href="aspnetCompany-User.aspx">Users</a></li>
        <li class=""><a href="aspnetCompany-List.aspx">Lists</a></li>
        <li class=""><a href="aspnetCompany-Settings.aspx">Settings</a></li>
        <li class="active"><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
        <li class=""><a href="aspnetCompany-Calendar.aspx">Calendar</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>  
</div>        	<div class="container two-column-sidebar mod-company-defaults">
            	<div class="ym-column linearize-level-1">
                    <div class="ym-col1">
                        <div class="ym-cbox"> 
                        	<div class="box-holder">             	
                                <div class="content vmiddle">
                                    <div name="company_defaults_product_form" class="ym-form">
                                        <table>
                                        	<tr>
                                            	<td>
                                                	<table>
                                                    	<tr>
                                                            <td class="lbl"><label for="employee_type">*Employee Type</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select name="employee_type" id="ddl_employee_type">
                                                                        <option value="Employee">Employee</option>
                                                                        <option value="Salesman">Salesman</option>
                                                                        <option value="Both">Both</option>                                                                   
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="employee_class">*Employee Class</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select name="employee_class" id="ddl_employee_class">
                                                                        <option value="Contractual">Contractual</option>
                                                                        <option value="Freelance">Freelance</option>
                                                                        <option value="Regular">Regular</option>                                                                 
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="department">*Department</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select name="department" id="ddl_department">
                                                                        <option value="Customer Service">Customer Service</option>
                                                                        <option value="Financial">Financial</option>
                                                                        <option value="Human Resource">Human Resource</option>
                                                                        <option value="Information Technology">Information Technology</option>
                                                                        <option value="Invetory">Invetory</option>  
                                                                        <option value="Marketing">Marketing</option> 
                                                                        <option value="Purchasing">Purchasing</option> 
                                                                        <option value="Sales">Sales</option>                                                                      
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="status">*Status</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select name="status" id="ddl_status">
                                                                        <option value="Open">Open</option>
                                                                        <option value="Close">Close</option>                                                                     
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="day_off">*Day Off</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select name="day_off" id="ddl_day_off">
                                                                        <option value="Sunday">Sunday</option>
                                                                        <option value="Monday">Monday</option>
                                                                        <option value="Tuesday">Tuesday</option>
                                                                        <option value="Wednesday">Wednesday</option>
                                                                        <option value="Thursday">Thursday</option>
                                                                        <option value="Friday">Friday</option>
                                                                        <option value="Saturday">Saturday</option>                                                                      
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="payment_method">*Payment Method</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow medium">
                                                                    <select name="payment_method" id="ddl_payment_method">
                                                                        <option value="Cash">Cash</option>
                                                                        <option value="Check">Check</option>
                                                                        <option value="Card">Card</option>                                                                  
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                	<table>
                                                    	<tr>
                                                            <td class="lbl"><label for="start">*Start</label></td>
                                                            <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_start" name="start" value="00:00:00" class="short" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="start">*Break Out</label></td>
                                                            <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_break_out" name="break_out" value="00:00:00" class="short" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="start">*Break In</label></td>
                                                            <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_break_in" name="break_in" value="00:00:00" class="short" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="start">*End</label></td>
                                                            <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_end" name="end" value="00:00:00" class="short" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="start">*Grace Period</label></td>
                                                            <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_grace_period" name="grace_period" value="00:00:00" class="short" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl"><label for="time_duration">*Time Duration</label></td>
                                                            <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_time_duration" name="time_duration" value="00:00:00" class="short" /></td>
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
                    <div class="ym-col3">
    <div class="ym-cbox"> 
        <ul class="sidebar crossfade">
            <li class=""><a href="aspnetCompany-Defaults.aspx"><span class="item general"></span>General</a></li>	
            <li class=""><a href="aspnetCompany-Defaults-Customer.aspx"><span class="item customer"></span>Customer</a></li>
            <li class=""><a href="aspnetCompany-Defaults-Supplier.aspx"><span class="item supplier"></span>Supplier</a></li>
            <li class="active"><a href="aspnetCompany-Defaults-Employee.aspx"><span class="item employee"></span>Employee</a></li>
            <li class=""><a href="aspnetCompany-Defaults-Product.aspx"><span class="item product"></span>Product</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>


    <script src="Script/CompanyDefaultEmployee.js"></script>


</asp:Content>
