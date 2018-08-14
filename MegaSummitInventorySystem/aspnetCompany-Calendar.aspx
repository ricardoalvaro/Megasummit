<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Calendar.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Calendar" %>
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
</div><div id="main" class="company-company-calendar">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox">
        	<div class="submenu">
    <ul class="crossfade ym-clearfix">
        <li class=""><a href="aspnetCompany.aspx">Company</a></li>
        <li class=""><a href="aspnetCompany-User.aspx">Users</a></li>
        <li class=""><a href="aspnetCompany-List.aspx">Lists</a></li>
        <li class=""><a href="aspnetCompany-Settings.aspx">Settings</a></li>
        <li class=""><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
        <li class="active"><a href="aspnetCompany-Calendar.aspx">Calendar</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>  
</div> 
        	<div class="container two-column-sidebar mod-company-calendar">
            	<div class="ym-column linearize-level-1">
                    <div class="ym-col1">
                        <div class="ym-cbox"> 
                        	<br /><br /><br />
                        	<div class="rounded">
                            	<div class="content tabular">                            	
                                    <table class="tblholder custom" id="cheight-200">
                                        <thead>
                                            <tr>
                                                <th width="25%">Date</th>
                                                <th width="25%">Day</th>
                                                <th width="50%">Holiday</th>
                                            </tr>
                                        </thead>
                                        <tbody class="scroll">
                                            <tr>
                                                <td width="25%">07.04.2014</td>
                                                <td width="25%">Friday</td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%">07.04.2014</td>
                                                <td width="25%">Wednesday</td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                            <tr>
                                                <td width="25%"></td>
                                                <td width="25%"></td>
                                                <td width="50%"></td>
                                            </tr>
                                        </tbody>
                                   </table>	
                                </div>
                            </div>	
                            <div class="addup">
                                <table class="summary">
                                    <tr><td colspan="3">&nbsp;</td></tr>
                                    <tr>
                                        <td width="60%">&nbsp;</td>
                                        <td>Total Working Days</td>
                                        <td>361</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>Total Non-Working Days</td>
                                        <td>4</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="ym-col3">
                        <div class="ym-cbox"> 
                        	<div id="calendar_date"></div>
                        </div>
                    </div>
                </div>		
            </div>	
        </div>
    </div>
</div>

   
</asp:Content>
