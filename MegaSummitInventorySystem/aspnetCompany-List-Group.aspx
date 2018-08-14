<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-List-Group.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_List_Group" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">

        .search_class {
                border: 0;
                width: 100%;
        }

        .search_class:focus {
                outline: none;

        }
        .ym-form .submit {
            color:#858585;
        }
        .ym-form .obj select {
            padding: 2px 5px 1px 5px;
        }
        .ym-form .obj input[type="text"], .ym-form .obj input[type="password"], .ym-form .obj .dp {
            padding: 2px 5px 1px 5px;
        }
        .ym-form .obj textarea {
            padding: 2px 5px 1px 5px;
        }
        .ym-form .obj .dp input[type="text"] {
            padding: 2px 5px 1px 0;
        }
    </style>

    <div id="subheader" class="hassubmenu">
    <div class="ym-wrapper">
    	<div class="ym-wbox">
        	<!-- Start of Two Grids -->
            <div class="ym-grid linearize-level-1">
                <div class="block-left ym-gl">
                    <div class="ym-gbox">
                        <ul class="menu ym-clearfix">
                            <li class="active"><a href="aspnetCompany.aspx">Company</a></li>
                            <li class=""><a href="aspnetCompany-Summary.aspx">Summary</a></li>
                            <li class=""><a href="aspnetCompany-Reminders.aspx">Reminders</a></li>
                            <li class=""><a href="aspnetCompany-History.aspx">History</a></li>	
                        </ul>
                        <div class="ym-ie-clearing">&nbsp;</div>
                    </div>
                </div>
                <div class="block-right ym-gr">
    <div class="ym-gbox">
        
           <div id="action_user_type" style="display:none">
              <ul id="toolbar" class="">
                    <li><a onclick="ActionSaveUpdateUserType(this)" class="save" >Save</a></li>
                    <li><a onclick="ActionNewUserType(this)" class="new" >New</a></li>
                    <li><a onclick="ActionSearchUserType(this)" class="find">Find</a></li>
                    <li><a onclick="ActionDeleteUserType(this)" class="delete" >Delete</a></li>
                    <li><a  class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
        </div>

          <div id="action_position" style="display:none">
              <ul id="toolbar" class="">
                    <li><a  class="save" onclick="ActionSaveUpdatePosition(this)">Save</a></li>
                    <li><a  class="new" onclick="ActionNewPosition(this)" >New</a></li>
                    <li><a  class="find" onclick="ActionSearchPosition(this)">Find</a></li>
                    <li><a  class="delete" onclick="ActionDeletePosition(this)">Delete</a></li>
                    <li><a  class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
        </div>

          <div id="action_employee_class" style="display:none">
              <ul id="toolbar" class="">
                    <li><a  class="save" onclick="ActionSaveUpdateEmployeeClass(this)">Save</a></li>
                    <li><a  class="new" onclick="ActionNewEmployeeClass(this)">New</a></li>
                    <li><a  class="find" onclick="ActionSearchEmployeeClass(this)">Find</a></li>
                    <li><a  class="delete" onclick="ActionDeleteEmployeeClass(this)">Delete</a></li>
                    <li><a  class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
        </div>

          <div id="action_department" style="display:none">
              <ul id="toolbar" class="">
                    <li><a  class="save" onclick="ActionSaveUpdateDepartment(this)" >Save</a></li>
                    <li><a  class="new" onclick="ActionNewDepartment(this)" >New</a></li>
                    <li><a  class="find" onclick="ActionSearchDepartment(this)" >Find</a></li>
                    <li><a  class="delete" onclick="ActionDeleteDepartment(this)" >Delete</a></li>
                    <li><a  class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
        </div>

         <div id="action_categories" style="display:none">
              <ul id="toolbar" class="">
                    <li><a  class="save" onclick="ActionSaveUpdateCategory(this)">Save</a></li>
                    <li><a  class="new"  onclick="ActionNewCategory(this)">New</a></li>
                    <li><a  class="find" onclick="ActionSearchCategory(this)">Find</a></li>
                    <li><a  class="delete"  onclick="ActionDeleteCategory(this)">Delete</a></li>
                    <li><a  class="print disabled" href="javascript:;">Print</a></li>
            </ul>	
        </div>

    </div>
