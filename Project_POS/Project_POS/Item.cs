using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class Item
    {
        public string itemId { set; get; }
        public string itemName { set; get; }
        public int costPrice { set; get; }
        public int salePrice { set; get; }

        public Item(string itemId, string itemName, int costPrice, int salePrice)
        {
            this.itemId = itemId;
            this.itemName = itemName;
            this.costPrice = costPrice;
            this.salePrice = salePrice;
        }

        public void updateItem(string itemId, string itemName, int costPrice, int salePrice)
        {
            this.itemId = itemId;
            this.itemName = itemName;
            this.costPrice = costPrice;
            this.salePrice = salePrice;
        }
    }
}