<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetVoucher.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetVoucher" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />
     <div id="main" class="suppliers-purchase-order">
         <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
            <div class="container two-column-sidebar style2">
                <div class="ym-column linearize-level-1">
                    <div id="content-holder" class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                                <div name="suppliers_voucher_form" id="suppliers_voucher_form" method="POST" class="ym-form">
                                    <div class="addup">
                                        <h1>Voucher</h1>
                                        <div class="ym-clearfix">
                                            <div class="float-left">
                                                <table>
                                                    <tr>
                                                        <td class="lbl"><label for="supplier_name">*Supplier Name</label></td>
                                                        <td class="obj">
                                                             <input type="text" autocorrect="off" spellcheck="false" id="supplier"  value="" class="long" />     
                                                        <%--	<div class="select-arrow long">
                                                            <select name="supplier_name" id="supplier_name">
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
                                                        <td class="lbl"><label for="reference_number">*Reference No.</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" value="VO" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" />
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
                                </div>
                                <div class="space5"></div>                              
                                <div class="addup payment-options">
                                	<div class="holder rounded">
                                    	<ul class="potabs">
                                            <li class="active form" onclick="PaymentType(this, 'cash')"><a href="javascript:void(0)"><span class="icon cash">&nbsp;</span>Cash</a>
                                                <div class="amount"><span id="spnCash">0.00</span></div></li>
                                            <li class="view" onclick="PaymentType(this, 'check')"><a href="javascript:void(0)"><span class="icon check">&nbsp;</span>Check</a>
                                                <div class="amount"><span id="spnCheck">0.00</span></div></li>
                                        </ul>
                                        <div class="space5"></div>
                                        <div id="potab-content-holder" class="subholder rounded">
                                            <div class="content vmiddle">
                                                <div name="suppliers_voucher_cash_form" id="suppliers_voucher_cash_form" method="POST" class="ym-form">
                                                    <table id="cash">
                                                        <tr>
                                                            <td class="lbl"><label for="bank_account">*Bank Account</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow long">
                                                                    <select name="bank_account" id="bank_account">
                                                                        <option value=""></option>                                                                                                                                     
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr> 
                                                        <tr>
                                                            <td class="lbl"><label for="amount">*Amount</label></td>
                                                            <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="input_cash_amount" name="amount" class="short" /></td>
                                                        </tr>   
                                                    </table>
                                                   <table class="tblholder plain" style="display: none" id="check">
                                                    <thead>
                                                        <tr>
                                                            <th width="30%">Bank Name</th>
                                                            <th width="20%">Check No.</th>
                                                            <th width="15%">Date</th>
                                                            <th width="15%">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                       
                                                    </tbody>
                                                </table>
                                                </div>             
                                            </div>       
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <div class="subtab-container">
                                    <div class="box-holder">
                                        <ul class="subtabs crossfade">
                                            <li class="active view"><a href="javascript:void(0)">Apply to Invoices</a>
                                            <li class="form"><a href="javascript:void(0)">Apply to Memo</a>
                                        </ul>
                                        <div id="subtab-content-holder">
                                            <div class="content tabular">
                                                <table class="tblholder unclickable" id="tbl_apply_invoices">
                                                    <thead>
                                                        <tr>
                                                            <th width="15%">Reference No.</th>
                                                            <th width="10%">Date</th>
                                                            <th width="30%">Description</th>
                                                            <th width="10%">Balance</th>
                                                            <th width="15%"><input type="checkbox" id="applied" class="lblleft"  onchange="ApplyToAllCheck(this)"/><label for="apply">Apply</label></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                                                                        
                                                    </tbody>
                                               </table>
                                            </div>
                                        </div>                          
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  <div class="ym-col3">
                    <div class="ym-cbox"> 
    	                <ul class="sidebar sidelists2 crossfade scroll" id="ulSupplier">
                       <%--     <li>                
                               <a href="javascript:;" id="item-1">
                	                <span class="name">Pentagon Corporation
                    	                <span class="ym-clearfix"><span class="float-left">June 03, 2014</span>
                                            <span class="float-right">7,000.00</span>
                                        </span>
                                    </span>
                               </a>               
                            </li> --%>
                     <%--       <li>                
                               <a href="javascript:;" id="item-2">
               		                <span class="name">Pamo Fishing
                    	                <span class="ym-clearfix"><span class="float-left">February 11, 2014</span>
                                            <span class="float-right">3,600.00</span>
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
    <script src="Script/Voucher.js"></script>
    <script type="text/javascript">
        var SupplierData = <%= SupplierVM.AutoCompleteSupplier %>;
        var BankAutoCompleteData = <%=CompanyVM.CompanyBankAutoComplete %>;
    </script>

     <style>
        input[type="radio"], input[type="checkbox"] {
            display: inline !important;
    opacity: 0 !important;
    float: right !important;
        }
        .bank {
            /*border: none;*/
            width: 96%;
        }

        .check_no {
            /*border: none;*/
            width: 96%;
        }

        ._date {
            /*border: none;*/
            width: 96%;
        }

        .check_type {
            /*border: none;*/
            width: 96%;
        }

        .amount {
            /*border: none;*/
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
