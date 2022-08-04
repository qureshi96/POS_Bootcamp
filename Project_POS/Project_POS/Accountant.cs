using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class Accountant:Employee
    {
        public Accountant(string empName, string empNo, string password)
        {
            this.empName = empName;
            this.empNo = empNo;
            this.password = password;
            this.designation = "Accountant";
        }
    }
}
