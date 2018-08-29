<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetPurchaseReturnInformation.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetPurchaseReturnInformation" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />
    <div id="main" class="suppliers-purchase-order">
        <div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
        <div class="container one-column withpad withbg mod-sales-invoice return">
            <div class="inner">                    	
                <div class="box-holder">                        
                	<div name="suppliers_purchase_return_form" id="suppliers_purchase_return_form" method="POST" class="ym-form">
                        <div class="addup">
                            <h1>Purchase Return</h1>
                            <div class="ym-grid grid3">
                                <div class="left ym-gl">
                                    <div class="ym-gbox">
                                        <div class="ym-clearfix">
                                            <div class="float-left">
                                                <table>
                                                    <tr>
                                                        <td class="lbl" width="19%"><label for="supplier">*Supplier</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="supplier"  value="" class="long" />   
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl" valign="top"><label for="address">*Address</label></td>
                                                        <td class="obj"><textarea id="address" name="address" autocorrect="off" spellcheck="false" class="long"></textarea></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>	    
                                </div>
                                <div class="middle ym-gl">
                                    <div class="ym-gbox">
                                        <table>
                                            <tr>
                                                <td class="lbl" width="19%"><label for="deliver_to">Deliver To</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow long">
                                                        <select name="deliver_to" id="deliver_to">
                                                            <option value=""></option>                                                               
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="salesman">Salesman</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow long">
                                                                <select name="Salesman" id="supplier">
                                                                    <option value=""></option>                                                                                                                                     
                                                                </select>
                                                            </div>
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="po_number">P.O No.</label></td>
                                                <td class="obj">
                                                    <div class="grid ym-clearfix">
                                                        <div class="col-left">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="po_number" name="po_number" value="" class="short" />
                                                        </div>
                                                        <div class="col-right">
                                                            <label for="terms">*Terms</label>
                                                            <div class="select-arrow short">
                                                                <select name="terms" id="terms">
                                                                    <option value="COD">COD</option>
                                                                    <option value="30">30</option>
                                                                    <option value="60">60</option>
                                                                    <option value="90">90</option>
                                                                    <option value="120">120</option>
                                                                    <option value="150">150</option> 
                                                                    <option value="180">180</option>                                                                  
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ym-ie-clearing">&nbsp;</div>      
                                                </td>
                                            </tr>
                                        </table>	
                                    </div>    
                                </div>
                                <div class="right ym-gr">
                                    <div class="ym-gbox ym-clearfix">
                                        <div class="float-right">
                                            <table>
                                                <tr>
                                                    <td class="lbl"><label for="reference_number">*Reference No.</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" />
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
                                                    <td class="lbl"><label for="reference_number">*Date</label></td>
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
                        </div>                                
                        <%--<div id="content-holder" class="pane-holder">
                        	<div class="rounded">
                                <table class="tblholder unclickable">
                                    <thead>
                                        <tr>
                                            <th width="20%">Product Name</th>
                                            <th width="20%">Location</th>
                                            <th width="10%">Quantity</th>
                                            <th width="10%">Unit</th>
                                            <th width="10%">Unit Price</th>
                                            <th width="10%">Discount</th>
                                            <th width="10%">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody class="scroll custom" id="cheight-242">
                                        <tr>
                                            <td width="20%">here</td>
                                            <td width="20%">here</td>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="20%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                    </tbody>
                               </table>
                            </div>
                        </div>--%>

                        <div class="rounded scroll-half">
    <table class="tblholder unclickable">
        <thead>
            <tr>
                <th width="20%">Product Name</th>
                <th width="20%">Location</th>
                <th width="10%">Quantity</th>
                <th width="10%">Unit</th>
                <th width="10%">Unit Price</th>
                <th width="10%">Discount</th>
                <th width="10%">Amount</th>
            </tr>
        </thead>
        <tbody class="scroll">
            <tr>
                <td width="20%">here</td>
                <td width="20%">here</td>
                <td width="10%">here</td>
                <td width="10%">here</td>
                <td width="10%">here</td>
                <td width="10%">here</td>
                <td width="10%">here</td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
            <tr>
                <td width="20%"></td>
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="10%"></td>
            </tr>
        </tbody>
   </table>
</div>
                        <div class="addup rounded scroll-half movedown5">
    <table class="tblholder unclickable">
        <thead>
            <tr>
                <th width="10%">Reference No.</th>
                <th width="10%">Date</th>
                <th width="30%">Description</th>
                <th width="12%">Balance</th>
                <th width="12%"><input type="checkbox" id="applied" class="lblleft" /><label for="apply">Apply</label></th>
            </tr>
        </thead>
        <tbody class="scroll">
            <tr>
                <td width="10%">here</td>
                <td width="10%">here</td>
                <td width="30%">here</td>
                <td width="12%">here</td>
                <td width="12%">here</td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
            <tr>
                <td width="10%"></td>
                <td width="10%"></td>
                <td width="30%"></td>
                <td width="12%"></td>
                <td width="12%"></td>
            </tr>
        </tbody>
   </table>
</div>


                        <div class="space10"></div>
                        <div class="addup bottom-pane">
                            <div class="row1">
                                <!-- Start of Two Grids -->
                                <div class="ym-grid linearize-level-1">
                                    <div class="pane-left ym-gl">
                                        <div class="ym-gbox">
                                            <div class="ym-clearfix">
                                                <div class="float-left">
                                                    <table>
                                                        <tr>
                                                            <td class="lbl" valign="top"><label for="notes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notes</label></td>
                                                            <td class="obj"><textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="long"></textarea></td>
                                                        </tr>
                                                    </table>
                                                </div>                                                        
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pane-right ym-gr">
                                        <div class="ym-gbox">
                                            <div class="ym-clearfix">
                                                <div class="float-right">
                                                    <table>
                                                        <tr>
                                                            <td>Total Amount</td>
                                                            <td>1,500.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td><a href="apply-to-invoice" class="btnlink view"><img src="http://localhost:8181/megasummit/images/buttons/apply-invoice.png" width="87" height="20" alt="Void" /></a></td>
                                                            <td>500.00</td>
                                                        </tr>                                                  
                                                    </table>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>
                                <!-- End of Two Grids -->  
                                <div class="space5">&nbsp;</div>                                     
                            </div>
                            <div class="row2">
                                <!-- Start of Two Grids -->
                                <div class="ym-grid ym-equalize linearize-level-1">
                                    <div class="pane-left ym-gl">
                                        <div class="ym-gbox">
                                            &nbsp;
                                        </div>
                                    </div>
                                    <div class="pane-right ym-gr">
                                        <div class="ym-gbox">
                                            <div class="ym-clearfix">
                                                <div class="float-right">
                                                    <table>
                                                        <tr>
                                                            <td>Balance&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                            <td>1,000.00</td>
                                                        </tr>                                                 
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End of Two Grids -->		
                            </div>
                        </div>
                        <div class="addup"><div class="space15"></div></div>
                    </div>    
                </div>
            </div>      			
        </div>	
    </div>
</div>

    </div>
</asp:Content>
