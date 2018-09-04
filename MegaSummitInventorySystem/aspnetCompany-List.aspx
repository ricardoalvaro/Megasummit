<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-List.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .search_class {
            border: 0;
            width: 100%;
        }

            .search_class:focus {
                outline: none;
            }
        .municipality {
            width: 97% !important;
            border:none;
            background: transparent;
        }
        .product_class {
            width: 97% !important;
            border:none;
            background: transparent;
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

                            <div id="action_location" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a class="save" onclick="ActionSaveUpdateLocation(this)">Save</a></li>
                                    <li><a class="new" onclick="ActionNewLocation(this)">New</a></li>
                                    <li><a class="find" onclick="ActionSearchLocation(this)">Find</a></li>
                                    <li><a class="delete" onclick="ActionDeleteLocation(this)">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_region_province" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a class="save" onclick="ActionSaveUpdateRegion(this)">Save</a></li>
                                    <li><a class="new" onclick="ActionNewRegion(this)">New</a></li>
                                    <li><a class="find" onclick="ActionSearchRegion(this)">Find</a></li>
                                    <li><a class="delete" onclick="ActionDeleteRegion(this)">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_product_department" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a class="save" onclick="ActionSaveUpdateProduct(this)">Save</a></li>
                                    <li><a class="new" onclick="ActionNewProduct(this)">New</a></li>
                                    <li><a class="find" onclick="ActionSearchProduct(this)">Find</a></li>
                                    <li><a class="delete" onclick="ActionDeleteProduct(this)">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>


                            <div id="action_bank" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a class="save" onclick="ActionSaveUpdateBank(this)">Save</a></li>
                                    <li><a class="new" onclick="ActionNewBank(this)">New</a></li>
                                    <li><a class="find" onclick="ActionSearchBank(this)">Find</a></li>
                                    <li><a class="delete" onclick="ActionDeleteBank(this)">Delete</a></li>
                                    <li><a class="print disabled" href="javascript:;">Print</a></li>
                                </ul>
                            </div>

                            <div id="action_forwarder" style="display: none">
                                <ul id="toolbar" class="">
                                    <li><a class="save" onclick="ActionSaveUpdateForwarder(this)">Save</a></li>
                                    <li><a class="new" onclick="ActionNewForwarder(this)">New</a></li>
                                    <li><a class="find" onclick="ActionSearchForwarder(this)">Find</a></li>
                                    <li><a class="delete" onclick="ActionDeleteForwarder(this)">Delete</a></li>
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
    <div id="main" class="company-company-lists-general">
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
                                        <li class="active view" onclick='ActivateForm(this);'><a onclick="SubMenuDisplay('location')" style="cursor: default">Location</a></li>
                                        <li class="view" onclick='ActivateForm(this);'><a onclick="SubMenuDisplay('region_province')" style="cursor: default">Region Province</a></li>
                                        <li class="view" onclick='ActivateForm(this);'><a onclick="SubMenuDisplay('product_department')" style="cursor: default">Product Department</a></li>
                                        <li class="view" onclick='ActivateForm(this);'><a onclick="SubMenuDisplay('bank')" style="cursor: default">Bank</a></li>
                                        <li class="view" onclick='ActivateForm(this);'><a onclick="SubMenuDisplay('forwarder')" style="cursor: default">Forwarder</a></li>
                                    </ul>
                                    <%-- Start Location --%>
                                    <div id="xLocation" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Location</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                        <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                        <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                        <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                        <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                        <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                        <tr>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                        <tr>
                                                        <td></td>
                                                    </tr>
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
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>
                                            </table>

                                        </div>
                                    </div>

                                    <div id="xLocationManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Location</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_location_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_location" name="location" value="" class="long"></td>
                                                    </tr>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

                                    <div id="xLocationSearch" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Location</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_location_search" name="location" value="" class="long search_class" onchange="OnSearchLocation()"></td>
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

                                    <%-- End Location --%>


                                    <%-- Start Region Province --%>

                                    <div id="xRegionProvince" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Region Province</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
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
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>
                                            </table>

                                        </div>
                                    </div>

                                    <div id="xRegionProvinceManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Region Province</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_region_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_region" name="region province" value="" class="long"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br />
                                            <div id="Div1">
                                                <div class="content tabular">
                                                    <table id="region_province_table" class="tblholder">
                                                        <thead>
                                                            <tr>
                                                                <th>Region Municipality</th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                               
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="xRegionProvinceSearch" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Region</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_region_search" name="region" value="" class="long search_class" onchange="OnSearchRegion()"></td>
                                                        </tr>

                                                        <div id="xRegionSearchFixContent">
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
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

                                    <%-- End Region Province --%>

                                    <%-- Start Product Department --%>

                                    <div id="xProductDepartment" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Product Department</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
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
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>
                                            </table>

                                        </div>
                                    </div>

                                    <div id="xProductDepartmentManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Product Department</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_product_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_product" name="product" value="" class="long" /></td>
                                                    </tr>
                                                </tbody>

                                            </table>
                                             <br />
                                            <div id="Div3">
                                                <div class="content tabular">
                                                    <table id="product_department_table" class="tblholder">
                                                        <thead>
                                                            <tr>
                                                                <th>Product Class</th>
                                                            </tr>
                                                        </thead>
                                                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                            <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                               
                                                            </tbody>
                                                            <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                            <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                        </div>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="xProductDepartmentSearch" style="display: none">
                                        <div class="content tabular">
                                            <table  class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Product Department</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_product_search" name="product" value="" class="long search_class" onchange="OnSearchProductDepartment()"></td>
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

                                    <%-- End Product Department --%>

                                    <%-- Start Bank --%>

                                    <div id="xBank" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Bank</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
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
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>
                                            </table>

                                        </div>
                                    </div>

                                    <div id="xBankManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Bank</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_bank_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_bank" name="bank" value="" class="long"></td>
                                                    </tr>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

                                    <div id="xBankSearch" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Bank</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_bank_search" name="location" value="" class="long search_class"></td>
                                                        </tr>

                                                        <div id="xBankSearchFixContent">
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
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

                                    <%-- End Bank --%>


                                    <%-- Start Forwarder --%>

                                    <div id="xForwarder" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Forwarder</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
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
                                                    <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                                </div>
                                            </table>

                                        </div>
                                    </div>

                                    <div id="xForwarderManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Forwarder Name</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_forwarder_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_forwarder_name" value="" class="long"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Address</label></td>
                                                        <td class="obj">
                                                            <textarea type="text" autocorrect="off" spellcheck="false" id="txt_address" value="" class="xlong"></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Contact Person</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_contact_person" value="" class="long"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Telephone</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_telephone" value="" class="long"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Mobile Phone</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_mobile_phone" value="" class="long"></td>
                                                    </tr>

                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="fax">Fax</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="txt_fax" class="xxmedium">
                                                                </div>
                                                                <div class="col-right">
                                                                    <label for="status">*Status</label>
                                                                    <div class="select-arrow xxmedium">
                                                                        <select id="ddl_status">
                                                                            <option value="Open">Open</option>
                                                                            <option value="Closed">Closed</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Area</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_area" value="" class="long"></td>
                                                    </tr>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

                                    <div id="xForwarderSearch" style="display: none">
                                        <div class="content tabular">
                                            <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th>Forwarder</th>
                                                    </tr>
                                                </thead>
                                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                        <tr>
                                                            <td>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_forwarder_search" value="" class="long search_class"></td>
                                                        </tr>

                                                        <div id="Div2">
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
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

                                    <%-- End Bank --%>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar crossfade">
                                    <li class="active"><a href="aspnetCompany-List.aspx"><span class="item general"></span>General</a></li>
                                    <li class=""><a href="aspnetCompany-List-Group.aspx"><span class="item groups"></span>Groups</a></li>
                                    <li class=""><a href="aspnetCompany-List-PayrollItem.aspx"><span class="item payroll-items"></span>Payroll Items</a></li>
                                    <li class=""><a href="aspnetCompany-List-Field.aspx"><span class="item fields"></span>Fields</a></li>
                                    <li class=""><a href="aspnetCompany-List-PaymentType.aspx"><span class="item payment-type"></span>Payment Type</a></li>
                                    <li class=""><a href="aspnetCompany-List-Others.aspx"><span class="item others"></span>Others</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Script/CompanyList.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            SubMenuDisplay('location');
        });

        
        function ActivateForm(me) {
            $(me).closest('ul').find('li').each(function () {
                $(this).removeClass('active');

            });

            $(me).addClass('active');

        }

    </script>

</asp:Content>
