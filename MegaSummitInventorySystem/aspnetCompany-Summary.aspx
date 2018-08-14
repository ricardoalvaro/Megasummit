<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Summary.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Summary" %>
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
        #main .ym-wbox {
            padding: 6px 0 11px 0;
        }
    </style>
    <div id="subheader" class="">
    <div class="ym-wrapper">
    	<div class="ym-wbox">
        	<!-- Start of Two Grids -->
            <div class="ym-grid linearize-level-1">
                <div class="block-left ym-gl">
                    <div class="ym-gbox">
                        <ul class="menu ym-clearfix">
                            <li class=""><a href="aspnetCompany.aspx">Company</a></li>
                            <li class="active"><a href="aspnetCompany-Summary.aspx">Summary</a></li>
                            <li class=""><a href="aspnetCompany-Reminders.aspx">Reminders</a></li>
                            <li class=""><a href="aspnetCompany-History.aspx">History</a></li>	
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>
                </div>
                <div class="block-right ym-gr">
    <div class="ym-gbox">
        <ul id="toolbar" class="">
            <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
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
</div>
    <div id="main" class="company-summary">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
            <div class="submenu">
                    <ul class="crossfade ym-clearfix" style="border:none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
        	<div class="container two-column-sidebar mod-company-company">
            	<div class="inner">
                    <div class="box-holder">
                        <table>                            	
                            <td width="50%">  
                                <h5><strong>Account Summary</strong></h5>                                 
                                <div class="rounded" style="margin-right:10%;">
                                	<table class="tblholder unclickable">  
                                      <tbody>                                        
                                            <tr>
                                                <td width="60%">Account Receivables</td>
                                                <td width="40%" align="right">6,000</td>                                                            
                                            </tr>
                                             <tr>
                                                <td width="60%">Account Payables</td>
                                                <td width="40%" align="right"></td>                                                            
                                            </tr>
                                             <tr>
                                                <td width="60%">Inventory</td>
                                                <td width="40%" align="right"></td>                                                            
                                            </tr>
                                            <tr>
                                                <td width="60%">Bank Account</td>
                                                <td width="40%" align="right"></td>                                                            
                                            </tr>
                                            <tr>
                                                <td width="60%">Cash on Hand</td>
                                                <td width="40%" align="right"></td>                                                            
                                            </tr>
                                            <tr>
                                                <td width="60%">Check on Hand</td>
                                                <td width="40%" align="right"></td>                                                            
                                            </tr>
                                            <tr>
                                                <td width="60%">Petty Cash</td>
                                                <td width="40%" align="right"></td>                                                            
                                            </tr>
                                            <tr>
                                              <td width="60%">Bad Debts</td>
                                                <td width="40%" align="right"></td>                                                            
                                            </tr>
                                      </tbody>
                                   </table>
                                </div>
                            </td>
                            <td width="50%">
                              <h5><strong>Revenue: Year to Date</strong></h5>
                              <div class="rounded" style="margin-right:10%;">
                              	<table class="tblholder unclickable">
                                    <tr>
                                        <td width="60%">Total Revenue</td>
                                        <td width="40%" align="right">0.00</td>
                                    </tr>
                                    <tr>
                                        <td width="60%">Cost of Sales</td>
                                        <td width="40%" align="right">0.00</td>
                                    </tr>
                                    <tr>
                                        <td width="60%">Gross Profit</td>
                                        <td width="40%" align="right">0.00</td>
                                    </tr>
                                    <tr>
                                        <td width="60%">Expenses</td>
                                        <td width="40%" align="right">0.00</td>
                                    </tr>
                                    <tr>
                                        <td width="60%">Bad Debts</td>
                                        <td width="40%" align="right"></td>                                                            
                                    </tr>
                                    <tr>
                                        <td width="60%">Net Income</td>
                                        <td width="40%" align="right">0.00</td>
                                    </tr>
                                    <tr>
                                        <td width="60%">Taxes</td>
                                        <td width="40%" align="right">0.00</td>
                                    </tr>
                                    <tr>
                                        <td width="60%">Net Income After Taxes</td>
                                        <td width="40%" align="right">0.00</td>
                                    </tr>
                               </table>
                              </div>
                            </td>
                        </table>
                        <br />
                        <div class="addup">
                            <table>
                                <td width="50%">
                                    <div class="addup">
                                        <h5><strong>Aged Receivables</strong></h5>
                                    </div>
                                    <div class="rounded" style="margin-right:10%;">
                                    	<table class="tblholder unclickable">
                                          <tbody>                                        
                                                <tr>
                                                    <td width="40%">0-30</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">31-60</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">61-90</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">91-120</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">121-150</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">151-180</td>
                                                    <td width="30%" align="right">6,000</td>
                                                    <td width="30%" align="right">100.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">Over 180 Days</td>
    
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                </td>
                                <td width="50%">
                                    <div class="addup">
                                        <h5><strong>Aged Payables</strong></h5>
                                    </div>
                                    <div class="rounded" style="margin-right:10%;">
                                    	<table class="tblholder unclickable">
                                            <tbody>                                        
                                                <tr>
                                                    <td width="40%">0-30</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">31-60</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">61-90</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">91-120</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">121-150</td>
                                                    <td width="30%" align="right">0.00</td>
                                                    <td width="30%" align="right">0.00</td>
                                                </tr> 
                                                <tr>
                                                    <td width="40%">151-180</td>
                                                    <td width="30%" align="right">6,000</td>
                                                    <td width="30%" align="right">100.00</td>
                                                </tr> 
                                                 <tr>
                                                    <td width="40%">Over 180 Days</td>
                                                    <td width="30%" align="right">6,000</td>
                                                    <td width="30%" align="right">100.00</td>
                                                </tr>    
                                            </tbody>
                                       </table>
                                    </div>
                                </td>
                            </table>
                        </div>	
                    </div>
                </div>     			
            </div>	
        </div>
    </div>
</div>

    <script type="text/javascript">
        $(function () {
            var pgurl = window.location.href.substr(window.location.href.lastIndexOf("/") + 1);
            $(".list a ").each(function () {
                if ($(this).attr("href") == pgurl || $(this).attr("href") == '')
                    $(this).closest("li").addClass("active");
            })
        });
    </script>

</asp:Content>
