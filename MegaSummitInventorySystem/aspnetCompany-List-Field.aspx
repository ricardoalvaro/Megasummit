<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCompany-List-Field.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCompany_List_Field" %>
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

         <div id="action_unit" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="ActionSaveUpdateUnit(this)"  class="save">Save</a></li>
                <li><a onclick="ActionNewUnit(this)" class="new" >New</a></li>
                <li><a onclick="ActionSearchUnit(this)" class="find">Find</a></li>
                <li><a onclick="ActionDeleteUnit(this)" class="delete">Delete</a></li>
                <li><a class="print disabled" href="javascript:;">Print</a></li>
            </ul>
        </div>
       
          <div id="action_sub_unit" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="ActionSaveUpdateSubUnit(this)" class="save">Save</a></li>
                <li><a onclick="ActionNewSubUnit(this)"  class="new" >New</a></li>
                <li><a onclick="ActionSearchSubUnit(this)"  class="find">Find</a></li>
                <li><a onclick="ActionDeleteSubUnit(this)"  class="delete">Delete</a></li>
                <li><a  class="print disabled" >Print</a></li>
            </ul>
        </div>

        <div id="action_terms" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="ActionSaveUpdateTerm(this)"  class="save">Save</a></li>
                <li><a onclick="ActionNewTerm(this)" class="new" >New</a></li>
                <li><a onclick="ActionSearchTerm(this)" class="find">Find</a></li>
                <li><a onclick="ActionDeleteTerms(this)" class="delete">Delete</a></li>
                <li><a  class="print disabled" href="javascript:;">Print</a></li>
            </ul>
        </div>

         <div id="action_packing" style="display:none">
            <ul id="toolbar" class="">
                <li><a onclick="ActionSaveUpdatePacking(this)" class="save">Save</a></li>
                <li><a onclick="ActionNewPacking(this)" class="new" >New</a></li>
                <li><a onclick="ActionSearchPacking(this)" class="find">Find</a></li>
                <li><a onclick="ActionDeletePacking(this)" class="delete">Delete</a></li>
                <li><a  class="print disabled" href="javascript:;">Print</a></li>
            </ul>
        </div>
         	
    </div>
</div>            </div>
            <!-- End of Two Grids -->
        </div>
    </div>			
</div><div id="main" class="company-company-lists-fields">
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
                                    <li class="active view"><a  onclick="SubMenuDisplay('unit')" class="new-find" style="cursor:default">Unit</a></li>
                                    <li class="view"><a onclick="SubMenuDisplay('sub_unit')" class="new-find" style="cursor:default">Sub Unit</a></li>
                                    <li class="view"><a onclick="SubMenuDisplay('terms')" class="new-find" style="cursor:default">Terms</a></li>
                                    <li class="view"><a onclick="SubMenuDisplay('packing')" class="new-find" style="cursor:default">Packing</a></li>
                                </ul>
                                <div id="tab-content-holder">
                                   <%-- Start Unit --%>

                                    <div id="xUnit" style="display: none">
                                	    <div class="content tabular">
                                           <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th width="50%">Unit</th>
                                                        <th width="50%">Plural</th>
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

                                    <div id="xUnitManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Unit</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_unit_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_unit" value="" class="long">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Plural</label></td>
                                                        <td class="obj">
                                                            <input id="Hidden1" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_plural" value="" class="long">
                                                        </td>
                                                    </tr>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

                                    <div id="xUnitSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Unit</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_unit_search"  value="" class="long search_class" ></td>
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

                                    <%-- End Unit --%>

                                    <%-- Start Sub Unit --%>

                                    <div id="xSubUnit" style="display: none">
                                	    <div class="content tabular">
                                           <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th width="50%">Sub Unit</th>
                                                        <th>Plural</th>
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

                                    <div id="xSubUnitManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Sub Unit</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_sub_unit_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_sub_unit" value="" class="long">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Plural</label></td>
                                                        <td class="obj">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_plural_sub_unit" value="" class="long">
                                                        </td>
                                                    </tr>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

                                    <div id="xSubUnitSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Sub Unit</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_sub_unit_search"  value="" class="long search_class" ></td>
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

                                    <%-- End Sub Unit --%>

                                    <%-- Start Terms --%>

                                    <div id="xTerms" style="display: none">
                                	    <div class="content tabular">
                                           <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th width="50%">Terms</th>
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

                                    <div id="xTermsManage" style="display: none">
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="lbl">
                                                            <label for="bank">Terms</label></td>
                                                        <td class="obj">
                                                            <input id="hdn_terms_id" valu="0" type="hidden" />
                                                            <input type="text" autocorrect="off" spellcheck="false" id="txt_terms" value="" class="long">
                                                        </td>
                                                    </tr>
                                                  
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

                                    <div id="xTermsSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Terms</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_terms_search"  value="" class="long search_class" ></td>
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

                                    <%-- End Terms --%>

                                    <%-- Start Packing --%>

                                    <div id="xPacking" style="display: none">
                                	    <div class="content tabular">
                                           <table class="tblholder">
                                                <thead>
                                                    <tr>
                                                        <th width="50%">Packing</th>
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

                                    <div id="xPackingManage" style="display: none">
                                           <input id="hdn_packing_id" valu="0" type="hidden" />
                                        <div class="content vmiddle ym-form">
                                            <table>
                                                <tbody>
                                                   <tr>
                                                        <td class="lbl"><label for="packing">*Packing</label></td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_packing" name="unit" value="" class="xshort"></td>
                                                        <td class="obj">
                	                                        <div class="select-arrow xmedium">
                                                                <select id="ddl_unit_type">
                                                                </select>
                                                            </div>
                                                        </td>
                                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="txt_packing_unit" name="sub_unit" value="" class="xshort"></td>
                                                        <td class="obj">
                	                                        <div class="select-arrow xmedium">
                                                                <select id="ddl_sub_unit_type">
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                  
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>

                                    <div id="xPackingSearch" style="display:none">
                                    <div class="content tabular">
                                        <table class="tblholder">
                                            <thead>
                                                <tr>
                                                    <th>Packing</th>
                                                </tr>
                                            </thead>
                                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 0px;">
                                                <tbody class="scroll" style="overflow: hidden; width: auto; height: 0px;">
                                                    <tr>
                                                        <td><input type="text" autocorrect="off" spellcheck="false" id="txt_packing_search"  value="" class="long search_class" ></td>
                                                    </tr>

                                                    <div id="Div2">
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

                                    <%-- End Packing --%>
                                
                                </div>
                            </div>	
                        </div>
                    </div>
                    <div class="ym-col3">
    <div class="ym-cbox"> 
        <ul class="sidebar crossfade">
            <li class=""><a href="aspnetCompany-List.aspx"><span class="item general"></span>General</a></li>	
            <li class=""><a href="aspnetCompany-List-Group.aspx"><span class="item groups"></span>Groups</a></li>
            <li class=""><a href="aspnetCompany-List-PayrollItem.aspx"><span class="item payroll-items"></span>Payroll Items</a></li>
            <li class="active"><a href="aspnetCompany-List-Field.aspx"><span class="item fields"></span>Fields</a></li>
            <li class=""><a href="aspnetCompany-List-PaymentType.aspx"><span class="item payment-type"></span>Payment Type</a></li>
            <li class=""><a href="aspnetCompany-List-Others.aspx"><span class="item others"></span>Others</a></li>
        </ul>		
    </div>
