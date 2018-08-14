<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Defaults-Customer.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Defaults_Customer" %>
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
</div><div id="main" class="company-company-defaults-customer">
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
                                    <div name="company_defaults_customer_form" class="ym-form">
                                        <table>
                                            <tr>
                                                <td class="lbl"><label for="price_level">*Price Level</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow short short">
                                                        <select name="price_level" id="ddl_price_level">
                                                            <option value="A">A</option>
                                                            <option value="B">B</option>
                                                            <option value="C">C</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="status">*Status</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow short">
                                                        <select name="status" id="ddl_status">
                                                            <option value="Open">Open</option>
                                                            <option value="Close">Close</option>
                                                            <option value="Limit">Limit</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="terms">*Terms</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow short">
                                                        <select name="terms" id="ddl_terms">
                                                            <option value="C.O.D.">C.O.D.</option>
                                                            <option value="30">30</option>
                                                            <option value="60">60</option>
                                                            <option value="90">90</option>
                                                            <option value="120">120</option>
                                                            <option value="150">150</option>
                                                            <option value="180">180</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="credit_limit">*Credit Limit</label></td>
                                                <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_credit_limit" name="credit_limit" value="30,000.00" class="short" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="sales_reference">*Sales Reference</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow short">
                                                        <select name="sales_reference" id="ddl_sales_reference">
                                                            <option value="DR">DR</option>
                                                            <option value="UP">UP</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="payment_method">*Payment Method</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow short">
                                                        <select name="payment_method" id="ddl_payment_method">
                                                            <option value="Cash">Cash</option>
                                                            <option value="Check">Check</option>
                                                            <option value="Card">Card</option>
                                                        </select>
                                                    </div>
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
            <li class="active"><a href="aspnetCompany-Defaults-Customer.aspx"><span class="item customer"></span>Customer</a></li>
            <li class=""><a href="aspnetCompany-Defaults-Supplier.aspx"><span class="item supplier"></span>Supplier</a></li>
            <li class=""><a href="aspnetCompany-Defaults-Employee.aspx"><span class="item employee"></span>Employee</a></li>
            <li class=""><a href="aspnetCompany-Defaults-Product.aspx"><span class="item product"></span>Product</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>
    <script src="Script/CompanyDefaultCustomer.js"></script>
</asp:Content>
