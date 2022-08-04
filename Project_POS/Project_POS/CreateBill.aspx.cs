using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POS_system
{
    public partial class CreateBill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }
            Session["bill"] = new List<Item>();
        }
        [System.Web.Services.WebMethod(enableSession:true)]
        public static string billItems (string itemid)
        {
            ItemRecords list = HttpContext.Current.Session["itemslist"] as ItemRecords;
            List<Item> billlist = HttpContext.Current.Session["bill"] as List<Item>;
            for (int i = 0; i < list.getItemsList().Count; ++i)
            {
                if (itemid.ToString().Equals(list.itemsList[i].itemId))
                {
                    billlist.Add(list.itemsList[i]);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(billlist);
        }
    }
}