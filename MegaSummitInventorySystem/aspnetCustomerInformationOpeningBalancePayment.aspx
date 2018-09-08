<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerInformationOpeningBalancePayment.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerInformationOpeningBalancePayment" %>
<%@ Register src="include/CustomerSubMenuAjax.ascx" tagname="CustomerSubMenuAjax" tagprefix="uc1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />

    <div id="main" class="customer-customers">
       <div class="ym-wrapper">    	   	
    <div class="ym-wbox"> 
        <div class="submenu ajax padding-0">
<uc1:CustomerSubMenuAjax ID="CustomerSubMenuAjax1" runat="server" />
    <div class="ym-ie-clearing">&nbsp;</div>
</div>        <ul class="suboptions">
            <li class="form" id="goto_invoice"><a href="#">Invoices</a></li>
            <li class="form active" id="goto_payment"><a href="#">Payments</a></li>
        </ul>
        <div id="content-holder">
        	<div class="container two-column-sidebar style2 withbg">
                <div class="ym-column linearize-level-1">
                    <div class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                              <div name="customer_customers_opening_balance_invoice_form" id="customer_customers_opening_balance_invoice_form" method="POST" class="ym-form">
                                <div class="addup">
                                    <h1>Opening Balance - Payments</h1>
                                </div>
                                <div class="content vmiddle">                                        
                                    <table>
                            <tbody><tr>
                                <td class="lbl"><label for="bank_name">*Bank Name</label></td>
                                <td class="obj">
                                    <input type="text" class="long" spellcheck="false" id="bank" value="" />
                                </td>
                            </tr>
                            <tr>
                                <td class="lbl"><label for="check_number">*Check No.</label></td>
                                <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="check_number" name="check_number" class="medium"></td>
                            </tr>
                            <tr>
                                <td class="lbl"><label for="date">*Date</label></td>
                                <td class="obj">
                                    <div class="dp xxmedium">
                                        <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date">
                                    </div>
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="lbl"><label for="amount">*Amount</label></td>
                                <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="xxmedium"></td>
                            </tr>                   
                        </tbody></table>
                                </div>
                              </div>
                            </div>
                        </div>
                    </div>
                    <div class="ym-col3">
                    <div class="ym-cbox"> 
    	                <ul class="sidebar sidelists2 crossfade scroll" id="ulCustomer">
                 
                        </ul>
                    </div>
                </div>                

                </div>		
            </div>
        </div>
    </div>
</div>
    </div>
    
    <style>
        .padding-0 {
            padding: 0;
        }
    </style>

    <script type="text/javascript">
        /// <reference path="js/jquery-3.3.1.slim.min.js" />
        //--------Need refactoring----------

        var CustomerID = 0;
        var BankID = 0;
        var helper = new Helper();


        $(document).ready(function () {

            

            CustomerID = Number(helper.GetQuerystring()["customerID"]);
            if (!$.isNumeric(CustomerID) || CustomerID <= 0) {
                CustomerID = 0;

            }

            $('#goto_invoice').click(function(){ window.location='aspnetCustomerInformationOpeningBalance.aspx?customerID=' + CustomerID });
            $('#goto_payment').click(function(){ window.location='aspnetCustomerInformationOpeningBalancePayment.aspx?customerID=' + CustomerID });

            $(':input').on('input', function () { // do not allow single quote and double quote 
                this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
            });

            Fill();

            $('#btn-save').removeClass('disabled').click(function () {
                SaveOpeningBalance(this);
            });


            $('#btn-new').click(function () {
                if ($(this).hasClass("disabled") == false) {
                    location.reload();
                }
            });

            if (CustomerID > 0) {
                FillCustomerOpeningBalance();
            }

        });

        function FillCustomerOpeningBalance()
        {
            //SelectCustomerOpeningBalance(ID,CustomerID)


            
            var customer_id = CustomerID;

            var pageUrl = '/Webservice/svr_Customer.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectCustomerOpeningBalance",
                data: "{ 'ID':'" + 0 + "' , 'customerID':'" + customer_id + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    $('#ulCustomer').empty();
                    var data = eval(response.d);

                    for (var i = 0; i < data.length; i++) {
                        $("#ulCustomer").append(ListInvoiceOpeningBalance(data[i]["ID"], data[i]['BankName'], data[i]['CheckNo'], data[i]['Amount']));
                    }

                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }

                
        function ListInvoiceOpeningBalance(id, bank_name, check_no, amount) {
            return "<li><a href='javascript:void(0);'  id='item-1' onclick=\"SelectSingleOpeningBalance('" + id + "')\"><span class='name'>" + bank_name + "<span class='ym-clearfix'><span class='float-left'>" + check_no + "</span><span class='float-right'>" + ((amount == '0') ? '' : Number(amount).toFixed(2)) + "</span></span></span></a></li>";
        }


        function SelectSingleOpeningBalance(id)
        {
            $('#btn-new').removeClass('disabled');
            $('#btn-save').addClass('disabled');
            var customer_id = CustomerID;

            var pageUrl = '/Webservice/svr_Customer.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectCustomerOpeningBalance",
                data: "{ 'ID':'" + id + "' , 'customerID':'" + customer_id + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    var data = eval(response.d);

                    for (var i = 0; i < data.length; i++) {
                        

                        BankID= data[i]['BankID'];;
                        $('#bank').val(data[i]['BankName']);
                        $('#check_number').val(data[i]['CheckNo']);
                        $('#amount').val(data[i]['Amount']);
                        $('#date').val(  FormatDate( data[i]['CreatedDate']));

                    }

                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }



        function SaveOpeningBalance(me)
        {
            if ($(me).hasClass("disabled") == false) {
                var pageUrl = '/Webservice/svr_Customer.asmx';
               

                var customerID = CustomerID;
                var bankID = BankID;
                var bankName = $('#bank').val();
                var checkNo = $('#check_number').val();
                var amount = ($('#amount').val() =='') ? '0': $('#amount').val() ;
                var created_date = $('#date').val();

                var data_transfer = "{'customerID':'{0}', 'bankID':'{1}', 'bankName':'{2}', 'checkNo':'{3}', 'createdDate':'{4}', 'amount':'{5}' }"
                .f(customerID, bankID, bankName, checkNo, created_date, amount);
                $.ajax({
                    type: "POST", url: pageUrl + "/InsertCustomerOpeningBalance",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json", crossdomain: true,
                    success: function (response) {
                        FillCustomerOpeningBalance(); ClearAllFields();
                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
                

            }
        }


        function ClearAllFields()
        {
            BankID= 0;;
            $('#bank').val('');
            $('#check_number').val('');
            $('#amount').val('');
            $('#date').val('');
        }



       
        function Fill() {

            $('#bank').autocomplete({
                source: BankAutoCompleteData, minLength: 0, minChars: 0, max: 12, autoFill: true, matchContains: false,
                select: function (a, b) {
                    BankID = b.item.id;
                }
            }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); })
         .change(function () { $(this).closest("tr").find(":input").val(''); });


        }

       

        var BankAutoCompleteData = <%=CompanyVM.CompanyBankAutoComplete %>;
        

    </script>



</asp:Content>
