namespace POS_system
{
    public class Customer
    {
        public string customerName { set; get; }
        public string customerId { set; get; }
        public string phoneNo { set; get; }

        public Customer(string customerName, string customerId, string phoneNo)
        {
            this.customerName = customerName;
            this.customerId = customerId;
            this.phoneNo = phoneNo;
        }
    }
}