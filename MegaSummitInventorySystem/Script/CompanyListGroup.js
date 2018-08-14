/// <reference path="https://code.jquery.com/jquery-3.2.1.slim.js" />
/// <reference path="ValidateEntry.js" />




//------UserType SECTION-----------------------

var bl;

function LoadUserType() {
    var pageUrl = '/Webservice/svr_UserType.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectUserType",
        data: "{ 'user_type':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xUserType tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xUserType tbody:last').append("<tr><td><div onclick=\"ActionSelectUserType('" + data[i] + "')\">" + data[i] + "</div></td></tr>");

            }
            bl = window.setInterval("loadBlankUserType()", 300);

        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankUserType() {
    for (var i = 0; i < 30; i++) {
        $('#xUserType tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectUserType(id) {
    $('#action_user_type .save').addClass('disabled');
    $('#action_user_type .delete').removeClass('disabled');
    $('#action_user_type .new').addClass('disabled');
    $('#action_user_type .find').addClass('disabled');

    $("#hdn_user_type_id").val(id);
    $("#txt_user_type").val(id);



    $("#xUserType").hide();
    $("#xUserTypeSearch").hide();
    $("#xUserTypeManage").show();

}

function ActionNewUserType(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_user_type_id").val('0');
        $("#txt_user_type").val('');

        $('#action_user_type .save').removeClass('disabled');
        $('#action_user_type .delete').addClass('disabled');
        $('#action_user_type .new').addClass('disabled');
        $('#action_user_type .find').addClass('disabled');

        $("#xUserType").hide();
        $("#xUserTypeSearch").hide();
        $("#xUserTypeManage").show();

    }
}

function ActionSaveUpdateUserType(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_UserType.asmx';
        var role = $("#txt_user_type").val();



        var data_transfer = "{ 'role':'{0}'}"
            .f(role);

        $.ajax({
            type: "POST",
            url: pageUrl + "/InsertUserType",
            data: data_transfer,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            crossdomain: true,
            success: function (response) {

                LoadUserType();
                SubMenuDisplay('user_type');

            },
            error: function (response) {
                alert(response.status);
            }
        });
            
    }
}

function ActionDeleteUserType(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_user_type_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_UserType.asmx';

            var data_transfer = "{'role':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteUserType",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadUserType();
                    SubMenuDisplay('user_type');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function UserTypeAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_UserType.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteUserType",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_user_type_search").autocomplete({
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


    $("#txt_user_type_search").autocomplete({
        select: function (a, b) {

            ActionSelectUserType(b.item.label)
        }
    });
}

function ActionSearchUserType(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_user_type .save').addClass('disabled');
        $('#action_user_type .delete').addClass('disabled');
        $('#action_user_type .new').addClass('disabled');
        $('#action_user_type .find').addClass('disabled');

        $("#xUserType").hide();
        $("#xUserTypeManage").hide();
        $("#xUserTypeSearch").show();

        $('#txt_user_type_search').val('');
        UserTypeAutoCompleteByName();
    }
}


//------CATEGORIES SECTION-----------------------

