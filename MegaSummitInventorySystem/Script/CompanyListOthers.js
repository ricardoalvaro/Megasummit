/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

var bl;

//------HOLIDAY SECTION-----------------------

function LoadHoliday() {
    var pageUrl = '/Webservice/svr_Holiday.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectHoliday",
        data: "{ 'id':'0', 'holiday_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xHoliday tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xHoliday tbody:last').append("<tr><td><div onclick=\"ActionSelectHoliday('" + data[i]["ID"] + "')\">" + data[i]["HolidayName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankHoliday()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankHoliday() {
    for (var i = 0; i < 30; i++) {
        $('#xHoliday tbody:last').append("<tr><td><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectHoliday(id) {
    $('#action_holiday .save').removeClass('disabled');
    $('#action_holiday .delete').removeClass('disabled');
    $('#action_holiday .new').addClass('disabled');
    $('#action_holiday .find').addClass('disabled');

    $("#hdn_holiday_id").val(id);



    var pageUrl = '/Webservice/svr_Holiday.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectHoliday",
        data: "{ 'id':'" + id + "', 'holiday_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_holiday").val(data[i]["HolidayName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xHoliday").hide();
    $("#xHolidaySearch").hide();
    $("#xHolidayManage").show();

}

function ActionNewHoliday(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_holiday_id").val('0');
        $("#txt_holiday").val('');

        $('#action_holiday .save').removeClass('disabled');
        $('#action_holiday .delete').addClass('disabled');
        $('#action_holiday .new').addClass('disabled');
        $('#action_holiday .find').addClass('disabled');

        $("#xHoliday").hide();
        $("#xHolidaySearch").hide();
        $("#xHolidayManage").show();

    }
}

function ActionSaveUpdateHoliday(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Holiday.asmx';
        var id = $("#hdn_holiday_id").val();
        var holiday = $("#txt_holiday").val();


        if (id == '0') {
            if (ValidateAddUpdateHoliday()) {
                var data_transfer = "{ 'holiday_name':'{0}'}"
                    .f(holiday);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertHoliday",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadHoliday();
                        SubMenuDisplay('holiday');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }


        } else {

            if (ValidateAddUpdateHoliday()) {
                var data_transfer = "{ 'id':'{0}','holiday_name':'{1}' }"
                     .f(id, holiday);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateHoliday",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadHoliday();
                        SubMenuDisplay('holiday');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteHoliday(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_holiday_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Holiday.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteHoliday",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadHoliday();
                    SubMenuDisplay('holiday');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function HolidayAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Holiday.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteHoliday",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_holiday_search").autocomplete({
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


    $("#txt_holiday_search").autocomplete({
        select: function (a, b) {

            ActionSelectHoliday(b.item.id)
        }
    });
}

function ActionSearchHoliday(me) {

    if ($(me).hasClass("disabled") == false) {

        $('#action_holiday .save').addClass('disabled');
        $('#action_holiday .delete').addClass('disabled');
        $('#action_holiday .new').addClass('disabled');
        $('#action_holiday .find').addClass('disabled');

        $("#xHoliday").hide();
        $("#xHolidayManage").hide();
        $("#xHolidaySearch").show();

        $('#txt_holiday_search').val('');
        HolidayAutoCompleteByName();
    }
}

function ValidateAddUpdateHoliday() {
    var holiday = $("#txt_holiday").val();

    var message = "";

    if (holiday == "") {
        message += "Holiday required! <br>";
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


//------REMARKS SECTION-----------------------


function LoadRemarks() {
    var pageUrl = '/Webservice/svr_Remarks.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRemarks",
        data: "{ 'id':'0', 'remarks_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xRemarks tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xRemarks tbody:last').append("<tr><td><div onclick=\"ActionSelectRemarks('" + data[i]["ID"] + "')\">" + data[i]["RemarksName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankRemarks()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankRemarks() {
    for (var i = 0; i < 30; i++) {
        $('#xRemarks tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectRemarks(id) {
    $('#action_remarks .save').removeClass('disabled');
    $('#action_remarks .delete').removeClass('disabled');
    $('#action_remarks .new').addClass('disabled');
    $('#action_remarks .find').addClass('disabled');

    $("#hdn_remarks_id").val(id);



    var pageUrl = '/Webservice/svr_Remarks.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectRemarks",
        data: "{ 'id':'" + id + "', 'remarks_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_remarks").val(data[i]["RemarksName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xRemarks").hide();
    $("#xRemarksSearch").hide();
    $("#xRemarksManage").show();

}

function ActionNewReturn(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_remarks_id").val('0');
        $("#txt_remarks").val('');

        $('#action_remarks .save').removeClass('disabled');
        $('#action_remarks .delete').addClass('disabled');
        $('#action_remarks .new').addClass('disabled');
        $('#action_remarks .find').addClass('disabled');

        $("#xRemarks").hide();
        $("#xRemarksSearch").hide();
        $("#xRemarksManage").show();

    }
}

function ActionSaveUpdateRemarks(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Remarks.asmx';
        var id = $("#hdn_remarks_id").val();
        var remarks = $("#txt_remarks").val();


        if (id == '0') {
            if (ValidateAddUpdateRemarks()) {
                var data_transfer = "{ 'remarks_name':'{0}'}"
                    .f(remarks);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertRemarks",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadRemarks();
                        SubMenuDisplay('remarks');

                    },
                    error: function (response) {
                        alert(response.status);
                    }

                });
            }

        } else {

            if (ValidateAddUpdateRemarks()) {
                var data_transfer = "{ 'id':'{0}','remarks_name':'{1}' }"
                     .f(id, remarks);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateRemarks",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadRemarks();
                        SubMenuDisplay('remarks');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteRemarks(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_remarks_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Remarks.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteRemarks",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadRemarks();
                    SubMenuDisplay('remarks');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function RemarksAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Remarks.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteRemarks",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_remarks_search").autocomplete({
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


    $("#txt_remarks_search").autocomplete({
        select: function (a, b) {

            ActionSelectRemarks(b.item.id)
        }
    });
}

function ActionSearchRemarks(me) {

    if ($(me).hasClass("disabled") == false) {

        $('#action_remarks .save').addClass('disabled');
        $('#action_remarks .delete').addClass('disabled');
        $('#action_remarks .new').addClass('disabled');
        $('#action_remarks .find').addClass('disabled');

        $("#xRemarks").hide();
        $("#xRemarksManage").hide();
        $("#xRemarksSearch").show();

        $('#txt_remarks_search').val('');
        RemarksAutoCompleteByName();
    }
}

function ValidateAddUpdateRemarks() {
    var remarks = $("#txt_remarks").val();

    var message = "";

    if (remarks == "") {
        message += "Remarks required! <br>";
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




//------REASON OF RETURN SECTION-----------------------


function LoadReasonOfReturn() {
    var pageUrl = '/Webservice/svr_ReasonOfReturn.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReasonOfReturn",
        data: "{ 'id':'0', 'return_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xReasonOfReturn tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xReasonOfReturn tbody:last').append("<tr><td><div onclick=\"ActionSelectReasonOfReturn('" + data[i]["ID"] + "')\">" + data[i]["ReturnName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankReasonOfReturn()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankReasonOfReturn() {
    for (var i = 0; i < 30; i++) {
        $('#xReasonOfReturn tbody:last').append("<tr><td><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectReasonOfReturn(id) {
    $('#action_reason_of_return .save').removeClass('disabled');
    $('#action_reason_of_return .delete').removeClass('disabled');
    $('#action_reason_of_return .new').addClass('disabled');
    $('#action_reason_of_return .find').addClass('disabled');

    $("#hdn_reason_of_return_id").val(id);



    var pageUrl = '/Webservice/svr_ReasonOfReturn.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReasonOfReturn",
        data: "{ 'id':'" + id + "', 'return_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_reason_of_return").val(data[i]["ReturnName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xReasonOfReturn").hide();
    $("#xReasonOfReturnSearch").hide();
    $("#xReasonOfReturnManage").show();

}

function ActionNewReasonOfReturn(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_reason_of_return_id").val('0');
        $("#txt_reason_of_return").val('');

        $('#action_reason_of_return .save').removeClass('disabled');
        $('#action_reason_of_return .delete').addClass('disabled');
        $('#action_reason_of_return .new').addClass('disabled');
        $('#action_reason_of_return .find').addClass('disabled');

        $("#xReasonOfReturn").hide();
        $("#xReasonOfReturnSearch").hide();
        $("#xReasonOfReturnManage").show();

    }
}

function ActionSaveUpdateReasonOfReturn(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_ReasonOfReturn.asmx';
        var id = $("#hdn_reason_of_return_id").val();
        var return_name = $("#txt_reason_of_return").val();


        if (id == '0') {
            if (ValidateAddUpdateReasonOfReturn()) {
                var data_transfer = "{ 'return_name':'{0}'}"
                    .f(return_name);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertReasonOfReturn",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadReasonOfReturn();
                        SubMenuDisplay('reason_of_return');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateReasonOfReturn()) {
                var data_transfer = "{ 'id':'{0}','return_name':'{1}' }"
                     .f(id, return_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateReasonOfReturn",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadReasonOfReturn();
                        SubMenuDisplay('reason_of_return');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteReasonOfReturn(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_reason_of_return_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_ReasonOfReturn.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteReasonOfReturn",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadReasonOfReturn();
                    SubMenuDisplay('reason_of_return');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function ReasonOfReturnAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_ReasonOfReturn.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteReasonOfReturn",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_reason_of_return_search").autocomplete({
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


    $("#txt_reason_of_return_search").autocomplete({
        select: function (a, b) {

            ActionSelectReasonOfReturn(b.item.id)
        }
    });
}

function ActionSearchReasonOfReturn(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_reason_of_return .save').addClass('disabled');
        $('#action_reason_of_return .delete').addClass('disabled');
        $('#action_reason_of_return .new').addClass('disabled');
        $('#action_reason_of_return .find').addClass('disabled');

        $("#xReasonOfReturn").hide();
        $("#xReasonOfReturnManage").hide();
        $("#xReasonOfReturnSearch").show();

        $('#txt_reason_of_return_search').val('');
        ReasonOfReturnAutoCompleteByName();
    }
}

function ValidateAddUpdateReasonOfReturn() {
    var reason_of_return = $("#txt_reason_of_return").val();

    var message = "";

    if (reason_of_return == "") {
        message += "Reason of Return required! <br>";
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




//------REASON OF ADJUSTMENT SECTION-----------------------

function LoadReasonOfAdjustment() {
    var pageUrl = '/Webservice/svr_ReasonOfAdjustment.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReasonOfAdjustment",
        data: "{ 'id':'0', 'adjustment_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xReasonOfAdjustment tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xReasonOfAdjustment tbody:last').append("<tr><td><div onclick=\"ActionSelectAdjustment('" + data[i]["ID"] + "')\">" + data[i]["ReasonName"] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankReasonOfAdjustment()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankReasonOfAdjustment() {
    for (var i = 0; i < 30; i++) {
        $('#xReasonOfAdjustment tbody:last').append("<tr><td><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectAdjustment(id) {
    $('#action_reason_of_adjustment .save').removeClass('disabled');
    $('#action_reason_of_adjustment .delete').removeClass('disabled');
    $('#action_reason_of_adjustment .new').addClass('disabled');
    $('#action_reason_of_adjustment .find').addClass('disabled');

    $("#hdn_reason_of_adjustment_id").val(id);



    var pageUrl = '/Webservice/svr_ReasonOfAdjustment.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectReasonOfAdjustment",
        data: "{ 'id':'" + id + "', 'adjustment_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_reason_of_adjustment").val(data[i]["ReasonName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xReasonOfAdjustment").hide();
    $("#xReasonOfAdjustmentSearch").hide();
    $("#xReasonOfAdjustmentManage").show();

}

function ActionNewReasonOfAdjustment(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_reason_of_adjustment_id").val('0');
        $("#txt_reason_of_adjustment").val('');

        $('#action_reason_of_adjustment .save').removeClass('disabled');
        $('#action_reason_of_adjustment .delete').addClass('disabled');
        $('#action_reason_of_adjustment .new').addClass('disabled');
        $('#action_reason_of_adjustment .find').addClass('disabled');

        $("#xReasonOfAdjustment").hide();
        $("#xReasonOfAdjustmentSearch").hide();
        $("#xReasonOfAdjustmentManage").show();

    }
}

function ActionSaveUpdateReasonOfAdjustment(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_ReasonOfAdjustment.asmx';
        var id = $("#hdn_reason_of_adjustment_id").val();
        var category_name = $("#txt_reason_of_adjustment").val();


        if (id == '0') {
            if (ValidateAddUpdateReasonOfAdjustment()) {
                var data_transfer = "{ 'adjustment_name':'{0}'}"
                    .f(category_name);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertReasonOfAdjustment",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadReasonOfAdjustment();
                        SubMenuDisplay('reason_of_adjustment');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateReasonOfAdjustment()) {
                var data_transfer = "{ 'id':'{0}','adjustment_name':'{1}' }"
                     .f(id, category_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateReasonOfAdjustment",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadReasonOfAdjustment();
                        SubMenuDisplay('reason_of_adjustment');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteReasonOfAdjustment(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_reason_of_adjustment_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_ReasonOfAdjustment.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteReasonOfAdjustment",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadReasonOfAdjustment();
                    SubMenuDisplay('reason_of_adjustment');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function ReasonOfAdjustmentAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_ReasonOfAdjustment.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteReasonOfAdjustment",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_reason_of_adjustment_search").autocomplete({
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


    $("#txt_reason_of_adjustment_search").autocomplete({
        select: function (a, b) {

            ActionSelectAdjustment(b.item.id)
        }
    });
}

function ActionSearchReasonOfAdjustment(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_reason_of_adjustment .save').addClass('disabled');
        $('#action_reason_of_adjustment .delete').addClass('disabled');
        $('#action_reason_of_adjustment .new').addClass('disabled');
        $('#action_reason_of_adjustment .find').addClass('disabled');

        $("#xReasonOfAdjustment").hide();
        $("#xReasonOfAdjustmentManage").hide();
        $("#xReasonOfAdjustmentSearch").show();

        $('#txt_reason_of_adjustment_search').val('');
        ReasonOfAdjustmentAutoCompleteByName();
    }
}

function ValidateAddUpdateReasonOfAdjustment() {
    var reason_of_adjustment = $("#txt_reason_of_adjustment").val();

    var message = "";

    if (reason_of_adjustment == "") {
        message += "Reason of Adjustment required! <br>";
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













