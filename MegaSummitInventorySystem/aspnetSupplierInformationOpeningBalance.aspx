<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetSupplierInformationOpeningBalance.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetSupplierInformationOpeningBalance" %>
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
            <li class="active form" id="goto_invoice"><a href="javascript:void(0)">Invoices</a></li>
            <li class="form" id="goto_payment"><a href="javascript:void(0)">Payments</a></li>
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
                                    <h1>Opening Balance - Invoices</h1>
                                </div>
                                <div class="content vmiddle">                                        
                                    <table>
                                            <tr>
                                                <td class="lbl"><label for="reference_number">*Reference No.</label></td>
                                                <td class="obj">
                                                    <div class="grid ym-clearfix">
                                                        <div class="col-left">
                                                            <div class="select-arrow xxshort">
                                                                <select id="reference_no">
                                                                   
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-left">
                                                            &nbsp;&nbsp;
                                                        </div>
                                                        <div class="col-left">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_number" class="xxxmedium" />
                                                        </div>
                                                    </div>
                                                    <div class="ym-ie-clearing">&nbsp;</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="reference_number">*Date</label></td>
                                                <td class="obj">
                                                    <div class="dp xmedium">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="salesman">*Salesman</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow medium">
                                                        <select name="salesman" id="salesman">
                                                            <option value=""></option>                      
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="terms">*Terms</label></td>
                                                <td class="obj">
                                                    <div class="select-arrow xxmedium">
                                                        <select name="terms" id="terms">                      
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                           
                                            <tr>
                                                <td class="lbl"><label for="amount">*Amount</label></td>
                                                <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="amount" name="amount" class="xxmedium" /></td>
                                            </tr>
                                            <tr>
                                                <td class="lbl"><label for="balance">*Balance</label></td>
                                                <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="balance" name="balance" disabled class="xxmedium" /></td>
                                            </tr>                               
                                        </table>
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
        var PurchaseInvoiceID = 0;
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
                InvoiceSelectOpeningBalance();
            }



        });


        //PuchasedInsertOpeningBalance( )

        
        function InsertOpeningBalance(me)
        {
            if ($(me).hasClass("disabled") == false)
            {
                var supplier_id = SupplierID;
                var ref_no = $('#reference_no option:selected').text();
                var ref_no_serial = $('#reference_letter').val();
                var created_date = $('#date').val();
                var salesman_id = $('#salesman').val();
                var term_id = $('#terms').val();
                var total_amount = ($('#amount').val() == '') ? '0' : $('#amount').val();

                
                var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
                var data_transfer = "{ 'supplierID':'{0}', 'refNo':'{1}', 'refNoSerial':'{2}', 'createdDate':'{3}', 'salesman':'{4}', 'termID':'{5}', 'subTotal':'{6}' }"
                .f(supplier_id , ref_no, ref_no_serial, created_date, salesman_id, term_id, total_amount);
                 

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/PuchasedInsertOpeningBalance",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {
                        InvoiceSelectOpeningBalance();
                        //window.location = "aspnetSales.aspx";
                        //alert(response.d);
                        $('#reference_letter').val('');
                        $('#amount').val('');
                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



        function InvoiceSelectOpeningBalance()
        {
            //InvoiceOpeningBalanceSelect(long customer_id, long invoice_id)

            var supplier_id = SupplierID;
            var invoice_id = PurchaseInvoiceID;

            var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/PurchasedSelectOpeningBalance",
                data: "{ 'supplier_id':'" + supplier_id + "' , 'invoice_id':'" + invoice_id + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    $('#ulSupplier').empty();
                    var data = eval(response.d);

                    for (var i = 0; i < data.length; i++) {
                        $("#ulSupplier").append(ListInvoiceOpeningBalance(data[i]["ID"], data[i]['SupplierName'], data[i]['RefNo'] + data[i]['RefNoSerial'] , data[i]['Amount']));
                    }

                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }

       


        
        function ListInvoiceOpeningBalance(invoice_id, customer_name, ref_no, amount) {
            return "<li><a href='javascript:void(0);'  id='item-1' onclick=\"SelectSingleOpeningBalance('" + invoice_id + "')\"><span class='name'>" + customer_name + "<span class='ym-clearfix'><span class='float-left'>" + ref_no + "</span><span class='float-right'>" + ((amount == '0') ? '' : Number(amount).toFixed(2)) + "</span></span></span></a></li>";
        }

        function SelectSingleOpeningBalance(invoice_id)
        {
            $('#btn-save').addClass('disabled')
            $('#btn-new').removeClass('disabled')

            //alert(invoice_id);

            //SalesInvoiceID = invoice_id;


            var supplier_id = SupplierID;
            //var invoice_id = invoice_id;

            var pageUrl = '/Webservice/svr_PurchasedInvoice.asmx';
            $.ajax({
                type: "POST",
                url: pageUrl + "/PurchasedSelectOpeningBalance",
                data: "{ 'supplier_id':'" + supplier_id + "' , 'invoice_id':'" + invoice_id + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    var data = eval(response.d);

                    for (var i = 0; i < data.length; i++) {

                        $('#reference_no option:selected').text(data[i]['RefNo']);
                        $('#reference_letter').val(data[i]['RefSerial']);
                        $('#date').val(FormatDate(data[i]['CreatedDate']));
                        $('#salesman').val(data[i]['SalesmanID']);
                        $('#terms').val(data[i]['TermID']);
                        $('#amount').val(Number(data[i]['Amount']).toFixed(2));
                        $('#balance').val(  Number(data[i]['Balance']).toFixed(2) );
                        //$("#ulCustomer").append(ListInvoiceOpeningBalance(data[i]["ID"], data[i]['CustomerName'], data[i]['RefNo'], data[i]['TotalAmount']));
                    }

                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }

        
        function Fill()
        {
            FillSalesman(); FillTerm();  FillDate(); FillReference();
        }

        function FillSalesman()
        {
            $('#salesman').empty(); //$('#salesman').append("<option value='" + "0" + "'>" + "</option>");
            var data = EmployeeData;
            for (var i = 0; i < data.length; i++) { $('#salesman').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>"); }
        }

        function FillTerm()
        {
            $('#terms').empty();// $('#terms').append("<option value='" + "0" + "'>" + "</option>");
            var data = TermData;
            for (var i = 0; i < data.length; i++) { $('#terms').append("<option value='" + data[i]["ID"] + "'>" + data[i]["TermName"] + "</option>"); }
        }

    

        function FillDate()
        {
            var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
            $('#date').val("0" + month + "/" + day + "/" + year);
        
        }

        function FillReference()
        {
            $('#reference_no').empty(); //$('#remarks').append("<option value='" + "0" + "'>" + "</option>");
            var data = RefNoData;
            for (var i = 0; i < data.length; i++) { $('#reference_no').append("<option value='" + data[i]["ID"] + "'>" + data[i]["PrefixInitial"] + "</option>"); }
    
        }


        //------------------

        
        var EmployeeData = <%= EmployeeVM.Employees(0, string.Empty, "Salesman") %>;
        var TermData = <%= CustomerVM.Terms %>;
        var RefNoData = <%= SalesVM.SalesSetting %>;

    </script>


    <style>
        .padding-0 {
            padding: 0;
        }
    </style>


</asp:Content>
