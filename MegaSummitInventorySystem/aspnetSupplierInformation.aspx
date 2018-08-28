<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierInformation.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSupplierInformation" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<%@ Register src="include/SupplierSubMenuAjax.ascx" tagname="SupplierSubMenuAjax" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />

    <div id="main" class="suppliers-suppliers">
    <div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
         <uc2:SupplierSubMenuAjax ID="SupplierSubMenuAjax1" runat="server" />
        <div class="container one-column withbg">
            <div class="inner">                    	
                <div class="box-holder">                        
                	<div id="content-holder">
                    	<div class="content vmiddle">
                        	<div class="space40"></div>
                            <div name="suppliers_suppliers_form" id="suppliers_suppliers_form" method="POST" class="ym-form">
                                <table>
                                    <tr>
                                         <td>
                                            <table>
                                                <tr>
                                                    <td class="lbl"><label for="supplier_name">*Supplier Name</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="supplier_name" name="supplier_name" value="" class="fullwidth" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl" valign="top"><label for="address">*Address</label></td>
                                                    <td class="obj"><textarea id="address" name="address" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="contact_person">Contact Person</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="contact_person" name="contact_person" value="" class="fullwidth" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="region_province">*Region Province</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select name="region_province" id="region_province">
                                                                                                                      
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <td class="lbl"><label for="municipality">*Municipality</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select name="municipality" id="municipality">
                                                                                                                                                                              
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="business_phone1">Business Phone 1</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="business_phone1" name="business_phone1" value="" class="fullwidth" /></td>
                                                </tr> 
                                                <tr>
                                                    <td class="lbl"><label for="business_phone1">Business Phone 2</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="business_phone2" name="business_phone2" value="" class="fullwidth" /></td>
                                                </tr>                                        
                                                <tr>
                                                    <td class="lbl"><label for="fax">Fax</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="fax" name="fax" value="" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="mobile_phone">Mobile Phone</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="mobile_phone" name="mobile_phone" value="" class="short" />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl" valign="top"><label for="notes">Notes</label></td>
                                                    <td class="obj"><textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                </tr>                                       
                                            </table>
                                        </td>
                                        <td width="44"></td>
                                        <td width=>
                                            <table>
                                                <tr>
                                                    <td class="lbl"><label for="reference_initial">*Reference Initial</label></td>
                                                    <td class="obj">
                                                       <input type="text" autocorrect="off" spellcheck="false" id="reference_initial" name="reference_initial" value="" class="short"  />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="tin_number">TIN No.</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="tin_number" name="tin_number" value="" class="fullwidth" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="vat_number">VAT No.</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="vat_number" name="vat_number" value="" class="fullwidth" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="salesman">Salesman</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                                <select name="salesman" id="salesman">
                                                                    <option value=""></option>                                                                                                                     
                                                                </select>
                                                            </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="terms">*Terms</label></td>
                                                    <td class="obj">
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
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><div class="horz-divider"></div></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="supplier_since">Supplier Since</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="supplier_since" name="supplier_since" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="ave_payable">Ave. Payable</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="ave_payable" name="ave_payable" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="last_invoice_date">Last Invoice Date</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_invoice_date" name="last_invoice_date" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="last_invoice_amt">Last Invoice Amt</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_invoice_amt" name="last_invoice_amt" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <td class="lbl"><label for="last_payment_date">Last Payment Date</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_payment_date" name="last_payment_date" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="last_payment_amt">Last Payment Amt</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_payment_amt" name="last_payment_amt" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="total_cleared">Total Cleared</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_cleared" name="total_cleared" value="" class="short" disabled />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="total_uncleared">Total Uncleared</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_uncleared" name="total_uncleared" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="balance">Balance</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="balance" name="balance" value="" class="short" disabled />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>                                                
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div class="space10"></div>
                                            <div class="ym-clearfix">
                                                <div class="float-right">
                                                    <button type="submit" id="btn-opening-balance" class="submit small">Opening Balance</button>
                                                </div>
                                            </div>
                                            <div class="space5"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>	
                        </div>
                    </div>	    
                </div>
            </div>      			
        </div>	
    </div>
</div>
    </div>


    <script src="Script/SupplierInformation.js"></script>
    <script type="text/javascript">

        var RegionData = <%= RegionMunicipalityVM.Regions %>;
        var MunicipalityData = <%= RegionMunicipalityVM.Municipalities %>;
        var EmployeeData = <%= EmployeeVM.Employees(0, string.Empty, "Salesman") %>;
        var TermData =  <%= CustomerVM.Terms %>;
        var SupplierSingleData   <%= SupplierSingleData()  %>;

    </script>
</asp:Content>
