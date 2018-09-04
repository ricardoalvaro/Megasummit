<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerInformation.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerInformation" %>
<%@ Register src="include/CustomerSubMenuAjax.ascx" tagname="CustomerSubMenuAjax" tagprefix="uc1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />

    <div id="main" class="customer-customers">
        <div class="ym-wrapper">    	   	
            <div class="ym-wbox"> 
       <uc1:CustomerSubMenuAjax ID="CustomerSubMenuAjax1" runat="server" />
        <div class="container one-column withbg">
                <div class="inner">                    	
                    <div class="box-holder">                        
                	    <div id="content-holder">
                    	    <div class="content vmiddle">
                        	    <div class="space40"></div>
                                <div name="customer_customers_form" id="customer_customers_form"  class="ym-form">
                                    <table>
                                        <tr>
                                             <td>
                                                <table>
                                                    <tr>
                                                        <td class="lbl"><label for="customer_name">*Customer Name</label></td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="customer_name" name="customer_name" value="" class="fullwidth" /></td>
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
                                                                    <option value="Abra">Abra</option>
                                                                    <option value="Agusan del Norte">Agusan del Norte</option>
                                                                    <option value="Agusan del Sur">Agusan del Sur</option>                                                                   
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr> 
                                                    <tr>
                                                        <td class="lbl"><label for="municipality">*Municipality</label></td>
                                                        <td class="obj">
                                                            <div class="select-arrow fullwidth">
                                                                <select name="municipality" id="municipality">
                                                                    <option value=""></option>                                                                                                                          
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="business_phone">Business Phone</label></td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="business_phone" name="business_phone" value="" class="fullwidth" /></td>
                                                    </tr> 
                                                    <tr>
                                                        <td class="lbl"><label for="home_phone">Home Phone</label></td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="home_phone" name="home_phone" value="" class="fullwidth" /></td>
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
                                                        <td class="lbl"><label for="ship_to">Ship To</label></td>
                                                        <td class="obj">
                                                            <div class="select-arrow fullwidth">
                                                                <select name="ship_to" id="ship_to">
                                                                    <option value="Abel Forwarder">Abel Forwarder</option>
                                                                    <option value="Abiva Trucking">Abiva Trucking</option>
                                                                    <option value="Accordas Trucking">Accordas Trucking</option>                                                                   
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="price_level">*Price Level</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <div class="select-arrow short">
                                                                        <select name="price_level" id="price_level">
                                                                            <option value="A">A</option>
                                                                            <option value="B">B</option>
                                                                            <option value="C">C</option>                                                                   
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-right">
                                                                    <label for="status">*Status</label>
                                                                    <div class="select-arrow short">
                                                                        <select name="status" id="status">
                                                                            <option value="Open">Open</option>
                                                                            <option value="Closed">Closed</option>
                                                                            <option value="Limit">Limit</option>                                                                   
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>      
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="tin_number">TIN No.</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="tin_number" name="tin_number" value="" class="short" />
                                                                </div>
                                                                <div class="col-right">
                                                                    <label for="vat_number">VAT No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="vat_number" name="vat_number" value="" class="short" />
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>               
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="salesman">*Salesman</label></td>
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
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
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
                                                                <div class="col-right">
                                                                    <label for="credit_limit">*Credit Limit</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="credit_limit" name="credit_limit" value="" class="short" />
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><div class="horz-divider"></div></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl"><label for="customer_since">Customer Since</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="customer_since" name="customer_since" value="" class="short" disabled />
                                                                </div>
                                                                <div class="col-right">
                                                                    <label for="ave_receivables">Ave. Receivables</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="ave_receivables" name="ave_receivables" value="" class="short" disabled />
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
                                                        <button type="button" id="btn-opening-balance" class="submit small">Opening Balance</button>
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


    <script src="Script/CustomerInformation.js"></script>
    <script type="text/javascript">
        var RegionData = <%= RegionMunicipalityVM.Regions %>;
        var MunicipalityData = <%= RegionMunicipalityVM.Municipalities %>;
        var ForwarderData = <%= CustomerVM.Forwarders %>;
        var EmployeeData = <%= EmployeeVM.Employees(0, string.Empty, "Salesman") %>;
        var TermData =  <%= CustomerVM.Terms %>;
        var SettingData = <%= CustomerVM.CustomerSettings %>;
        var CustomerSingleData   <%= CustomerSingleData()  %>;
    </script>

</asp:Content>
