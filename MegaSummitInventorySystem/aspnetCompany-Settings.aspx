<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Settings.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">

        .chk_form {
        
        }
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


         <div id="action_sales" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="ActionSaveUpdateSales(this)" class="save" >Save</a></li>
                <li><a onclick="ActionNewSales(this)" class="new" >New</a></li>
                <li><a onclick="ActionSearchSales(this)" class="find" >Find</a></li>
                <li><a onclick="ActionDeleteSales(this)" class="delete" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

         <div id="action_sales_return" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdateSalesReturn()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

         <div id="action_sales_order" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdateSalesOrder()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

         <div id="action_official_receipt" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdateOfficialReceipt()" class="save" >Save</a></li>
                <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

        <div id="action_memo" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdateMemo()" class="save" >Save</a></li>
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
</div><div id="main" class="company-company-settings-customers">
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
                                    <li id="sales" class="form active"  onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('s')" class="new-find" style="cursor:default">Sales</a></li>
                                    <li id="sales_receipt" class="form" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('sr')" class="save" style="cursor:default">Sales Return</a></li>
                                    <li id="sales_order" class="form" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('so')" class="save" style="cursor:default">Sales Order</a></li>
                                    <li id="official_receipt" class="form" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('or')" class="save" style="cursor:default">Official Receipt</a></li>
                                    <li id="customer_receipt" class="form" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('cm')" class="save" style="cursor:default">Memo</a></li>
                                </ul>
                                <div id="tab-content-holder">

                                     <%-- Start Sales --%>
                                    <div id="xSales" style="display:none">
                                	    <div class="content tabular">
                                           <table class="tblholder">
                                        	    <thead>
                                            	    <tr>
                                                        <th width="50%">Prefix Initial</th>
                                                        <th width="50%">Description</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll">
                                               <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                </tbody>
                                           </table>                                       
                                        </div>
                                    </div>

                                    <div id="xSalesManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="hidden" id="hdn_sales_id" value="0" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="prefix_initial" name="prefix_initial" value="DR" class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="description" name="description" value="Delivery Receipt" class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="latest_number" class="nolbl"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="latest_number_sales" name="latest_number" value="1" class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="next_number" name="next_number" value="2" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="maximum_lines">*Maximum No. Lines</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="maximum_lines" name="maximum_lines" value="29" class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">&nbsp;</td>
                                                        <td class="obj">
                                                            <div class="rounded">
                                                                <table class="tblholder custom" id="cheight-105">
                                                                    <thead>
                                                                        <tr>
                                                                            <th width="65%">Product Department</th>
                                                                            <th width="35%">
                                                                                <input type="checkbox" id="access" class="lblleft"><label for="access">Access</label></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                                        <tbody class="scroll" style="overflow: hidden; width: auto;">
                                                                     
                                                                        </tbody>
                                                                        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px;"></div>
                                                                        <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                                    </div>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <div class="ym-clearfix">
                                                                <div class="float-right">
                                                                    <br>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="submit small">Template</button>
                                                                    <div class="space5"></div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="xSalesSearch" style="display: none">
                                        <div class="content tabular">
                                            <table  class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Sales</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_sales_search" name="product" value="" class="long search_class" onchange="OnSearchProductDepartment()"></td>
                                                        </tr>

                                                        <div id="Div5">
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                        </div>
                                                    </tbody>
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>
                                            </table>

                                        </div>
                                    </div>


                                     <%-- End Sales --%>

                                    <%-- Start Sales Return --%>

                                    <div id="xSalesReturn" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_sr_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_sr_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_sr_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_sr_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_sr_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>

                                
                                    
                                    <%-- End Sales Return --%>


                                     <%-- Start Sales Order --%>
                                    
                                     <div id="xSalesOrder" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_so_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_so_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_so_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_so_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_so_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>

                                    <%-- End Sales --%>


                                    <%--Start OFFICIAL RECEIPT--%>

                                     <div id="xOfficialReceipt" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_or_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_or_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_or_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_or_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_or_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>

                                    <%--END OR--%>

                                    <%--Start MEMO--%>

                                     <div id="xMemo" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_cm_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_cm_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_cm_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_cm_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_cm_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>

                                    <%--End MeMO--%>




                                </div>
                            </div>	
                        </div>
                    </div>
                    <div class="ym-col3">
    <div class="ym-cbox"> 
        <ul class="sidebar crossfade">
            <li class="active"><a href="aspnetCompany-Settings.aspx"><span class="item general"></span>Customers</a></li>	
            <li class=""><a href="aspnetCompany-Settings-Suppliers.aspx"><span class="item supplier"></span>Suppliers</a></li>
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
    <div id="script_writer"></div>
    <script src="Script/CompanySettingCustomer.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SubMenuDisplay('s');
        });

        function ActivateForm(me) {
            $(me).closest('ul').find('li').each(function () {
                $(this).removeClass('active');

            });

            $(me).addClass('active');

        }


    </script>

</asp:Content>
