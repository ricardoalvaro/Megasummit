<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductsAdjustment.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSuppliersVoucher" %>

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
    <script src="Script/ProductAdjustment.js"></script>

    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class=""><a href="aspnetProduct.aspx">Product</a></li>
                                <li class=""><a href="aspnetProductPreorder.aspx">Preorder</a></li>
                                <li class=""><a href="aspnetProductAssembly.aspx">Assembly</a></li>
                                <li class="active"><a href="aspnetProductsAdjustment.aspx">Inventory Adjustment</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" onclick="SavingAdjustment(); return false;">Save</a></li>
                                <li><a id="btn-new" class="new  " onclick="NewAdjustment();">New</a></li>
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
    <input id="hdnAdjustmentID" type="hidden" value="0" />

    <div id="main" class="products-inventory-adjustment">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <div class="submenu nopad">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <ul class="suboptions">
                    <li>
                    </li>
                </ul>

                <div class="container two-column-sidebar style2">
                    <div class="ym-column linearize-level-1">
                        <div id="content-holder" class="ym-col1">
                            <div class="ym-cbox padtop9">
                                <div class="box-holder">


                                    <h1>Inventory Adjustment</h1>
                                    <div class="content vmiddle">
                                        <div id="inventory_adjustment_form" class="ym-form">

                                            <table>
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="product_name">*Product Name</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow long">
                                                                        <select name="product_name" id="product">
                                                                            <option value=""></option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="location">*Location</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow medium">
                                                                        <select name="location" id="location" onchange="LoadProductStock();">
                                                                            <option value=""></option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="current_quantity">Current Quantity</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="current_quantity" name="current_quantity" value="" class="short" disabled /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="new_quantity">*New Quantity</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="new_quantity" name="new_quantity" value="" class="short" onblur="ComputeQuantityDifference();" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="quantity_difference">Quantity Difference</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="quantity_difference" name="quantity_difference" value="" class="short" disabled /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="unit_price">*Unit Price</label></td>
                                                                <td class="obj">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="unit_price" name="unit_price" value="" class="short" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="reason_adjustment">*Reason of Adjustment</label></td>
                                                                <td class="obj">
                                                                    <div class="select-arrow long">
                                                                        <select name="reason_adjustment" id="reason_adjustment">
                                                                            <option value=""></option>
                                                                        </select>

                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="50"></td>
                                                    <td valign="top">
                                                        <table>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="reference_number">*Reference No.</label></td>
                                                                <td class="obj">
                                                                    <div class="grid ym-clearfix">
                                                                        <div class="col-left">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" disabled />
                                                                        </div>
                                                                        <div class="col-left">
                                                                            &nbsp;&nbsp;
                                                                        </div>
                                                                        <div class="col-left">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="reference_number" name="reference_number" class="xxxmedium" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="lbl">
                                                                    <label for="reference_number">*Date</label></td>
                                                                <td class="obj">
                                                                    <div class="dp xmedium">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar sidelists2 crossfade scroll" id="ulInvAdjustment">
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                    <li>&nbsp; <br/> &nbsp;</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        LoadInventoryAdjustment("0");
    </script>

</asp:Content>
