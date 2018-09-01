<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierInformationPayments.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetaspnetSupplierInformationPayments" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<%@ Register src="include/SupplierSubMenuAjax.ascx" tagname="SupplierSubMenuAjax" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
     <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />

    <div id="main" class="suppliers-suppliers">
    <div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
         <uc2:SupplierSubMenuAjax ID="SupplierSubMenuAjax1" runat="server" />

        <div class="padding-0">
            <ul class="suboptions">
                <li><a href="javascript:void(0)" onclick="LoadCash()">Cash</a></li>
                <li><a href="javascript:void(0)" onclick="LoadCheck()">Check</a></li>
            </ul>
        <div class="ym-ie-clearing">&nbsp;</div>
        </div>

        
        <div class="container one-column" >
            <div class="inner">                    	
                <div class="box-holder"> 
                    <div id="content-holder">
                    	<div class="content tabular">                            	
                            <table class="tblholder main unclickable" id="tblMain">
                             
                           </table>	
                        </div>
                        <div class="addup"><div class="space20"></div></div>
                    </div>
                </div>
            </div>      			
        </div>	
        	
    </div>
</div>
    </div>


    <script type="text/javascript">

        $(document).ready(function () {
            LoadCash();
        });


        function LoadCash() {
            var data = cashData;

            $('#tblMain').empty();
            $('#tblMain').append("<thead> <tr> <th width='20%'>Reference No.</th><th width='20%'>Date</th><th width='20%'>O.R. Amount</th><th width='20%'>Amount</th></tr></thead>");
            $('#tblMain').append("<tbody class='scroll'>");

            for (var i = 0; i < data.length; i++) {
                $('#tblMain').append("<tr><td width='20%'>" + data[i]['RefNo'] + "</td><td width='20%'>" + FormatDate(data[i]['CreatedDate']) + "</td><td width='20%'>" + data[i]['ORAmount'] + "</td><td width='20%'>" + data[i]['CashAmount'] + "</td></tr>");
            }

            $('#tblMain').append("</tbody></table>");
            LoadExtraTR();

        }


        function LoadCheck() {
            var data = checkData;

            $('#tblMain').empty();
            $('#tblMain').append("<thead> <tr> <th width='15%'>Reference No.</th><th width='20%'>Date</th><th width='15%'>Bank</th><th width='15%'>Check No</th><th width='15%'>Check Data</th><th width='15%'>O.R. Amount</th><th width='10%'>Amount</th></tr></thead>");
            $('#tblMain').append("<tbody class='scroll'>");

            for (var i = 0; i < data.length; i++) {
                $('#tblMain').append("<tr><td width='15%'>" + data[i]['RefNo'] + "</td><td width='15%'>" + FormatDate(data[i]['CreatedDate']) + "</td><td width='15%'>" + data[i]['BankName'] + "</td><td width='15%'>" + data[i]['CheckNo'] + "</td><td width='15%'>" + FormatDate(data[i]['CheckDate']) + "</td><td width='15%'>" + data[i]['ORAmount'] + "</td><td width='10%'>" + data[i]['CheckAmount'] + "</td></tr>");
            }

            $('#tblMain').append("</tbody></table>");
            LoadExtraTR();
        }

        function LoadExtraTR() {

            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody').append("<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
            }

        }

        var cashData = <%= PurchasePaymentVM.CashPayment(long.Parse( (Request["supplierID"] == null ? "0" : Request["supplierID"])  ))%>;
        var checkData = <%= PurchasePaymentVM.CheckPayment(long.Parse( (Request["supplierID"] == null ? "0" : Request["supplierID"])  ))%>;

    </script>


 <style>
        .padding-0 {
            padding: 0;
        }
        .tblholder .scroll {
    height: 460px;
}
    </style>
</asp:Content>
