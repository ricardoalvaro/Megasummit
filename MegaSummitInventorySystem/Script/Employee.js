
LoadEmployeeList();

// ------------------------------------------- Create new Employee
function NewEmployee() {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');

    LoadEmployeeClass();
    LoadDepartment();

    $('#hdn_customerID').val("0");
   
    $("#xEmployeeList").hide();
    $("#xEmployeeForm").show();
}

// *******************************************************************************************************
// ------------------------------------------- SELECTING DATA --------------------------------------------
// *******************************************************************************************************


// ------------------------------------------- Load Employee Class
function LoadEmployeeClass() {

    var pageUrl = '/Webservice/svr_Employee.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployeeClass",
        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#employee_class').empty();
            $('#employee_class').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#employee_class').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeClassName"] + "</option>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------- Load Department
function LoadDepartment() {

    var pageUrl = '/Webservice/svr_Employee.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectDepartment",
        data: "{ }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#department').empty();
            $('#department').append("<option value='" + "0" + "'>" + "</option>");
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#department').append("<option value='" + data[i]["ID"] + "'>" + data[i]["DepartmentName"] + "</option>");

            }
        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------- Load All Sales Orders
function LoadEmployeeList() {
    var pageUrl = '/Webservice/svr_Employee.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{'id':'0','employee_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#tblEmployee tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {
                $('#tblEmployee tbody:last').append("<tr><td width='28%'><div onclick=\"ActionSelectEmployee('" + data[i]["ID"] + "')\">" + data[i]["EmployeeName"] + "</div></td><td width='12%'><div onclick=\"ActionSelectEmployee('" + data[i]["ID"] + "')\">" + data[i]["EmployeeType"] + "</div></td><td width='12%'><div onclick=\"ActionSelectEmployee('" + data[i]["ID"] + "')\">" + data[i]["EmployeeClassName"] + "</div></td><td width='12%'><div onclick=\"ActionSelectEmployee('" + data[i]["ID"] + "')\">" + data[i]["DepartmentName"] + "</div></td><td width='12%'><div onclick=\"ActionSelectEmployee('" + data[i]["ID"] + "')\">" + Number(data[i]["CashBond"]).toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,") + "</div></td><td width='12%'><div onclick=\"ActionSelectEmployee('" + data[i]["ID"] + "')\">" + data[i]["Status"] + "</div></td></tr>");

            }
            for (var i = 0; i < 25; i++) {
                $('#tblEmployee tbody:last').append("<tr><td width='28%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td><td width='12%'><div></div></td></tr>");
            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}

// ------------------------------------------------- Load Sales Order Information By Selectec Sales Order
function ActionSelectEmployee(id) {

    $('#toolbar .save').removeClass('disabled');
    $('#toolbar .new').addClass('disabled');
    $('#toolbar .find').addClass('disabled');


    LoadEmployeeClass();
    LoadDepartment();


    $("#hdnEmployeeID").val(id);

    var pageUrl = '/Webservice/svr_Employee.asmx';

    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployee",
        data: "{'id':'" + id + "','employee_name':'' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#employee_name').val(data[i]["EmployeeName"]);
                $('#address').val(data[i]["Address"]);
                $('#contact_person').val(data[i]["ContactPerson"]);
                $('#spouse_name').val(data[i]["SpouseName"]);
                $('#phone').val(data[i]["Phone"]);
                $('#mobile_phone').val(data[i]["MobilePhone"]);
                $('#civil_status').val(data[i]["CivilStatus"]);
                $('#birthdate').val(ToJavaScriptDate(data[i]["DateOfBirth"]));
                $('#email').val(data[i]["Email"]);
                $('#notes').val(data[i]["Notes"]);

                $('#employee_type').val(data[i]["EmployeeType"]);
                $('#tax_status').val(data[i]["TaxStatus"]);
                $('#employee_class').val(data[i]["EmployeeClassID"]);
                $('#tin_number').val(data[i]["TinNo"]);
                $('#department').val(data[i]["DepartmentID"]);
                $('#sss_number').val(data[i]["SSSNo"]);
                $('#status').val(data[i]["Status"]);
                $('#philhealth_number').val(data[i]["PhilHealthNo"]);
                $('#cash_bond').val(data[i]["CashBond"]);
                $('#pagibig_number').val(data[i]["PagIbigNo"]);

                
                $("#xEmployeeList").hide();
                $("#xEmployeeForm").show();


            }

        },
        error: function (response) {
            alert(response.status);
        }
    });

}


