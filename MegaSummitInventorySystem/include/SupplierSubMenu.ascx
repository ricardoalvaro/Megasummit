<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SupplierSubMenu.ascx.cs" Inherits="MegaSummitInventorySystem.include.SupplierSubMenu" %>
<%@ Register src="GenericControl.ascx" tagname="GenericControl" tagprefix="uc1" %>
<div id="subheader">
    <div class="ym-wrapper">
    	<div class="ym-wbox">
        	<!-- Start of Two Grids -->
            <div class="ym-grid linearize-level-1">
                <div class="block-left ym-gl">
                    <div class="ym-gbox">
                        <ul class="menu ym-clearfix">
                            <li class=""><a href="aspnetSupplier.aspx">Supplier</a></li>
                            <li class=""><a href="aspnetPurchaseInvoice.aspx">Purchase</a></li>
                            <li class=""><a href="aspnetPurchaseReturn.aspx">Purchase Return</a></li>
                            <li class=""><a href="aspnetPurchaseOrder.aspx">Purchase Order</a></li>
                            <li class=""><a href="aspnetVoucher.aspx">Voucher</a></li>	
                            <li class=""><a href="#">Memo</a></li>	
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>
                </div>
                <uc1:GenericControl ID="GenericControl1" runat="server" />
            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div>



<script type="text/javascript">

    /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
    //--------Need refactoring----------


    $(document).ready(function () {

        //alert(getCurentFileName());

        $(".menu > li").each(function (index) {

            var active = $(this).find("a").attr("href");

            if (getCurentFileName() == active) {
                $(this).addClass("active");
            }
            else {
                $(this).removeClass("active");
            }

        });

    });

    function getCurentFileName() {
        var pagePathName = window.location.pathname;
        return pagePathName.substring(pagePathName.lastIndexOf("/") + 1);
    }


</script>
