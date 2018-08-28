<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetPurchaseOrder.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetPurchaseOrder" %>
<%@ Register src="include/SupplierSubMenu.ascx" tagname="SupplierSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:SupplierSubMenu ID="SupplierSubMenu1" runat="server" />


     <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="container one-column">
       			<div class="inner">                    	
                    <div class="box-holder">
                        <div class="addup">
                          <div class="pagination">
                               
                            </div>
                        </div>
                        <div class="content tabular">                            	
                            <table class="tblholder main" >
                                <thead>
                                    <tr>
                                        <th width="10%">Reference No.</th>
                                        <th width="10%">Date</th>
                                        <th width="25%">Supplier Name</th>
                                        <th width="10%">Date</th>
                                        <th width="10%">Cancel Date</th>
                                        <th width="10%">Amount</th>
                                        <th width="10%">Balance</th>
                                        <th width="10%">Status</th>
                                    </tr>
                                </thead>
                                <tbody class="scroll" id="tblMain">
                                    <asp:Repeater runat="server" ID="repList">
                                        <ItemTemplate>
                                            <tr id="rec-1" onclick="RedirectToGeneralInfomation(<%# Eval("ID") %>)" >
                                                <td width="10%"><%# Eval("RefNo").ToString() %></td>
                                                <td width="10%"><%# DateTime.Parse(Eval("Date").ToString()).ToString("MM/dd/yyyy") %></td>
                                                <td width="25%"><%# Eval("SupplierName").ToString() %></td>
                                                <td width="10%"><%# DateTime.Parse(Eval("Date").ToString()).ToString("MM/dd/yyyy") %></td>
                                                <td width="10%"><%# Eval("CancelDate") %></td>
                                                <td width="10%"><%# Decimal.Parse(Eval("Amount").ToString()).ToString("N") %></td>
                                                <td width="10%"><%# Decimal.Parse(Eval("Balance").ToString()).ToString("N") %></td>
                                                   <td width="10%"><%# Eval("Status").ToString() %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                           </table>	
                        </div>
                        <div class="addup"><div class="space20"></div></div>
                    </div>
                </div>	
            </div>	
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            $('#btn-new').removeClass('disabled');
            //$('#btn-find').removeClass('disabled');
            var table = $("#tblMain");
            table.append(defaultTableRow());


            $("#btn-new").click(function () {
                window.location = "aspnetPurchaseOrderInformation.aspx";
            });

        });


        //$("#btn-find").click(function () {
        //    var table = $("#tblMain");
        //    table.html(""); //Clear 

        //    table.append("<tr id='rec-1'><td width='100%'><input type='text'  id='txt_search_customer'  class='long search_class ui-autocomplete-input' style='border:transparent' /></td></tr>");

        //    table.append(defaultTableRow());

        //    CustomerAutoCompleteByName();
        //});

        function CustomerAutoCompleteByName() {
            var pageUrl = '/Webservice/svr_Supplier.asmx';
            $.ajax({
                type: "POST", url: pageUrl + "/AutoCompleteSupplier", data: "{  }", contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (response) {
                    $("#txt_search_customer").autocomplete({
                        source: response.d, minLength: 0, minChars: 0, max: 12, autoFill: true, matchContains: false
                    }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
                }, error: function (response) { alert(response.status); }

            });


            $("#txt_search_customer").autocomplete({
                select: function (a, b) {

                    RedirectToGeneralInfomation(b.item.id)
                }
            });
        }

        function defaultTableRow() {

            var temp = "<tr>   <td width='100%'></td></tr>";
            var result = "";

            for (var i = 0; i < 30; i++) {
                result += temp;
            }

            return result;
        }

        function RedirectToGeneralInfomation(purchase_order_id) {
            window.location = "aspnetPurchaseOrderInformation.aspx?purchaseOrderID=" + purchase_order_id;
        }

    </script>



</asp:Content>
