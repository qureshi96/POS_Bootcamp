using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class Bill
    {
        public string billNo { set; get; }
        public Customer customer;
        public DateTime time = new DateTime();
        public List<Item> billItems;
        public int totalAmount ;

        public void addItemToBill(Item item,int quantity)
        {
            for(int i = 0; i < quantity; ++i)
            {
                billItems.Add(item);
            }
        }
        public void removeItemfromBill(Item item)
        {
            billItems.Remove(item);
        }
        public int calculateTotal()
        {
            
            for(int i = 0; i < billItems.Count; ++i)
            {
                totalAmount += billItems[i].salePrice;
            }
            return totalAmount;
        }
    }
}