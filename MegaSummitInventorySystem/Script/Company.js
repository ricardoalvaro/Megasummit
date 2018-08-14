/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />



//------------------------------------

$(document).ready(function () {


  

    ///-------------------------------------------------
    var pageUrl = '/Webservice/svr_Company.asmx';
    
    $.ajax({
        type: "POST",
        url: pageUrl + "/GetCompany",
        data: "{'company_id':'0', 'company_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            //alert(response.d);

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#hdn_company_id").val(data[i]["ID"]);
                $("#img_company").attr("src", data[i]["ImagePath"]);
                $("#txt_company_name").val(data[i]["CompanyName"]);
                $("#txt_address").val(data[i]["Address"]);
                $("#txt_phone").val(data[i]["Telephone"]);
                $("#txt_fax").val(data[i]["Fax"]);
                $("#txt_vat_number").val(data[i]["VatNo"]);
                $("#txt_tin_number").val(data[i]["TinNo"]);
                $("#txt_website").val(data[i]["Website"]);
                $("#txt_email").val(data[i]["Email"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

});

function UploadData()
{
    var fileUpload = $("#uploadFile").get(0);
    var files = fileUpload.files;

    var data = new FormData();
    for (var i = 0; i < files.length; i++) {
        data.append(files[i].name, files[i]);
    }

    $.ajax({
        url: "/Webservice/CompanyImageUploader.ashx",
        type: "POST",
        data: data,
        contentType: false,
        processData: false,
        success: function (result) {

            //alert(result);
            if (result != "") {
                //alert('Successfully Sa');
                //alert(result);
                //uploaded
            }
            else {
                alert('Some error occur, Please contact the administrator!');
            }


        },
        error: function (err) {
            alert(err.statusText)
        }
    });

}

function ValidateUpdateCompany()
{
    var company_name = $("#txt_company_name").val();
    var address = $("#txt_address").val();
    var telephone = $("#txt_phone").val();

    var message = "";

    if (company_name == "")
    {
        message += "Company required! <br>";
    }

    if (address == "") {
        message += "Address required! <br>";
    }

    if (telephone == "") {
        message += "Phone required! <br>";
    }


    //-------------------------
    if (message == "") {
        return true
    }
    else {
        
        alert(message);
        return false;
    }

}

function UpdateCompany()
{

    if (ValidateUpdateCompany()) {


        var id = $("#hdn_company_id").val();
        var img = $("#img_company").attr("src");
        var company_name = $("#txt_company_name").val();
        var address = $("#txt_address").val();
        var phone = $("#txt_phone").val();
        var fax = $("#txt_fax").val();
        var vat = $("#txt_vat_number").val();
        var tin = $("#txt_tin_number").val();
        var website = $("#txt_website").val();
        var email = $("#txt_email").val();

        var pageUrl = '/Webservice/svr_Company.asmx';


        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateCompany",

            //UpdateCompany(long id,  image_path,  company_name,  address,  telephone,  fax,  vat_no,  tin_no,  website,  email)
            data: "{'id':'{0}', 'image_path':'{1}', 'company_name':'{2}', 'address':'{3}', 'telephone':'{4}', 'fax':'{5}', 'vat_no':'{6}', 'tin_no':'{7}', 'website':'{8}', 'email':'{9}'}"
            .f(id, img, company_name, address, phone, fax, vat, tin, website, email),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                alert('Successfully updated');




            },
            error: function (response) {
                alert(response.status);
            }
        });


    }


}


function UpdateAccounting() {
    var pageUrlAccounting = "/Webservice/svr_CompanyAccoounting.asmx";
    var current = $("#current_financial_year").val();
    var last = $("#last_month_financial_year").val();
    var conversion = $("#converstion_month").val();

    $.ajax({
        type: "POST",
        url: pageUrlAccounting + "/UpdateCompanyAccounting",
        data: "{ 'id':'{0}',  'company_id':'{1}',  'current_financial_year':'{2}',  'last_month_financial_year':'{3}',  'converstion_month':'{4}'}"
        .f(1, 0, current, last, conversion),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {



            $("#accnt").removeAttr("class", "active");
            $("#sales").removeAttr("class", "active");
            $("#bank_account").removeAttr("class", "active");
            $("#tax_exemption").removeAttr("class", "active");


            $("#accnt").attr("class", "active");
            SubMenuDisplay('sales');

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function LoadAccounting() {


    var pageUrlAccounting = "/Webservice/svr_CompanyAccoounting.asmx";


    //SelectCompanyAccounting( 'id':'{0}',  'company_id':'{1}',  'current_financial_year':'{2}',  'last_month_financial_year':'{3}',  'converstion_month':'{4}')
    $.ajax({
        type: "POST",
        url: pageUrlAccounting + "/SelectCompanyAccounting",
        data: "{ 'id':'1',  'company_id':'0',  'current_financial_year':'',  'last_month_financial_year':'',  'converstion_month':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            //alert(response.d);

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#current_financial_year").val(data[i]["CurrentFinancialYear"]);
                $("#last_month_financial_year").val(data[i]["LastMonthFinancialYear"]);
                $("#converstion_month").val(data[i]["ConversionMonth"]);


            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


}


//---SALES TAX-----------------------------------

function UpdateSalesTax() {
    var pageUrlSalesTax = "/Webservice/svr_CompanySalesTax.asmx";


    var tax_type = $("#tax_type").val();
    var rate =  $("#rate").val();
    var tax_collected = $("#tax_collected_account").val();
    var tax_paid = $("#tax_paid_account").val();


    
    $.ajax({
        type: "POST",
        //UpdateCompanySalesTax(long id, long company_id, string tax_type, decimal rate, string tax_collected_amount, string tax_paid_account)
        url: pageUrlSalesTax + "/UpdateCompanySalesTax",
        data: "{ 'id':'{0}',  'company_id':'{1}',  'tax_type':'{2}',  'rate':'{3}',  'tax_collected_amount':'{4}', 'tax_paid_account':'{5}'}"
        .f(1, 0, tax_type, rate, tax_collected, tax_paid),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {


            $("#accnt").removeAttr("class", "active");
            $("#sales").removeAttr("class", "active");
            $("#bank_account").removeAttr("class", "active");
            $("#tax_exemption").removeAttr("class", "active");


            $("#bank_account").attr("class", "active");
            SubMenuDisplay('bank_account');

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function LoadSalesTax() {


    var pageUrlAccounting = "/Webservice/svr_CompanySalesTax.asmx";


    //SelectCompanyAccounting( 'id':'{0}',  'company_id':'{1}',  'current_financial_year':'{2}',  'last_month_financial_year':'{3}',  'converstion_month':'{4}')
    $.ajax({
        type: "POST",
        url: pageUrlAccounting + "/SelectCompanySalesTax",
        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            //alert(response.d);

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#tax_type").val(data[i]["TaxType"]);
                $("#rate").val(data[i]["Rate"]);
                $("#tax_collected_account").val(data[i]["TaxCollectedAccount"]);
                $("#tax_paid_account").val(data[i]["TaxPaidAccount"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


}


//--------------BANK ACCOUNT--------------------

function LoadAllBank()
{
    var pageUrl = '/Webservice/svr_Bank.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectBank",
        data: "{ 'id':'0', 'bank_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#bank_name').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#bank_name').append("<option value='" + data[i]["BankName"] + "'>" + data[i]["BankName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadBankAccount() {
    var pageUrl = '/Webservice/svr_CompanyBankAccount.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCompanyBankAccount",
        data: "{'id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xBankAccount tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xBankAccount tbody:last').append("<tr><td><div onclick=\"ActionSelectBankAccount('" + data[i]["ID"] + "')\">" + data[i]["BankName"] + "</div></td><td>" + data[i]["AccountType"] + "</td><td>" + data[i]["AccountNo"] + "</td></tr>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionSelectBankAccount(id) {

    LoadAllBank();

    $('#action_bank_account .save').removeClass('disabled');
    $('#action_bank_account .delete').removeClass('disabled');
    $('#action_bank_account .new').addClass('disabled');
    $('#action_bank_account .find').addClass('disabled');

    $("#hdn_bank_account_id").val(id);

    var pageUrl = '/Webservice/svr_CompanyBankAccount.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCompanyBankAccount",
        data: "{'id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#bank_name").val(data[i]["BankName"]);
                $("#account_name").val(data[i]["AccountName"]);
                $("#account_type").val(data[i]["AccountType"]);
                $("#account_number").val(data[i]["AccountNo"]);
                $("#branch").val(data[i]["Branch"]);
                $("#opening_balance").val(data[i]["OpeningBalance"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


    $("#xBankAccount").hide();
    $("#xBankAccountSearch").hide();
    $("#xBankAccountManage").show();
}

function ActionNewBankAccount(me) {

    if ($(me).hasClass("disabled") == false) {

        LoadAllBank();

        $("#hdn_bank_account_id").val('0');

        $("#account_name").val('');
        $("#account_number").val('');
        $("#branch").val('');
        $("#opening_balance").val('');


        $('#action_bank_account .save').removeClass('disabled');
        $('#action_bank_account .delete').addClass('disabled');
        $('#action_bank_account .new').addClass('disabled');
        $('#action_bank_account .find').addClass('disabled');

        $("#xBankAccount").hide();
        $("#xBankAccountSearch").hide();
        $("#xBankAccountManage").show();
    }
}

function ActionSaveUpdateBankAccount(me) {

    if ($(me).hasClass("disabled") == false) {



        var id = $("#hdn_bank_account_id").val();
      
        var bank_name = $("#bank_name").val();
        var account_name =  $("#account_name").val();
        var account_type = $("#account_type").val();
        var account_number = $("#account_number").val();
        var branch = $("#branch").val();
        var opening_balance =  $("#opening_balance").val();


        if (id == '0') {


            //InsertCompanyBankAccount(long company_id, string bank_name, string account_name, string account_type, string account_no, string branch, decimal opening_balance)
            var pageUrl = '/Webservice/svr_CompanyBankAccount.asmx';

            var data_transfer = "{'company_id':'{0}','bank_name':'{1}','account_name':'{2}','account_type':'{3}', 'account_no':'{4}', 'branch':'{5}', 'opening_balance':'{6}'}"
                .f('0', bank_name, account_name, account_type, account_number, branch, opening_balance);


            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertCompanyBankAccount",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadBankAccount();
                    SubMenuDisplay('bank_account');

                },
                error: function (response) {
                    alert(response.status);
                }
            });

            //}


        } else {


            //if (ValidateAddUpdateProduct()) {

            var pageUrl = '/Webservice/svr_CompanyBankAccount.asmx';

            var data_transfer = "{'id':'"+id+"', 'company_id':'{0}','bank_name':'{1}','account_name':'{2}','account_type':'{3}', 'account_no':'{4}', 'branch':'{5}', 'opening_balance':'{6}'}"
                .f('0', bank_name, account_name, account_type, account_number, branch, opening_balance);

            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateCompanyBankAccount",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    LoadBankAccount();
                    SubMenuDisplay('bank_account');
                },
                error: function (response) {
                    alert(response.status);
                }
            });

            //}
        }
    }
}

function ActionDeleteBankAccount(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_bank_account_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_CompanyBankAccount.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteCompanyBankAccount",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadBankAccount();
                    SubMenuDisplay('bank_account');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function BankAccountAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_CompanyBankAccount.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteBankAccount",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_bank_account_search").autocomplete({
                source: response.d,
                minLength: 0,
                minChars: 0,
                max: 12,
                autoFill: true,
                matchContains: false
            })

                .on('focus', function (event) {
                    var self = this;
                    $(self).autocomplete("search", "");
                });
        },

        error: function (response) {
            alert(response.status);
        }

    });


    $("#txt_bank_account_search").autocomplete({
        select: function (a, b) {

            ActionSelectBankAccount(b.item.id)
        }
    });
}

function ActionSearchBankAccount(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_bank_account .save').addClass('disabled');
        $('#action_bank_account .delete').addClass('disabled');
        $('#action_bank_account .new').addClass('disabled');
        $('#action_bank_account .find').addClass('disabled');

        $("#xBankAccount").hide();
        $("#xBankAccountManage").hide();
        $('#xBankAccountSearch').show();

        $('#txt_bank_account_search').val('');
        BankAccountAutoCompleteByName();
    }
}



//------TAX EXEMPTION SECTION-----------------------

function LoadTax() {
    var pageUrl = '/Webservice/srv_CompanyTaxExemption.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCompanyTaxExemption",
        data: "{'id':'0','company_id':'0','tax_code':'','description':'','amount':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xTaxExemption tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xTaxExemption tbody:last').append("<tr><td><div onclick=\"ActionSelectTax('" + data[i]["ID"] + "')\">" + data[i]["TaxCode"] + "</div></td></tr>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionSelectTax(id) {
    $('#action_tax_exmption .save').removeClass('disabled');
    $('#action_tax_exmption .delete').removeClass('disabled');
    $('#action_tax_exmption .new').addClass('disabled');
    $('#action_tax_exmption .find').addClass('disabled');

    $("#hdn_tax_id").val(id);

    var pageUrl = '/Webservice/srv_CompanyTaxExemption.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCompanyTaxExemption",
        data: "{'id':'" + id + "','company_id':'0','tax_code':'','description':'','amount':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_tax_code").val(data[i]["TaxCode"]);
                $("#txt_description").val(data[i]["Description"]);
                $("#txt_amount").val(data[i]["Amount"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });


    $("#xTaxExemption").hide();
    $("#xTaxExemptionSearch").hide();
    $("#xTaxExemptionManage").show();
}

function ActionNewTax(me) {

    if ($(me).hasClass("disabled") == false) {
        $("#hdn_tax_id").val('0');
        $("#txt_tax_code").val('');
        $("#txt_description").val('');
        $("#txt_amount").val('');

        $('#action_tax_exmption .save').removeClass('disabled');
        $('#action_tax_exmption .delete').addClass('disabled');
        $('#action_tax_exmption .new').addClass('disabled');
        $('#action_tax_exmption .find').addClass('disabled');

        $("#xTaxExemption").hide();
        $("#xTaxExemptionManage").show();
    }
}

function ActionSaveUpdateTax(me) {

    if ($(me).hasClass("disabled") == false) {



        var id = $("#hdn_tax_id").val();
        var tax_code = $("#txt_tax_code").val();
        var description = $("#txt_description").val();
        var amount = $("#txt_amount").val();

        if (id == '0') {


            //if (ValidateAddUpdateProduct()) {

            var pageUrl = '/Webservice/srv_CompanyTaxExemption.asmx';

            var data_transfer = "{'company_id':'{0}','tax_code':'{1}','description':'{2}','amount':'{3}'}".f('0', tax_code, description, amount);


            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertCompanyTaxExemption",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadTax();
                    SubMenuDisplay('tax_exemption');

                },
                error: function (response) {
                    alert(response.status);
                }
            });

            //}


        } else {


            //if (ValidateAddUpdateProduct()) {

            var pageUrl = '/Webservice/srv_CompanyTaxExemption.asmx';

            var data_transfer = "{'id':'{0}','company_id':'{1}','tax_code':'{2}','description':'{3}','amount':'{4}'}".f(id, '0', tax_code, description, amount);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateCompanyTaxExemption",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {
                    LoadTax();
                    SubMenuDisplay('tax_exemption');
                },
                error: function (response) {
                    alert(response.status);
                }
            });

            //}
        }
    }
}

