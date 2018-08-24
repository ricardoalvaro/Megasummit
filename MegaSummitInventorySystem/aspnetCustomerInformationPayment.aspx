<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerInformationPayment.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerInformtaionPayment" %>
<%@ Register src="include/CustomerSubMenuAjax.ascx" tagname="CustomerSubMenuAjax" tagprefix="uc1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
    <div id="main" class="customer-customers">
        <div class="ym-wrapper">    	   	
            <div class="ym-wbox"> 
       <uc1:CustomerSubMenuAjax ID="CustomerSubMenuAjax1" class="nopad" runat="server" />
  
                       <ul class="suboptions">
            <li class="active"><a href="javascript:void(0)" onclick="LoadCash()">Cash</a></li>
            <li><a href="javascript:void(0)" onclick="LoadCheck()">Check</a></li>
            <li><a href="javascript:void(0)" onclick="LoadCreditCard()">Card</a></li>
        </ul>
        <div class="container one-column">
            <div class="inner">                    	
                <div class="box-holder"> 
                    <div id="content-holder">
                    	<div class="content tabular">                            	
                            <table class="tblholder main unclickable" id="tblMain">
                               <%-- <thead>
                                    <tr>
                                        <th width="20%">Reference No.</th>
                                        <th width="20%">Date</th>
                                        <th width="20%">O.R. Amount</th>
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
                                
                                </tbody>--%>
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

        $(document).ready(function(){
            LoadCash();
        });

        function LoadCash()
        {
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
            $('#tblMain').append("<thead> <tr> <th width='20%'>Reference No.</th><th width='20%'>Date</th><th width='20%'>Bank</th><th width='20%'>Check No</th><th width='20%'>Check Data</th><th width='20%'>O.R. Amount</th><th width='20%'>Amount</th></tr></thead>");
            $('#tblMain').append("<tbody class='scroll'>");

            for (var i = 0; i < data.length; i++) {
                $('#tblMain').append("<tr><td width='20%'>" + data[i]['RefNo'] + "</td><td width='20%'>" + FormatDate(data[i]['CreatedDate']) + "</td><td width='20%'>" + data[i]['BankName'] + "</td><td width='20%'>" + data[i]['CheckNo'] + "</td><td width='20%'>" + FormatDate(data[i]['CheckDate']) + "</td><td width='20%'>" + data[i]['ORAmount'] + "</td><td width='20%'>" + data[i]['CashAmount'] + "</td></tr>");
            }

            $('#tblMain').append("</tbody></table>");
            LoadExtraTR();
        }

        function LoadCreditCard() {
            var data = creditData;

            $('#tblMain').empty();
            $('#tblMain').append("<thead> <tr> <th width='20%'>Reference No.</th><th width='20%'>Date</th><th width='20%'>Card Type</th><th width='20%'>Card No</th><th width='20%'>Name</th><th width='20%'>Expiry</th><th width='20%'>Code</th><th width='20%'>O.R. Amount</th><th width='20%'>Amount</th></tr></thead>");
            $('#tblMain').append("<tbody class='scroll'>");

            for (var i = 0; i < data.length; i++) {
                $('#tblMain').append("<tr><td width='20%'>" + data[i]['RefNo'] + "</td><td width='20%'>" + FormatDate(data[i]['CreatedDate']) + "</td><td width='20%'>" + data[i]['CardType'] + "</td><td width='20%'>" + data[i]['CardNumber'] + "</td><td width='20%'>" + data[i]['NameOnCard'] + "</td><td width='20%'>" + data[i]['Expiration'] + "</td><td width='20%'>" + data[i]['ApprovalCode'] + "</td><td width='20%'>" + data[i]['ORAmount'] + "</td><td width='20%'>" + data[i]['CashAmount'] + "</td></tr>");
            }

            $('#tblMain').append("</tbody></table>");
            LoadExtraTR();
        }

        function LoadExtraTR()
        {

            for (var i = 0; i < 50; i++) {
                $('#tblMain tbody').append("<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>");
            }
           
        }

        var cashData = <%= OfficialReceiptVM.CashPayment(long.Parse( (Request["customerID"] == null ? "0" : Request["customerID"])  ))%>;
        var checkData = <%= OfficialReceiptVM.CheckPayment(long.Parse( (Request["customerID"] == null ? "0" : Request["customerID"])  ))%>;
        var creditData = <%= OfficialReceiptVM.CreditCardPayment(long.Parse( (Request["customerID"] == null ? "0" : Request["customerID"])  ))%>;
    </script>

    <style>
        .padding-0 {
            padding: 0;
        }
    </style>
</asp:Content>
