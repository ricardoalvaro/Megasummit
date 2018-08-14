<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Defaults-Product.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Defaults_Product" %>
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
</div><div id="main" class="company-company-defaults-product">
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
                                    <div name="default_product_form" class="ym-form">
                                        <table>
                                            <tr>
                                                <td class="lbl"><label for="product_department">*Product Department</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow long">
                                                        <select name="product_department" id="product_department">
                                                            <option value="Chemical">Chemical</option>
                                                            <option value="Construction Material">Construction Material</option>
                                                            <option value="Electrical">Electrical</option>
                                                            <option value="Hardware">Hardware</option>
                                                            <option value="Plumbing">Plumbing</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="location">*Location</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow long">
                                                        <select name="location" id="location">
                                                            <option value="Lantana">Lantana</option>                
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="reason_of_adjustment">*Reason of Adjustment</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow xxlong">
                                                        <select name="reason_of_adjustment" id="reason_of_adjustment">
                                                            <option value="Damaged">Damaged</option>
                                                            <option value="Interchange">Interchange</option>
                                                            <option value="Lost">Lost</option>                
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
            <li class=""><a href="aspnetCompany-Defaults-Customer.aspx"><span class="item customer"></span>Customer</a></li>
            <li class=""><a href="aspnetCompany-Defaults-Supplier.aspx"><span class="item supplier"></span>Supplier</a></li>
            <li class=""><a href="aspnetCompany-Defaults-Employee.aspx"><span class="item employee"></span>Employee</a></li>
            <li class="active"><a href="aspnetCompany-Defaults-Product.aspx"><span class="item product"></span>Product</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>

    <script src="Script/CompanyDefaultProduct.js"></script>

</asp:Content>
