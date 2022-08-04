using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class ItemRecords
    {
        public List<Item> itemsList=new List<Item>();
        
        public ItemRecords()
        {
            itemsList.Add(new Item("3221", "iPhone 13",  150000, 200000));
            itemsList.Add(new Item("3243", "iPhone 13 pro",  170000, 250000));
            itemsList.Add(new Item("35421", "Macbook Air M2",  200000, 300000));
            itemsList.Add(new Item("4323", "Adidas Ultraboost",  50000, 55000));
            itemsList.Add(new Item("32", "Pen",  20, 30));
        }
        public List<Item> getItemsList()
        {
            return itemsList;
        }

    }
}