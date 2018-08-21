<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="aspnetCustomerMemo.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetCustomerMemo1" %>
<%@ Register src="include/CustomerSubMenu.ascx" tagname="CustomerSubMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <uc1:CustomerSubMenu ID="CustomerSubMenu1" runat="server" />
<div id="main" >
    <div class="ym-wrapper">    	   	
        <div class="ym-wbox"> 
        		 <div class="container two-column-sidebar style2 mod-memo">
                <div class="ym-column linearize-level-1">
                    <div id="content-holder" class="ym-col1">
                        <div class="ym-cbox padtop9"> 
                            <div class="box-holder">
                                  <div name="customer_memo_form" id="customer_memo_form" method="POST" class="ym-form">
                                    <div class="addup">
                                        <h1>Customer Memo</h1>
                                        <div class="ym-clearfix">
                                            <div class="float-left">
                                                <table>
                                                	<tr>
                                                        <td class="lbl"><label for="customer_name">*Customer Name</label></td>
                                                        <td class="obj">
                                                             <input type="text" autocorrect="off" spellcheck="false" id="customer"  value="" class="long" />       
                                                           <%-- <div class="select-arrow long">
                                                                <select id="customer_name" name="customer_name">
                                                                    <option value=""></option>	     
                                                                </select>
                                                            </div>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="float-right">
                                                <table>
                                                    <tr>
                                                        <td class="lbl"><label for="reference_number">Reference No.</label></td>
                                                        <td class="obj">
                                                            <div class="grid ym-clearfix">
                                                                <div class="col-left">
                                                                    <input type="text" autocorrect="off" spellcheck="false" id="reference_letter" name="reference_letter" class="xxshort"  value="CM"/>
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
                                                        <td class="lbl"><label for="date">*Date</label></td>
                                                        <td class="obj">
                                                            <div class="dp xmedium">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="date" name="date" class="date" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="addup">
                                        <div class="space5"></div>
                                        <div class="box">
                                        	<div class="space10"></div>
                                            <table>
                                                <tr>
                                                    <td class="lbl"><label for="account_name">Account Name</label></td>
                                                    <td class="obj">
                                                        <div class="select-arrow fullwidth">
                                                            <select id="account_name" name="account_name">
                                                                <option value=""></option>	     
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td class="lbl"><label for="debit">Debit</label></td>
                                                   <td class="obj">
                                                        <div class="grid ym-clearfix">
                                                            <div class="col-left">
                                                                <input type="text" autocorrect="off" spellcheck="false" id="debit" name="debit" class="short" />
                                                            </div>
                                                            <div class="col-right">
                                                                <label for="credit">Credit</label>
                                                                <input type="text" autocorrect="off" spellcheck="false" id="credit" name="credit" class="short" />
                                                            </div>
                                                        </div>
                                                        <div class="ym-ie-clearing">&nbsp;</div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="space10"></div>                      
                                        </div>
                                        <div class="space10"></div>
                                    </div>
                                    <div class="rounded">
                                    	<table class="tblholder unclickable" id="tblList">
                                            <thead>
                                                <tr>
                                                    <th width="15%">Reference No.</th>
                                                    <th width="10%">Date</th>
                                                    <th width="50%">Description</th>
                                                    <th width="10%">Balance</th>
                                                    <th width="12%"><input type="checkbox" id="applied" class="lblleft" /><label for="apply">Apply</label></th>
                                                </tr>
                                            </thead>
                                            <tbody class="scroll">
                                               <%-- <tr>
                                                    <td width="15%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="50%">here</td>
                                                    <td width="10%">here</td>
                                                    <td width="12%">here</td>
                                                </tr>--%>
                                                                                        
                                            </tbody>
                                       </table>
                                    </div>
                                    <div class="addup summary">
                                    	<div class="space10">&nbsp;</div>
                                        <div class="ym-clearfix">
                                        	<div class="total box">
                                                <div class="ym-clearfix">
                                                    <table>
                                                        <tr>
                                                            <td width="50%">Invoice Amt.</td>
                                                            <td  width="50%">2,000.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Applied Amt.</td>
                                                            <td>0.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Balance</td>
                                                            <td>0.00</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="space20">&nbsp;</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  <div class="ym-col3">
                        <div class="ym-cbox"> 
    	                    <ul class="sidebar sidelists2 crossfade scroll" id="ulMemoList">
                               <%-- <li>                
                                   <a href="javascript:;" id="item-1">
                	                    <span class="name">Tacloban Far East Marketing
                    	                    <span class="ym-clearfix"><span class="float-left">Discount</span>
                                                <span class="float-right">200.00</span>
                                            </span>
                                        </span>
                                   </a>               
                                </li> --%>
                                
                            </ul>
                        </div>
                    </div>
                </div>		
            </div>	
        </div>
    </div>
</div>

      <script type="text/javascript">
          /// <reference path="js/jquery-3.3.1.slim.min.js" />
          //--------Need refactoring----------
          var CustomerID = 0;


          $(document).ready(function () {

             
            
              Fill();

          });

          function ListOfficialReceipt(customer_name , ref_no, amount)
          {
              return "<li><a href='javascript:;' id='item-1'><span class='name'>" + customer_name + "<span class='ym-clearfix'><span class='float-left'>" + ref_no + "</span><span class='float-right'>" + ((amount == '0') ? '' : Number(amount).toFixed(2)) + "</span></span></span></a></li>";
          }



          function Fill()
          {
              FillCustomerAutoComplete(); CreateDate(); FillDefaultList();
          }

          function FillCustomerAutoComplete() {
              $("#customer").autocomplete({
                  source: CustomerData, minLength: 0, minChars: 0, max: 12, autoFill: true,
                  matchContains: false, select: function (a, b) {
                      //customer information
                      FillCustomerDetails(b.item.id);
                      CustomerID = b.item.id;
                  }
              }).on('focus', function (event) { var self = this; $(self).autocomplete("search", ""); });
          }


          function FillCustomerDetails(customer_id) {
            
              console.log(customer_id);
          }

          function CreateDate()
          {
              var currentDate = new Date(); var day = currentDate.getDate(); var month = currentDate.getMonth() + 1; var year = currentDate.getFullYear();
              $('#date').val("0" + month + "/" + day + "/" + year);
          }

          function FillDefaultList()
          {
              for (var i = 0; i < 20; i++) {
                  $("#tblList tbody").append("<tr><td width='15%'></td><td width='10%'></td><td width='23%'></td><td width='15%'></td><td width='12%'></td><td width='20%'></td></tr>");
            
                  $("#ulMemoList").append(ListOfficialReceipt('&nbsp;','&nbsp;','0') );
              }

          }

       </script>

     <script type="text/javascript">

         var CustomerData = <%= CustomerVM.CustomerAutoComplete %>;
         
    </script>
</asp:Content>
