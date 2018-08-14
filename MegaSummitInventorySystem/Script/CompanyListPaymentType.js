/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />

var bl;
//------CardType SECTION-----------------------

function LoadCardType() {
    var pageUrl = '/Webservice/svr_CardType.asmx';


    $.ajax({
        type: "POST",
        //SelectBenefit(long id,string benefit_name)
        url: pageUrl + "/SelectCardType",
        data: "{ 'id':'0', 'card_type':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xCardType tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xCardType tbody:last').append("<tr><td width='50%'><div onclick=\"ActionSelectCardType('" + data[i]["ID"] + "')\">" + data[i]["CardTypeName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankCardType()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankCardType() {
    for (var i = 0; i < 30; i++) {
        $('#xCardType tbody:last').append("<tr><td width='50%'><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectCardType(id) {
    $('#action_card_type .save').removeClass('disabled');
    $('#action_card_type .delete').removeClass('disabled');
    $('#action_card_type .new').addClass('disabled');
    $('#action_card_type .find').addClass('disabled');

    $("#hdn_card_type_id").val(id);



    var pageUrl = '/Webservice/svr_CardType.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCardType",
        data: "{ 'id':'" + id + "', 'card_type':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_card_type").val(data[i]["CardTypeName"]);


            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xCardType").hide();
    $("#xCardTypeSearch").hide();
    $("#xCardTypeManage").show();

}

function ActionNewCardType(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_card_type_id").val('0');


        $("#txt_card_type").val('');
     



        $('#action_card_type .save').removeClass('disabled');
        $('#action_card_type .delete').addClass('disabled');
        $('#action_card_type .new').addClass('disabled');
        $('#action_card_type .find').addClass('disabled');

        $("#xCardType").hide();
        $("#xCardTypeSearch").hide();
        $("#xCardTypeManage").show();

    }
}

function ActionSaveUpdateCardType(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_CardType.asmx';


        var id = $("#hdn_card_type_id").val();

        var card = $("#txt_card_type").val();


    
        if (id == '0') {
            //InsertBenefit( )
            var data_transfer = "{ 'card_type':'{0}'}"
               .f(card);

            $.ajax({
                type: "POST",
                url: pageUrl + "/InsertCardType",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadCardType();
                    SubMenuDisplay('card');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        } else {


            var data_transfer = "{ 'id':'" + id + "', 'card_type':'{0}'}"
                .f(card);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateCardType",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadCardType();
                    SubMenuDisplay('card');


                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }



    }
}

function ActionDeleteCardType(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_card_type_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_CardType.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteCardType",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadCardType();
                    SubMenuDisplay('card');

                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function CardTypeAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_CardType.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteCardType",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_card_type_search").autocomplete({
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


    $("#txt_card_type_search").autocomplete({
        select: function (a, b) {

            ActionSelectCardType(b.item.id)
        }
    });
}

function ActionSearchCardType(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_card_type .save').addClass('disabled');
        $('#action_card_type .delete').addClass('disabled');
        $('#action_card_type .new').addClass('disabled');
        $('#action_card_type .find').addClass('disabled');

        $("#xCardType").hide();
        $("#xCardTypeManage").hide();
        $("#xCardTypeSearch").show();

        $('#txt_card_type_search').val('');
        CardTypeAutoCompleteByName();
    }
}
