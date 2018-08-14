<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-Settings-Banking.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_Settings_Banking" %>

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


                            <div id="action_deposit" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="UpdateDeposit()" class="save">Save</a></li>
                                    <li><a class="new disabled">New</a></li>
                                    <li><a class="find disabled">Find</a></li>
                                    <li><a class="delete disabled">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_withdrawal" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="UpdateWithdrawal()" class="save">Save</a></li>
                                    <li><a class="new disabled">New</a></li>
                                    <li><a class="find disabled">Find</a></li>
                                    <li><a class="delete disabled">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_return" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="UpdateReturn()" class="save">Save</a></li>
                                    <li><a class="new disabled">New</a></li>
                                    <li><a class="find disabled">Find</a></li>
                                    <li><a class="delete disabled">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_discounting" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="UpdateDiscounting()" class="save">Save</a></li>
                                    <li><a class="new disabled">New</a></li>
                                    <li><a class="find disabled">Find</a></li>
                                    <li><a class="delete disabled">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_memo" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="UpdateMemo()" class="save">Save</a></li>
                                    <li><a class="new disabled">New</a></li>
                                    <li><a class="find disabled">Find</a></li>
                                    <li><a class="delete disabled">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>
    <div id="main" class="company-company-settings-banking">
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
                                        <li id="dp" class="active forview"><a onclick="SubMenuDisplay('dp')" class="save" style="cursor: default">Deposits</a></li>
                                        <li id="wd" class="forview"><a onclick="SubMenuDisplay('wd')" class="save" style="cursor: default">Withdrawal</a></li>
                                        <li id="rt" class="forview"><a onclick="SubMenuDisplay('rt')" class="save" style="cursor: default">Return</a></li>
                                        <li id="ds" class="forview"><a onclick="SubMenuDisplay('ds')" class="save" style="cursor: default">Discounting</a></li>
                                        <li id="bm" class="forview"><a onclick="SubMenuDisplay('bm')" class="save" style="cursor: default">Memo</a></li>
                                    </ul>
                                    <div id="tab-content-holder">

                                        <div id="xDeposit" style="display: none">
                                            <div class="content vmiddle">
                                                <div class="ym-form">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="prefix_initial">*Prefix Initial</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_dp_prefix" class="short"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="description">*Description</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_dp_description" class="fullwidth"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="chkautomatic">Automatic</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="checkbox" id="chk_dp_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                            <label>*Latest No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_dp_latest" class="xshort">
                                                                            <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_dp_next" class="xshort">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="vDeposit" style="width: 300px; height: 200px; background-color: white; display: none; cursor: default">
                                            <div onclick="Popup.hide('vDeposit')">X</div>
                                            <div id="vDepositData"></div>
                                        </div>


                                        <div id="xWithdrawal" style="display: none">
                                            <div class="content vmiddle">
                                                <div class="ym-form">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="prefix_initial">*Prefix Initial</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_wd_prefix" class="short"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="description">*Description</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_wd_description" class="fullwidth"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="chkautomatic">Automatic</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="checkbox" id="chk_wd_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                            <label>*Latest No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_wd_latest" class="xshort">
                                                                            <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_wd_next" class="xshort">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="xReturn" style="display: none">
                                            <div class="content vmiddle">
                                                <div class="ym-form">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="prefix_initial">*Prefix Initial</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_rt_prefix" class="short"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="description">*Description</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_rt_description" class="fullwidth"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="chkautomatic">Automatic</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="checkbox" id="chk_rt_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                            <label>*Latest No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_rt_latest" class="xshort">
                                                                            <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_rt_next" class="xshort">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="xDiscounting" style="display: none">
                                            <div class="content vmiddle">
                                                <div class="ym-form">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="prefix_initial">*Prefix Initial</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_ds_prefix" class="short"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="description">*Description</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_ds_description" class="fullwidth"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="chkautomatic">Automatic</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="checkbox" id="chk_ds_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                            <label>*Latest No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_ds_latest" class="xshort">
                                                                            <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_ds_next" class="xshort">
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
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_bm_prefix" class="short"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="description">*Description</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_bm_description" class="fullwidth"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="chkautomatic">Automatic</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="checkbox" id="chk_bm_automatic" class="nolbl" style="display: inline; margin: 2px -12px 0 0; z-index: 9;"><label for="latest_number">&nbsp;&nbsp;</label>
                                                                            <label>*Latest No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_bm_latest" class="xshort">
                                                                            <label for="next_number">&nbsp;&nbsp;*Next No.</label>
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_bm_next" class="xshort">
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
                                    <li class="active"><a href="aspnetCompany-Settings-Banking.aspx"><span class="item banking"></span>Banking</a></li>
                                    <li class=""><a href="aspnetCompany-Settings-Accounts.aspx"><span class="item accounts"></span>Accounts</a></li>
                                    <li class=""><a href="aspnetCompany-Settings-Accessories.aspx"><span class="item accessories"></span>Accessories</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  

    <script src="Script/CompanySettingBanking.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            SubMenuDisplay('dp');
        });

        function SubMenuDisplay(display) {


            $("#xDeposit").hide();
            $("#action_deposit").hide();

            $("#xWithdrawal").hide();
            $("#action_withdrawal").hide();

            $("#xReturn").hide();
            $("#action_return").hide();

            $("#xDiscounting").hide();
            $("#action_discounting").hide();

            $("#xMemo").hide();
            $("#action_memo").hide();



            if (display == 'dp') {

                LoadDeposit();

                $("#xDeposit").show();
                $("#action_deposit").show();

            }
            else if (display == 'wd') {

                LoadWithdrawal();
                $("#xWithdrawal").show();
                $("#action_withdrawal").show();

            }
            else if (display == 'rt') {
                LoadReturn();

                $("#xReturn").show();
                $("#action_return").show();


            }

            else if (display == 'ds') {

                LoadDiscounting();
                $("#xDiscounting").show();
                $("#action_discounting").show();


            }

            else if (display == 'bm') {

                LoadMemo();
                $("#xMemo").show();
                $("#action_memo").show();


            }


        }



        ///////////////////////

       


    </script>


</asp:Content>