// *******************************************************************************************************
// ------------------------------------------- SAVING DATA -----------------------------------------------
// *******************************************************************************************************

// ------------------------------------------- Saving Employee Information
function SavingInvoice() {

    var pageUrl = '/Webservice/svr_Employee.asmx';

    var employee_picture = "";
    var employee_name = $('#employee_name').val();
    var address = $('#address').val();
    var contact_person = $('#contact_person').val();
    var spouse_name = $('#spouse_name').val();
    var phone = $('#phone').val();
    var mobile_phone = $('#mobile_phone').val();
    var civil_status = $('#civil_status').val();
    var birthdate = $('#birthdate').val().replace(".", "/").replace(".", "/");
    var email = $('#email').val();
    var notes = $('#notes').val();

    var employee_type = $('#employee_type').val();
    var tax_status = $('#tax_status').val();
    var employee_class = $('#employee_class').val();
    var tin_number = $('#tin_number').val();
    var department = $('#department').val();
    var sss_number = $('#sss_number').val();
    var status = $('#status').val();
    var philhealth_number = $('#philhealth_number').val();
    var cash_bond = $('#cash_bond').val();
    var pagibig_number = $('#pagibig_number').val();


    if ($('#hdnEmployeeID').val() != 0) {
        $.ajax({
            type: "POST",
            url: pageUrl + "/UpdateEmployee",
            data: "{'id':'" + $('#hdnEmployeeID').val() + "', 'employee_picture':'" + employee_picture + "', 'employee_name':'" + employee_name + "', 'address':'" + address + "', 'contact_person':'" + contact_person + "', 'spouse_name':'" + spouse_name + "', 'phone':'" + phone + "', 'mobile_phone':'" + mobile_phone + "', 'civil_status':'" + civil_status + "', 'birthdate':'" + birthdate + "', 'email':'" + email + "', 'notes':'" + notes + "', 'employee_type':'" + employee_type + "', 'tax_status':'" + tax_status + "', 'employee_class':'" + employee_class + "', 'tin_number':'" + tin_number + "', 'department':'" + department + "', 'sss_number':'" + sss_number + "', 'status':'" + status + "', 'philhealth_number':'" + philhealth_number + "', 'cash_bond':'" + cash_bond + "', 'pagibig_number':'" + pagibig_number + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadEmployeeList();

                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');
                $("#xEmployeeList").show();
                $("#xEmployeeForm").hide();
            },
            error: function (response) {
                alert(response.d);
            }
        });
    }
    else {
        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertEmployee",
            data: "{'employee_picture':'" + employee_picture + "', 'employee_name':'" + employee_name + "', 'address':'" + address + "', 'contact_person':'" + contact_person + "', 'spouse_name':'" + spouse_name + "', 'phone':'" + phone + "', 'mobile_phone':'" + mobile_phone + "', 'civil_status':'" + civil_status + "', 'birthdate':'" + birthdate + "', 'email':'" + email + "', 'notes':'" + notes + "', 'employee_type':'" + employee_type + "', 'tax_status':'" + tax_status + "', 'employee_class':'" + employee_class + "', 'tin_number':'" + tin_number + "', 'department':'" + department + "', 'sss_number':'" + sss_number + "', 'status':'" + status + "', 'philhealth_number':'" + philhealth_number + "', 'cash_bond':'" + cash_bond + "', 'pagibig_number':'" + pagibig_number + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {
                LoadEmployeeList();

                $('#toolbar .save').addClass('disabled');
                $('#toolbar .new').removeClass('disabled');
                $('#toolbar .find').removeClass('disabled');
                $("#xEmployeeList").show();
                $("#xEmployeeForm").hide();
            },
            error: function (response) {
                alert(response.d);
            }
        });
    }
}


// -------------------------------------------------- Converting Date Format
function ToJavaScriptDate(value) {
    var date = new Date(value);
    var jsonDate = (date.getMonth() + 1) + '.' + date.getDate() + '.' + date.getFullYear();
    return jsonDate;
}
