using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class AuthorizedEmployees
    {
        public List<Employee> authorizedEmployeesList;

        public AuthorizedEmployees()
        {
            authorizedEmployeesList = new List<Employee>();
            authorizedEmployeesList.Add(new Admin("Usman", "001", "curemd"));
            authorizedEmployeesList.Add(new Accountant("Sohaib", "002", "curemd"));

        }

    }
}