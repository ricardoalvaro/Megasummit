function Helper()
{

    this.GetQuerystring = function ()
    {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    }

    this.FormatDate = function (value) {
        var date = new Date(value);
        var jsonDate = (date.getMonth() + 1) + '/' + date.getDate() + '/' + date.getFullYear();
        return jsonDate;
    }


    this.ActivateMenu = function ()
    {
       
        $(function () {
            var pgurl = window.location.href.substr(window.location.href.lastIndexOf("/") + 1);

            
            if (pgurl == "aspnetCompany-Summary.aspx" ||
                pgurl == "aspnetCompany-Calendar.aspx" || 
                pgurl == "aspnetCompany-Defaults-Customer.aspx" ||
                pgurl == "aspnetCompany-Defaults-Employee.aspx" ||
                pgurl == "aspnetCompany-Defaults-Product.aspx" ||
                pgurl == "aspnetCompany-Defaults-Supplier.aspx" ||
                pgurl == "aspnetCompany-Defaults.aspx" ||
                pgurl == "aspnetCompany-History.aspx" ||
                pgurl == "aspnetCompany-List-Field.aspx" ||
                pgurl == "aspnetCompany-List-Group.aspx" ||
                pgurl == "aspnetCompany-List-Others.aspx" ||
                pgurl == "aspnetCompany-List-PaymentType.aspx" ||
                pgurl == "aspnetCompany-List-PayrollItem.aspx" ||
                pgurl == "aspnetCompany-List.aspx" ||
                pgurl == "aspnetCompany-Reminder-UndepositFunds.aspx" ||
                pgurl == "aspnetCompany-Reminders-PreorderItems.aspx" ||
                pgurl == "aspnetCompany-Reminders-PurchaseOrder.aspx" ||
                pgurl == "aspnetCompany-Reminders-ReturnedCheck.aspx" ||
                pgurl == "aspnetCompany-Reminders-SalesOrder.aspx" ||
                pgurl == "aspnetCompany-Reminders-TodoList.aspx" ||
                pgurl == "aspnetCompany-Reminders.aspx" ||
                pgurl == "aspnetCompany-Settings-Accessories.aspx" ||
                pgurl == "aspnetCompany-Settings-Accounts.aspx" ||
                pgurl == "aspnetCompany-Settings-Banking.aspx" ||
                pgurl == "aspnetCompany-Settings-Employees.aspx" ||
                pgurl == "aspnetCompany-Settings-Products.aspx" ||
                pgurl == "aspnetCompany-Settings-Suppliers.aspx" ||
                pgurl == "aspnetCompany-Settings.aspx" ||
                pgurl == "aspnetCompany-Summary.aspx" || 
                pgurl == "aspnetCompany-User.aspx" ||
                pgurl == "aspnetCompany.aspx"
                )

            {
                $("#iCompany").addClass("active");
            }
           
          

            if (pgurl.indexOf("aspnetCustomer.aspx") >= 0 ||
                pgurl.indexOf("aspnetCustomerInformation.aspx") >= 0 ||
                pgurl.indexOf("aspnetCustomerInformationCustomerItem.aspx") >= 0 ||
                pgurl.indexOf("aspnetCustomerInformationSalesOrder.aspx") >= 0 ||
                pgurl.indexOf("aspnetCustomerInformationInvoices.aspx") >= 0 ||
                pgurl.indexOf("aspnetCustomerInformationPayment.aspx") >= 0 ||
                pgurl.indexOf("aspnetCustomerInformationMemo.aspx") >= 0 ||
                pgurl.indexOf("aspnetSales.aspx") >= 0 ||
                pgurl.indexOf("aspnetSalesInvoice.aspx") >= 0 ||
                pgurl.indexOf("aspnetSalesReturn.aspx") >= 0 ||
                pgurl.indexOf("aspnetSalesReturnInformation.aspx") >= 0 ||
                pgurl.indexOf("aspnetSalesOrder.aspx") >= 0 ||
                pgurl.indexOf("aspnetSalesOrderInformation.aspx") >= 0 ||
                pgurl.indexOf("aspnetOfficialReceipt.aspx") >= 0 ||
                pgurl.indexOf("aspnetCustomerMemo.aspx") >= 0 
                ) {
                $("#iCustomer").addClass("active");
                
            }



            if (pgurl == "aspnetEmployee.aspx") {
                $("#iEmployee").addClass("active");
            }


            else if (pgurl.indexOf("aspnetProduct.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductInformation.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductInformationStockCard.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductInformationCustomerItem.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductInformationSupplierItem.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductInformationLocation.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductPreOrder.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductAssembly.aspx") >= 0 ||
                pgurl.indexOf("aspnetProductAdjustment.aspx") >= 0 
                ) {
                $("#iProduct").addClass("active");
            }
           


            //--------------
            ///aspnetProduct.aspx
            //aspnetProductPreorder.aspx
            //aspnetProductAssembly.aspx
            //aspnetProductsAdjustment.aspx


        });
    }


}