function LoadCategories() {
    var pageUrl = '/Webservice/svr_Category.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCategory",
        data: "{ 'id':'0', 'category_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xCategories tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xCategories tbody:last').append("<tr><td><div onclick=\"ActionSelectCategory('" + data[i]["ID"] + "')\">" + data[i]["CategoryName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankCategories()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankCategories() {
    for (var i = 0; i < 30; i++) {
        $('#xCategories tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}


function ActionSelectCategory(id) {
    $('#action_categories .save').removeClass('disabled');
    $('#action_categories .delete').removeClass('disabled');
    $('#action_categories .new').addClass('disabled');
    $('#action_categories .find').addClass('disabled');

    $("#hdn_category_id").val(id);



    var pageUrl = '/Webservice/svr_Category.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectCategory",
        data: "{ 'id':'" + id + "', 'category_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_category").val(data[i]["CategoryName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xCategories").hide();
    $("#xCategoriesSearch").hide();
    $("#xCategoriesManage").show();

}

function ActionNewCategory(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_category_id").val('0');
        $("#txt_category").val('');

        $('#action_categories .save').removeClass('disabled');
        $('#action_categories .delete').addClass('disabled');
        $('#action_categories .new').addClass('disabled');
        $('#action_categories .find').addClass('disabled');

        $("#xCategories").hide();
        $("#xCategoriesSearch").hide();
        $("#xCategoriesManage").show();

    }
}

function ActionSaveUpdateCategory(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Category.asmx';
        var id = $("#hdn_category_id").val();
        var category_name = $("#txt_category").val();


        if (id == '0') {
            if (ValidateAddUpdateCategory()) {
                var data_transfer = "{ 'category_name':'{0}'}"
                    .f(category_name);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertCategory",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadCategories();
                        SubMenuDisplay('categories');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateCategory()) {
                var data_transfer = "{ 'id':'{0}','category_name':'{1}' }"
                     .f(id, category_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateCategory",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadCategories();
                        SubMenuDisplay('categories');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteCategory(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_category_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Category.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteCategory",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadCategories();
                    SubMenuDisplay('categories');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function CategoryAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Category.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteCategory",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_category_search").autocomplete({
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


    $("#txt_category_search").autocomplete({
        select: function (a, b) {

            ActionSelectCategory(b.item.id)
        }
    });
}

function ActionSearchCategory(me) {

    if ($(me).hasClass("disabled") == false) {
        $('#action_categories .save').addClass('disabled');
        $('#action_categories .delete').addClass('disabled');
        $('#action_categories .new').addClass('disabled');
        $('#action_categories .find').addClass('disabled');

        $("#xCategories").hide();
        $("#xCategoriesManage").hide();
        $("#xCategoriesSearch").show();

        $('#txt_category_search').val('');
        CategoryAutoCompleteByName();
    }
}

function ValidateAddUpdateCategory() {
    var category = $("#txt_category").val();

    var message = "";

    if (category == "") {
        message += "Category required! <br>";
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

//------DEPARTMENT SECTION-----------------------

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

            $('#xDepartment tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xDepartment tbody:last').append("<tr><td><div onclick=\"ActionSelectDepartment('" + data[i]["ID"] + "')\">" + data[i]["DepartmentName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankDepartment()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankDepartment() {
    for (var i = 0; i < 30; i++) {

        $('#xDepartment tbody:last').append("<tr><td><div >" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectDepartment(id) {
    $('#action_department .save').removeClass('disabled');
    $('#action_department .delete').removeClass('disabled');
    $('#action_department .new').addClass('disabled');
    $('#action_department .find').addClass('disabled');

    $("#hdn_department_id").val(id);



    var pageUrl = '/Webservice/svr_Department.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectDepartment",
        data: "{ 'id':'" + id + "', 'department_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_department").val(data[i]["DepartmentName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xDepartment").hide();
    $("#xDepartmentSearch").hide();
    $("#xDepartmentManage").show();

}

function ActionNewDepartment(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_department_id").val('0');
        $("#txt_department").val('');

        $('#action_department .save').removeClass('disabled');
        $('#action_department .delete').addClass('disabled');
        $('#action_department .new').addClass('disabled');
        $('#action_department .find').addClass('disabled');

        $("#xDepartment").hide();
        $("#xDepartmentSearch").hide();
        $("#xDepartmentManage").show();

    }
}

function ActionSaveUpdateDepartment(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Department.asmx';
        var id = $("#hdn_department_id").val();
        var department_name = $("#txt_department").val();


        if (id == '0') {
            if (ValidateAddUpdateDepartment()) {
                var data_transfer = "{ 'department_name':'{0}'}"
                    .f(department_name);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertDepartment",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadDepartment();
                        SubMenuDisplay('department');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateDepartment()) {
                var data_transfer = "{ 'id':'{0}','department_name':'{1}' }"
                     .f(id, department_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateDepartment",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadDepartment();
                        SubMenuDisplay('department');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteDepartment(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_department_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Department.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteDepartment",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadDepartment();
                    SubMenuDisplay('department');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function DepartmentAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Department.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteDepartment",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_department_search").autocomplete({
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


    $("#txt_department_search").autocomplete({
        select: function (a, b) {

            ActionSelectDepartment(b.item.id)
        }
    });
}

function ActionSearchDepartment(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_department .save').addClass('disabled');
        $('#action_department .delete').addClass('disabled');
        $('#action_department .new').addClass('disabled');
        $('#action_department .find').addClass('disabled');

        $("#xDepartment").hide();
        $("#xDepartmentManage").hide();
        $("#xDepartmentSearch").show();

        $('#txt_department_search').val('');
        DepartmentAutoCompleteByName();
    }
}

function ValidateAddUpdateDepartment() {
    var department = $("#txt_department").val();

    var message = "";

    if (department == "") {
        message += "Department required! <br>";
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




//------EMPLOYEE CLASS SECTION-----------------------


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

            $('#xEmployeeClass tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xEmployeeClass tbody:last').append("<tr><td><div onclick=\"ActionSelectEmployeeClass('" + data[i]["ID"] + "')\">" + data[i]["EmployeeClassName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankEmployeeClass()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}


// ------------------------------------------- Filling Table Blank Space
function loadBlankEmployeeClass() {
    for (var i = 0; i < 30; i++) {

        $('#xEmployeeClass tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}

function ActionSelectEmployeeClass(id) {
    $('#action_employee_class .save').removeClass('disabled');
    $('#action_employee_class .delete').removeClass('disabled');
    $('#action_employee_class .new').addClass('disabled');
    $('#action_employee_class .find').addClass('disabled');

    $("#hdn_employee_class_id").val(id);



    var pageUrl = '/Webservice/svr_EmployeeClass.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectEmployeeClass",
        data: "{ 'id':'"+id+"', 'employee_class_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_employee_class").val(data[i]["EmployeeClassName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xEmployeeClass").hide();
    $("#xEmployeeClassSearch").hide();
    $("#xEmployeeClassManage").show();

}

function ActionNewEmployeeClass(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_employee_class_id").val('0');
        $("#txt_employee_class").val('');

        $('#action_employee_class .save').removeClass('disabled');
        $('#action_employee_class .delete').addClass('disabled');
        $('#action_employee_class .new').addClass('disabled');
        $('#action_employee_class .find').addClass('disabled');

        $("#xEmployeeClass").hide();
        $("#xEmployeeClassSearch").hide();
        $("#xEmployeeClassManage").show();

    }
}

function ActionSaveUpdateEmployeeClass(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_EmployeeClass.asmx';
        var id = $("#hdn_employee_class_id").val();
        var employee_class = $("#txt_employee_class").val();


        if (id == '0') {
            if (ValidateAddUpdateEmployeeClass()) {
                var data_transfer = "{ 'employee_class_name':'{0}'}"
                    .f(employee_class);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertEmployeeClass",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadEmployeeClass();
                        SubMenuDisplay('employee_class');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdateEmployeeClass()) {
                var data_transfer = "{ 'id':'{0}','employee_class_name':'{1}' }"
                     .f(id, employee_class);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdateEmployeeClass",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadEmployeeClass();
                        SubMenuDisplay('employee_class');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeleteEmployeeClass(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_employee_class_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_EmployeeClass.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeleteEmployeeClass",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadEmployeeClass();
                    SubMenuDisplay('employee_class');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function EmployeeClassAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_EmployeeClass.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompleteEmployeeClass",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_employee_class_search").autocomplete({
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


    $("#txt_employee_class_search").autocomplete({
        select: function (a, b) {

            ActionSelectEmployeeClass(b.item.id)
        }
    });
}

function ActionSearchEmployeeClass(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_employee_class .save').addClass('disabled');
        $('#action_employee_class .delete').addClass('disabled');
        $('#action_employee_class .new').addClass('disabled');
        $('#action_employee_class .find').addClass('disabled');

        $("#xEmployeeClass").hide();
        $("#xEmployeeClassManage").hide();
        $("#xEmployeeClassSearch").show();

        $('#txt_employee_class_search').val('');
        EmployeeClassAutoCompleteByName();
    }
}

function ValidateAddUpdateEmployeeClass() {
    var employee_class = $("#txt_employee_class").val();

    var message = "";

    if (employee_class == "") {
        message += "Employee Class required! <br>";
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


//------POSITION SECTION-----------------------

function LoadPosition() {
    var pageUrl = '/Webservice/svr_Position.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectPosition",
        data: "{ 'id':'0', 'position_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            $('#xPosition tbody').empty();
            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $('#xPosition tbody:last').append("<tr><td><div onclick=\"ActionSelectPosition('" + data[i]["ID"] + "')\">" + data[i]["PositionName"] + "</div></td></tr>");

            }

            bl = window.setInterval("loadBlankPosition()", 300);
        },
        error: function (response) {
            alert(response.status);
        }
    });
}

// ------------------------------------------- Filling Table Blank Space
function loadBlankPosition() {
    for (var i = 0; i < 30; i++) {
        $('#xPosition tbody:last').append("<tr><td><div>" + "" + "</div></td></tr>");

    }

    window.clearInterval(bl);
}
function ActionSelectPosition(id) {
    $('#action_position .save').removeClass('disabled');
    $('#action_position .delete').removeClass('disabled');
    $('#action_position .new').addClass('disabled');
    $('#action_position .find').addClass('disabled');

    $("#hdn_position_id").val(id);



    var pageUrl = '/Webservice/svr_Position.asmx';


    $.ajax({
        type: "POST",
        url: pageUrl + "/SelectPosition",
        data: "{ 'id':'" + id + "', 'position_name':''}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        crossdomain: true,
        success: function (response) {

            var data = eval(response.d);
            var obj = "";
            for (var i = 0; i < data.length; i++) {

                $("#txt_position_name").val(data[i]["PositionName"]);

            }


        },
        error: function (response) {
            alert(response.status);
        }
    });




    $("#xPosition").hide();
    $("#xPositionSearch").hide();
    $("#xPositionManage").show();

}

function ActionNewPosition(me) {

    if ($(me).hasClass("disabled") == false) {

        $("#hdn_position_id").val('0');
        $("#txt_position_name").val('');

        $('#action_position .save').removeClass('disabled');
        $('#action_position .delete').addClass('disabled');
        $('#action_position .new').addClass('disabled');
        $('#action_position .find').addClass('disabled');

        $("#xPosition").hide();
        $("#xPositionSearch").hide();
        $("#xPositionManage").show();

    }
}

function ActionSaveUpdatePosition(me) {

    if ($(me).hasClass("disabled") == false) {

        var pageUrl = '/Webservice/svr_Position.asmx';
        var id = $("#hdn_position_id").val();
        var position_name = $("#txt_position_name").val();
       

        if (id == '0') {
            if (ValidateAddUpdatePosition()) {
                var data_transfer = "{ 'position_name':'{0}'}"
                    .f(position_name);

                $.ajax({
                    type: "POST",
                    url: pageUrl + "/InsertPosition",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadPosition();
                        SubMenuDisplay('position');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }

        } else {

            if (ValidateAddUpdatePosition()) {
                var data_transfer = "{ 'id':'{0}','position_name':'{1}' }"
                     .f(id, position_name);


                $.ajax({
                    type: "POST",
                    url: pageUrl + "/UpdatePosition",
                    data: data_transfer,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    crossdomain: true,
                    success: function (response) {

                        LoadPosition();
                        SubMenuDisplay('position');

                    },
                    error: function (response) {
                        alert(response.status);
                    }
                });
            }
        }



    }
}

function ActionDeletePosition(me) {
    if ($(me).hasClass("disabled") == false) {
        var id = $("#hdn_position_id").val();

        if (id != '0') {

            var pageUrl = '/Webservice/svr_Position.asmx';

            var data_transfer = "{'id':'{0}'}"
                .f(id);


            $.ajax({
                type: "POST",
                url: pageUrl + "/DeletePosition",
                data: data_transfer,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    LoadPosition();
                    SubMenuDisplay('position');
                },
                error: function (response) {
                    alert(response.status);
                }
            });


        }
    }
}

function PositionAutoCompleteByName() {
    var pageUrl = '/Webservice/svr_Position.asmx';
    $.ajax({
        type: "POST",
        url: pageUrl + "/AutoCompletePosition",
        data: "{  }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $("#txt_position_search").autocomplete({
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


    $("#txt_position_search").autocomplete({
        select: function (a, b) {

            ActionSelectPosition(b.item.id)
        }
    });
}

function ActionSearchPosition(me) {
    if ($(me).hasClass("disabled") == false) {
        $('#action_position .save').addClass('disabled');
        $('#action_position .delete').addClass('disabled');
        $('#action_position .new').addClass('disabled');
        $('#action_position .find').addClass('disabled');

        $("#xPosition").hide();
        $("#xPositionManage").hide();
        $("#xPositionSearch").show();

        $('#txt_position_search').val('');
        PositionAutoCompleteByName();
    }
}

function ValidateAddUpdatePosition() {
    var position = $("#txt_position_name").val();

    var message = "";

    if (position == "") {
        message += "Position required! <br>";
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