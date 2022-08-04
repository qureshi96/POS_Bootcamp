using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POS_system
{
    public partial class ViewCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }
        }
        [System.Web.Services.WebMethod(enableSession: true)]
        public static string customersdatatable()
        {
            CustomerRecords list = HttpContext.Current.Session["customerlist"] as CustomerRecords;
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(list.getCustomerList());
        }
        [System.Web.Services.WebMethod(enableSession: true)]
        public static string returnCustomer(string customerId)
        {
            Customer customer=new Customer("","","");
            CustomerRecords list = HttpContext.Current.Session["customerlist"] as CustomerRecords;
            for(int i = 0; i < list.getCustomerList().Count; ++i)
            {
                if (customerId.ToString().Equals(list.customerList[i].customerId))
                {
                    customer = list.customerList[i];
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(customer);

        }

        protected void updateCustomer_Click(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod(enableSession: true)]
        public static string deletecustomer(string customerid)
        {
            CustomerRecords list = HttpContext.Current.Session["customerlist"] as CustomerRecords;
            for (int i = 0; i < list.getCustomerList().Count; ++i)
            {
                if (customerid.ToString().Equals(list.customerList[i].customerId))
                {
                    list.customerList.RemoveAt(i);
                    HttpContext.Current.Session["customerlist"] = list;
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(list.customerList);
        }

    }
}