<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Settings-Accessories.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Settings_Accessories" %>
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
                            <li class="active"><a href="http://localhost:8181/megasummit/company/company/">Company</a></li>
                            <li class=""><a href="http://localhost:8181/megasummit/company/summary/">Summary</a></li>
                            <li class=""><a href="http://localhost:8181/megasummit/company/reminders/">Reminders</a></li>
                            <li class=""><a href="http://localhost:8181/megasummit/company/history/">History</a></li>	
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>
                </div>
                <div class="block-right ym-gr">
    <div class="ym-gbox">


       <div id="action_packing_list" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdatePackingList()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

         <div id="action_pick_up_slip" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdatePickUpSlip()" class="save" >Save</a></li>
               <li><a class="new disabled" >New</a></li>
                <li><a class="find disabled" >Find</a></li>
                <li><a class="delete disabled" >Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
         </div>

        <div id="action_counter_receipt" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="UpdateCounterReceipt()" class="save" >Save</a></li>
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
</div><div id="main" class="company-company-settings-accessories">
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
                                    <li id="pl" class="active form"   onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('pl')" class="save" style="cursor:default">Packing List</a></li>
                                    <li id="pu" class="view"  onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('pu')" class="save" style="cursor:default">Pick Up Slip</a></li>
                                    <li id="cr" class="view"   onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('cr')" class="save" style="cursor:default">Counter Receipt</a></li>
                                </ul>  

                    			<div id="tab-content-holder">

                                    <div id="xPackingList" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_pl_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_pl_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_pl_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_pl_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_pl_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>
                                    
                                    <div id="xPickUpSlip" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_pu_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_pu_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_pu_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_pu_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_pu_next" class="xshort">
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>
                                	
                                    <div id="xCounterReceipt" style="display: none">
                                        <div class="content vmiddle">
                                            <div class="ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="prefix_initial">*Prefix Initial</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_cr_prefix"  class="short"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="description">*Description</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_cr_description"   class="fullwidth"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="chkautomatic">Automatic</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="checkbox" id="chk_cr_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                    <label>*Latest No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_cr_latest"  class="xshort">
                                                                    <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_cr_next" class="xshort">
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
            <li class=""><a href="aspnetCompany-Settings-Suppliers.aspx"><span class="item supplier"></span>Suppliers</a></li>
            <li class=""><a href="aspnetCompany-Settings-Employees.aspx"><span class="item employee"></span>Employees</a></li>
            <li class=""><a href="aspnetCompany-Settings-Products.aspx"><span class="item product"></span>Products</a></li>
            <li class=""><a href="aspnetCompany-Settings-Banking.aspx"><span class="item banking"></span>Banking</a></li>
            <li class=""><a href="aspnetCompany-Settings-Accounts.aspx"><span class="item accounts"></span>Accounts</a></li>
            <li class="active"><a href="aspnetCompany-Settings-Accessories.aspx"><span class="item accessories"></span>Accessories</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>
    <script src="Script/CompanySettingAccessories.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            SubMenuDisplay('pl');
        });

        function SubMenuDisplay(display) {


            $("#xPackingList").hide();
            $("#action_packing_list").hide();

            $("#xPickUpSlip").hide();
            $("#action_pick_up_slip").hide();

            $("#xCounterReceipt").hide();
            $("#action_counter_receipt").hide();




            if (display == 'pl') {

                LoadPackingList();

                $("#xPackingList").show();
                $("#action_packing_list").show();

            }

            else if (display == 'pu') {

                LoadPickUpSlip();

                $("#xPickUpSlip").show();
                $("#action_pick_up_slip").show();

            }

            else if (display == 'cr') {
                LoadCounterReceipt();
                $("#xCounterReceipt").show();
                $("#action_counter_receipt").show();

            }

        }

        function ActivateForm(me) {
            $(me).closest('ul').find('li').each(function () {
                $(this).removeClass('active');

            });

            $(me).addClass('active');

        }


    </script>
</asp:Content>
