<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Settings-Accounts.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Settings_Accounts" %>
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
                        <div id="action_journal" style="display: block">
                            <ul id="toolbar" class="">
                                <li><a onclick="UpdateJournal()" class="save">Save</a></li>
                                <li><a class="new disabled">New</a></li>
                                <li><a class="find disabled">Find</a></li>
                                <li><a class="delete disabled">Delete</a></li>
                                <li><a class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                    </div>
                </div>            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div><div id="main" class="company-company-settings-accounts">
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
                                    <li class="active form"><a href="#tab-voucher" class="save">Journal Voucher</a></li>
                                </ul>                            	                                	
                                <div id="tab-content-holder">
                                	
                                    
                                     <div class="content vmiddle">
                                                <div class="ym-form">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="prefix_initial">*Prefix Initial</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_jv_prefix" class="short"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="description">*Description</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_jv_description" class="fullwidth"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="chkautomatic">Automatic</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="checkbox" id="chk_jv_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                            <label>*Latest No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_jv_latest" class="xshort">
                                                                            <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_jv_next" class="xshort">
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
                    <div class="ym-col3">
    <div class="ym-cbox"> 
        <ul class="sidebar crossfade">
            <li class=""><a href="aspnetCompany-Settings.aspx"><span class="item general"></span>Customers</a></li>	
            <li class=""><a href="aspnetCompany-Settings-Suppliers.aspx"><span class="item supplier"></span>Suppliers</a></li>
            <li class=""><a href="aspnetCompany-Settings-Employees.aspx"><span class="item employee"></span>Employees</a></li>
            <li class=""><a href="aspnetCompany-Settings-Products.aspx"><span class="item product"></span>Products</a></li>
            <li class=""><a href="aspnetCompany-Settings-Banking.aspx"><span class="item banking"></span>Banking</a></li>
            <li class="active"><a href="aspnetCompany-Settings-Accounts.aspx"><span class="item accounts"></span>Accounts</a></li>
            <li class=""><a href="aspnetCompany-Settings-Accessories.aspx"><span class="item accessories"></span>Accessories</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>

    <script type="text/javascript">

        LoadJournal();

        function LoadJournal()
        {
            var pageUrl = '/Webservice/svr_Setting.asmx';

            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectSetting",
                data: "{ 'id':'20', 'setting_name':'' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {


                    var data = eval(response.d);
                    var obj = "";
                    for (var i = 0; i < data.length; i++) {

                        $("#txt_jv_prefix").val(data[i]["Prefix"]);
                        $("#txt_jv_description").val(data[i]["Description"]);

                        if (data[i]["Automatic"] == true) {
                            $("#chk_jv_automatic").attr('checked', 'checked');
                        }

                        $("#txt_jv_latest").val(data[i]["LatestNo"]);
                        $("#txt_jv_next").val(data[i]["NextNo"]);

                    }


                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }
       

        function UpdateJournal() {
            var pageUrl = '/Webservice/svr_Setting.asmx';
            var id = "20";
            var prefix = $("#txt_jv_prefix").val();
            var description = $("#txt_jv_description").val();
            var automatic = false;
            var latest = $("#txt_jv_latest").val();
            var next = $("#txt_jv_next").val();

            if ($('#chk_jv_automatic').is(":checked")) {
                automatic = true;
            }

            var data_transfer = "{'id':'{0}',  'prefix':'{1}',  'description':'{2}',  'automatic':'{3}',  'latest_no':'{4}',  'next_no':'{5}'}"
                        .f(id, prefix, description, automatic, latest, next);

            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateSetting",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadJournal();

                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }

    </script>

</asp:Content>
