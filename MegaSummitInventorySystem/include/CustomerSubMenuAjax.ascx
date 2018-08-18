<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerSubMenuAjax.ascx.cs" Inherits="MegaSummitInventorySystem.include.CustomerSubMenuAjax" %>
<div class="submenu ajax padding-0">
	<ul class="crossfade ym-clearfix">
        <li class=" "><a data="aspnetCustomerInformation.aspx" onclick="Redirect('aspnetCustomerInformation.aspx')" style="cursor:default">General Info</a></li>
        <li class=" "><a data="aspnetCustomerInformationCustomerItem.aspx" onclick="Redirect('aspnetCustomerInformationCustomerItem.aspx')" style="cursor:default">Customer Items</a></li>
        <li class=" "><a data="aspnetCustomerInformationSalesOrder.aspx" onclick="Redirect('aspnetCustomerInformationSalesOrder.aspx')" style="cursor:default">Sales Order</a></li>
        <li class=" "><a data="aspnetCustomerInformationInvoices.aspx" onclick="Redirect('aspnetCustomerInformationInvoices.aspx')" style="cursor:default">Invoices</a></li>
        <li class=" "><a data="aspnetCustomerInformationPayment.aspx" onclick="Redirect('aspnetCustomerInformationPayment.aspx')" style="cursor:default">Payments</a></li>
        <li class=" "><a data="aspnetCustomerInformationMemo.aspx" onclick="Redirect('aspnetCustomerInformationMemo.aspx')" style="cursor:default">Memo</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>
</div>

<script src="Script/Helper.js"></script>

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

        var CustomerID = Number(helper.GetQuerystring()["customerID"]);
        if ($.isNumeric(CustomerID) || CustomerID > 0) {
            window.location = location + "?customerID=" + CustomerID;
        }


    }

</script>