/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />


var bl;

//-----------Taxes -------

function LoadTaxes() {
    var pageUrl = '/Webservice/svr_Tax.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectTax",
        data: "{ 'id':'0', 'tax':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xTax tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xTax tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectTaxes('" + data[i]["ID"] + "')\">" + data[i]["TaxName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankTaxes()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankTaxes() {
    for (var i = 0; i < 30; i++) {

        $('#xTax tbody:last').append("<tr><td width='50%'><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectTaxes(id) {
    $('#action_taxes .save').removeClass('disabled');
    $('#action_taxes .delete').removeClass('disabled');
    $('#action_taxes .new').addClass('disabled');
    $('#action_taxes .find').addClass('disabled');

    $("#hdn_taxes_id").val(id);



    var pageUrl = '/Webservice/svr_Tax.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectTax",
        data: "{ 'id':'" + id + "', 'tax':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#taxes_name").val(data[i]["TaxName"]);

            }

            SelectDataRangeTaxes(id);

        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xTax").hide();
    $("#xTaxSearch").hide();
    $("#xTaxManage").show();

}

function SelectDataRangeTaxes(id) {
    var pageUrl = '/Webservice/svr_TaxRange.asmx';

    //SelectDeductionSalaryRange(long id, long deduction_id)
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectTaxRange",
        data: "{ 'id':'0', 'tax_id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#tax_range tbody");
            table.empty();
            var range_data = data;

            //alert(range_data);
            for (var i = 0; i < range_data.length; i++) {

                table.append("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short range' value='" + data[i]["TaxBracket"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee' value='" + data[i]["TaxBased"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer' value='" + data[i]["TaxRate"] + "'></td></tr>");
                // alert("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short range' value='" + data[i]["SalaryRange"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer' value='" + data[i]["Empoyee"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee' value='" + data[i]["Employer"] + "'></td></tr>");
                // table.append("<tr><td width='33%'><input class='hdn' type='hidden' /><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td></tr>");
                //data[i]["ID"]
                //data[i]["SalaryRange"]
                //data[i]["Empoyee"]
                //data[i]["Employer"]
            }

            for (var i = 0; i < 50; i++)//plus 50 rows
            {
                table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
            }



        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionNewTaxes(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_taxes_id").val('0');


        $("#taxes_name").val('');



        $('#action_taxes .save').removeClass('disabled');
        $('#action_taxes .delete').addClass('disabled');
        $('#action_taxes .new').addClass('disabled');
        $('#action_taxes .find').addClass('disabled');

        $("#xTax").hide();
        $("#xTaxSearch").hide();
        $("#xTaxManage").show();


        var table = $("#tax_range tbody");
        table.empty();

        for (var i = 0; i < 50; i++)//plus 50 rows
        {
            table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
        }

    }
}

function ActionSaveUpdateTaxes(me) {



    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Tax.asmx';


        var id = $("#hdn_taxes_id").val();

        var tax = $("#taxes_name").val();
        var table_chunk = GenerateTaxesTableChunk();

        if (id == '0') {
            //InsertBenefit( )
            var data_transfer = "{  'tax':'{0}','table_chunck':'{1}' }"
               .f(tax, table_chunk);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertTax",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadTaxes();
                    SubMenuDisplay('taxes');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{ 'id':'" + id + "', 'tax':'{0}' }"
                .f(tax);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateTax",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadTaxes();
                    SubMenuDisplay('taxes');


                },
                error: function (response) {
                    alert(response.status);
                }
            });


            $("#tax_range tbody tr").each(function (i) {

                if ($(this).find("td .range").val().length > 0) {

                    var _dataUpdate = "{'id':'" + $(this).find("td .hdn").val() + "',  'tax_id':'" + id + "',  'tax_bracket':'" + $(this).find("td .range").val() + "',  'tax_based':'" + $(this).find("td .employee").val() + "',  'tax_rate':'" + $(this).find("td .employer").val() + "'}";

                    $.ajax({
                        type: "POST",
                        url: "/Webservice/svr_TaxRange.asmx/UpdateTaxRange",
                        //UpdateDeduction( )
                        data: _dataUpdate,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        crossdomain: true,
                        success: function (response) {

                            //LoadDeduction();
                            //SubMenuDisplay('deduction');

                        },
                        error: function (response) {
                            alert(response.status);
                        }
                    });

                    //chunk += $(this).find("td .range").val() + "," + $(this).find("td .employer").val() + "," + $(this).find("td .employee").val() + "^";
                }

            });


        }



    }
}

