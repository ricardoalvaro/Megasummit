<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Settings-Suppliers.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Settings_Suppliers" %>
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

          <div id="action_purchase_return" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdatePurchaseReturn()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

        <div id="action_purchase_order" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdatePurchaseOrder()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

         <div id="action_voucher" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdateVoucherOrder()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

          <div id="action_memo" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdateSupplierMemo()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>


    </div>
</div>            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div><div id="main" class="company-company-settings-suppliers">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="submenu">
    <ul class="crossfade ym-clearfix">
        <li class=""><a href="aspnetCompany.aspx">Company</a></li>
        <li class=""><a href="aspnetCompany-User.aspx">Users</a></li>
        <li class=""><a href="aspnetCompany-List.aspx">Lists</a></li>
        <li class="active"><a href="aspnetCompany-Settings.aspx">Settings</a></li>
        <li class=""><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
        <li class=""><a href="aspnetCompany-Calendar.aspx">Calendar</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>  
</div> 
        	<div class="container two-column-sidebar mod-company-settings">
            	<div class="ym-column linearize-level-1">
                    <div class="ym-col1">
                        <div class="ym-cbox"> 
                        	<div class="box-holder">
                            	<ul class="tabs crossfade">
                                    <li id="pr" class="active form"><a   onclick="SubMenuDisplay('pr')" class="save" style="cursor:default">Purchase Return</a></li>
                                    <li id="po" class="form"><a  onclick="SubMenuDisplay('po')" class="save" style="cursor:default">Purchase Order</a></li>
                                    <li id="sv" class="form"><a  onclick="SubMenuDisplay('sv')" class="save" style="cursor:default">Voucher</a></li>
                                    <li id="sm" class="form"><a  onclick="SubMenuDisplay('sm')" class="save" style="cursor:default">Memo</a></li>
                                </ul>  
                                <div id="tab-content-holder">
                                	
                                    <div id="xPurchaseReturn" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_pr_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_pr_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_pr_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_pr_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_pr_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>
                                    
                                    <div id="xPurchaseOrder" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_po_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_po_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_po_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_po_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_po_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>

                                    <div id="xVoucher" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_vo_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_vo_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_vo_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_vo_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_vo_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>

                                    <div id="xMemo" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_sm_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_sm_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_sm_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_sm_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_sm_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
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
        <ul class="sidebar crossfade">
            <li class=""><a href="aspnetCompany-Settings.aspx"><span class="item general"></span>Customers</a></li>	
            <li class="active"><a href="aspnetCompany-Settings-Suppliers.aspx"><span class="item supplier"></span>Suppliers</a></li>
            <li class=""><a href="aspnetCompany-Settings-Employees.aspx"><span class="item employee"></span>Employees</a></li>
            <li class=""><a href="aspnetCompany-Settings-Products.aspx"><span class="item product"></span>Products</a></li>
            <li class=""><a href="aspnetCompany-Settings-Banking.aspx"><span class="item banking"></span>Banking</a></li>
            <li class=""><a href="aspnetCompany-Settings-Accounts.aspx"><span class="item accounts"></span>Accounts</a></li>
            <li class=""><a href="aspnetCompany-Settings-Accessories.aspx"><span class="item accessories"></span>Accessories</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>

    <script src="Script/CompanySettingSupplier.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            SubMenuDisplay('pr');
        });

        function SubMenuDisplay(display) {


            $("#xPurchaseReturn").hide();
            $("#action_purchase_return").hide();

            $("#xPurchaseOrder").hide();
            $("#action_purchase_order").hide();

            $("#xVoucher").hide();
            $("#action_voucher").hide();

            $("#xMemo").hide();
            $("#action_memo").hide();

            if (display == 'pr') {

                LoadPurchaseReturn();

                $("#xPurchaseReturn").show();
                $("#action_purchase_return").show();
            }
            else if (display == 'po') {

                LoadPurchaseOrder();

                $("#xPurchaseOrder").show();
                $("#action_purchase_order").show();
            }
            else if (display == 'sv') {

                LoadVoucherOrder();
                $("#xVoucher").show();
                $("#action_voucher").show();
            }
            else if (display == 'sm') {

                LoadSupplierMemo();
                $("#xMemo").show();
                $("#action_memo").show();
            }


        }

    </script>


</asp:Content>
