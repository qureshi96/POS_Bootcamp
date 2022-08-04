using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class Admin:Employee
    {
        public AuthorizedEmployees addAccountant(Accountant accountant,AuthorizedEmployees emplist)
        {
            emplist.authorizedEmployeesList.Add(accountant);
            return emplist;
        }
        public Admin(string empName,string empNo,string password)
        {
            this.empName = empName;
            this.empNo = empNo;
            this.password = password;
            this.designation = "Admin";
        }
    }
}