function GenerateTaxesTableChunk() {

    //-------------------------

    var chunk = "";
    $("#tax_range tbody tr").each(function (i) {

        if ($(this).find("td .range").val().length > 0) {
            chunk += $(this).find("td .range").val() + "," + $(this).find("td .employee").val() + "," + $(this).find("td .employer").val() + "^";
        }
        // alert($(this).find("td .range").val() + "," + $(this).find("td .employer").val() + "," + $(this).find("td .employee").val() + "^");

    });

    var table = $("#tax_range tbody");
    for (var i = 0; i < 50; i++)//plus 50 rows
    {
        table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
    }


    return chunk;
}

function ActionDeleteTaxes(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_taxes_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Tax.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteTax",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadTaxes();
                    SubMenuDisplay('taxes');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function TaxesAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Tax.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteTax",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_taxes_search").autocomplete({
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


    $("#txt_taxes_search").autocomplete({
        select: function (a, b) {

            ActionSelectContribution(b.item.id)
        }
    });
}

function ActionSearchTaxes(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_taxes .save').addClass('disabled');
        $('#action_taxes .delete').addClass('disabled');
        $('#action_taxes .new').addClass('disabled');
        $('#action_taxes .find').addClass('disabled');

        $("#xTax").hide();
        $("#xTaxManage").hide();
        $("#xTaxSearch").show();

        $('#action_taxes').val('');
        TaxesAutoCompleteByName();
    }
}


//-----------Contribution -------

function LoadContribution() {
    var pageUrl = '/Webservice/svr_Contribution.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectContribution",
        data: "{ 'id':'0', 'contribution_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xContribution tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xContribution tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectContribution('" + data[i]["ID"] + "')\">" + data[i]["ContributionName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankContribution()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankContribution() {
    for (var i = 0; i < 30; i++) {
        $('#xContribution tbody:last').append("<tr><td width='50%'><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectContribution(id) {
    $('#action_contributions .save').removeClass('disabled');
    $('#action_contributions .delete').removeClass('disabled');
    $('#action_contributions .new').addClass('disabled');
    $('#action_contributions .find').addClass('disabled');

    $("#hdn_contribution_id").val(id);



    var pageUrl = '/Webservice/svr_Contribution.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectContribution",
        data: "{ 'id':'" + id + "', 'contribution_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#contribution_name").val(data[i]["ContributionName"]);

            }

            SelectDataRangeContribution(id);

        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xContribution").hide();
    $("#xContributionSearch").hide();
    $("#xContributionManage").show();

}

function SelectDataRangeContribution(id) {
    var pageUrl = '/Webservice/svr_ContributionSalaryRange.asmx';

    //SelectDeductionSalaryRange(long id, long deduction_id)
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectContributionSalaryRange",
        data: "{ 'id':'0', 'contribution_id':'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#contribution_range tbody");
            table.empty();
            var range_data = data;

            //alert(range_data);
            for (var i = 0; i < range_data.length; i++) {

                table.append("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short range' value='" + data[i]["SalaryRange"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee' value='" + data[i]["Employee"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer' value='" + data[i]["Employer"] + "'></td></tr>");
                // alert("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short range' value='" + data[i]["SalaryRange"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer' value='" + data[i]["Empoyee"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee' value='" + data[i]["Employer"] + "'></td></tr>");
                // table.append("<tr><td width='33%'><input class='hdn' type='hidden' /><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td></tr>");
                //data[i]["ID"]
                //data[i]["SalaryRange"]
                //data[i]["Empoyee"]
                //data[i]["Employer"]
            }

            for (var i = 0; i < 50; i++)//plus 50 rows
            {
                table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
            }



        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionNewContribution(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_contribution_id").val('0');


        $("#contribution_name").val('');



        $('#action_contributions .save').removeClass('disabled');
        $('#action_contributions .delete').addClass('disabled');
        $('#action_contributions .new').addClass('disabled');
        $('#action_contributions .find').addClass('disabled');

        $("#xContribution").hide();
        $("#xContributionSearch").hide();
        $("#xContributionManage").show();


        var table = $("#contribution_range tbody");
        table.empty();
        for (var i = 0; i < 50; i++)//plus 50 rows
        {
            table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
        }

    }
}

function ActionSaveUpdateContribution(me) {



    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Contribution.asmx';


        var id = $("#hdn_contribution_id").val();

        var contribution = $("#contribution_name").val();
        var table_chunk = GenerateContributionTableChunk();

        if (id == '0') {
            //InsertBenefit( )
            var data_transfer = "{  'contribution_name':'{0}','table_chunck':'{1}' }"
               .f(contribution, table_chunk);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertContribution",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadContribution();
                    SubMenuDisplay('contribution');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{ 'id':'" + id + "', 'contribution_name':'{0}' }"
                .f(contribution);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateContribution",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadContribution();
                    SubMenuDisplay('contribution');


                },
                error: function (response) {
                    alert(response.status);
                }
            });


            $("#contribution_range tbody tr").each(function (i) {

                if ($(this).find("td .range").val().length > 0) {

                    var _dataUpdate = "{'id':'" + $(this).find("td .hdn").val() + "',  'contribution_id':'" + id + "',  'salary_range':'" + $(this).find("td .range").val() + "',  'employee':'" + $(this).find("td .employee").val() + "',  'employer':'" + $(this).find("td .employer").val() + "'}";

                    $.ajax({
                        type: "POST",
                        url: "/Webservice/svr_ContributionSalaryRange.asmx/UpdateContributionSalaryRange",
                        //UpdateDeduction( )
                        data: _dataUpdate,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        crossdomain: true,
                        success: function (response) {

                            //LoadDeduction();
                            //SubMenuDisplay('deduction');

                        },
                        error: function (response) {
                            alert(response.status);
                        }
                    });

                    //chunk += $(this).find("td .range").val() + "," + $(this).find("td .employer").val() + "," + $(this).find("td .employee").val() + "^";
                }

            });


        }



    }
}