</div>                </div>		
            </div>	
        </div>
    </div>
</div>

    <script src="Script/CompanyListField.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            SubMenuDisplay('unit');
        });

        function SubMenuDisplay(display) {
            $("#xUnit").hide();
            $("#xUnitManage").hide();
            $("#xUnitSearch").hide();
            $("#action_unit").hide();

            $("#xSubUnit").hide();
            $("#xSubUnitManage").hide();
            $("#xSubUnitSearch").hide();
            $("#action_sub_unit").hide();

            $("#xTerms").hide();
            $("#xTermsManage").hide();
            $("#xTermsSearch").hide();
            $("#action_terms").hide();

            $("#xPacking").hide();
            $("#xPackingManage").hide();
            $("#xPackingSearch").hide();
            $("#action_packing").hide();

            if (display == 'unit') {
                $("#xUnit").show();
                $("#action_unit").show();

                LoadUnit();

                $('#action_unit .save').addClass('disabled');
                $('#action_unit .delete').addClass('disabled');
                $('#action_unit .new').removeClass('disabled');
                $('#action_unit .find').removeClass('disabled');

            }
            else if (display == 'sub_unit') {
                $("#xSubUnit").show();
                $("#action_sub_unit").show();

                LoadSubUnit();
                $('#action_sub_unit .save').addClass('disabled');
                $('#action_sub_unit .delete').addClass('disabled');
                $('#action_sub_unit .new').removeClass('disabled');
                $('#action_sub_unit .find').removeClass('disabled');

            }
            else if (display == 'terms') {
                $("#xTerms").show();
                $("#action_terms").show();

                LoadTerms();

                $('#action_terms .save').addClass('disabled');
                $('#action_terms .delete').addClass('disabled');
                $('#action_terms .new').removeClass('disabled');
                $('#action_terms .find').removeClass('disabled');

            }


            else if (display == 'packing') {
                $("#xPacking").show();
                $("#action_packing").show();

                LoadPacking();
                LoadUnitPacking();
                LoadSubUnitPacking();

                $('#action_packing .save').addClass('disabled');
                $('#action_packing .delete').addClass('disabled');
                $('#action_packing .new').removeClass('disabled');
                $('#action_packing .find').removeClass('disabled');

            }



        }



        //////////////////

       
    </script>

</asp:Content>
