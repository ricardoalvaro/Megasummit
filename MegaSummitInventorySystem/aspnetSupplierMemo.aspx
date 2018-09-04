<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierMemo.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSupplierMemo" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />
     <div id="main" class="suppliers-purchase-order">
         
            <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
            <div class="container two-column-sidebar style2 mod-memo">
                <div class="ym-column linearize-level-1">
                    <div id="content-holder" class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                                  <div name="suppliers_memo_form" id="suppliers_memo_form" method="POST" class="ym-form">
                                    <div class="addup">
                                        <h1>Supplier Memo</h1>
                                        <div class="ym-clearfix">
                                            <div class="float-left">
                                                <table>
                                                    <tr>
                                                        <td class="lbl"><label for="supplier_name">*Supplier Name</label></td>
                                                        <td class="obj">
                                                             <input type="text" autocorrect="off" spellcheck="false" id="supplier"  value="" class="long" />     
                                                         
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
                                                                    <input type="text" autocorrect="off" spellcheck="false" value="SM" id="reference_letter" name="reference_letter" class="xxshort" />
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
                                                    <th width="12%"><input type="checkbox" id="applied" class="lblleft" /><label for="apply">Apply</label></th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                                                
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
    	                <ul class="sidebar sidelists2 crossfade scroll" id="ulSupplier">
                    
                        </ul>
                    </div>
                </div>
                </div>		
            </div>	
        </div>
    </div>
     </div>
    <script src="Script/SupplierMemo.js"></script>
    <script type="text/javascript">
        var SupplierData = <%= SupplierVM.AutoCompleteSupplier %>;
        var Account = <%= AccountsVM.Accounts %>;
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
