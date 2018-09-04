<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-List-PaymentType.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_List_PaymentType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .search_class {
            border: 0;
            width: 100%;
        }

            .search_class:focus {
                outline: none;
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




                            <div id="action_check_type" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="(this)" class="save">Save</a></li>
                                    <li><a onclick="(this)" class="new">New</a></li>
                                    <li><a onclick="(this)" class="find">Find</a></li>
                                    <li><a onclick="(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_card_type" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateCardType(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewCardType(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchCardType(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteCardType(this)" class="delete">Delete</a></li>
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
    <div id="main" class="company-company-lists-payment-type">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="submenu">
                    <ul class="crossfade ym-clearfix">
                        <li class=""><a href="aspnetCompany.aspx">Company</a></li>
                        <li class=""><a href="aspnetCompany-User.aspx">Users</a></li>
                        <li class="active"><a href="aspnetCompany-List.aspx">Lists</a></li>
                        <li class=""><a href="aspnetCompany-Settings.aspx">Settings</a></li>
                        <li class=""><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
                        <li class=""><a href="aspnetCompany-Calendar.aspx">Calendar</a></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <div class="container two-column-sidebar mod-company-lists">
                    <div class="ym-column linearize-level-1">
                        <div class="ym-col1">
                            <div class="ym-cbox">
                                <div class="box-holder">
                                    <ul class="tabs crossfade">
                                        <li class="active view" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('check')" class="new-find" style="cursor: default">Check Type</a></li>
                                        <li class="view" onclick = 'ActivateForm(this);'><a onclick="SubMenuDisplay('card')" class="new-find" style="cursor: default">Card Type</a></li>
                                    </ul>
                                    <div id="tab-content-holder">


                                        <%-- ------------- --%>

                                        <div id="xCheckType" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Check Type</th>
                                                            <th width="50%">Days Clearing</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td>Local
                                                            </td>
                                                            <td>1</td>
                                                        </tr>
                                                        <tr>
                                                            <td>OTC
                                                            </td>
                                                            <td>30</td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <%-- ------------- --%>

                                        <div id="xCardType" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Card Type</th>
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
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div id="xCardTypeManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Card type</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_card_type_id" valu="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_card_type" value="" class="long">
                                                            </td>
                                                        </tr>

                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                        <div id="xCardTypeSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Card Type</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_card_type_search" value="" class="long search_class"></td>
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

                                        <%-- ------------- --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar crossfade">
                                    <li class=""><a href="aspnetCompany-List.aspx"><span class="item general"></span>General</a></li>
                                    <li class=""><a href="aspnetCompany-List-Group.aspx"><span class="item groups"></span>Groups</a></li>
                                    <li class=""><a href="aspnetCompany-List-PayrollItem.aspx"><span class="item payroll-items"></span>Payroll Items</a></li>
                                    <li class=""><a href="aspnetCompany-List-Field.aspx"><span class="item fields"></span>Fields</a></li>
                                    <li class="active"><a href="aspnetCompany-List-PaymentType.aspx"><span class="item payment-type"></span>Payment Type</a></li>
                                    <li class=""><a href="aspnetCompany-List-Others.aspx"><span class="item others"></span>Others</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Script/CompanyListPaymentType.js"></script>
    <script type="text/javascript">
        SubMenuDisplay('check');
        
        function SubMenuDisplay(display) {


            $("#xCheckType").hide();
            $("#action_check_type").hide();

            $("#xCardType").hide();
            $("#xCardTypeManage").hide();
            $("#xCardTypeSearch").hide();
            $("#action_card_type").hide();



            if (display == 'check') {
                $("#xCheckType").show();
                $("#action_check_type").show();



            }
            else if (display == 'card') {


                $("#xCardType").show();
                $("#action_card_type").show();


                LoadCardType();

                $('#action_card_type .save').addClass('disabled');
                $('#action_card_type .delete').addClass('disabled');
                $('#action_card_type .new').removeClass('disabled');
                $('#action_card_type .find').removeClass('disabled');

            }
            else {

                alert('just a template for now');
            }



        }

        //onclick = 'ActivateForm(this);'
        function ActivateForm(me) {
            $(me).closest('ul').find('li').each(function () {
                $(this).removeClass('active');

            });

            $(me).addClass('active');

        }


    </script>

</asp:Content>
