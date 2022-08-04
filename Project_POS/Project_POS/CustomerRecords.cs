using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class CustomerRecords
    {
        public List<Customer> customerList=new List<Customer>();
        
        public CustomerRecords()
        {
            customerList.Add(new Customer("John Cena", "1", "043523523"));
            customerList.Add(new Customer("Joe Root", "2", "044656523"));
            customerList.Add(new Customer("James May", "3", "042332343"));
            customerList.Add(new Customer("Richard Hammond", "4", "13243523"));
        }
        public List<Customer> getCustomerList()
        {
            return customerList;
        }
    }

}
