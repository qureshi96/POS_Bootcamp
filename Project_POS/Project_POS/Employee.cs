using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace POS_system
{
    public class Employee
    {
        public string empName { get; set; }
        public string empNo { get; set; }
        public string designation { get; set; }
        public string password { get; set; }

        public CustomerRecords addCustomer(Customer customer,CustomerRecords customerlist)
        {
            customerlist.customerList.Add(customer);
            return customerlist;
        }
        public void deleteCustomer(Customer customer)
        {

        }
        public void updateCustomer(Customer customer, string customerName, string customerId, string phoneNo)
        {

        }
        public void viewCustomers(List<Customer> customerList)
        {

        }
        public ItemRecords addItem(Item item,ItemRecords itemslist,int quantity)
        {
            for (int i = 0; i < quantity; i++)
            {
                itemslist.itemsList.Add(item);
            }
            return itemslist;
        }
        public void deleteItem(Item item)
        {

        }
        public void updateItem(Item item, string itemId, string itemName, int costPrice, int salePrice)
        {

        }
        public void viewItems(List<Item> itemList)
        {

        }

    }
}