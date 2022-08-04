using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POS_system
{
    public partial class ViewItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }
               
        }
        [System.Web.Services.WebMethod(enableSession:true)]
        public static string itemsdatatable()
        {
            ItemRecords list =HttpContext.Current.Session["itemslist"] as ItemRecords;
            JavaScriptSerializer js=new JavaScriptSerializer();
            return js.Serialize(list.getItemsList());
        }
        [System.Web.Services.WebMethod(enableSession:true)]
        public static string returnItem(string itemId)
        {
            Item item=new Item("","",0,0);
            ItemRecords list = HttpContext.Current.Session["itemslist"] as ItemRecords;
            for(int i=0;i<list.getItemsList().Count;++i)
            {
                if (itemId.ToString().Equals(list.itemsList[i].itemId))
                {
                    item = list.itemsList[i];
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(item);
        }

        protected void updateItem_Click(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod(enableSession: true)]
        public static string deleteitem(string itemid)
        {
            ItemRecords list = HttpContext.Current.Session["itemslist"] as ItemRecords;
            for (int i = 0; i < list.getItemsList().Count; ++i)
            {
                if (itemid.ToString().Equals(list.itemsList[i].itemId))
                {
                    list.itemsList.RemoveAt(i);
                    HttpContext.Current.Session["itemslist"] = list;
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(list.itemsList);
        }

    }
}