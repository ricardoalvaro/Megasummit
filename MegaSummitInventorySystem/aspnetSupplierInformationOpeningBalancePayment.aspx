<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierInformationOpeningBalancePayment.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSupplierInformationOpeningBalancePayment" %>
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
            <li class="form" id="goto_invoice"><a href="javascript:void(0)">Invoices</a></li>
            <li class="form active" id="goto_payment"><a href="javascript:void(0)">Payments</a></li>
        </ul>
        <div class="ym-ie-clearing">&nbsp;</div>
        </div>
        
         <div id="content-holder">
        	<div class="container two-column-sidebar style2 withbg">
                <div class="ym-column linearize-level-1">
                    <div class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                              <div name="customer_customers_opening_balance_invoice_form" id="customer_customers_opening_balance_invoice_form" method="POST" class="ym-form">
                                <div class="addup">
                                    <h1>Opening Balance - Payment</h1>
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
    	                <ul class="sidebar sidelists2 crossfade scroll" id="ulSupplier">
                                  
                    
                        </ul>
                    </div>
                </div>                

                </div>		
            </div>
        </div>	
        	
    </div>
</div>
    </div>

    
    <script type="text/javascript">


        
        var SupplierID = 0;
        var BankAccountID = 0;
        var helper = new Helper();

        $(document).ready(function () {
          
            SupplierID = Number(helper.GetQuerystring()["supplierID"]);
            if (!$.isNumeric(SupplierID) || SupplierID <= 0) {
                SupplierID = 0;
            }

            $('#goto_invoice').click(function () { window.location = 'aspnetSupplierInformationOpeningBalance.aspx?supplierID=' + SupplierID });
            $('#goto_payment').click(function () { window.location = 'aspnetSupplierInformationOpeningBalancePayment.aspx?supplierID=' + SupplierID });


            $(':input').on('input', function(){ // do not allow single quote and double quote 
                this.value = this.value.replace(/(['"])/g, '');//  /[^\w]/g,"");
            });

            Fill();

            $('#btn-save').removeClass('disabled').click(function(){
                InsertOpeningBalance(this);
            });


            $('#btn-new').click(function(){
                if ($(this).hasClass("disabled") == false)
                {
                    location.reload();
                }
            });

            if(SupplierID > 0)
            {
                //load all opening balance
                FillSupplierOpeningBalance();
            }



        });


        //PuchasedInsertOpeningBalance( )

        
        function InsertOpeningBalance(me)
        {
            if ($(me).hasClass("disabled") == false)
            {
                var pageUrl = '/Webservice/svr_Supplier.asmx';

                var supplierID = SupplierID;
                var bankID = BankID;
                var bankName = $('#bank').val();
                var checkNo = $('#check_number').val();
                var amount = ($('#amount').val() == '') ? '0' : $('#amount').val();
                var created_date = $('#date').val();

                var data_transfer = "{'supplierID':'{0}', 'bankID':'{1}', 'bankName':'{2}', 'checkNo':'{3}', 'createdDate':'{4}', 'amount':'{5}' }"
                .f(supplierID, bankID, bankName, checkNo, created_date, amount);
                $.ajax({
                    type: "POST", url: pageUrl + "/InsertSupplierOpeningBalance",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json", crossdomain: true,
                    success: function (response) {
                        FillSupplierOpeningBalance(); ClearAllFields();
                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });

            }
        }



  
        function FillSupplierOpeningBalance()
        {
            
            var supplier_id = SupplierID;

            var pageUrl = '/Webservice/svr_Supplier.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectSupplierOpeningBalance",
                data: "{ 'ID':'" + 0 + "' , 'SupplierID':'" + supplier_id + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    $('#ulSupplier').empty();
                    var data = eval(response.d);

                    for (var i = 0; i < data.length; i++) {
                        $("#ulSupplier").append(ListInvoiceOpeningBalance(data[i]["ID"], data[i]['BankName'], data[i]['CheckNo'], data[i]['Amount']));
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

        function SelectSingleOpeningBalance(invoice_id)
        {
            $('#btn-save').addClass('disabled')
            $('#btn-new').removeClass('disabled')

            var supplier_id = SupplierID;

            var pageUrl = '/Webservice/svr_Supplier.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectSupplierOpeningBalance",
                data: "{ 'ID':'" + invoice_id + "' , 'SupplierID':'" + supplier_id + "' }",
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

        function ClearAllFields()
        {
            BankID= 0;;
            $('#bank').val('');
            $('#check_number').val('');
            $('#amount').val('');
            $('#date').val('');
        }

        
        function Fill()
        {
            $('#bank').autocomplete({
                source: BankAutoCompleteData, minLength: 0, minChars: 0, max: 12, autoFill: true, matchContains: false,
                select: function (a, b) {
                    BankID = b.item.id;
                }
            }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); })
            .change(function () { $(this).closest("tr").find(":input").val(''); });

        }

       


        //------------------

        var BankAutoCompleteData = <%=CompanyVM.CompanyAccountAutoComplete %>;

    </script>


    <style>
        .padding-0 {
            padding: 0;
        }
    </style>



</asp:Content>
