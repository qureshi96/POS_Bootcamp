using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POS_system
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["emplist"] == null)
            {
                Session["emplist"] = new AuthorizedEmployees();
            }
            if (Session["customerlist"] == null)
            {
                Session["customerlist"] = new CustomerRecords();
            }
            if (Session["itemslist"] == null)
            {
                Session["itemslist"] = new ItemRecords();
            }
            
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            bool found = false;
            AuthorizedEmployees emplist = Session["emplist"] as AuthorizedEmployees;
            for (int i = 0; i < emplist.authorizedEmployeesList.Count; ++i)
            {
                if (userName.Value == emplist.authorizedEmployeesList[i].empName
                    && pass.Value == emplist.authorizedEmployeesList[i].password)

                {
                    Session["emplist"] = emplist;
                    Session["username"] = emplist.authorizedEmployeesList[i];
                    Response.Redirect("ControlPage.aspx");
                    found = true;
                }
            }
            if (!found)
            {
                invalid_login.InnerText = "Invalid username or password!";
            }
        }


    }
}