function GenerateContributionTableChunk() {

    //-------------------------

    var chunk = "";
    $("#contribution_range tbody tr").each(function (i) {

        if ($(this).find("td .range").val().length > 0) {
            chunk += $(this).find("td .range").val() + "," + $(this).find("td .employee").val() + "," + $(this).find("td .employer").val() + "^";
        }
        // alert($(this).find("td .range").val() + "," + $(this).find("td .employer").val() + "," + $(this).find("td .employee").val() + "^");

    });

    var table = $("#contribution_range tbody");
    for (var i = 0; i < 50; i++)//plus 50 rows
    {
        table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
    }


    return chunk;
}

function ActionDeleteContribution(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_contribution_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Contribution.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteContribution",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadContribution();
                    SubMenuDisplay('contribution');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function ContributionAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Contribution.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteContribution",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_contribution_search").autocomplete({
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


    $("#txt_contribution_search").autocomplete({
        select: function (a, b) {

            ActionSelectContribution(b.item.id)
        }
    });
}

function ActionSearchContribution(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_contributions .save').addClass('disabled');
        $('#action_contributions .delete').addClass('disabled');
        $('#action_contributions .new').addClass('disabled');
        $('#action_contributions .find').addClass('disabled');

        $("#xContribution").hide();
        $("#xContributionManage").hide();
        $("#xContributionSearch").show();

        $('#txt_contribution_search').val('');
        ContributionAutoCompleteByName();
    }
}


//-----------Deduction -------

