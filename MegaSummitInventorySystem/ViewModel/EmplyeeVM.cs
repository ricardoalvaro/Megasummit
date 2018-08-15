using MegaSummitInventorySystem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EmployeeVM
{
  private static DatabaseDataContext Database = new DatabaseDataContext();

  public static string Employees(long id, string employeeName, string employeeType)
  {
        Database = new DatabaseDataContext();
        var data = Database._EmployeeSalesSelect(id, employeeName, employeeType).ToList();
        return JsonConvert.SerializeObject(data, Newtonsoft.Json.Formatting.None);
      
  }

}
//Database = new DatabaseDataContext();
//                var data = Database._EmployeeSalesSelect(id, employeeName, employeeType);