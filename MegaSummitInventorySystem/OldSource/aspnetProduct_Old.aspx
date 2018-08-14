<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProduct_Old.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .ui-menu .ui-menu-item a {
            height: 12px;
            line-height: 10px;
            color: #858585;
            font-size: 12px;
        }

            .ui-menu .ui-menu-item a:hover {
                background: #1e90ff;
                color: #fff;
                border: none;
                border-radius: 0;
            }

        .vmiddle2 {
            width: 1024px !important;
        }

        .uploadFile {
            visibility: hidden;
        }

        .box-holder2 {
            height: 194px !important;
        }

        #main .container.one-column.withbg {
            height: 425px !important;
        }
        .container.one-column {
            height: 425px !important;
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
        tbody.scroll {
            height: 407px !important;
        }
        .slimScrollDiv {
            height: 407px !important;
        }
        #main .ym-wbox {
            padding: 5px 0 10px 0;
        }
        .submenu {
            padding: 0 0 13px 0 !important;
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
                                <li class="active"><a href="aspnetProduct.aspx">Product</a></li>
                                <li class=""><a href="aspnetProductPreorder.aspx">Preorder</a></li>
                                <li class=""><a href="aspnetProductAssembly.aspx">Assembly</a></li>
                                <li class=""><a href="aspnetProductsAdjustment.aspx">Inventory Adjustment</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>

                    <div class="block-right ym-gr">
                        <div class="ym-gbox" id="action_product" style="display: block">
                            <ul id="toolbar" class="">
                                <li><a onclick="ActionSaveUpdateProduct(this)" class="save disabled">Save</a></li>
                                <li><a onclick="ActionNewProduct(this)" class="new">New</a></li>
                                <li><a onclick="ActionSearchCustomer(this)" class="find">Find</a></li>
                                <li><a onclick="ActionDeleteProduct(this)" class="delete disabled">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                        <div class="ym-gbox" id="action_stock_card" style="display: none">
                            <ul id="toolbar" class="">
                                <li><a onclick="(this)" class="save">Save</a></li>
                                <li><a onclick="(this)" class="new">New</a></li>
                                <li><a onclick="(this)" class="find">Find</a></li>
                                <li><a onclick="(this)" class="delete">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                        <div class="ym-gbox" id="action_customer_item" style="display: none">
                            <ul id="toolbar" class="">
                                <li><a onclick="(this)" class="save">Save</a></li>
                                <li><a onclick="(this)" class="new">New</a></li>
                                <li><a onclick="(this)" class="find">Find</a></li>
                                <li><a onclick="(this)" class="delete">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                        <div class="ym-gbox" id="action_supplier_item" style="display: none">
                            <ul id="toolbar" class="">
                                <li><a onclick="(this)" class="save">Save</a></li>
                                <li><a onclick="(this)" class="new">New</a></li>
                                <li><a onclick="(this)" class="find">Find</a></li>
                                <li><a onclick="(this)" class="delete">Delete</a></li>
                                <li><a id="btn-print" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                        <div class="ym-gbox" id="action_location" style="display: none">
                            <ul id="toolbar" class="">
                                <li><a onclick="(this)" class="save">Save</a></li>
                                <li><a onclick="(this)" class="new">New</a></li>
                                <li><a onclick="(this)" class="find">Find</a></li>
                                <li><a onclick="(this)" class="delete">Delete</a></li>
                                <li><a id="A1" class="print disabled" href="javascript:;">Print</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End of Two Grids -->
            </div>
        </div>
    </div>
    <div id="main" class="products-product">

        <asp:HiddenField ID="hdnProductID" runat="server" Value="0" />
        
                <!--<div class="submenu nopad">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                <ul class="suboptions">
                    <li>
                    </li>
                </ul>-->

                <div id="xProductList" style="display: block" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">
                            <div class="submenu nopad">
                    <ul class="crossfade ym-clearfix" style="border: none">
                        <li></li>
                    </ul>
                    <div class="ym-ie-clearing">&nbsp;</div>
                </div>
                    <div class="container one-column">
                        <div class="inner">
                            <div class="box-holder">
                                <div class="content tabular">
                                    <table id="tblProduct" class="tblholder main">
                                        <thead>
                                            <tr>
                                                <th width="35%">Product Name</th>
                                                <th width="10%">Qty on Hand</th>
                                                <th width="10%">Qty Order</th>
                                                <th width="8%">Units</th>
                                                <th width="8%">Cost</th>
                                                <th width="8%">Discount</th>
                                                <th width="10%">Average Cost</th>
                                                <th width="10%">Qty Diff.</th>
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
                                <div class="addup">
                                    <div class="space20"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                </div>

                <div id="xProductSearch" style="display: none" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div class="content tabular">
                                            <table id="Table1" class="tblholder main">
                                                <thead>
                                                    <tr>
                                                        <th width="100%">Product Name</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll">
                                                    <tr id="rec-1">
                                                        <td width="100%">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_product_search" name="product_name" value="" class="long search_class" style="color: gray; outline: none; border: none; background-color: transparent;" />
                                                        </td>
                                                    </tr>

                                                    <div id="xProductSearchFixContent">
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                        </tr>
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

                <div id="xProductSubMenu" style="display: none;">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">
                            <div class="submenu ajax" style="padding: 0 0 23px;">
                                <ul class="crossfade ym-clearfix">
                                    <li id="general_info" class="active form" onclick="ShowActiveTab('general_info')"><a href="#" class="save-new-delete">General Info</a></li>
                                    <li id="stock_card" class=" view" onclick="ShowActiveTab('stock_card')"><a href="#">Stock Cards</a></li>
                                    <li id="customer_item" class=" view" onclick="ShowActiveTab('customer_item')"><a href="#">Customer Items</a></li>
                                    <li id="supplier_item" class=" view" onclick="ShowActiveTab('supplier_item')"><a href="#">Supplier Items</a></li>
                                    <li id="location_tab" class=" view" onclick="ShowActiveTab('location_tab')"><a href="#">Location</a></li>
                                </ul>
                                <div class="ym-ie-clearing">&nbsp;</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="xGeneralInfo" style="display: none" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">

                            <div class="container one-column withbg">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="content-holder">
                                            <div class="content vmiddle vmiddle2">
                                                <div id="products_product_form" class="ym-form">
                                                    <table>
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td>&nbsp;</td>
                                                                        <td>

                                                                            <div class="uploadBox">
                                                                                <a href="javascript:void(0)" id="uploadIcon" href="">
                                                                                    <img id="img_company" src="image/google.jpg" width="157" height="77" alt="Google" class="image" />
                                                                                </a>
                                                                                <input type="file" value="upload" id="uploadFile" class="uploadFile" onchange="ShowPreview(this)" />
                                                                            </div>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="product_name">*Product Name</label></td>
                                                                        <td class="obj">
                                                                            <input id="hdn_product_id" type="hidden" />
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="product_name" name="product_name" value="" class="fullwidth" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="brand">Brand</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="brand" name="brand" value="" class="fullwidth" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="upc_sku">UPC/SKU</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="upc_sku" name="upc_sku" value="Stock Keeping Unit / Universal Product Code" class="fullwidth" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="product_department">*Product Department</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow fullwidth">
                                                                                <select name="product_department" id="product_department" onchange="LoadProductClass()">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="product_class">*Product Class</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow fullwidth">
                                                                                <select name="product_class" id="product_class">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="location">*Location</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow fullwidth">
                                                                                <select name="location" id="location">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="qty_on_hand">Qty. on Hand</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="qty_on_hand" name="qty_on_hand" value="" class="short" disabled />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="qty_available">Qty. Available</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="qty_available" name="qty_available" value="" class="short" disabled />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="qty_so">Qty. S.O.</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="qty_so" name="qty_so" value="" class="short" disabled />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="qty_po">Qty. P.O.</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="qty_po" name="qty_po" value="" class="short" disabled />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="reorder_product">*Reorder Point</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reorder_product" name="reorder_product" value="" class="short" />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="reorder_qty">*Reorder Qty.</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reorder_qty" name="reorder_qty" value="" class="short" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl" valign="top">
                                                                            <label for="notes">Notes</label></td>
                                                                        <td class="obj">
                                                                            <textarea id="notes" name="notes" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="44"></td>
                                                            <td width="">
                                                                <table>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <div class="space81"></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="packing">Packing</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow fullwidth">
                                                                                <select name="packing" id="packing">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="units">*Units</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <div class="select-arrow short">
                                                                                        <select name="units" id="units">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="ave_payable">Sub Units</label>
                                                                                    <div class="select-arrow short">
                                                                                        <select name="sub_units" id="sub_units">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="price_a">Price A</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="price_a" name="price_a" value="" class="short" />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="ave_payable">Discount A</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="discount_a" name="discount_a" value="" class="short" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="price_b">Price B</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="price_b" name="price_b" value="" class="short" />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="ave_payable">Discount B</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="discount_b" name="discount_b" value="" class="short" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="price_c">Price C</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="price_c" name="price_c" value="" class="short" />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="ave_payable">Discount C</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="discount_c" name="discount_c" value="" class="short" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <div class="horz-divider"></div>
                                                                            <div class="space2"></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="cost">Cost</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="cost" name="cost" value="" class="short" disabled />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="last_discount">Last Discount</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="last_discount" name="last_discount" value="" class="short" disabled />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="average_cost">Average Cost</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="average_cost" name="average_cost" value="" class="short" disabled />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="sub_average_cost">Sub Average Cost</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="sub_average_cost" name="sub_average_cost" value="" class="short" disabled />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="total_units_in">Total Units In</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="total_units_in" name="total_units_in" value="" class="short" disabled />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="total_units_out">Total Units Out</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="total_units_out" name="total_units_out" value="" class="short" disabled />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="date_last_received">Date Last Received</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="date_last_received" name="date_last_received" value="" class="short" disabled />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <label for="date_last_sold">Date Last Sold</label>
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="date_last_sold" name="date_last_sold" value="" class="short" disabled />
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="qty_difference">Qty. Difference</label></td>
                                                                        <td class="obj">
                                                                            <div class="grid ym-clearfix">
                                                                                <div class="col-left">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="qty_difference" name="qty_difference" value="" class="short" disabled />
                                                                                </div>
                                                                                <div class="col-right">
                                                                                    <div class="submit small" onclick="OpenGeneralInfoOpeningBalance()">Opening Balance</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ym-ie-clearing">&nbsp;</div>
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
                            </div>
                        </div>
                    </div>
                </div>

                <div id="xGeneralInfoOpeningBalance" style="display: none" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">
                            <div class="container one-column withbg">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div1">
                                            <div class="content vmiddle vmiddle2">
                                                <div name="products_product_opening_balance_form" id="products_product_opening_balance_form" method="POST" class="ym-form">
                                                    <table>
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="product_name">*Product Name</label></td>
                                                                        <td class="obj">
                                                                            <div class="select-arrow long">
                                                                                <select name="product_name" id="productOpening" onchange="ActionSelectProductDetails();">
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
                                                                                <select name="location" id="locationOpeningBalance">
                                                                                    <option value=""></option>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="quantity">*Quantity</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="quantity" name="quantity" value="" class="short" onblur="ActionComputeAmount();" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="unit">*Unit</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="unit" name="unit" value="" class="short" disabled /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="unit_price">*Unit Price</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="unit_price" name="unit_price" value="" class="short" onblur="ActionComputeAmount();" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="discount">Discount</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="discount" name="discount" value="" class="short" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="lbl">
                                                                            <label for="amount">Amount</label></td>
                                                                        <td class="obj">
                                                                            <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" value="" class="short" disabled /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="44"></td>
                                                            <td width="">
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
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="obj">&nbsp;</td>
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
                            </div>
                        </div>
                    </div>
                </div>

                <div id="xStockCards" style="display: none" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">
                            <div class="container one-column" style="height: 425px !important;">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div class="content tabular">
                                            <table class="tblholder main unclickable" id="StockCard_Table">
                                                <thead>
                                                    <tr>
                                                        <th width="9%">Ref. No.</th>
                                                        <th width="8%">Date</th>
                                                        <th width="12%">Transaction Type</th>
                                                        <th width="20%">Customer/Supplier Name</th>
                                                        <th width="5%">In</th>
                                                        <th width="5%">Out</th>
                                                        <th width="5%">Price</th>
                                                        <th width="8%">Discount</th>
                                                        <th width="8%">Ave. Cost</th>
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

                <div id="xCustomerItems" style="display: none" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div class="content tabular">
                                            <table class="tblholder main unclickable" id="CustomerItem_Table">
                                                <thead>
                                                    <tr>
                                                        <th width="12%">Reference No.</th>
                                                        <th width="12%">Date</th>
                                                        <th width="35%">Customer Name</th>
                                                        <th width="12%">Quantity</th>
                                                        <th width="12%">Cost</th>
                                                        <th width="12%">Discount</th>
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

                <div id="xSupplierItems" style="display: none" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">

                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div class="content tabular">
                                            <table class="tblholder main unclickable" id="SupplierItem_Table">
                                                <thead>
                                                    <tr>
                                                        <th width="12%">Reference No.</th>
                                                        <th width="12%">Date</th>
                                                        <th width="35%">Supplier Name</th>
                                                        <th width="12%">Quantity</th>
                                                        <th width="12%">Cost</th>
                                                        <th width="12%">Discount</th>
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

                <div id="xLocation" style="display: none" class="_cont">
                    <div class="ym-wrapper">
                        <div class="ym-wbox">

                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div class="content tabular">
                                            <table class="tblholder main unclickable">
                                                <thead>
                                                    <tr>
                                                        <th width="15%">Location Name</th>
                                                        <th width="55%">Address</th>
                                                        <th width="15%">Quantity Demand</th>
                                                        <th width="15%">Quantity  on Hand</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="scroll">
                                                    <tr>
                                                        <td width="15%">here</td>
                                                        <td width="55%">here</td>
                                                        <td width="15%">here</td>
                                                        <td width="15%">here</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%"></td>
                                                        <td width="55%"></td>
                                                        <td width="15%"></td>
                                                        <td width="15%"></td>
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

        function OpenGeneralInfo() {
            $("#xProductList").hide();
            $("#xGeneralInfo").show();
            $("#xGeneralInfoOpeningBalance").hide();
            $("#xStockCards").hide();
            $("#xCustomerItems").hide();
            $("#xSupplierItems").hide();
            $("#xLocation").hide();
        }
        function OpenGeneralInfoOpeningBalance() {
            $("#xProductList").hide();
            $("#xGeneralInfo").hide();
            $("#xGeneralInfoOpeningBalance").show();
            $("#xStockCards").hide();
            $("#xCustomerItems").hide();
            $("#xSupplierItems").hide();
            $("#xLocation").hide();
        }
        function OpenStockCards() {
            $("#xProductList").hide();
            $("#xGeneralInfo").hide();
            $("#xGeneralInfoOpeningBalance").hide();
            $("#xStockCards").show();
            $("#xCustomerItems").hide();
            $("#xSupplierItems").hide();
            $("#xLocation").hide();
        }
        function OpenCustomerItems() {
            $("#xProductList").hide();
            $("#xGeneralInfo").hide();
            $("#xGeneralInfoOpeningBalance").hide();
            $("#xStockCards").hide();
            $("#xCustomerItems").show();
            $("#xSupplierItems").hide();
            $("#xLocation").hide();
        }
        function OpenSupplierItems() {
            $("#xProductList").hide();
            $("#xGeneralInfo").hide();
            $("#xGeneralInfoOpeningBalance").hide();
            $("#xStockCards").hide();
            $("#xCustomerItems").hide();
            $("#xSupplierItems").show();
            $("#xLocation").hide();
        }
        function OpenLocation() {
            $("#xProductList").hide();
            $("#xGeneralInfo").hide();
            $("#xGeneralInfoOpeningBalance").hide();
            $("#xStockCards").hide();
            $("#xCustomerItems").hide();
            $("#xSupplierItems").hide();
            $("#xLocation").show();
        }
        $("#uploadIcon").click(function () {
            $(this).next().trigger('click');
        });
        function ShowPreview(input) {
            if (input.files && input.files[0]) {
                var ImageDir = new FileReader();
                ImageDir.onload = function (e) {
                    $('#img_company').attr('src', e.target.result);
                    //upload sync here
                    if ($("#hdn_product_id").val() != "0") {
                        UploadData();
                    }
                }

                ImageDir.readAsDataURL(input.files[0]);
            }
        }
        function UploadData() {
            var fileUpload = $("#uploadFile").get(0);
            var files = fileUpload.files;

            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }

            $.ajax({
                url: "/Webservice/ProductUpload.ashx",
                type: "POST",
                data: data,
                contentType: false,
                processData: false,
                success: function (result) {

                    if ($("#hdn_product_id").val() != "0")//update
                    {

                        var pageUrl = '/Webservice/svr_Product.asmx';


                        $.ajax({
                            type: "POST",
                            url: pageUrl + "/UpdateProductPicture",
                            data: "{'id':'{0}', 'product_picture':'{1}'}"
                            .f($("#hdn_product_id").val(), result),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            crossdomain: true,
                            success: function (response) {

                            },
                            error: function (response) {
                                alert(response.status);
                            }
                        });
                    }

                },
                error: function (err) {
                    alert(err.statusText)
                }
            });

        }

    </script>

</asp:Content>
