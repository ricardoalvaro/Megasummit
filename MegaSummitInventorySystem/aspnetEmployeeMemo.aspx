﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetEmployeeMemo.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetEmployeeMemo" %>
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
                            <li class=""><a href="http://localhost:8181/megasummit/employees/time-attendance/">Time Attendance</a></li>
                            <li class=""><a href="http://localhost:8181/megasummit/employees/commission-voucher/">Commission Voucher</a></li>
                            <li class=""><a href="http://localhost:8181/megasummit/employees/payslip/">Payslip</a></li>
                            <li class="active"><a href="http://localhost:8181/megasummit/employees/memo/">Memo</a></li>	
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
</div>            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div>
    
    <div id="main" class="employees-memo">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
            <div class="container two-column-sidebar style2 mod-memo">
                <div class="ym-column linearize-level-1">
                    <div id="content-holder" class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                                  <div name="employees_memo_form" id="employees_memo_form" method="POST" class="ym-form">
                                    <div class="addup">
                                        <h1>Employee Memo</h1>
                                        <div class="ym-clearfix">
                                            <div class="float-left">
                                                <table>
                                                    <tr>
                                                        <td class="lbl"><label for="employee_name">*Employee Name</label></td>
                                                        <td class="obj">
                                                        	<div class="select-arrow long">
                                                                <select id="employee_name" name="employee_name">
                                                                    <option value=""></option>	     
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="float-right">
                                                <table>
                                                    <tr>
                                                        <td class="lbl"><label for="reference_number">*Reference No.</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" disabled />
                                                                </div>
                                                                <div class="col-left">
                                                                    &nbsp;&nbsp;
                                                                </div>
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_number" name="reference_number" class="xxxmedium" />
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="date">*Date</label></td>
                                                        <td class="obj">
                                                            <div class="dp xmedium">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="addup">
                                        <div class="space5"></div>
                                        <div class="box">
                                        	<div class="space10"></div>
                                            <table>
                                                <tr>
                                                    <td class="lbl"><label for="account_name">Account Name</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select id="account_name" name="account_name">
                                                                <option value=""></option>	     
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td class="lbl"><label for="debit">Debit</label></td>
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
                                            <div class="space10"></div>                      
                                        </div>
                                        <div class="space10"></div>
                                    </div>
                                    <div class="rounded">
                                    	<table class="tblholder unclickable">
                                            <thead>
                                                <tr>
                                                    <th width="15%">Reference No.</th>
                                                    <th width="10%">Date</th>
                                                    <th width="50%">Description</th>
                                                    <th width="10%">Balance</th>
                                                    <th width="12%"><input type="checkbox" id="applied" class="lblleft" /><label for="apply">Apply</label></th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td width="15%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="50%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="12%">here</td>
                                                </tr>
                                                <tr>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                    <td width="50%"></td>
                                                    <td width="10%"></td>
                                                    <td width="12%"></td>
                                                </tr>                                                
                                            </tbody>
                                       </table>
                                    </div>
                                    <div class="addup summary">
                                    	<div class="space10">&nbsp;</div>
                                        <div class="ym-clearfix">
                                        	<div class="total box">
                                                <div class="ym-clearfix">
                                                    <table>
                                                        <tr>
                                                            <td width="50%">Invoice Amt.</td>
                                                            <td  width="50%">2,000.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Applied Amt.</td>
                                                            <td>0.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Balance</td>
                                                            <td>0.00</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="space20">&nbsp;</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ym-col3">
    <div class="ym-cbox"> 
    	<ul class="sidebar sidelists2 crossfade scroll">
            <li>                
               <a href="javascript:;" id="item-1">
                	<span class="name">Tacloban Far East Marketing
                    	<span class="ym-clearfix"><span class="float-left">Discount</span>
                            <span class="float-right">200.00</span>
                        </span>
                    </span>
               </a>               
            </li> 
            <li>                
               <a href="javascript:;" id="item-2">
                <span class="name">Omega Lumber
                    <span class="ym-clearfix"><span class="float-left">Discount</span>
                        <span class="float-right">200.00</span>
                    </span>
                </span>
               </a>               
            </li> 
            <li>                
               <a href="javascript:;" id="item-3">
                	<span class="name">Pioneer Construction Supply
                    	<span class="ym-clearfix"><span class="float-left">Discount</span>
                            <span class="float-right">1,200.00</span>
                        </span>
                    </span>
               </a>               
            </li> 
        </ul>
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>

</asp:Content>
