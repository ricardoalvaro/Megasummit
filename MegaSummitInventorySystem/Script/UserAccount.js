/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />



function ShowTableSelected(tab)
{

    $("#tbl_company").hide();
    $("#tbl_customer").hide();
    $("#tbl_supplier").hide();
    $("#tbl_employee").hide();
    $("#tbl_product").hide();
    $("#tbl_banking").hide();
    $("#tbl_accounts").hide();
    $("#tbl_accessories").hide();
    $("#tbl_report").hide();
    
    if (tab == 'company'){
        $("#tbl_company").show();
    }
    else if (tab == 'customer') {

        $("#tbl_customer").show();
    }
    else if (tab == 'supplier') {
        $("#tbl_supplier").show();
    }
    else if (tab == 'employee') {
        $("#tbl_employee").show();
    }
    else if (tab == 'product') {
        $("#tbl_product").show();
    }
    else if (tab == 'banking') {
        $("#tbl_banking").show();
    }
    else if (tab == 'accounts') {
        $("#tbl_accounts").show();
    }
    else if (tab == 'accessories') {
        $("#tbl_accessories").show();
    }
    else if (tab == 'report') {
        $("#tbl_report").show();
    }
    else {
        alert('Template here');
    }


}

function LoadAccessPrivilage()
{
    $("#user_form").hide();
    $("#access_privilage").show();

    /// load data here

}

function CreateUser()
{

    if ($("#btn-save").hasClass("disabled") == true) {

        //alert('save now');

        var pageUrl = '/Webservice/svr_UserAccount.asmx';
        var name = $("#txt_name").val();
        var user_name = $("#txt_username").val();
        var password = $("#txt_password").val();
        var user_type = $("#ddl_user_type option:selected").text();
        var position = $("#ddl_position option:selected").text();
        var status = $("#ddl_status option:selected").text();


        var data_transfer = "{'name':'{0}',  'position':'{1}',  'status':'{2}',  'user_name':'{3}',  'password':'{4}', 'role':'{5}'}"
            .f(name, position, status, user_name, password, user_type);
   

        var obj = JSON.stringify(data_transfer);


        $.ajax({
            type: "POST",
            url: pageUrl + "/CreateAccount",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                alert("Successfully saved");

                LoadAllUsers();
                NewEvent();

            },
            error: function (response) {
                alert(response.status);
            }
        });

    }

    
}


