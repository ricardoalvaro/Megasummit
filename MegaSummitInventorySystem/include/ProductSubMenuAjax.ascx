<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductSubMenuAjax.ascx.cs" Inherits="MegaSummitInventorySystem.include.ProductSubMenuAjax" %>
<div class="submenu ajax ">
	<ul class="crossfade ym-clearfix">
        <li class=" "><a data="aspnetProductInformation.aspx" onclick="Redirect('aspnetProductInformation.aspx')" >General Info</a></li>
        <li class=" "><a data="aspnetProductInformationStockCard.aspx" onclick="Redirect('aspnetProductInformationStockCard.aspx')" >Stock Cards</a></li>
        <li class=" "><a data="aspnetProductInformationCustomerItem.aspx" onclick="Redirect('aspnetProductInformationCustomerItem.aspx')">Customer Items</a></li>
        <li class=" "><a data="aspnetProductInformationSupplierItem.aspx" onclick="Redirect('aspnetProductInformationSupplierItem.aspx')">Supplier Items</a></li>
        <li class=" "><a data="aspnetProductInformationLocation.aspx" onclick="Redirect('aspnetProductInformationLocation.aspx')">Location</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>
</div>

<script type="text/javascript">

    /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
    //--------Need refactoring----------


    $(document).ready(function () {

        //alert(getCurentFileName());

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


    function Redirect(location)
    {

        var helper = new Helper();

       var  ProductID = Number(helper.GetQuerystring()["productID"]);
        if ($.isNumeric(ProductID) || ProductID > 0) {
            window.location = location + "?productID=" + ProductID;
        }

       
    }

</script>