</div>            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div><div id="main" class="company-company-lists-groups">
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        	<div class="submenu">
    <ul class="crossfade ym-clearfix">
        <li class=""><a href="aspnetCompany.aspx">Company</a></li>
        <li class=""><a href="aspnetCompany-User.aspx">Users</a></li>
        <li class="active"><a href="aspnetCompany-List.aspx">Lists</a></li>
        <li class=""><a href="aspnetCompany-Settings.aspx">Settings</a></li>
        <li class=""><a href="aspnetCompany-Defaults.aspx">Defaults</a></li>
        <li class=""><a href="aspnetCompany-Calendar.aspx">Calendar</a></li>
    </ul>
    <div class="ym-ie-clearing">&nbsp;</div>  
</div> 
        	<div class="container two-column-sidebar mod-company-lists">
            	<div class="ym-column linearize-level-1">
                    <div class="ym-col1">
                        <div class="ym-cbox"> 
                        	<div class="box-holder">
                            	<ul class="tabs crossfade">
                                    <li class="active view"><a onclick="SubMenuDisplay('user_type')"  class="new-find" style="cursor:default">User Type</a></li>
                                    <li class="view"><a  onclick="SubMenuDisplay('position')"  class="new-find" style="cursor:default">Position</a></li>
                                    <li class="view"><a  onclick="SubMenuDisplay('employee_class')" class="new-find" style="cursor:default">Employee Class</a></li>
                                    <li class="view"><a  onclick="SubMenuDisplay('department')" class="new-find" style="cursor:default">Department</a></li>
                                    <li class="view"><a  onclick="SubMenuDisplay('categories')" class="new-find" style="cursor:default">Categories</a></li>
                                </ul>

                                 <%-- Start User Type --%>

                                <div id="xUserType" style="display: none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>User Type</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div id="xUserTypeManage" style="display:none">
                                    <div class="content vmiddle ym-form">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="bank">User Type</label></td>
                                                    <td class="obj">
                                                        <input id="hdn_user_type_id" valu="0" type="hidden" />
                                                        <input type="text" autocorrect="off" spellcheck="false" id="txt_user_type" name="location" value="" class="long"></td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>

                                <div id="xUserTypeSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>User Type</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_user_type_search" name="location" value="" class="long search_class" ></td>
                                                    </tr>

                                                    <div id="xLocationSearchFixContent">
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                        </div>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>
                                        </table>

                                    </div>
                                </div>
                                
                               <%-- End User Type --%>

                                <%-- Start Position --%>

                                <div id="xPosition" style="display: none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Position</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div id="xPositionManage" style="display:none">
                                    <div class="content vmiddle ym-form">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="bank">Position</label></td>
                                                    <td class="obj">
                                                        <input id="hdn_position_id" valu="0" type="hidden" />
                                                        <input type="text" autocorrect="off" spellcheck="false" id="txt_position_name" name="location" value="" class="long"></td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>

                                <div id="xPositionSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Location</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_position_search" name="location" value="" class="long search_class" onchange="OnSearchLocation()"></td>
                                                    </tr>

                                                    <div id="Div5">
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                        </div>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>
                                        </table>

                                    </div>
                                </div>

                                <%-- End Position --%>

                                <%-- Start Employee Class --%>

                                <div id="xEmployeeClass" style="display: none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Employee Class</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div id="xEmployeeClassManage" style="display:none">
                                    <div class="content vmiddle ym-form">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="bank">Employee Class</label></td>
                                                    <td class="obj">
                                                        <input id="hdn_employee_class_id" valu="0" type="hidden" />
                                                        <input type="text" autocorrect="off" spellcheck="false" id="txt_employee_class" value="" class="long"></td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>

                                <div id="xEmployeeClassSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Employee Class</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_employee_class_search" value="" class="long search_class" ></td>
                                                    </tr>

                                                    <div id="Div4">
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                        </div>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>
                                        </table>

                                    </div>
                                </div>

                                <%-- End  Employee Class --%>


                                <%-- Start Department --%>

                                <div id="xDepartment" style="display: none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Department</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div id="xDepartmentManage" style="display:none">
                                    <div class="content vmiddle ym-form">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="bank">Department</label></td>
                                                    <td class="obj">
                                                        <input id="hdn_department_id" valu="0" type="hidden" />
                                                        <input type="text" autocorrect="off" spellcheck="false" id="txt_department" value="" class="long" />
                                                    </td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>

                                <div id="xDepartmentSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Department</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_department_search"  value="" class="long search_class" onchange="OnSearchLocation()"></td>
                                                    </tr>

                                                    <div id="Div6">
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                        </div>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>
                                        </table>

                                    </div>
                                </div>

                                <%-- End  Department --%>


                                <%-- Start Categories --%>

                                <div id="xCategories" style="display: none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Categories</th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div id="xCategoriesManage" style="display:none">
                                    <div class="content vmiddle ym-form">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td class="lbl">
                                                        <label for="bank">Categories</label></td>
                                                    <td class="obj">
                                                        <input id="hdn_category_id" value="0" type="hidden" />
                                                        <input type="text" autocorrect="off" spellcheck="false" id="txt_category" value="" class="long"></td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>

                                <div id="xCategoriesSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Categories</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_category_search"  value="" class="long search_class" onchange="OnSearchLocation()"></td>
                                                    </tr>

                                                    <div id="Div7">
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                      <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                     <tr>
                                                        <td></td>
                                                    </tr>
                                                        </div>
                                                </tbody>
                                                <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 8px; position: absolute; top: -30px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 30px;"></div>
                                                <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
                                            </div>
                                        </table>

                                    </div>
                                </div>

                                <%-- End  Categories --%>








                            </div>	
                        </div>
                    </div>
                    <div class="ym-col3">
    <div class="ym-cbox"> 
        <ul class="sidebar crossfade">
            <li class=""><a href="aspnetCompany-List.aspx"><span class="item general"></span>General</a></li>	
            <li class="active"><a href="aspnetCompany-List-Group.aspx"><span class="item groups"></span>Groups</a></li>
            <li class=""><a href="aspnetCompany-List-PayrollItem.aspx"><span class="item payroll-items"></span>Payroll Items</a></li>
            <li class=""><a href="aspnetCompany-List-Field.aspx"><span class="item fields"></span>Fields</a></li>
            <li class=""><a href="aspnetCompany-List-PaymentType.aspx"><span class="item payment-type"></span>Payment Type</a></li>
            <li class=""><a href="aspnetCompany-List-Others.aspx"><span class="item others"></span>Others</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>

    <script src="Script/CompanyListGroup.js"></script>
    <script type="text/javascript">


 
        SubMenuDisplay('user_type');
        //------------------------


        function SubMenuDisplay(display) {
            $("#xUserType").hide();
            $("#xUserTypeManage").hide();
            $("#xUserTypeSearch").hide();
            $("#action_user_type").hide();


            $("#xPosition").hide();
            $("#xPositionManage").hide();
            $("#xPositionSearch").hide();
            $("#action_position").hide();

            $("#xEmployeeClass").hide();
            $("#xEmployeeClassManage").hide();
            $("#xEmployeeClassSearch").hide();
            $("#action_employee_class").hide();

            $("#xDepartment").hide();
            $("#xDepartmentManage").hide();
            $("#xDepartmentSearch").hide();
            $("#action_department").hide();

            $("#xCategories").hide();
            $("#xCategoriesManage").hide();
            $("#xCategoriesSearch").hide();
            $("#action_categories").hide();



            if (display == 'user_type') {
                $("#xUserType").show();
                $("#action_user_type").show();

                LoadUserType();
                $('#action_user_type .save').addClass('disabled');
                $('#action_user_type .delete').addClass('disabled');
                $('#action_user_type .new').removeClass('disabled');
                $('#action_user_type .find').removeClass('disabled');

            }
            else if (display == 'position') {
                $("#xPosition").show();
                $("#action_position").show();

                LoadPosition();

                $('#action_position .save').addClass('disabled');
                $('#action_position .delete').addClass('disabled');
                $('#action_position .new').removeClass('disabled');
                $('#action_position .find').removeClass('disabled');

            }
            else if (display == 'employee_class') {
                $("#xEmployeeClass").show();
                $("#action_employee_class").show();

                LoadEmployeeClass();

                $('#action_employee_class .save').addClass('disabled');
                $('#action_employee_class .delete').addClass('disabled');
                $('#action_employee_class .new').removeClass('disabled');
                $('#action_employee_class .find').removeClass('disabled');

            }
            else if (display == 'department') {
                $("#xDepartment").show();
                $("#action_department").show();

                LoadDepartment();

                $('#action_department .save').addClass('disabled');
                $('#action_department .delete').addClass('disabled');
                $('#action_department .new').removeClass('disabled');
                $('#action_department .find').removeClass('disabled');


            }
            else if (display == 'categories') {

                $("#xCategories").show();
                $("#action_categories").show();

                LoadCategories();

                $('#action_categories .save').addClass('disabled');
                $('#action_categories .delete').addClass('disabled');
                $('#action_categories .new').removeClass('disabled');
                $('#action_categories .find').removeClass('disabled');
            }
        }


    </script>
</asp:Content>
