<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetProductAssembly.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetProductAssembly1" %>
 <%@ Register src="include/ProductSubMenu.ascx" tagname="ProductSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .product{
            width: 206px;
            /*border: solid 1px transparent*/
        }
        .location{
            width: 139px;
            /*border: solid 1px transparent;*/
        }
        .quantity{
            width: 75px;
            /*border: solid 1px transparent;*/
        }
        .unit{
            width: 75px;
            /*border: solid 1px transparent;*/
        }
        .ave_cost{
            width: 103px;
            /*border: solid 1px transparent;*/
        }
        .amount{
            width: 64px;
            /*border: 1px solid transparent;*/
        }


    </style>

    <uc1:ProductSubMenu ID="ProductSubMenu1" runat="server" />
    <div id="main" class="products-product">
         <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
            <div class="container two-column-sidebar style2">
                <div class="ym-column linearize-level-1">
                    <div id="Div1" class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                              <h1>Assembly</h1>
                              <div class="addup">
                              	<div name="inventory_adjustment_form" id="Form1" method="POST" class="ym-form">
                                	<div class="ym-clearfix">
                                        <div class="float-left">
                                            <table>                                           
                                                <tr>
                                                    <td class="lbl"><label for="product_name">*Product Name</label></td>
                                                    <td class="obj">
                                                        <input type="text" autocorrect="off" spellcheck="false" id="product_name"  value="" class="long" />
                                                       <%-- <div class="select-arrow fullwidth">
                                                            <select name="product_name" id="Select1">
                                                                <option value=""></option>                                                             
                                                            </select>
                                                        </div>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="location">*Location</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select name="location" id="location">
                                                                <option value=""></option>                                                             
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="quantity">*Quantity</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="quantity" name="current_quantity" value="" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="unit">*Unit</label>
                                                                <div class="select-arrow short">
                                                                    <select name="unit" id="unit">
                                                                        <option value=""></option>                                                             
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>                                                
                                                <tr>
                                                    <td class="lbl"><label for="average_cost">Average Cost</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="average_cost" name="average_cost" value="" class="short" disabled /></td>
                                                </tr>                                    
                                            </table>
                                        </div>
                                        <div class="float-right">
                                            <table>
                                                <tr>
                                                    <td class="lbl"><label for="reference_number">*Reference No.</label></td>
                                                    <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" value="AS"  name="reference_letter" class="xxshort " disabled/>
                                                            </div>
                                                            <div class="col-left">
                                                                &nbsp;&nbsp;
                                                            </div>
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="reference_number" name="reference_number" class="xxxmedium" />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="reference_number">*Date</label></td>
                                                    <td class="obj">
                                                        <div class="dp xmedium">
                                                            <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td class="lbl"><label for="batch_number">*Batch Number</label></td>
                                                    <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="batch_number" name="batch_number" value="" class="xmedium" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="lbl"><label for="prepared_by">Prepared by</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow xmedium">
                                                            <select name="prepared_by" id="prepared_by">
                                                                <option value=""></option>                                                             
                                                            </select>

                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>    
                                        </div>
                                    </div> 
                                    <div class="space10"></div>   
                                </div>
                              </div>                              
                              <div class="rounded">
                                    <table id="tblMain" class="tblholder unclickable">
                                        <thead>
                                            <tr>
                                                <th width="30%">Product Name</th>
                                                <th width="20%">Location</th>
                                                <th width="12%">Quantity</th>
                                                <th width="12%">Unit</th>
                                                <th width="15%">Average Cost</th>
                                                <th width="12%">Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody class="scroll">
                                            <%--<tr><td style="width: 30%"><input type="text" class="product" /><input type="hidden" class="product_id" /></td><td><input type="text" class="location" width="100%"/><input type="hidden" class="location_id" /></td><td><input type="text" class="quantity" /></td><td><input type="text" class="unit" /></td><td><input type="text" class="ave_cost" /></td><td><input type="text" class="amount" /></td></tr>
                                          --%>
                                        </tbody>
                                   </table>
                                </div>  
                                <div class="addup"><br /><br /><br /></div>                         
                            </div>
                        </div>
                    </div>
                   
                    <div class="ym-col3">
                        <div class="ym-cbox"> 
                            
                            <asp:Repeater runat="server" ID="repList">
                                <HeaderTemplate>
                                    <ul id="ulSidebar" class="sidebar sidelists2 crossfade scroll">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <a href="javascript:;" id="item-1">
                                            <span class="name"><%# Eval("ProductName") %>
                    	                    <span><%#Eval("LocationName") %></span>
                                            </span>
                                        </a>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>

    	                   
                              
                        </div>
                    </div>

                </div>		
            </div>	
        </div>
    </div>