function LoadDeduction() {
    var pageUrl = '/Webservice/svr_Deduction.asmx';


    $.ajax({
        type: "POST",
        //SelectBenefit(long id,string benefit_name)
        url: pageUrl + "/SelectDeduction",
        data: "{ 'id':'0', 'deduction_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xDeduction tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xDeduction tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectDeduction('" + data[i]["ID"] + "')\">" + data[i]["DeductionName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankDeduction()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankDeduction() {
    for (var i = 0; i < 30; i++) {
        $('#xDeduction tbody:last').append("<tr><td width='50%'><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectDeduction(id) {
    $('#action_deductions .save').removeClass('disabled');
    $('#action_deductions .delete').removeClass('disabled');
    $('#action_deductions .new').addClass('disabled');
    $('#action_deductions .find').addClass('disabled');

    $("#hdn_deduction_id").val(id);



    var pageUrl = '/Webservice/svr_Deduction.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectDeduction",
        data: "{ 'id':'" + id + "', 'deduction_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#deduction_name").val(data[i]["DeductionName"]);
                             
            }

            SelectDataRange(id);
            //table.find('tr').each(function (i) {

            //    $tds.eq(0).find(".hdn").val();
            //    $tds.eq(1).find(".range").val();
            //    $tds.eq(2).find(".employer").val();
            //    $tds.eq(3).find(".employee").val();
                

            //});


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xDeduction").hide();
    $("#xDeductionSearch").hide();
    $("#xDeductionManage").show();

}

function SelectDataRange(id)
{
    var pageUrl = '/Webservice/svr_DeductionSalaryRange.asmx';

    //SelectDeductionSalaryRange(long id, long deduction_id)
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectDeductionSalaryRange",
        data: "{ 'id':'0', 'deduction_id':'"+id+"'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var table = $("#deduction_range tbody");
            table.empty();
            var range_data = data;

            //alert(range_data);
            for (var i = 0; i < range_data.length; i++) {

                table.append("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short range' value='" + data[i]["SalaryRange"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee' value='" + data[i]["Empoyee"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer' value='" + data[i]["Employer"] + "'></td></tr>");
               // alert("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short range' value='" + data[i]["SalaryRange"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer' value='" + data[i]["Empoyee"] + "'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee' value='" + data[i]["Employer"] + "'></td></tr>");
                // table.append("<tr><td width='33%'><input class='hdn' type='hidden' /><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td></tr>");
                //data[i]["ID"]
                //data[i]["SalaryRange"]
                //data[i]["Empoyee"]
                //data[i]["Employer"]
            }

            for (var i = 0; i < 50; i++)//plus 50 rows
            {
                table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
            }

           

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionNewDeduction(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_deduction_id").val('0');


        $("#deduction_name").val('');



        $('#action_deductions .save').removeClass('disabled');
        $('#action_deductions .delete').addClass('disabled');
        $('#action_deductions .new').addClass('disabled');
        $('#action_deductions .find').addClass('disabled');

        $("#xDeduction").hide();
        $("#xDeductionSearch").hide();
        $("#xDeductionManage").show();


        var table = $("#deduction_range tbody");
        table.empty();

        for (var i = 0; i < 50; i++)//plus 50 rows
        {
            table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
        }

    }
}

function ActionSaveUpdateDeduction(me) {

 

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Deduction.asmx';


        var id = $("#hdn_deduction_id").val();

        var deduction = $("#deduction_name").val();
        var table_chunk = GenerateDeductionTableChunk();

        if (id == '0') {
            //InsertBenefit( )
            var data_transfer = "{  'deduction_name':'{0}','table_chunck':'{1}' }"
               .f(deduction, table_chunk);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertDeduction",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadDeduction();
                    SubMenuDisplay('deduction');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{ 'id':'" + id + "', 'deduction_name':'{0}' }"
                .f(deduction);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateDeduction",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadDeduction();
                    SubMenuDisplay('deduction');


                },
                error: function (response) {
                    alert(response.status);
                }
            });


            $("#deduction_range tbody tr").each(function (i) {

                if ($(this).find("td .range").val().length > 0) {

                    var _dataUpdate = "{'id':'" + $(this).find("td .hdn").val() + "',  'deduction_id':'" + id + "',  'salary_range':'" + $(this).find("td .range").val() + "',  'employee':'" + $(this).find("td .employee").val() + "',  'employer':'" + $(this).find("td .employer").val() + "'}";

                    $.ajax({
                        type: "POST",
                        url: "/Webservice/svr_DeductionSalaryRange.asmx/UpdateDeduction",
                        //UpdateDeduction( )
                        data: _dataUpdate,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        crossdomain: true,
                        success: function (response) {

                            //LoadDeduction();
                            //SubMenuDisplay('deduction');

                        },
                        error: function (response) {
                            alert(response.status);
                        }
                    });

                    //chunk += $(this).find("td .range").val() + "," + $(this).find("td .employer").val() + "," + $(this).find("td .employee").val() + "^";
                }
               
            });


         




        }



    }
}

function GenerateDeductionTableChunk() {

    //-------------------------

    var chunk = "";
    $("#deduction_range tbody tr").each(function (i) {

        if ($(this).find("td .range").val().length > 0)
        {
            chunk += $(this).find("td .range").val() + "," + $(this).find("td .employee").val() + "," + $(this).find("td .employer").val() + "^";
        }
        // alert($(this).find("td .range").val() + "," + $(this).find("td .employer").val() + "," + $(this).find("td .employee").val() + "^");

    });

    var table = $("#deduction_range tbody");
    for (var i = 0; i < 50; i++)//plus 50 rows
    {
        table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
    }
    //alert(chunk);


    return chunk;
}

