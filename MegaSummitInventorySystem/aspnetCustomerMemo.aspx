<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerMemo.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerMemo1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
<div id="main" >
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        		 <div class="container two-column-sidebar style2 mod-memo">
                <div class="ym-column linearize-level-1">
                    <div id="content-holder" class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                                  <div name="customer_memo_form" id="customer_memo_form" method="POST" class="ym-form">
                                    <div class="addup">
                                        <h1>Customer Memo</h1>
                                        <div class="ym-clearfix">
                                            <div class="float-left">
                                                <table>
                                                	<tr>
                                                        <td class="lbl"><label for="customer_name">*Customer Name</label></td>
                                                        <td class="obj">
                                                             <input type="text" autocorrect="off" spellcheck="false" id="customer"  value="" class="long" />       
                                                           <%-- <div class="select-arrow long">
                                                                <select id="customer_name" name="customer_name">
                                                                    <option value=""></option>	     
                                                                </select>
                                                            </div>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="float-right">
                                                <table>
                                                    <tr>
                                                        <td class="lbl"><label for="reference_number">Reference No.</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort"  value="CM"/>
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
                                                            <select id="account_name" name="account_name" onchange="CheckType(this)">
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
                                    	<table class="tblholder unclickable" id="tbl_apply_invoices">
                                            <thead>
                                                <tr>
                                                    <th width="15%">Reference No.</th>
                                                    <th width="10%">Date</th>
                                                    <th width="50%">Description</th>
                                                    <th width="10%">Balance</th>
                                                    <th width="12%">
                                                        <input type="checkbox" id="applied" class="lblleft" style="display:block !important ;opacity:1 !important; z-index:999 !important" onchange="ApplyToAllCheck(this)">
                                                        <label for="apply">Apply</label></th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                               <%-- <tr>
                                                    <td width="15%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="50%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="12%">here</td>
                                                </tr>--%>
                                                                                        
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
                                                            <td  width="50%"><span id="spnInvoiceAmt">0.00</span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Applied Amt.</td>
                                                            <td><span id="spnApplyAmt">0.00</span> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Balance</td>
                                                            <td><span id="spnBalance">0.00</span> </td>
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
    	                    <ul class="sidebar sidelists2 crossfade scroll" id="ulMemoList">
                               <%-- <li>                
                                   <a href="javascript:;" id="item-1">
                	                    <span class="name">Tacloban Far East Marketing
                    	                    <span class="ym-clearfix"><span class="float-left">Discount</span>
                                                <span class="float-right">200.00</span>
                                            </span>
                                        </span>
                                   </a>               
                                </li> --%>
                                
                            </ul>
                        </div>
                    </div>
                </div>		
            </div>	
        </div>
    </div>
</div>
    <script src="Script/CustomerMemo.js"></script>

     <script type="text/javascript">

         var CustomerData = <%= CustomerVM.CustomerAutoComplete %>;
         var Account = <%= AccountsVM.Accounts %>;
         var CustomerMemoList = <%= CustomerMemoVM.CustomerMemoList %>;
         
    </script>

     <style>
        input[type="radio"], input[type="checkbox"] {
            display: inline !important;
    opacity: 0 !important;
    float: right !important;
        }
        .bank {
            border: none;
            background: none;
            width: 96%;
        }

        .check_no {
            border: none;
            background: none;
            width: 96%;
        }

        ._date {
            border: none;
            background: none;
            width: 96%;
        }

        .check_type {
            border: none;
            background: none;
            width: 96%;
        }

        .amount {
            border: none;
            background: none;
            width: 96%;
        }
        input.apply {
    width: 68%;
    float: left;
}
        .apply {
            border:none;
            background:none;
        }
        input.chk {
    opacity: 1 !important;
    margin: 3.5px 7px;
}
    </style>
</asp:Content>