</div>

   


    <script type="text/javascript">

      
        /// <reference path="https://code.jquery.com/jquery-3.3.1.slim.min.js" /> 
        //--------Need refactoring----------
        var product_id = 0;
        var location_id = 0;

        $(document).ready(function () {

            $("#tblMain tbody").append(GenerateStaticList());
            GenerateDynamicProductAutoComplete();


            $("#btn-new").removeClass("disabled");
            CreateDate();
            ProductAutoComplete();
            LocationAutoComplete();
            LoadUnits();
            LoadPreparedEmployee();

          

            $("#ulSidebar").append(defaultTableRow());

            $("#btn-new").click(function(){
                $("#btn-new").addClass("disabled");
                $("#btn-save").removeClass("disabled");
                // window.location = "btn-new";
            });

            $("#btn-save").click(function(){
                $("#btn-new").removeClass("disabled");
                $("#btn-save").addClass("disabled");
                // window.location = "btn-new";
            });
        });


        function GenerateStaticList()
        {
            var ret = "";
            for (var i = 0; i < 20; i++) {
                ret +="<tr><td style='width: 30%'><input type='text' class='product'  /><input type='hidden' class='product_id' /></td><td><input type='text' class='location' width='100%'/><input type='hidden' class='location_id' /></td><td><input type='text' class='quantity' /></td><td><input type='text' class='unit' /></td><td><input type='text' class='ave_cost' /></td><td><input type='text' class='amount' /></td></tr>";
            }

            return ret;
        }


        function GenerateDynamicProductAutoComplete()
        {
            $("#tblMain tbody tr").find('td').each (function() {
                
                $(this).find(".product").autocomplete({source: ProductAutoCompleteData,minLength: 0,minChars: 0,max: 12,autoFill: true,matchContains: false,
                    select: function (a, b) {
                        alert('product name');
                    }
                })

                $(this).find(".location").autocomplete({source: LocationAutoCompleteData,minLength: 0,minChars: 0,max: 12,autoFill: true,matchContains: false,
                    select: function (a, b) {
                        alert('location');
                    }
                })

            });  
        }

        function SelectFromList(id)
        {
            $("#btn-new").addClass("disabled");
            $("#btn-save").removeClass("disabled");
            $("#btn-delete").removeClass("disabled");
        }

        function CreateDate()
        {
            var currentDate = new Date();
            var day = currentDate.getDate();
            var month = currentDate.getMonth() + 1;
            var year = currentDate.getFullYear();
            $('#date').val("0" + month + "/" + day + "/" + year);
        }

        function defaultTableRow()
        {
            var temp = "<li><a href='javascript:;' id='item-2' onclick=\"SelectFromList('0')\"><span class='name'>&nbsp;<span>&nbsp;</span></span></a><li><a href='javascript:;' id='item-2'><span class='name'>&nbsp;<span>&nbsp;</span></span></a></li></li>";
            var result = "";

            for (var i = 0; i < 30; i++) {
                result += temp;
            }

            return result;
        }

        function ProductAutoComplete()
        {
            $("#product_name").autocomplete({
                source: ProductAutoCompleteData,
                minLength: 0,
                minChars: 0,
                max: 12,
                autoFill: true,
                matchContains: false,
                select: function (a, b) {

                    product_id = Number(b.item.id);
                    location_id = Number($("#location").val());
                    ActionSelectProductDetails();
                }
            })
        }

      

        function LocationAutoComplete() {
            $('#location').empty();
            var data = LocationAutoCompleteData;
            for (var i = 0; i < data.length; i++) {

                $('#location').append("<option value='" + data[i]["id"] + "'>" + data[i]["label"] + "</option>");

            }
        }

        function LoadUnits() {
            var pageUrl = '/Webservice/svr_Unit.asmx';


            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectUnit",
                data: "{ 'id':'0', 'unit':'', 'plural':'' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    $('#unit').empty();
                    var data = eval(response.d);
                    var obj = "";
                    for (var i = 0; i < data.length; i++) {

                        $('#unit').append("<option value='" + data[i]["ID"] + "'>" + data[i]["UnitName"] + "</option>");

                    }


                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }

        function LoadPreparedEmployee() {

            var pageUrl = '/Webservice/svr_CustomerSales.asmx';


            $.ajax({
                type: "POST",
                url: pageUrl + "/SelectEmployee",
                data: "{ 'id':'0', 'employeeName':'', 'employeeType':'Employee'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                crossdomain: true,
                success: function (response) {

                    $('#prepared_by').empty();
                    $('#prepared_by').append("<option value='" + "0" + "'>" + "</option>");
                    var data = eval(response.d);
                    var obj = "";
                    for (var i = 0; i < data.length; i++) {

                        $('#prepared_by').append("<option value='" + data[i]["ID"] + "'>" + data[i]["EmployeeName"] + "</option>");

                    }


                },
                error: function (response) {
                    alert(response.status);
                }
            });

        }



        var LocationAutoCompleteData = <%= AutoCompleteLocation() %>;
        var ProductAutoCompleteData = <%= AutoCompleteProduct() %>;
      
    </script>

</asp:Content>
