<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-History.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_History" %>

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
    <div id="subheader" class="">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class=""><a href="aspnetCompany.aspx">Company</a></li>
                                <li class=""><a href="aspnetCompany-Summary.aspx">Summary</a></li>
                                <li class=""><a href="aspnetCompany-Reminders.aspx">Reminders</a></li>
                                <li class="active"><a href="aspnetCompany-History.aspx">History</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new disabled " href="">New</a></li>
                                <li><a id="btn-find" class="find " href="javascript:;">Find</a></li>
                                <li><a id="btn-delete" class="delete disabled" href="javascript:;">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>
    <div id="main" class="company-history">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="submenu nopad">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <ul class="suboptions">
                    <li><%--<div class="addup">--%>
                            <%--<div class="pagination">--%>
                                <%--<a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                            <%--</div><%--</div>--%>
                    </li>
                </ul>
                <div class="container">
                    <div class="one-column">
                        <div class="inner">
                            <div class="box-holder">
                                <%--<div class="addup">
                                    <div class="pagination">
                                        <a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>
                                    </div>
                                </div>--%>
                                <div class="content tabular">
                                    <table class="tblholder unclickable">
                                        <thead>
                                            <tr>
                                                <th width="10%">Date</th>
                                                <th width="10%">Time</th>
                                                <th width="20%">Username</th>
                                                <th width="40%">Module Name</th>
                                                <th width="20%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="scroll">
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">User Access</td>
                                                <td width="20%">Delete</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">Company > Company > Settings > Customer > Sales > Upritning</td>
                                                <td width="20%">New</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">User Access</td>
                                                <td width="20%">Delete</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">Company > Company > Settings > Customer > Sales > Upritning</td>
                                                <td width="20%">New</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">User Access</td>
                                                <td width="20%">Delete</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">Company > Company > Settings > Customer > Sales > Upritning</td>
                                                <td width="20%">New</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">User Access</td>
                                                <td width="20%">Delete</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">Company > Company > Settings > Customer > Sales > Upritning</td>
                                                <td width="20%">New</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">User Access</td>
                                                <td width="20%">Delete</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">Company > Company > Settings > Customer > Sales > Upritning</td>
                                                <td width="20%">New</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">User Access</td>
                                                <td width="20%">Delete</td>
                                            </tr>
                                            <tr>
                                                <td width="10%">06.10.2014</td>
                                                <td width="10%">17:24:40</td>
                                                <td width="20%">admin</td>
                                                <td width="40%">Company > Company > Settings > Customer > Sales > Upritning</td>
                                                <td width="20%">New</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>

                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="addup">
                                    <div class="space20"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