function loadData(user_id)
{
    $('#toolbar a').addClass('disabled');
    $("#btn-save").removeClass('disabled');
    $("#btn-new").removeClass('disabled');
    $("#btn-delete").removeClass('disabled');
    var user_id = $("#hdn_user_id").val(user_id);

    var pageUrl = '/Webservice/svr_UserAccount.asmx';

    $("#user_form").show();
    $("#access_privilage").hide();

    $.ajax({
        type: "POST",
        url: pageUrl + "/GetAllUsers",

        data: "{'userID':'" + user_id + "','name':'','userName':'','roles':'','position':'','status':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            //alert(response.d);

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#hdn_user_id").val(data[i]["UserID"]);
                $("#txt_name").val(data[i]["Name"]);

                $("#txt_username").attr('disabled', 'disabled');

                $("#txt_username").val(data[i]["UserName"]);
                $("#txt_password").val(data[i]["Password"]);
                $("#ddl_user_type option:selected").text(data[i]["Roles"]);
                $("#ddl_position option:selected").text(data[i]["Position"]);
                $("#ddl_status option:selected").text(data[i]["Status"]);
                               
            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}


function NewEvent()
{
    $('#toolbar a').addClass('disabled');
    $("#btn-new" ).removeClass('disabled');
    $("#btn-find").removeClass('disabled');

    $("#hdn_user_id").val('0');
    $("#txt_name").val('');
    $("#txt_username").removeAttr('disabled');

    $("#txt_username").val('');
    $("#txt_password").val('');
    //$("#ddl_user_type").val('first').change();
    //$("#ddl_position option:selected").text(data[i]["Position"]);
    //$("#ddl_status option:selected").text(data[i]["Status"]);
    
}


function FindEvent(me) {

    if ($(me).hasClass("disabled") == false) {
        
        //do the code here
        alert("function here");

    }
    
}

function SaveEvent(me) {

    if ($(me).hasClass("disabled") == false) {
        
        var pageUrl = '/Webservice/svr_UserAccount.asmx';

        var user_id = $("#hdn_user_id").val();
        var name = $("#txt_name").val();
        var user_name = $("#txt_username").val();
        var password = $("#txt_password").val();
        var user_type = $("#ddl_user_type option:selected").text();
        var position = $("#ddl_position option:selected").text();
        var status = $("#ddl_status option:selected").text();

        if (user_id == '0') {

            CreateUser();
        }
        else {
            //UpdateAccount(string user_id, string name, string position, string status, string user_name, string password, string role)
            var data_transfer = "{'user_id':'{0}', 'name':'{1}',  'position':'{2}',  'status':'{3}',  'user_name':'{4}',  'password':'{5}', 'role':'{6}'}"
                .f(user_id, name, position, status, user_name, password, user_type);


            $.ajax({
                type: "POST",
                url: pageUrl + "/UpdateAccount",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    alert("Successfully saved");

                    LoadAllUsers();
                    NewEvent();

                },
                error: function (response) {
                    alert(response.status);
                }
            });
        }


    }
}


function PrintEvent(me) {
    if ($(me).hasClass("disabled") == false) {

        //do the code here
        alert("function here");
    }
}

function DeleteEvent(me) {
    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_UserAccount.asmx';

        var user_id = $("#hdn_user_id").val();
        var user_name = $("#txt_username").val();
        var user_type = $("#ddl_user_type option:selected").text();

        //DeleteAccount(string user_name, string user_id, string role)
        var data_transfer = "{'user_id':'{0}',  'user_name':'{1}',  'role':'{2}'}"
            .f(user_id,  user_name,  user_type);


        $.ajax({
            type: "POST",
            url: pageUrl + "/DeleteAccount",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                alert("Successfully deleted");

                LoadAllUsers();
                NewEvent();

            },
            error: function (response) {
                alert(response.status);
            }
        });

        
    }
}



function LoadUserType()
{
    var pageUrl = '/Webservice/svr_UserAccount.asmx';


    $.ajax({
        type: "POST",

        url: pageUrl + "/AllRoles",

        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            //alert(response.d);

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ddl_user_type").append("<option value='" + data[i]["Roles"] + "'>" + data[i]["Roles"] + "</option>");

                //alert(data[i]["Name"]);
                //""
                //obj += data[i]["Product_Code"] + " | " + data[i]["Description"] + "<br>";

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });

}

function LoadPosition()
{
    var pageUrl = '/Webservice/svr_UserAccount.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/AllPosition",

        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            //alert(response.d);

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ddl_position").append("<option value='" + data[i]["PositionName"] + "'>" + data[i]["PositionName"] + "</option>");

                //alert(data[i]["Name"]);
                //""
                //obj += data[i]["Product_Code"] + " | " + data[i]["Description"] + "<br>";

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}


function LoadAllUsers()
{
    var pageUrl = '/Webservice/svr_UserAccount.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/GetAllUsers",
        
        data: "{'userID':'','name':'','userName':'','roles':'','position':'','status':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            //alert(response.d);
            $("#ulUserAccount").empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {



                $("#ulUserAccount").append("<li><a onclick=\"loadData('" + data[i]["UserID"] + "')\"><span class='ym-clearfix'><span class='state " + data[i]["State"] + "'></span><span class='name'>" + data[i]["Name"] + "<span>" + data[i]["Roles"] + "</span></span><span class='conn'>" + data[i]["Status"] + "</span> </span> <span class='ym-ie-clearing'></span>  </a> </li>");
                
                //alert(data[i]["Name"]);
                //""
                //obj += data[i]["Product_Code"] + " | " + data[i]["Description"] + "<br>";

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}