function ActionDeleteTax(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_tax_id").val();
        //var location_name = $("#txt_location").val();

        if (id != '0') {

            var pageUrl = '/Webservice/srv_CompanyTaxExemption.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteCompanyTaxExemption",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadTax();
                    SubMenuDisplay('tax_exemption');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function TaxAutoCompleteByName() {
    var pageUrl = '/Webservice/srv_CompanyTaxExemption.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteTax",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_tax_search").autocomplete({
                source: response.d,
                minLength: 0,
                minChars: 0,
                max: 12,
                autoFill: true,
                matchContains: false
            })

                .on('focus', function (event) {
                    var self = this;
                    $(self).autocomplete("search", "");
                });
        },

        error: function (response) {
            alert(response.status);
        }

    });


    $("#txt_tax_search").autocomplete({
        select: function (a, b) {

            ActionSelectTax(b.item.id)
        }
    });
}

function ActionSearchTax(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_tax_exmption .save').addClass('disabled');
        $('#action_tax_exmption .delete').addClass('disabled');
        $('#action_tax_exmption .new').addClass('disabled');
        $('#action_tax_exmption .find').addClass('disabled');

        $("#xTaxExemption").hide();
        $("#xTaxExemptionManage").hide();
        $('#xTaxExemptionSearch').show();

        $('#txt_tax_search').val('');
        TaxAutoCompleteByName();
    }
}

function ValidateAddUpdateTax() {
    var location = $("#txt_product").val();

    var message = "";

    if (location == "") {
        message += "Product Department required!";
    }

    //-------------------------
    if (message == "") {
        return true
    }
    else {

        alert(message);
        return false;
    }
}