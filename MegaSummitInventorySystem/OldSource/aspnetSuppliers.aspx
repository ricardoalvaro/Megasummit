<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSuppliers.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSuppliers" %>

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
        .GeneralInfo {
            width: 1024px !important;
        }

        .padtop {
            padding: 28px 0 0 0;
        }
        .box-holder2 {
            height: 160px !important;
        }
        /*#main .container.one-column2 {
            height:461px !important;
        }*/
        .hmiddle {
            width: 703px !important;
            height: 450px !important;
        }
        #main .ym-wbox {
            padding: 5px 0 5px 0;
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
        .container.two-column-sidebar.style2.withbg {
            height: 418px !important;
        }
    </style>

    <div id="subheader">
        <div class="ym-wrapper">
            <div class="ym-wbox">
                <!-- Start of Two Grids -->
                <div class="ym-grid linearize-level-1">
                    <div class="block-left ym-gl">
                        <div class="ym-gbox">
                            <ul class="menu ym-clearfix">
                                <li class="active"><a href="aspnetSuppliers.aspx">Suppliers</a></li>
                                <li class=""><a href="aspnetSuppliersPurchase.aspx">Purchase</a></li>
                                <li class=""><a href="aspnetSuppliersPurchaseReturn.aspx">Purchase Return</a></li>
                                <li class=""><a href="aspnetSuppliersPurchaseOrder.aspx">Purchase Order</a></li>
                                <li class=""><a href="aspnetSuppliersVoucher.aspx">Voucher</a></li>
                                <li class=""><a href="aspnetSuppliersMemo.aspx">Memo</a></li>
                            </ul>
                            <div class="ym-ie-clearing">&nbsp;</div>
                        </div>
                    </div>
                    <div class="block-right ym-gr">
                        <div class="ym-gbox" id="supplier_action">
                            <ul id="toolbar" class="">
                                <li><a id="btn-save" onclick="SaveUpdateSupplier(this);" class="save disabled" href="javascript:;">Save</a></li>
                                <li><a id="btn-new" class="new  " onclick="NewSupplier();">New</a></li>
                                <li><a id="btn-find" class="find " onclick="ActionSearch();">Find</a></li>
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

    <div id="main" class="suppliers-suppliers">
        <%--<div id="xSuppliers" style="display: block">--%>
            <div class="ym-wrapper">
                <div class="ym-wbox">

                    <input id="hdnPurchasedID" type="hidden" value="0" />
                    <input id="SupplierID" type="hidden" value="0" />
                    <input id="hdnCheckTypeID" type="hidden" value="0" />
                    <input id="hdn_supplier_id" value="0" type="hidden" />



                    <input id="hdnOpeningBalanceID" type="hidden" value="0" />

                    <div class="submenu nopad" id="SubMenuID">
                        <ul class="crossfade ym-clearfix" style="border: none">
                            <li></li>
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>

                    <div id='mnu_submenu' class="submenu " style="display: none; padding: 0">
                        <ul class="crossfade ym-clearfix">
                            <li class="active form" onclick="OpenSuppliersSubMenuGeneralInfo()"><a href="#" class="new-find">General Info</a></li>
                            <li class=" view" onclick="OpenSuppliersSubMenuSupplierItem()"><a href="#">Supplier Items</a></li>
                            <li class=" view" onclick="OpenSuppliersSubMenuPurchaseOrder()"><a href="#">Purchase Order</a></li>
                            <li class=" view" onclick="OpenSuppliersSubMenuInvoice()"><a href="#">Invoices</a></li>
                            <li class=" view" onclick="OpenSuppliersSubMenuPayments()"><a href="#">Payments</a></li>
                            <li class=" view" onclick="OpenSuppliersSubMenuMemo()"><a href="#">Memo</a></li>
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>

                    <ul class="suboptions suboptions2" id="NextPageID">
                        <li>
                           <%-- <a href=""><<</a> | <a href="">< Previous</a>&nbsp;&nbsp;&nbsp;<a href="">Next ></a> | <a href="">>></a>--%>
                        </li>
                    </ul>

                    <div id="xSupplierInfoList" style="display: block">
                        <div class="container one-column">
                            <div class="inner">
                                <div class="box-holder">
                                    <div class="content tabular">
                                        <table class="tblholder main" id="xSupplierInfoListTable">
                                            <thead>
                                                <tr>
                                                    <th width="40%">Supplier Name</th>
                                                    <th width="15%">Region Province</th>
                                                    <th width="15%">Contact Person</th>
                                                    <th width="10%">Telephone</th>
                                                    <th width="10%">Fax</th>
                                                    <th width="10%">Balance</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll" style="height: 460px">
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
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
                                            <%--<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 202px;">
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 431px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>--%>
                                        </table>
                                    </div>
                                    <div class="addup">
                                        <div class="space20"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="xSupplierSearch" style="display: none">
                        <div class="content tabular">
                            <table class="tblholder">
                                <thead>
                                    <tr>
                                        <th>Supplier</th>
                                    </tr>
                                </thead>
                                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                    <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                        <tr>
                                            <td>
                                                <input type="text" autocorrect="off" spellcheck="false" id="txt_supplier_search" name="location" value="" class="long search_class" style='border: none; background-color: transparent;'></td>
                                        </tr>

                                        <div id="xSupplierSearchFixContent">
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
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

                    <div id="xSupplierOpeningBalance" style="display: none;">
                        <div class="ym-wrapper">
                                <div class="ym-wbox">
                                    <ul class="suboptions">
                                        <li class="active form"><a href="#suboption-opening-balance-invoices" onclick="ShowOpeningBalance();">Invoices</a></li>
                                        <li class="form"><a href="#suboption-opening-balance-payments"  onclick="ShowOpeningBalancePayment();">Payments</a></li>
                                    </ul>
                                    <div id="Div12">
                                        <div id="xGeneralInfoOpeningBalanceInvoice" style="margin: 0 0 -10px 0; display: block;">
                                            <div class="container two-column-sidebar style2 withbg">
                                                <div class="ym-column linearize-level-1">
                                                    <div class="ym-col1">
                                                        <div class="ym-cbox padtop9">
                                                            <div class="box-holder">
                                                                <div class="ym-form">
                                                                    <div class="addup">
                                                                        <h1>Opening Balance - Invoices</h1>
                                                                    </div>
                                                                    <div class="content vmiddle hmiddle">
                                                                        <table>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="reference_number">*Reference No.</label></td>
                                                                                <td class="obj">
                                                                                    <div class="grid ym-clearfix">
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="refNo" name="title" class="xxshort" />
                                                                                        </div>
                                                                                        <div class="col-left">
                                                                                            &nbsp;&nbsp;
                                                                                        </div>
                                                                                        <div class="col-left">
                                                                                            <input type="text" autocorrect="off" spellcheck="false" id="reference_number" name="reference_number" class="xxxmedium"/>
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
                                                                                    <label for="salesman">*Salesman</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow medium">
                                                                                        <select name="salesman" id="salesmanOpeningBalance">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="terms">*Terms</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow xxmedium">
                                                                                        <select name="terms" id="termOpeningBalance">
                                                                                            
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="amount">*Amount</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="xxmedium" value="0" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="balance">*Balance</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="BalanceOpeningBalance" name="balance" class="xxmedium"  value="0"/></td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ym-col3">
                                                        <div class="ym-cbox">
                                                            <ul class="sidebar sidelists2 crossfade scroll" id="ULOpeningBalance">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="xGeneralInfoOpeningBalancePayment" style="margin: 0 0 -10px 0; display: none;">
                                            <div class="container two-column-sidebar style2 withbg">
                                                <div class="ym-column linearize-level-1">
                                                    <div class="ym-col1">
                                                        <div class="ym-cbox padtop9">
                                                            <div class="box-holder">
                                                                <div class="ym-form">
                                                                    <div class="addup">
                                                                        <h1>Opening Balance - Payments</h1>
                                                                    </div>
                                                                    <div class="content vmiddle hmiddle">
                                                                        <table>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="bank_name">*Bank Name</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow long">
                                                                                        <select id="bank_name">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="check_number">*Check No.</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="check_number" name="check_number" class="medium" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="date">*Date</label></td>
                                                                                <td class="obj">
                                                                                    <div class="dp xxmedium">
                                                                                        <input type="text" autocorrect="off" spellcheck="false" id="checkDate" name="date" class="date" />
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="check_type">*Check Type</label></td>
                                                                                <td class="obj">
                                                                                    <div class="select-arrow xxmedium">
                                                                                        <select id="check_type">
                                                                                            <option value=""></option>
                                                                                        </select>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="lbl">
                                                                                    <label for="amount">*Amount</label></td>
                                                                                <td class="obj">
                                                                                    <input type="text" autocorrect="off" spellcheck="false" id="checkAmount" name="amount" class="xxmedium"  value="0"/></td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="ym-col3">
                                                        <div class="ym-cbox">
                                                            <ul class="sidebar sidelists2 crossfade scroll" id="UlPaymentOpening">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>

                    <!--asdasdasdasdasdasdasdasdsdasdasdasdasd-->

                    <div id="xSuppliersGeneralInfo" style="display: none">
                        <div class="container one-column one-column2 withbg">
                            <div class="inner">
                                <div class="box-holder box-holder2">
                                    <div id="content-holder">
                                        <div class="content vmiddle GeneralInfo">
                                            <div class="space40"></div>
                                            <div id="suppliers_suppliers_form" class="ym-form">
                                                <table style="width: auto; margin: 0 auto;">
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="supplier_name">*Supplier Name</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="supplier_name" name="supplier_name" value="" class="fullwidth" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl" valign="top">
                                                                        <label for="address">*Address</label></td>
                                                                    <td class="obj">
                                                                        <textarea id="address" name="address" autocorrect="off" spellcheck="false" class="fullwidth"></textarea></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="contact_person">Contact Person</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="contact_person" name="contact_person" value="" class="fullwidth" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="region_province">*Region Province</label></td>
                                                                    <td class="obj">
                                                                        <div class="select-arrow fullwidth">
                                                                            <select name="region_province" id="region_province" onchange="LoadMunicipalityPerRegion()">
                                                                                <option value="Abra">Abra</option>
                                                                                <option value="Agusan del Norte">Agusan del Norte</option>
                                                                                <option value="Agusan del Sur">Agusan del Sur</option>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="municipality">*Municipality</label></td>
                                                                    <td class="obj">
                                                                        <div class="select-arrow fullwidth">
                                                                            <select name="municipality" id="municipality">
                                                                                <option value=""></option>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="business_phone1">Business Phone 1</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="business_phone1" name="business_phone1" value="" class="fullwidth" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="business_phone1">Business Phone 2</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="business_phone2" name="business_phone2" value="" class="fullwidth" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="fax">Fax</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="fax" name="fax" value="" class="short" />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="mobile_phone">Mobile Phone</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="mobile_phone" name="mobile_phone" value="" class="short" />
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
                                                                    <td class="lbl">
                                                                        <label for="reference_initial">*Reference Initial</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="reference_initial" name="reference_initial" value="" class="short" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="tin_number">TIN No.</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="tin_number" name="tin_number" value="" class="fullwidth" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="vat_number">VAT No.</label></td>
                                                                    <td class="obj">
                                                                        <input type="text" autocorrect="off" spellcheck="false" id="vat_number" name="vat_number" value="" class="fullwidth" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="salesman">Salesman</label></td>
                                                                    <td class="obj">
                                                                        <div class="select-arrow fullwidth">
                                                                            <select name="salesman" id="salesman">
                                                                                <option value=""></option>
                                                                            </select>
                                                                        </div>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="terms">*Terms</label></td>
                                                                    <td class="obj">
                                                                        <div class="select-arrow short">
                                                                            <select name="terms" id="terms">
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <div class="horz-divider"></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="supplier_since">Supplier Since</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="supplier_since" name="supplier_since" value="" class="short" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="ave_payable">Ave. Payable</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="ave_payable" name="ave_payable" value="" class="short" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="last_invoice_date">Last Invoice Date</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_invoice_date" name="last_invoice_date" value="" class="short" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="last_invoice_amt">Last Invoice Amt</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_invoice_amt" name="last_invoice_amt" value="" class="short" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="last_payment_date">Last Payment Date</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_payment_date" name="last_payment_date" value="" class="short" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="last_payment_amt">Last Payment Amt</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="last_payment_amt" name="last_payment_amt" value="" class="short" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="total_cleared">Total Cleared</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_cleared" name="total_cleared" value="" class="short" disabled />
                                                                            </div>
                                                                            <div class="col-right">
                                                                                <label for="total_uncleared">Total Uncleared</label>
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="total_uncleared" name="total_uncleared" value="" class="short" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="lbl">
                                                                        <label for="balance">Balance</label></td>
                                                                    <td class="obj">
                                                                        <div class="grid ym-clearfix">
                                                                            <div class="col-left">
                                                                                <input type="text" autocorrect="off" spellcheck="false" id="balance" name="balance" value="" class="short" disabled />
                                                                            </div>
                                                                        </div>
                                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <div class="space10"></div>
                                                            <div class="ym-clearfix">
                                                                <div class="float-right">
                                                                    <button type="button" id="btn-opening-balance" class="submit small" onclick="LoadOpeningBalance();">Opening Balance</button>
                                                                </div>
                                                            </div>
                                                            <div class="space5"></div>
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

                    <div id="xSuppliersSupplierItem" style="display: none">
                        <div class="container one-column">
                            <div class="inner">
                                <div class="box-holder">
                                    <div class="content tabular">
                                        <table class="tblholder main unclickable">
                                            <thead>
                                                <tr>
                                                    <th width="28%">Product Name</th>
                                                    <th width="10%">Reference No.</th>
                                                    <th width="18%">Date of Last Purchase</th>
                                                    <th width="10%">Quantity</th>
                                                    <th width="10%">Unit</th>
                                                    <th width="15%">Cost Per Unit</th>
                                                    <th width="10%">Discount</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td width="28%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="18%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="15%">here</td>
                                                    <td width="10%">here</td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
                                                </tr>
                                                <tr>
                                                    <td width="28%"></td>
                                                    <td width="10%"></td>
                                                    <td width="18%"></td>
                                                    <td width="10%"></td>
                                                    <td width="10%"></td>
                                                    <td width="15%"></td>
                                                    <td width="10%"></td>
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

                    <div id="xSuppliersPurchaseOrder" style="display: none">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenSuppliersSubMenuPurchaseOrderAll()"><a href="#suboption-all">All</a></li>
                            <li><a href="#suboption-open" onclick="OpenSuppliersSubMenuPurchaseOrderOpen()">Open</a></li>
                            <li><a href="#suboption-closed" onclick="OpenSuppliersSubMenuPurchaseOrderClosed()">Closed</a></li>
                        </ul>
                        <div id="xSuppliersPurchaseOrderAll()" style="display: block">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div1">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="12%">Delivery Date</th>
                                                            <th width="12%">Cancel Date</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                            <th width="12%">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">herea</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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
                        <div id="xSuppliersPurchaseOrderOpen()" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div6">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="12%">Delivery Date</th>
                                                            <th width="12%">Cancel Date</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                            <th width="12%">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">heres</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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
                        <div id="xSuppliersPurchaseOrderClosed()" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div7">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="12%">Delivery Date</th>
                                                            <th width="12%">Cancel Date</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                            <th width="12%">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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

                    <div id="xSuppliersInvoice" style="display: none">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenSuppliersSubMenuInvoiceAll()"><a href="#suboption-all">All</a></li>
                            <li><a href="#suboption-paid" onclick="OpenSuppliersSubMenuInvoicePaid()">Paid</a></li>
                            <li><a href="#suboption-unpaid" onclick="OpenSuppliersSubMenuInvoiceUnpaid()">Unpaid</a></li>
                        </ul>
                        <div id="xSuppliersInvoiceAll" style="display: block">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div5">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable" id="xPurchaseList_table">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="25%">Salesman</th>
                                                            <th width="10%">Days</th>
                                                            <th width="10%">Amount</th>
                                                            <th width="10%">Balance</th>
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
                        <div id="xSuppliersInvoicePaid" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div8">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Transaction Type</th>
                                                            <th width="25%">Salesman</th>
                                                            <th width="10%">Days</th>
                                                            <th width="10%">Amount</th>
                                                            <th width="10%">Balance</th>
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
                        <div id="xSuppliersInvoiceUnpaid" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div9">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Transaction Type</th>
                                                            <th width="25%">Salesman</th>
                                                            <th width="10%">Days</th>
                                                            <th width="10%">Amount</th>
                                                            <th width="10%">Balance</th>
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

                    <div id="xSuppliersPayments" style="display: none">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenSuppliersSubMenuPaymentsCash()"><a href="#suboption-cash">Cash</a></li>
                            <li><a href="#suboption-check" onclick="OpenSuppliersSubMenuPaymentsCheck">Check</a></li>
                            <li><a href="#suboption-card" onclick="OpenSuppliersSubMenuPaymentsCard">Card</a></li>
                        </ul>
                        <div id="xSuppliersPaymentsCash" style="display: block">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div2">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="20%">Reference No.</th>
                                                            <th width="20%">Date</th>
                                                            <th width="20%">Voucher Amount</th>
                                                            <th width="20%">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="20%">here</td>
                                                            <td width="20%">here</td>
                                                            <td width="20%">here</td>
                                                            <td width="20%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
                                                            <td width="20%"></td>
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
                        <div id="xSuppliersPaymentsCheck" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div4">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="10%">Reference No.</th>
                                                            <th width="10%">Date</th>
                                                            <th width="12%">Voucher Amount</th>
                                                            <th width="18%">Bank Name</th>
                                                            <th width="10%">Check No.</th>
                                                            <th width="10%">Check Date</th>
                                                            <th width="10%">Check Type</th>
                                                            <th width="10%">Amount</th>
                                                            <th width="10%">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="18%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                            <td width="10%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="12%"></td>
                                                            <td width="18%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
                                                            <td width="10%"></td>
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
                        <div id="xSuppliersPaymentsCard" style="display: none">
                            <div class="content tabular">
                                <table class="tblholder main unclickable">
                                    <thead>
                                        <tr>
                                            <th width="10%">Reference No.</th>
                                            <th width="10%">Date</th>
                                            <th width="12%">Voucher Amount</th>
                                            <th width="12%">Card Type</th>
                                            <th width="10%">Card Number</th>
                                            <th width="10%">Expiration Date</th>
                                            <th width="10%">Approval Code</th>
                                            <th width="10%">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody class="scroll">
                                        <tr>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                            <td width="12%">here</td>
                                            <td width="12%">here</td>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                            <td width="10%">here</td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                        <tr>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="12%"></td>
                                            <td width="12%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                            <td width="10%"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="addup">
                                <div class="space20"></div>
                            </div>
                        </div>
                    </div>

                    <div id="xSuppliersMemo" style="display: none">
                        <ul class="suboptions">
                            <li class="active" onclick="OpenSuppliersSubMenuMemoAll()"><a href="#suboption-all">All</a></li>
                            <li><a href="#suboption-debit" onclick="OpenSuppliersSubMenuMemoDebit()">Debit</a></li>
                            <li><a href="#suboption-credit" onclick="OpenSuppliersSubMenuMemoCredit()">Credit</a></li>
                        </ul>
                        <div id="xSuppliersMemoAll" style="display: block">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div3">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Memo Type</th>
                                                            <th width="25%">Account Name</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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
                        <div id="xSuppliersMemoDebit" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div10">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Memo Type</th>
                                                            <th width="25%">Account Name</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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
                        <div id="xSuppliersMemoCredit" style="display: none">
                            <div class="container one-column">
                                <div class="inner">
                                    <div class="box-holder">
                                        <div id="Div11">
                                            <div class="content tabular">
                                                <table class="tblholder main unclickable">
                                                    <thead>
                                                        <tr>
                                                            <th width="12%">Reference No.</th>
                                                            <th width="12%">Date</th>
                                                            <th width="15%">Memo Type</th>
                                                            <th width="25%">Account Name</th>
                                                            <th width="12%">Amount</th>
                                                            <th width="12%">Balance</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="scroll">
                                                        <tr>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="15%">here</td>
                                                            <td width="25%">here</td>
                                                            <td width="12%">here</td>
                                                            <td width="12%">here</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
                                                            <td width="15%"></td>
                                                            <td width="25%"></td>
                                                            <td width="12%"></td>
                                                            <td width="12%"></td>
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

                    <!--asdasdasdasdasfsdfasdfsdfdsadfsafasdfasdf-->
                </div>
            </div>
        <%--</div>--%>

        <%--<div id="xSuppliersSubMenu" style="display: none">
            <div class="ym-wrapper">
                <div class="ym-wbox">
                    

                    <input id="hdn_supplier_id" value="0" type="hidden" />
                    <input id="hdnPurchasedID" value="0" type="hidden" />

                    


                </div>
            </div>
        </div>--%>
    </div>
    <script src="Script/Supplier.js"></script>
    <script type="text/javascript">

        var RegionAutoCompleteData = <%= SelectRegion() %>




        LoadSupplierList();

        function OpenSuppliers() {
            $('#xSuppliers').show();
            $('#xSuppliersSubMenu').hide();
        }
        function OpenSuppliersSubMenu() {
            $('#xSupplierInfoList').hide();
            $('#xSuppliersGeneralInfo').show();
        }
        function OpenSuppliersSubMenuGeneralInfo() {
            //$('#xSupplierInfoList').show();
            $('#xSuppliersGeneralInfo').show();
            $('#xSuppliersSupplierItem').hide();
            $('#xSuppliersPurchaseOrder').hide();
            $('#xSuppliersInvoice').hide();
            $('#xSuppliersPayments').hide();
            $('#xSuppliersMemo').hide();
            $('#NextPageID').show();
            
            $('#supplier_action .save').removeClass('disabled');
            $('#supplier_action .new').addClass('disabled');
            $('#supplier_action .find').addClass('disabled');
            $('#supplier_action .delete').addClass('disabled');

        }
        function OpenSuppliersSubMenuSupplierItem() {
            $('#xSupplierInfoList').hide();
            $('#xSuppliersGeneralInfo').hide();
            $('#xSuppliersSupplierItem').show();
            $('#xSuppliersPurchaseOrder').hide();
            $('#xSuppliersInvoice').hide();
            $('#xSuppliersPayments').hide();
            $('#xSuppliersMemo').hide();
            $('#NextPageID').show();
            $('#supplier_action .save').addClass('disabled');
            $('#supplier_action .new').removeClass('disabled');
            $('#supplier_action .find').removeClass('disabled');
            $('#supplier_action .delete').removeClass('disabled');
        }
        function OpenSuppliersSubMenuPurchaseOrder() {
            $('#xSupplierInfoList').hide();
            $('#xSuppliersGeneralInfo').hide();
            $('#xSuppliersSupplierItem').hide();
            $('#xSuppliersPurchaseOrder').show();
            $('#xSuppliersInvoice').hide();
            $('#xSuppliersPayments').hide();
            $('#xSuppliersMemo').hide();
            $('#NextPageID').hide();
            $('#supplier_action .save').addClass('disabled');
            $('#supplier_action .new').removeClass('disabled');
            $('#supplier_action .find').removeClass('disabled');
            $('#supplier_action .delete').removeClass('disabled');
        }
        function OpenSuppliersSubMenuPurchaseOrderAll() {
            $('#xSuppliersPurchaseOrderAll').show();
            $('#xSuppliersPurchaseOrderOpen').hide();
            $('#xSuppliersPurchaseOrderClosed').hide();
            $('#NextPageID').hide();
        }
        function OpenSuppliersSubMenuPurchaseOrderOpen() {
            $('#xSuppliersPurchaseOrderAll').hide();
            $('#xSuppliersPurchaseOrderOpen').show();
            $('#xSuppliersPurchaseOrderClosed').hide();
            $('#NextPageID').hide();
        }
        function OpenSuppliersSubMenuPurchaseOrderClosed() {
            $('#xSuppliersPurchaseOrderAll').hide();
            $('#xSuppliersPurchaseOrderOpen').hide();
            $('#xSuppliersPurchaseOrderClosed').show();
            $('#NextPageID').hide();
        }

        function OpenSuppliersSubMenuInvoice() {
            $('#xSupplierInfoList').hide();
            $('#xSuppliersGeneralInfo').hide();
            $('#xSuppliersSupplierItem').hide();
            $('#xSuppliersPurchaseOrder').hide();
            $('#xSuppliersInvoice').show();
            $('#xSuppliersPayments').hide();
            $('#xSuppliersMemo').hide();
            $('#NextPageID').hide();
            $('#supplier_action .save').addClass('disabled');
            $('#supplier_action .new').removeClass('disabled');
            $('#supplier_action .find').removeClass('disabled');
            $('#supplier_action .delete').removeClass('disabled');
        }
        function OpenSuppliersSubMenuInvoiceAll() {
            $('#xSuppliersInvoiceAll').show();
            $('#xSuppliersInvoicePaid').hide();
            $('#xSuppliersInvoiceUnpaid').hide();
        }
        function OpenSuppliersSubMenuInvoicePaoid() {
            $('#xSuppliersInvoiceAll').hide();
            $('#xSuppliersInvoicePaid').show();
            $('#xSuppliersInvoiceUnpaid').hide();
        }
        function OpenSuppliersSubMenuInvoiceUnpaid() {
            $('#xSuppliersInvoiceAll').hide();
            $('#xSuppliersInvoicePaid').hide();
            $('#xSuppliersInvoiceUnpaid').show();
        }

        function OpenSuppliersSubMenuPayments() {
            $('#xSupplierInfoList').hide();
            $('#xSuppliersGeneralInfo').hide();
            $('#xSuppliersSupplierItem').hide();
            $('#xSuppliersPurchaseOrder').hide();
            $('#xSuppliersInvoice').hide();
            $('#xSuppliersPayments').show();
            $('#xSuppliersMemo').hide();
            $('#NextPageID').hide();
            $('#supplier_action .save').addClass('disabled');
            $('#supplier_action .new').removeClass('disabled');
            $('#supplier_action .find').removeClass('disabled');
            $('#supplier_action .delete').removeClass('disabled');
        }
        function OpenSuppliersSubMenuPaymentsCash() {
            $('#xSuppliersPaymentsCash').show();
            $('#xSuppliersPaymentsCheck').hide();
            $('#xSuppliersPaymentsCard').hide();
        }
        function OpenSuppliersSubMenuPaymentsCheck() {
            $('#xSuppliersPaymentsCash').hide();
            $('#xSuppliersPaymentsCheck').show();
            $('#xSuppliersPaymentsCard').hide();
        }
        function OpenSuppliersSubMenuPaymentsCard() {
            $('#xSuppliersPaymentsCash').hide();
            $('#xSuppliersPaymentsCheck').hide();
            $('#xSuppliersPaymentsCard').show();
        }

        function OpenSuppliersSubMenuMemo() {
            $('#xSupplierInfoList').hide();
            $('#xSuppliersGeneralInfo').hide();
            $('#xSuppliersSupplierItem').hide();
            $('#xSuppliersPurchaseOrder').hide();
            $('#xSuppliersInvoice').hide();
            $('#xSuppliersPayments').hide();
            $('#xSuppliersMemo').show();

            $('#supplier_action .save').addClass('disabled');
            $('#supplier_action .new').removeClass('disabled');
            $('#supplier_action .find').removeClass('disabled');
            $('#supplier_action .delete').removeClass('disabled');
        }
        function OpenSuppliersSubMenuMemoAll() {
            $('#xSuppliersMemoAll').show();
            $('#xSuppliersMemoDebit').hide();
            $('#xSuppliersMemoCredit').hide();
        }
        function OpenSuppliersSubMenuMemoDebit() {
            $('#xSuppliersMemoAll').hide();
            $('#xSuppliersMemoDebit').show();
            $('#xSuppliersMemoCredit').hide();
        }
        function OpenSuppliersSubMenuMemoCredit() {
            $('#xSuppliersMemoAll').hide();
            $('#xSuppliersMemoDebit').hide();
            $('#xSuppliersMemoCredit').show();
        }
    </script>

</asp:Content>
