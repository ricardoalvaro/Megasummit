<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductPreorder_Old.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductPreorder" %>

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
        tbody.scroll {
            height: 407px !important;
        }
        .slimScrollDiv {
            height: 407px !important;
        }
        #main .ym-wbox {
            padding: 5px 0 10px 0;
        }
    </style>

    <script src="Script/Product.js"></script>

    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class=""><a href="aspnetProduct.aspx">Product</a></li>
                                <li class="active"><a href="aspnetProductPreorder.aspx">Preorder</a></li>
                                <li class=""><a href="aspnetProductAssembly.aspx">Assembly</a></li>
                                <li class=""><a href="aspnetProductsAdjustment.aspx">Inventory Adjustment</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new disabled " href="">New</a></li>
                                <li><a id="btn-find" class="find disabled" href="javascript:;">Find</a></li>
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
    <div id="main" class="products-preorder">
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

                <div class="container one-column">
                    <div class="inner">
                        <div class="box-holder">
                            <div id="tab-content-holder">
                                <div class="content tabular">
                                    <table class="tblholder" id="preOder_table">
                                        <thead>
                                            <tr>
                                                <th width="30%">Product Name</th>
                                                <th width="12%">Quantity on Hand</th>
                                                <th width="12%">Reorder Quantity</th>
                                                <th width="12%">Quantity Demand</th>
                                                <th width="12%">Quantity to Order</th>
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
                                        </tbody>
                                    </table>
                                </div>
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

    <script type="text/javascript">
        LoadPreOrder();
    </script>

</asp:Content>
