<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-List-Others.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_List_Others" %>

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

                            <div id="action_reason_of_adjustment" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateReasonOfAdjustment(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewReasonOfAdjustment(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchReasonOfAdjustment(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteReasonOfAdjustment(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_reason_of_return" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateReasonOfReturn(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewReasonOfReturn(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchReasonOfReturn(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteReasonOfReturn(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_remarks" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateRemarks(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewReturn(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchRemarks(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteRemarks(this)" class="delete">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_holiday" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a onclick="ActionSaveUpdateHoliday(this)" class="save">Save</a></li>
                                    <li><a onclick="ActionNewHoliday(this)" class="new">New</a></li>
                                    <li><a onclick="ActionSearchHoliday(this)" class="find">Find</a></li>
                                    <li><a onclick="ActionDeleteHoliday(this)" class="delete">Delete</a></li>
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
    <div id="main" class="company-company-lists-others">
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
                                        <li class="active view"><a onclick="SubMenuDisplay('reason_of_adjustment')" class="new-find" style="cursor: default">Reason of Adjustment</a></li>
                                        <li class="view"><a onclick="SubMenuDisplay('reason_of_return')" class="new-find" style="cursor: default">Reason of Return</a></li>
                                        <li class="view"><a onclick="SubMenuDisplay('remarks')" class="new-find" style="cursor: default">Remarks</a></li>
                                        <li class="view"><a onclick="SubMenuDisplay('holiday')" class="new-find" style="cursor: default">Holiday</a></li>
                                    </ul>
                                    <div id="tab-content-holder">

                                        <%-- Start Reason of adjustment --%>

                                        <div id="xReasonOfAdjustment" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Reason of Adjustment</th>
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

                                        <div id="xReasonOfAdjustmentManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Reason of Adjustment</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_reason_of_adjustment_id" valu="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_reason_of_adjustment" value="" class="long">
                                                            </td>
                                                        </tr>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                        <div id="xReasonOfAdjustmentSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Reason of Adjustment</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_reason_of_adjustment_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="xLocationSearchFixContent">
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

                                        <%-- End Reason of adjustment --%>



                                        <%-- Start Reason of REturn --%>

                                        <div id="xReasonOfReturn" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Reason of Return</th>
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

                                        <div id="xReasonOfReturnManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Reason of Return</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_reason_of_return_id" valu="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_reason_of_return" value="" class="long">
                                                            </td>
                                                        </tr>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                        <div id="xReasonOfReturnSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Reason of Return</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_reason_of_return_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div4">
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

                                        <%-- End Reason of REturn --%>

                                        <%-- Start Remarks --%>


                                        <div id="xRemarks" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Remarks</th>
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

                                        <div id="xRemarksManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Remarks</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_remarks_id" valu="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_remarks" value="" class="long">
                                                            </td>
                                                        </tr>

                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                        <div id="xRemarksSearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Remarks</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_remarks_search" value="" class="long search_class"></td>
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


                                        <%-- End Remarks --%>



                                        <%-- Start Holiday --%>

                                        <div id="xHoliday" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th width="50%">Holiday</th>
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

                                        <div id="xHolidayManage" style="display: none">
                                            <div class="content vmiddle ym-form">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="bank">Holiday</label></td>
                                                            <td class="obj">
                                                                <input id="hdn_holiday_id" valu="0" type="hidden" />
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_holiday" value="" class="long">
                                                            </td>
                                                        </tr>

                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                        <div id="xHolidaySearch" style="display: none">
                                            <div class="content tabular">
                                                <table class="tblholder">
                                                    <thead>
                                                        <tr>
                                                            <th>Holiday</th>
                                                        </tr>
                                                    </thead>
                                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                        <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_holiday_search" value="" class="long search_class"></td>
                                                            </tr>

                                                            <div id="Div1">
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

                                        <%-- End Holiday --%>
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
                                    <li class=""><a href="aspnetCompany-List-PaymentType.aspx"><span class="item payment-type"></span>Payment Type</a></li>
                                    <li class="active"><a href="aspnetCompany-List-Others.aspx"><span class="item others"></span>Others</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Script/CompanyListOthers.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SubMenuDisplay('reason_of_adjustment');
        });

        function SubMenuDisplay(display) {
            $("#xReasonOfAdjustment").hide();
            $("#xReasonOfAdjustmentManage").hide();
            $("#xReasonOfAdjustmentSearch").hide();
            $("#action_reason_of_adjustment").hide();

            $("#xReasonOfReturn").hide();
            $("#xReasonOfReturnManage").hide();
            $("#xReasonOfReturnSearch").hide();
            $("#action_reason_of_return").hide();

            $("#xRemarks").hide();
            $("#xRemarksManage").hide();
            $("#xRemarksSearch").hide();
            $("#action_remarks").hide();

            $("#xHoliday").hide();
            $("#xHolidayManage").hide();
            $("#xHolidaySearch").hide();
            $("#action_holiday").hide();



            if (display == 'reason_of_adjustment') {
                $("#xReasonOfAdjustment").show();
                $("#action_reason_of_adjustment").show();

                LoadReasonOfAdjustment();

                $('#action_reason_of_adjustment .save').addClass('disabled');
                $('#action_reason_of_adjustment .delete').addClass('disabled');
                $('#action_reason_of_adjustment .new').removeClass('disabled');
                $('#action_reason_of_adjustment .find').removeClass('disabled');

            }
            else if (display == 'reason_of_return') {
                $("#xReasonOfReturn").show();
                $("#action_reason_of_return").show();

                LoadReasonOfReturn();

                $('#action_reason_of_return .save').addClass('disabled');
                $('#action_reason_of_return .delete').addClass('disabled');
                $('#action_reason_of_return .new').removeClass('disabled');
                $('#action_reason_of_return .find').removeClass('disabled');

            }
            else if (display == 'remarks') {
                $("#xRemarks").show();
                $("#action_remarks").show();

                LoadRemarks();

                $('#action_remarks .save').addClass('disabled');
                $('#action_remarks .delete').addClass('disabled');
                $('#action_remarks .new').removeClass('disabled');
                $('#action_remarks .find').removeClass('disabled');

            }
            else if (display == 'holiday') {
                $("#xHoliday").show();
                $("#action_holiday").show();

                LoadHoliday();

                $('#action_holiday .save').addClass('disabled');
                $('#action_holiday .delete').addClass('disabled');
                $('#action_holiday .new').removeClass('disabled');
                $('#action_holiday .find').removeClass('disabled');

            }
        }

    </script>



</asp:Content>
