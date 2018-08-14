<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductAssembly.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductAssembly" %>



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

        .ym-column {
            padding-left: 240px;
        }

        .ym-col3 {
            width: 240px;
            right: 240px;
        }

            .ym-col3 .sidelink .plus {
                color: #858585;
                display: block;
                padding: 7px 10px 7px 25px;
                background: #FFF url(image/plus.png) no-repeat 10px center !important;
            }

                .ym-col3 .sidelink .plus:hover {
                    background: #4ca1ff url(images/plus.png) no-repeat 10px center !important;
                    color: #FFF;
                }

        .newpayment {
            width: 660.013px !important;
            height: 111px;
        }

        .tabular, .rounded {
            border: 1px solid #e5e5e5 !important;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            overflow: hidden;
        }

        .height {
            height: 178px !important;
        }

        .vmiddle2 {
            width: 982px !important;
            height: 179px;
        }

        .no-border {
            border: none !important;
        }

        .subcontainer-height {
            height: 202px !important;
        }

        .pane-holder-height {
            height: 200px !important;
        }

        .yform2 {
            width: 660px;
        }

        .subholder2 {
            height: 112px !important;
        }

        .tbody2 {
            height: 99px !important;
        }

        .box-holder2 {
            height: 202px !important;
        }

        .custom-table {
            width: 100% !important;
        }

            .custom-table tbody {
                overflow: hidden !important;
                width: auto !important;
                height: 284px !important;
            }

                .custom-table tbody tr td {
                    padding: 7px 10px 7px 10px !important;
                    border-bottom: 1px solid #f7f7f7 !important;
                }

                .custom-table tbody tr:hover td {
                    background: #4ca1ff !important;
                    color: #FFF !important;
                }

                    .custom-table tbody tr:hover td a {
                        color: #858585 !important;
                    }

                    .custom-table tbody tr:hover td a {
                        color: #FFF !important;
                    }

        .a {
            color: #858585 !important;
        }

            .a:hover {
                color: #FFF !important;
            }

        .scrollbar {
            height: 160px;
            overflow-y: scroll;
        }

        .force-overflow {
            min-height: 240px;
        }

        #wrapper {
            text-align: center;
            width: auto;
            margin: auto;
        }

        #style-1::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #F5F5F5;
        }

        #style-1::-webkit-scrollbar {
            width: 12px;
            background-color: #F5F5F5;
        }

        #style-1::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #555;
        }

        .potabs li {
            margin: 0 27px 0 27px;
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

    <script src="Script/ProductAssembly.js"></script>
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
                                <li class="active"><a href="aspnetProductAssembly.aspx">Assembly</a></li>
                                <li class=""><a href="aspnetProductsAdjustment.aspx">Inventory Adjustment</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" class="save disabled" onclick="SavingAssembly();">Save</a></li>
                                <li><a id="btn-new" class="new  " onclick="NewAssmbly();">New</a></li>
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
    <div id="main" class="products-assembly">
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

                <div class="container two-column-sidebar style2">
                    <div class="ym-column linearize-level-1">
                        <div id="content-holder" class="ym-col1">
                            <div class="ym-cbox padtop9">
                                <div class="box-holder">
                                    <h1>Assembly</h1>
                                    <div class="addup">
                                        <div name="inventory_adjustment_form" id="inventory_adjustment_form" method="POST" class="ym-form">
                                            <div class="ym-clearfix">
                                                <div class="float-left">
                                                    <table>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="product_name">*Product Name</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow fullwidth">
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
                                                                <div class="select-arrow fullwidth">
                                                                    <select name="location" id="location">
                                                                        <option value=""></option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="quantity">*Quantity</label></td>
                                                            <td class="obj">
                                                                <div class="grid ym-clearfix">
                                                                    <div class="col-left">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="quantity" name="current_quantity" value="" class="short" />
                                                                    </div>
                                                                    <div class="col-right">
                                                                        <label for="unit">*Unit</label>
                                                                        <div class="select-arrow short">
                                                                            <select name="unit" id="unit">
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
                                                                <label for="average_cost">Average Cost</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="average_cost" name="average_cost" value="" class="short" disabled /></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="float-right">
                                                    <table>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="reference_number">*Reference No.</label></td>
                                                            <td class="obj">
                                                                <div class="grid ym-clearfix">
                                                                    <div class="col-left">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort" />
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
                                                            <td class="lbl">
                                                                <label for="batch_number">*Batch Number</label></td>
                                                            <td class="obj">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="batch_number" name="batch_number" value="" class="xmedium" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lbl">
                                                                <label for="prepared_by">Prepared by</label></td>
                                                            <td class="obj">
                                                                <div class="select-arrow xmedium">
                                                                    <select name="prepared_by" id="prepared_by">
                                                                        <option value=""></option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="space10"></div>
                                        </div>
                                    </div>
                                    <div class="rounded">
                                        <table class="tblholder unclickable" id="AssemblyTable">
                                            <thead>
                                                <tr>
                                                    <th width="25%">Product Name</th>
                                                    <th width="20%">Location</th>
                                                    <th width="12%">Quantity</th>
                                                    <th width="12%">Unit</th>
                                                    <th width="15%">Average Cost</th>
                                                    <th width="12%">Amount</th>
                                                    <th width="5%"></th>
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
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="addup">
                                        <br />
                                        <br />
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ym-col3">
                            <div class="ym-cbox">
                                <ul class="sidebar sidelists2 crossfade scroll" id="ulAssembly">
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
    <style>
    </style>

    <script type="text/javascript">
        //NewAssmbly();
        LoadProductAssembly("0");
    </script>

</asp:Content>