function ActionDeleteDeduction(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_deduction_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Deduction.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteDeduction",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadDeduction();
                    SubMenuDisplay('deduction');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function DeductionAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Deduction.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteDeduction",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_deduction_search").autocomplete({
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


    $("#txt_deduction_search").autocomplete({
        select: function (a, b) {

            ActionSelectDeduction(b.item.id)
        }
    });
}

function ActionSearchDeduction(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_deductions .save').addClass('disabled');
        $('#action_deductions .delete').addClass('disabled');
        $('#action_deductions .new').addClass('disabled');
        $('#action_deductions .find').addClass('disabled');

        $("#xDeduction").hide();
        $("#xDeductionManage").hide();
        $("#xDeductionSearch").show();

        $('#txt_deduction_search').val('');
        DeductionAutoCompleteByName();
    }
}



//------Benefits SECTION-----------------------

function LoadBenefits() {
    var pageUrl = '/Webservice/svr_Benefit.asmx';


    $.ajax({
        type: "POST",
        //SelectBenefit(long id,string benefit_name)
        url: pageUrl + "/SelectBenefit",
        data: "{ 'id':'0', 'benefit_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xBenefits tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xBenefits tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectBenefits('" + data[i]["ID"] + "')\">" + data[i]["BenefitName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankBenefits()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankBenefits() {
    for (var i = 0; i < 30; i++) {
        $('#xBenefits tbody:last').append("<tr><td width='50%'><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}



function ActionSelectBenefits(id) {
    $('#action_benefits .save').removeClass('disabled');
    $('#action_benefits .delete').removeClass('disabled');
    $('#action_benefits .new').addClass('disabled');
    $('#action_benefits .find').addClass('disabled');

    $("#hdn_benefits_id").val(id);



    var pageUrl = '/Webservice/svr_Benefit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectBenefit",
        data: "{ 'id':'" + id + "', 'benefit_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_benefits").val(data[i]["BenefitName"]);
                $("#txt_days_allocated").val(data[i]["DayAllocated"]);
                $("#txt_add_to_year").val(data[i]["AddToYear"]);
                $("#txt_used_leave").val(data[i]["UsedLeaved"]);
                $("#txt_balance").val(data[i]["Balance"]);


                if (data[i]["Automatic"] == true) {
                    $("#chk_accumulation").attr('checked', 'checked');
                }

                if (data[i]["Automatic"] == true) {
                    $("#chk_cash_convertion").attr('checked', 'checked');
                }



            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xBenefits").hide();
    $("#xBenefitsSearch").hide();
    $("#xBenefitsManage").show();

}

function ActionNewBenefits(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_benefits_id").val('0');
     

        $("#txt_benefits").val('');
        $("#txt_days_allocated").val('0');
        $("#txt_add_to_year").val('0');
        $("#txt_used_leave").val('0');
        $("#txt_balance").val('0');



        $('#action_benefits .save').removeClass('disabled');
        $('#action_benefits .delete').addClass('disabled');
        $('#action_benefits .new').addClass('disabled');
        $('#action_benefits .find').addClass('disabled');

        $("#xBenefits").hide();
        $("#xBenefitsSearch").hide();
        $("#xBenefitsManage").show();

    }
}

function ActionSaveUpdateBenefits(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Benefit.asmx';


        var id = $("#hdn_benefits_id").val();

        var benefit =                 $("#txt_benefits").val();
        var days_allocated =          $("#txt_days_allocated").val();
        var add_to_year =             $("#txt_add_to_year").val();
        var used_leave =              $("#txt_used_leave").val();
        var balance =                 $("#txt_balance").val();
        var accumulation =            false;
        var conversion =              false;
     

        if ($('#chk_accumulation').is(":checked")) {
            accumulation = true;
        }


        if ($('#chk_cash_convertion').is(":checked")) {
            conversion = true;
        }

        if (id == '0') {
            //InsertBenefit( )
            var data_transfer = "{  'benefit_name':'{0}',  'day_allocated':'{1}',  'add_to_year':'{2}',  'used_leave':'{3}',  'balance':'{4}',  'accumulation':'{5}',  'cash_conversion':'{6}'  }"
               .f(benefit, days_allocated, add_to_year, used_leave, balance, accumulation, conversion);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertBenefit",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadBenefits();
                    SubMenuDisplay('benefits');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{ 'id':'" + id + "', 'benefit_name':'{0}',  'day_allocated':'{1}',  'add_to_year':'{2}',  'used_leave':'{3}',  'balance':'{4}',  'accumulation':'{5}',  'cash_conversion':'{6}'  }"
                .f(benefit, days_allocated, add_to_year, used_leave, balance, accumulation, conversion);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateBenefit",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadBenefits();
                    SubMenuDisplay('benefits');


                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }



    }
}

function ActionDeleteBenefits(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_benefits_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Benefit.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteBenefit",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadBenefits();
                    SubMenuDisplay('benefits');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function BenefitsAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Benefit.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteBenefit",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_benefit_search").autocomplete({
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


    $("#txt_benefit_search").autocomplete({
        select: function (a, b) {

            ActionSelectBenefits(b.item.id)
        }
    });
}

function ActionSearchBenefits(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_benefits .save').addClass('disabled');
        $('#action_benefits .delete').addClass('disabled');
        $('#action_benefits .new').addClass('disabled');
        $('#action_benefits .find').addClass('disabled');

        $("#xBenefits").hide();
        $("#xBenefitsManage").hide();
        $("#xBenefitsSearch").show();

        $('#txt_benefit_search').val('');
        BenefitsAutoCompleteByName();
    }
}






//------Wages SECTION-----------------------

function LoadWages() {
    var pageUrl = '/Webservice/svr_Wage.asmx';


    $.ajax({
        type: "POST",
        //SelectWage(long id, string wage_name,string wage_type,decimal multiple_by)
        url: pageUrl + "/SelectWage",
        data: "{ 'id':'0', 'wage_name':'', 'wage_type':'','multiple_by':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xWages tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xWages tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectWages('" + data[i]["ID"] + "')\">" + data[i]["WageName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankWages()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankWages() {
    for (var i = 0; i < 30; i++) {
        $('#xWages tbody:last').append("<tr><td width='50%'><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectWages(id) {
    $('#action_wages .save').removeClass('disabled');
    $('#action_wages .delete').removeClass('disabled');
    $('#action_wages .new').addClass('disabled');
    $('#action_wages .find').addClass('disabled');

    $("#hdn_wages_id").val(id);



    var pageUrl = '/Webservice/svr_Wage.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectWage",
        data: "{ 'id':'" + id + "', 'wage_name':'', 'wage_type':'','multiple_by':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_wages").val(data[i]["WageName"]);
                $("#ddl_wages_type").val(data[i]["WageType"]);
                $("#txt_wages_multiply").val(data[i]["MultiplyBy"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xWages").hide();
    $("#xWagesSearch").hide();
    $("#xWagesManage").show();

}

function ActionNewWages(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_wages_id").val('0');
        $("#txt_wages").val('');
        $("#txt_wages_multiply").val('');


        $('#action_wages .save').removeClass('disabled');
        $('#action_wages .delete').addClass('disabled');
        $('#action_wages .new').addClass('disabled');
        $('#action_wages .find').addClass('disabled');

        $("#xWages").hide();
        $("#xWagesSearch").hide();
        $("#xWagesManage").show();

    }
}

function ActionSaveUpdateWages(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Wage.asmx';
        var id = $("#hdn_wages_id").val();
        var wage = $("#txt_wages").val();
        var type = $("#ddl_wages_type").val();
        var multiply = $("#txt_wages_multiply").val();



        if (id == '0') {
            //InsertWage( string wage_name, string wage_type, decimal multiple_by)
            var data_transfer = "{ 'wage_name':'{0}', 'wage_type':'{1}','multiple_by':'{2}'}"
               .f(wage, type, multiply);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertWage",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadWages();
                    SubMenuDisplay('wages');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{ 'id':'" + id + "', 'wage_name':'{0}', 'wage_type':'{1}','multiple_by':'{2}'}"
                 .f(wage, type, multiply);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateWage",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadWages();
                    SubMenuDisplay('wages');


                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }



    }
}

function ActionDeleteWages(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_wages_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Wage.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteWage",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadWages();
                    SubMenuDisplay('wages');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function WagesAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Wage.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteWages",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_wages_search").autocomplete({
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


    $("#txt_wages_search").autocomplete({
        select: function (a, b) {

            ActionSelectWages(b.item.id)
        }
    });
}

function ActionSearchWages(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_wages .save').addClass('disabled');
        $('#action_wages .delete').addClass('disabled');
        $('#action_wages .new').addClass('disabled');
        $('#action_wages .find').addClass('disabled');

        $("#xWages").hide();
        $("#xWagesManage").hide();
        $("#xWagesSearch").show();

        $('#txt_wages_search').val('');
        WagesAutoCompleteByName();
    }
}

//-------------------------------------------------------------


//function LoadRegion() {
//    var pageUrl = '/Webservice/svr_Region.asmx';

//    $.ajax({
//        type: "POST",
//        url: pageUrl + "/SelectRegion",
//        data: "{'id':'0','region_name':'' }",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        crossdomain: true,
//        success: function (response) {

//            $('#xRegionProvince tbody').empty();
//            var data = eval(response.d);
//            var obj = "";
//            for (var i = 0; i < data.length; i++) {

//                $('#xRegionProvince tbody:last').append("<tr><td><div onclick=\"ActionSelectRegion('" + data[i]["ID"] + "')\">" + data[i]["RegionName"] + "</div></td></tr>");

//            }
//        },
//        error: function (response) {
//            alert(response.status);
//        }
//    });
//}

//function ActionSelectRegion(id) {
//    $('#action_region_province .save').removeClass('disabled');
//    $('#action_region_province .delete').removeClass('disabled');
//    $('#action_region_province .new').addClass('disabled');
//    $('#action_region_province .find').addClass('disabled');

//    $("#hdn_region_id").val(id);

//    var pageUrl = '/Webservice/svr_Region.asmx';

//    $.ajax({
//        type: "POST",
//        url: pageUrl + "/SelectRegion",
//        data: "{'id':'" + id + "','region_name':'' }",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        crossdomain: true,
//        success: function (response) {

//            var data = eval(response.d);
//            var obj = "";
//            for (var i = 0; i < data.length; i++) {

//                $("#txt_region").val(data[i]["RegionName"]);
//            }

//            SelectDataRegionMunicipality(id);


//        },
//        error: function (response) {
//            alert(response.status);
//        }
//    });


//    $("#xRegionProvince").hide();
//    $("#xRegionProvinceSearch").hide();
//    $("#xRegionProvinceManage").show();
//}

//function SelectDataRegionMunicipality(id) {
//    var pageUrl = '/Webservice/svr_RegionMunicipality.asmx';

//    //SelectRegionMunicipality(long id, long region_id)
//    $.ajax({
//        type: "POST",
//        url: pageUrl + "/SelectRegionMunicipality",
//        data: "{ 'id':'0', 'region_id':'" + id + "'}",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        crossdomain: true,
//        success: function (response) {

//            var data = eval(response.d);
//            var table = $("#region_province_table tbody");
//            table.empty();
//            var range_data = data;

//            //alert(range_data);
//            for (var i = 0; i < range_data.length; i++) {

//                table.append("<tr><td width='33%'><input class='hdn' value='" + data[i]["ID"] + "' type='hidden' /><input type='text' autocorrect='off' spellcheck='false' class='short municipality' value='" + data[i]["MunicipalityName"] + "'></td></tr>");

//            }

//            for (var i = 0; i < 50; i++)//plus 50 rows
//            {
//                table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short municipality'></td></tr>");
//            }



//        },
//        error: function (response) {
//            alert(response.status);
//        }
//    });
//}

//function ActionNewRegion(me) {

//    if ($(me).hasClass("disabled") == false) {
//        $("#hdn_region_id").val('0');
//        $("#txt_region").val('');

//        $('#action_region_province .save').removeClass('disabled');
//        $('#action_region_province .delete').addClass('disabled');
//        $('#action_region_province .new').addClass('disabled');
//        $('#action_region_province .find').addClass('disabled');

//        $("#xRegionProvince").hide();
//        $("#xRegionProvinceManage").show();

//        var table = $("#region_province_table tbody");
//        table.empty();

//        for (var i = 0; i < 50; i++)//plus 50 rows
//        {
//            table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short municipality'></td></tr>");
//        }
//    }
//}

//function ActionSaveUpdateRegion(me) {

//    if ($(me).hasClass("disabled") == false) {



//        var id = $("#hdn_region_id").val();
//        var region_name = $("#txt_region").val();
//        var table_chunk = GenerateMunicipalityTableChunk();
//        if (id == '0') {



//            var pageUrl = '/Webservice/svr_Region.asmx';

//            var data_transfer = "{'region_name':'{0}','table_chunk':'{1}'}"
//                .f(region_name, table_chunk);


//            $.ajax({
//                type: "POST",
//                url: pageUrl + "/InsertRegion",
//                data: data_transfer,
//                contentType: "application/json; charset=utf-8",
//                dataType: "json",
//                crossdomain: true,
//                success: function (response) {

//                    LoadRegion();
//                    SubMenuDisplay('region_province');

//                },
//                error: function (response) {
//                    alert(response.status);
//                }
//            });




//        } else {



//            var pageUrl = '/Webservice/svr_Region.asmx';

//            var data_transfer = "{'id':'{0}', 'region_name':'{1}'}"
//                .f(id, region_name);


//            $.ajax({
//                type: "POST",
//                url: pageUrl + "/UpdateRegion",
//                data: data_transfer,
//                contentType: "application/json; charset=utf-8",
//                dataType: "json",
//                crossdomain: true,
//                success: function (response) {
//                    LoadRegion();
//                    SubMenuDisplay('region_province');
//                },
//                error: function (response) {
//                    alert(response.status);
//                }
//            });

//            $("#region_province_table tbody tr").each(function (i) {

//                if ($(this).find("td .municipality").val().length > 0) {

//                    var _dataUpdate = "{'id':'" + $(this).find("td .hdn").val() + "',  'region_id':'" + id + "',  'municipality_name':'" + $(this).find("td .municipality").val() + "'}";

//                    $.ajax({
//                        type: "POST",
//                        url: "/Webservice/svr_RegionMunicipality.asmx/UpdateRegionMunicipality",
//                        //UpdateDeduction( )
//                        data: _dataUpdate,
//                        contentType: "application/json; charset=utf-8",
//                        dataType: "json",
//                        crossdomain: true,
//                        success: function (response) {
//                        },
//                        error: function (response) {
//                            alert(response.status);
//                        }
//                    });

//                }

//            });

//        }
//    }
//}

//function GenerateMunicipalityTableChunk() {

//    //-------------------------

//    var chunk = "";
//    $("#region_province_table tbody tr").each(function (i) {

//        if ($(this).find("td .municipality").val().length > 0) {
//            chunk += $(this).find("td .municipality").val() + "^";
//        }

//    });

//    //var table = $("#region_province_table tbody");
//    //for (var i = 0; i < 50; i++)//plus 50 rows
//    //{
//    //    table.append("<tr><td width='33%'><input class='hdn' type='hidden' value='0' /><input type='text' autocorrect='off' spellcheck='false' class='short range'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employee'></td><td width='33%'><input type='text' autocorrect='off' spellcheck='false' class='short employer'></td></tr>");
//    //}


//    return chunk;
//}

//function ActionDeleteRegion(me) {
//    if ($(me).hasClass("disabled") == false) {
//        var id = $("#hdn_region_id").val();
//        //var location_name = $("#txt_location").val();

//        if (id != '0') {

//            var pageUrl = '/Webservice/svr_Region.asmx';

//            var data_transfer = "{'id':'{0}'}"
//                .f(id);


//            $.ajax({
//                type: "POST",
//                url: pageUrl + "/DeleteRegion",
//                data: data_transfer,
//                contentType: "application/json; charset=utf-8",
//                dataType: "json",
//                crossdomain: true,
//                success: function (response) {

//                    LoadRegion();
//                    SubMenuDisplay('region_province');
//                },
//                error: function (response) {
//                    alert(response.status);
//                }
//            });


//        }
//    }
//}

//function RegionAutoCompleteByName() {
//    var pageUrl = '/Webservice/svr_Region.asmx';
//    $.ajax({
//        type: "POST",
//        url: pageUrl + "/AutoCompleteRegion",
//        data: "{  }",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (response) {
//            $("#txt_region_search").autocomplete({
//                source: response.d,
//                minLength: 0,
//                minChars: 0,
//                max: 12,
//                autoFill: true,
//                matchContains: false
//            })

//                .on('focus', function (event) {
//                    var self = this;
//                    $(self).autocomplete("search", "");
//                });
//        },

//        error: function (response) {
//            alert(response.status);
//        }

//    });


//    $("#txt_region_search").autocomplete({
//        select: function (a, b) {

//            ActionSelectRegion(b.item.id)
//        }
//    });
//}

//function ActionSearchRegion(me) {
//    if ($(me).hasClass("disabled") == false) {
//        $('#action_region_province .save').addClass('disabled');
//        $('#action_region_province .delete').addClass('disabled');
//        $('#action_region_province .new').addClass('disabled');
//        $('#action_region_province .find').addClass('disabled');

//        $("#xRegionProvince").hide();
//        $("#xRegionProvinceManage").hide();
//        $('#xRegionProvinceSearch').show();

//        $('#txt_region_search').val('');
//        RegionAutoCompleteByName();
//    }
//}

//function ValidateAddUpdateRegion() {
//    var location = $("#txt_region").val();

//    var message = "";

//    if (location == "") {
//        message += "Region required!";
//    }

//    //-------------------------
//    if (message == "") {
//        return true
//    }
//    else {

//        alert(message);
//        return false;
//    }
//}