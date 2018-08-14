/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

var bl;

//-------Packing Section

function LoadUnitPacking() {
    var pageUrl = '/Webservice/svr_Unit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectUnit",
        data: "{ 'id':'0', 'unit':'', 'plural':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ddl_unit_type').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#ddl_unit_type').append("<option value='" + data[i]["ID"] + "'>" + data[i]["UnitName"] + "</option>");

                //alert(data[i]["ID"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}


// ------------------------------------------- Filling Table Blank Space
function loadBlankUnitPacking() {
    for (var i = 0; i < 30; i++) {
        $('#xPacking tbody:last').append("<tr><td width='50%'><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function LoadSubUnitPacking() {
    var pageUrl = '/Webservice/svr_SubUnit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSubUnit",
        data: "{ 'id':'0', 'sub_unit_name':'', 'plural':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ddl_sub_unit_type').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#ddl_sub_unit_type').append("<option value='" + data[i]["ID"] + "'>" + data[i]["SubUnitName"] + "</option>");
                //("<tr><td width='50%'><div onclick=\"ActionSelectSubUnit('" + data[i]["ID"] + "')\">" + data[i]["SubUnitName"] + "</div></td><td width='50%'>" + data[i]["Plural"] + "</td></tr>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadPacking() {
    var pageUrl = '/Webservice/svr_Packing.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectPacking",
        //(long id, long packing,long unit_id,long packing2,long sub_unit_id)
        data: "{ 'id':'0', 'packing':'0', 'unit_id':'0','packing2':'0','sub_unit_id':'0' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPacking tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xPacking tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectPacking('" + data[i]["ID"] + "')\">" + data[i]["Packing"] + " - " + data[i]["UnitName"] + " - " + data[i]["Packing2"] + " - " + data[i]["SubUnitName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankUnitPacking()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function ActionSelectPacking(id) {
    $('#action_packing .save').removeClass('disabled');
    $('#action_packing .delete').removeClass('disabled');
    $('#action_packing .new').addClass('disabled');
    $('#action_packing .find').addClass('disabled');

    $("#hdn_packing_id").val(id);



    var pageUrl = '/Webservice/svr_Packing.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectPacking",
        data: "{ 'id':'" + id + "', 'packing':'0', 'unit_id':'0','packing2':'0','sub_unit_id':'0'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_packing").val(data[i]["Packing"]);
                $("#ddl_unit_type").val(data[i]["UnitID"]);
                $("#txt_packing_unit").val(data[i]["Packing2"]);
                $("#ddl_sub_unit_type").val(data[i]["SubUnitID"]);

                //alert(data[i]["Packing"]);
                //alert(data[i]["SubUnitName"]);
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xPacking").hide();
    $("#xPackingSearch").hide();
    $("#xPackingManage").show();

}

function ActionNewPacking(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_packing_id").val('0');
        $("#txt_packing").val('');
        $("#txt_packing_unit").val('');

        $('#action_packing .save').removeClass('disabled');
        $('#action_packing .delete').addClass('disabled');
        $('#action_packing .new').addClass('disabled');
        $('#action_packing .find').addClass('disabled');

        $("#xPacking").hide();
        $("#xPackingSearch").hide();
        $("#xPackingManage").show();

    }
}

function ActionSaveUpdatePacking(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Packing.asmx';
        var id = $("#hdn_packing_id").val();


        var packing1 = $("#txt_packing").val();
        var unit_type = $("#ddl_unit_type").val();
        var packing2 = $("#txt_packing_unit").val();
        var sub_type = $("#ddl_sub_unit_type").val();

        if (id == '0') {
            //InsertUnit(string unit, string plural)
            var data_transfer = "{  'packing':'{0}', 'unit_id':'{1}','packing2':'{2}','sub_unit_id':'{3}'}"
                .f(packing1, unit_type, packing2, sub_type);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertPacking",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadPacking();
                    SubMenuDisplay('packing');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{ 'id':'" + id + "', 'packing':'{0}', 'unit_id':'{1}','packing2':'{2}','sub_unit_id':'{3}'}"
            .f(packing1, unit_type, packing2, sub_type);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdatePacking",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadPacking();
                    SubMenuDisplay('packing');

                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }



    }
}

function ActionDeletePacking(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_packing_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_PAcking.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeletePacking",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadPacking();
                    SubMenuDisplay('packing');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function PackingAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Packing.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompletePacking",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_packing_search").autocomplete({
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


    $("#txt_packing_search").autocomplete({
        select: function (a, b) {

            ActionSelectPacking(b.item.id)
        }
    });
}

function ActionSearchPacking(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_packing .save').addClass('disabled');
        $('#action_packing .delete').addClass('disabled');
        $('#action_packing .new').addClass('disabled');
        $('#action_packing .find').addClass('disabled');

        $("#xPacking").hide();
        $("#xPackingManage").hide();
        $("#xPackingSearch").show();

        $('#txt_packing_search').val('');
        PackingAutoCompleteByName();
    }
}



//------TERMS SECTION-----------------------

function LoadTerms() {
    var pageUrl = '/Webservice/svr_Terms.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectTerm",
        data: "{ 'id':'0', 'term_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xTerms tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xTerms tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectTerm('" + data[i]["ID"] + "')\">" + data[i]["TermName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankTerms()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankTerms() {
    for (var i = 0; i < 30; i++) {
        $('#xTerms tbody:last').append("<tr><td width='50%'><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectTerm(id) {
    $('#action_terms .save').removeClass('disabled');
    $('#action_terms .delete').removeClass('disabled');
    $('#action_terms .new').addClass('disabled');
    $('#action_terms .find').addClass('disabled');

    $("#hdn_terms_id").val(id);



    var pageUrl = '/Webservice/svr_Terms.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectTerm",
        data: "{ 'id':'" + id + "', 'term_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_terms").val(data[i]["TermName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xTerms").hide();
    $("#xTermsSearch").hide();
    $("#xTermsManage").show();

}

function ActionNewTerm(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_terms_id").val('0');
        $("#txt_terms").val('');

        $('#action_terms .save').removeClass('disabled');
        $('#action_terms .delete').addClass('disabled');
        $('#action_terms .new').addClass('disabled');
        $('#action_terms .find').addClass('disabled');

        $("#xTerms").hide();
        $("#xTermsSearch").hide();
        $("#xTermsManage").show();

    }
}

function ActionSaveUpdateTerm(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Terms.asmx';
        var id = $("#hdn_terms_id").val();
        var terms = $("#txt_terms").val();


        if (id == '0') {
            if (ValidateAddUpdateTerms()) {
                //InsertUnit(string unit, string plural)
                var data_transfer = "{ 'term_name':'{0}'}"
                    .f(terms);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertTerm",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadTerms();
                        SubMenuDisplay('terms');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateTerms()) {
                var data_transfer = "{ 'id':'{0}','term_name':'{1}' }"
                     .f(id, terms);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateTerm",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadTerms();
                        SubMenuDisplay('terms');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteTerms(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_terms_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Terms.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteTerm",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadTerms();
                    SubMenuDisplay('terms');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function TermAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Terms.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteTerms",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_terms_search").autocomplete({
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


    $("#txt_terms_search").autocomplete({
        select: function (a, b) {

            ActionSelectTerm(b.item.id)
        }
    });
}

function ActionSearchTerm(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_terms .save').addClass('disabled');
        $('#action_terms .delete').addClass('disabled');
        $('#action_terms .new').addClass('disabled');
        $('#action_terms .find').addClass('disabled');

        $("#xTerms").hide();
        $("#xTermsManage").hide();
        $("#xTermsSearch").show();

        $('#txt_terms_search').val('');
        TermAutoCompleteByName();
    }
}

function ValidateAddUpdateTerms() {
    var terms = $("#txt_terms").val();

    var message = "";

    if (terms == "") {
        message += "Terms required! <br>";
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



//------SUB UNIT SECTION-----------------------



function LoadSubUnit() {
    var pageUrl = '/Webservice/svr_SubUnit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSubUnit",
        data: "{ 'id':'0', 'sub_unit_name':'', 'plural':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xSubUnit tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xSubUnit tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectSubUnit('" + data[i]["ID"] + "')\">" + data[i]["SubUnitName"] + "</div></td><td width='50%'>" + data[i]["Plural"] + "</td></tr>");

            }

            bl = window.setInterval("loadBlankSubUnit()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankSubUnit() {
    for (var i = 0; i < 30; i++) {
        $('#xSubUnit tbody:last').append("<tr><td width='50%'><div>" + "" + "</div></td><td width='50%'>" + "" + "</td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectSubUnit(id) {
    $('#action_sub_unit .save').removeClass('disabled');
    $('#action_sub_unit .delete').removeClass('disabled');
    $('#action_sub_unit .new').addClass('disabled');
    $('#action_sub_unit .find').addClass('disabled');

    $("#hdn_sub_unit_id").val(id);



    var pageUrl = '/Webservice/svr_SubUnit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectSubUnit",
        data: "{ 'id':'" + id + "', 'sub_unit_name':'', 'plural':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_sub_unit").val(data[i]["SubUnitName"]);
                $("#txt_plural_sub_unit").val(data[i]["Plural"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xSubUnit").hide();
    $("#xSubUnitSearch").hide();
    $("#xSubUnitManage").show();

}

function ActionNewSubUnit(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_sub_unit_id").val('0');
        $("#txt_sub_unit").val('');
        $("#txt_plural_sub_unit").val('');

        $('#action_sub_unit .save').removeClass('disabled');
        $('#action_sub_unit .delete').addClass('disabled');
        $('#action_sub_unit .new').addClass('disabled');
        $('#action_sub_unit .find').addClass('disabled');

        $("#xSubUnit").hide();
        $("#xSubUnitSearch").hide();
        $("#xSubUnitManage").show();

    }
}

function ActionSaveUpdateSubUnit(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_SubUnit.asmx';
        var id = $("#hdn_sub_unit_id").val();
        var unit = $("#txt_sub_unit").val();
        var plural = $("#txt_plural_sub_unit").val();


        if (id == '0') {
            if (ValidateAddUpdateSubUnit()) {
                //InsertUnit(string unit, string plural)
                var data_transfer = "{ 'sub_unit_name':'{0}','plural':'{1}'}"
                    .f(unit, plural);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertSubUnit",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadSubUnit();
                        SubMenuDisplay('sub_unit');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateSubUnit()) {
                var data_transfer = "{ 'id':'{0}','sub_unit_name':'{1}','plural':'{2}' }"
                     .f(id, unit, plural);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateSubUnit",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadUnit();
                        SubMenuDisplay('sub_unit');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteSubUnit(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_sub_unit_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_SubUnit.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteSubUnit",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadSubUnit();
                    SubMenuDisplay('sub_unit');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function SubUnitAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_SubUnit.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteSubUnit",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_sub_unit_search").autocomplete({
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


    $("#txt_sub_unit_search").autocomplete({
        select: function (a, b) {

            ActionSelectSubUnit(b.item.id)
        }
    });
}

function ActionSearchSubUnit(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_sub_unit .save').addClass('disabled');
        $('#action_sub_unit .delete').addClass('disabled');
        $('#action_sub_unit .new').addClass('disabled');
        $('#action_sub_unit .find').addClass('disabled');

        $("#xSubUnit").hide();
        $("#xSubUnitManage").hide();
        $("#xSubUnitSearch").show();

        $('#txt_sub_unit_search').val('');
        SubUnitAutoCompleteByName();
    }
}

function ValidateAddUpdateSubUnit() {
    var sub_unit = $("#txt_sub_unit").val();
    var plural = $("#txt_plural_sub_unit").val();

    var message = "";

    if (sub_unit == "") {
        message += "Sub Unit required! <br>";
    }

    if (plural == "") {
        message += "Plural required! <br>";
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


//------UNIT SECTION-----------------------

function LoadUnit() {
    var pageUrl = '/Webservice/svr_Unit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectUnit",
        data: "{ 'id':'0', 'unit':'', 'plural':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xUnit tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xUnit tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectUnit('" + data[i]["ID"] + "')\">" + data[i]["UnitName"] + "</div></td><td width='50%'>" + data[i]["Plural"] + "</td></tr>");

            }

            bl = window.setInterval("loadBlankUnit()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankUnit() {
    for (var i = 0; i < 30; i++) {
        $('#xUnit tbody:last').append("<tr><td width='50%'><div>" + "" + "</div></td><td width='50%'>" + "" + "</td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectUnit(id) {
    $('#action_unit .save').removeClass('disabled');
    $('#action_unit .delete').removeClass('disabled');
    $('#action_unit .new').addClass('disabled');
    $('#action_unit .find').addClass('disabled');

    $("#hdn_unit_id").val(id);



    var pageUrl = '/Webservice/svr_Unit.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectUnit",
        data: "{ 'id':'" + id + "', 'unit':'', 'plural':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_unit").val(data[i]["UnitName"]);
                $("#txt_plural").val(data[i]["Plural"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xUnit").hide();
    $("#xUnitSearch").hide();
    $("#xUnitManage").show();

}

function ActionNewUnit(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_unit_id").val('0');
        $("#txt_unit").val('');
        $("#txt_plural").val('');

        $('#action_unit .save').removeClass('disabled');
        $('#action_unit .delete').addClass('disabled');
        $('#action_unit .new').addClass('disabled');
        $('#action_unit .find').addClass('disabled');

        $("#xUnit").hide();
        $("#xUnitSearch").hide();
        $("#xUnitManage").show();

    }
}

function ActionSaveUpdateUnit(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Unit.asmx';
        var id = $("#hdn_unit_id").val();
        var unit = $("#txt_unit").val();
        var plural = $("#txt_plural").val();


        if (id == '0') {
            //InsertUnit(string unit, string plural)
            if (ValidateAddUpdateUnit()) {
                var data_transfer = "{ 'unit':'{0}','plural':'{1}'}"
                    .f(unit, plural);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertUnit",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadUnit();
                        SubMenuDisplay('unit');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateUnit()) {
                var data_transfer = "{ 'id':'{0}','unit':'{1}','plural':'{2}' }"
                     .f(id, unit, plural);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateUnit",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadUnit();
                        SubMenuDisplay('unit');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteUnit(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_unit_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Unit.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteUnit",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadUnit();
                    SubMenuDisplay('unit');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function UnitAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Unit.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteUnit",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_unit_search").autocomplete({
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


    $("#txt_unit_search").autocomplete({
        select: function (a, b) {

            ActionSelectUnit(b.item.id)
        }
    });
}

function ActionSearchUnit(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_unit .save').addClass('disabled');
        $('#action_unit .delete').addClass('disabled');
        $('#action_unit .new').addClass('disabled');
        $('#action_unit .find').addClass('disabled');

        $("#xUnit").hide();
        $("#xUnitManage").hide();
        $("#xUnitSearch").show();

        $('#txt_unit_search').val('');
        UnitAutoCompleteByName();
    }
}

function ValidateAddUpdateUnit() {
    var unit = $("#txt_unit").val();
    var plural = $("#txt_plural").val();

    var message = "";

    if (unit == "") {
        message += "Unit required! <br>";
    }

    if (plural == "") {
        message += "Plural required! <br>";
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