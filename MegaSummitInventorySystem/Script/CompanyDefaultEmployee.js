/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />


$(document).ready(function () {

    LoadEmployeeClass();
    LoadDepartment();

    //--------------------------
    LoadEmployeeData();
    //--------------------------

    $("#btn-save").click(function () {

        var pageUrl = '/Webservice/svr_EmployeeSetting.asmx';

        var id = 1;
        var company_id = 0;
        var employee_type = $("#ddl_employee_type").val();
        var employee_class = $("#ddl_employee_class").val();
        var department = $("#ddl_department").val();
        var status = $("#ddl_status").val();
        var day_off = $("#ddl_day_off").val();
        var payment_method = $("#ddl_payment_method").val();
        var start = $("#txt_start").val();
        var break_out = $("#txt_break_out").val();
        var break_in = $("#txt_break_in").val();
        var end = $("#txt_end").val();
        var grace_period = $("#txt_grace_period").val();
        var time_duration = $("#txt_time_duration").val();

         
        var data_transfer = "{ 'id':'{0}','company_id':'{1}','employee_type':'{2}','employee_class_id':'{3}','department_id':'{4}','status':'{5}','day_off':'{6}','payment_method':'{7}','day_start':'{8}','break_out':'{9}','break_in':'{10}','day_end':'{11}','grace_period':'{12}','time_duration':'{13}' }"
               .f(id, company_id, employee_type, employee_class, department, status, day_off, payment_method, start, break_out, break_in, end, grace_period, time_duration);


        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateEmployeeSetting",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                window.location.href = "aspnetCompany-Defaults-Product.aspx";
            },
            error: function (response) {
                alert(response.status);
            }
        });


    });


});


function LoadEmployeeData()
{
    var pageUrl = '/Webservice/svr_EmployeeSetting.asmx';

    var id = 1;
   
    var data_transfer = "{ 'id':'{0}'}"
           .f(id);

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployeeSetting",
        data: data_transfer,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {
           

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $("#ddl_employee_type").val(data[i]["EmployeeType"]);
                $("#ddl_employee_class").val(data[i]["EmployeeType"]);
                $("#ddl_department").val(data[i]["DepartmentID"]);
                $("#ddl_status").val(data[i]["Status"]);
                $("#ddl_day_off").val(data[i]["DayOff"]);
                $("#ddl_payment_method").val(data[i]["PaymentMethod"]);
                $("#txt_start").val(data[i]["DayStart"]);
                $("#txt_break_out").val(data[i]["BreakOut"]);
                $("#txt_break_in").val(data[i]["BreakIn"]);
                $("#txt_end").val(data[i]["DayEnd"]);
                $("#txt_grace_period").val(data[i]["GracePeriod"]);
                $("#txt_time_duration").val(data[i]["TimeDuration"]);
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadEmployeeClass() {
    var pageUrl = '/Webservice/svr_EmployeeClass.asmx';

        $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployeeClass",
        data: "{ 'id':'0', 'employee_class_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ddl_employee_class').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#ddl_employee_class').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeClassName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}

function LoadDepartment() {
    var pageUrl = '/Webservice/svr_Department.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectDepartment",
        data: "{ 'id':'0', 'department_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#ddl_department').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#ddl_department').append("<option value='" + data[i]["ID"] + "'>" + data[i]["DepartmentName"] + "</option>");

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });
}