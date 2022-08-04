using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POS_system
{
    public partial class ControlPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            Employee loggedin = Session["username"] as Employee;
            welcome.InnerText = "Welcome " + loggedin.empName + ", Your designation is: " + loggedin.designation;
            if (loggedin.designation == "Accountant")
            {
                div_accountantAdd.Visible = false;
            }
            if (loggedin.designation == "Admin")
            {
                createbill.Visible= false;
            }
        }

        protected void logoutbtn_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("LoginPage.aspx");
        }

        protected void addaccountant_Click(object sender, EventArgs e)
        {
            Admin loggedin = Session["username"] as Admin;
            AuthorizedEmployees emplist = Session["emplist"] as AuthorizedEmployees;
            Accountant accountant=new Accountant(empnametxt.Value, empidtxt.Value, emppasstxt.Value);
            Session["emplist"] = loggedin.addAccountant(accountant, emplist);
            empnametxt.Value = "";empidtxt.Value = ""; emppasstxt.Value = "";  
            added_accountant.InnerText="Added user to the list!";
        
        }

        protected void addcustomerbtn_Click(object sender, EventArgs e)
        {
            Employee loggedin = Session["username"] as Employee;
            CustomerRecords customerlist = Session["customerlist"] as CustomerRecords;
            Customer customer = new Customer(custnametx.Value, custidtxt.Value, custphonetxt.Value);
            Session["customerlist"]=loggedin.addCustomer(customer, customerlist);
            custnametx.Value = "";custidtxt.Value = ""; custphonetxt.Value = "";
            added_customer.InnerText = "Added Customer to the list!";
        }

        protected void additembtn_Click(object sender, EventArgs e)
        {
            Employee loggedin = Session["username"] as Employee;
            ItemRecords itemslist = Session["itemslist"] as ItemRecords;
            Item item = new Item(itemnametxt.Value, itemidtxt.Value, Convert.ToInt32(itemcostpricetxt.Value), Convert.ToInt32(itemsalepricetxt.Value));
            Session["itemslist"]=loggedin.addItem(item, itemslist,Convert.ToInt32(itemquantitytxt.Value));
            itemnametxt.Value = "";itemidtxt.Value = "";itemcostpricetxt.Value = "";itemsalepricetxt.Value = "";
            added_item.InnerText = "Added Item to the stock of items";
        }

        protected void viewitems_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewItems.aspx");
        }

        protected void viewcustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCustomers.aspx");
        }

        protected void createbill_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateBill.aspx");
        }
    }
}