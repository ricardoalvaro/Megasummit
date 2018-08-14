<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Defaults.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Defaults" %>
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
</div><div id="main" class="company-company-defaults-general">
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
                                    <div name="company_defaults_general_form" class="ym-form">
                                        <table>
                                            <tr>
                                                <td class="lbl"><label for="font_letter">*Font Letter</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow medium">
                                                        <select name="font_letter" id="font_letter">
                                                            <option value="Arial">Arial</option>
                                                            <option value="Courier New">Courier New</option>
                                                            <option value="Microsoft Sans Serif">Microsoft Sans Serif</option>
                                                            <option value="Tahoma">Tahoma</option>
                                                            <option value="Times New Roman">Times New Roman</option>
                                                            <option value="Verdana">Verdana</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="currency_symbol">*Currency Symbol</label></td>
                                                <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="currency_symbol" name="currency_symbol" value="Php" class="short" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="date_separator">*Date Separator</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow short">
                                                        <select name="date_separator" id="date_separator">
                                                            <option value=".">.</option>
                                                            <option value="-">-</option>
                                                            <option value="/">/</option>
                                                            <option value="&nbsp;">&nbsp;</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>                                                
                                            <tr>
                                                <td class="lbl"><label for="date_format">*Date Format</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow medium">
                                                        <select name="date_format" id="date_format">
                                                            <option value="DDMMYYYY">DDMMYYYY</option>
                                                            <option value="MMDDYYYY">MMDDYYYY</option>
                                                            <option value="YYYYDDMM">YYYYDDMM</option>
                                                            <option value="YYYYMMDD">YYYYMMDD</option>
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
            <li class="active"><a href="aspnetCompany-Defaults.aspx"><span class="item general"></span>General</a></li>	
            <li class=""><a href="aspnetCompany-Defaults-Customer.aspx"><span class="item customer"></span>Customer</a></li>
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

</asp:Content>
