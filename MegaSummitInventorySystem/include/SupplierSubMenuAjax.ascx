﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupplierSubMenuAjax.ascx.cs" Inherits="MegaSummitInventorySystem.include.SupplierSubMenuAjax" %>
<div class="submenu ajax padding-0">
	<ul class="crossfade ym-clearfix">
        <li class=" "><a data="aspnetSupplierInformation.aspx" onclick="Redirect('aspnetSupplierInformation.aspx')" style="cursor:default">General Info</a></li>
        <li class=" "><a data="aspnetSupplierInformationSupplierItem.aspx" onclick="Redirect('aspnetSupplierInformationSupplierItem.aspx')" style="cursor:default">Supplier Items</a></li>
        <li class=" "><a data="aspnetSupplierInformationPurchasedOrder.aspx" onclick="Redirect('aspnetSupplierInformationPurchasedOrder.aspx')" style="cursor:default">Purchase Order</a></li>
        <li class=" "><a data="aspnetSupplierInformationInvoices.aspx" onclick="Redirect('aspnetSupplierInformationInvoices.aspx')" style="cursor:default">Invoices</a></li>
        <li class=" "><a data="aspnetSupplierInformationPayments.aspx" onclick="Redirect('aspnetSupplierInformationPayments.aspx')" style="cursor:default">Payments</a></li>
        <li class=" "><a data="aspnetSupplierInformationPayments.aspx" onclick="Redirect('xxxx')" style="cursor:default">Memo</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>
</div>

<%--<script src="Script/Helper.js"></script>--%>

<script type="text/javascript">

    /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
    //--------Need refactoring----------


    $(document).ready(function () {

        $(".crossfade > li").each(function (index) {

            var active = $(this).find("a").attr("data");

            if (getCurentFileName() == active) {
                $(this).addClass("active form");
            }
            else {
                $(this).addClass("view");
            }

        });

    });

    function getCurentFileName() {
        var pagePathName = window.location.pathname;
        return pagePathName.substring(pagePathName.lastIndexOf("/") + 1);
    }


    function Redirect(location) {

        var helper = new Helper();

        var SupplierID = Number(helper.GetQuerystring()["supplierID"]);
        if ($.isNumeric(SupplierID) || SupplierID > 0) {
            window.location = location + "?supplierID=" + SupplierID;
        }


    }

</script>


