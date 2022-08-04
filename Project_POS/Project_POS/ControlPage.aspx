<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlPage.aspx.cs" Inherits="POS_system.ControlPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="ControlPage.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"/>

    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
         <header class="row" style="overflow:hidden; margin-top:1%;">
        <div class="col-10"></div>
        <div class="col-2">
            <asp:Button ID="logoutbtn" runat="server" Text="Logout" style="object-position: left;" OnClick="logoutbtn_Click" />
        </div>
    </header>
     <div class="container">
         <h1 runat="server" id="welcome"></h1>
         <div class="row">
         <div class="col-8">
        <div runat="server" id="div_accountantAdd" class="row">
            <h2>Add an Accountant to authorised users' list</h2>
            <div class="col-12">
                <input type="text" placeholder="Accountant Name" id="empnametxt"  runat="server"/>
                <input type="text" placeholder="Employee ID" id="empidtxt" runat="server"/>
                <input type="password" placeholder="Assign a password" id="emppasstxt" runat="server"/><br />
                <br />
                <asp:Button ID="addaccountant" runat="server" Text="Add user" OnClick="addaccountant_Click" />
                <p id="added_accountant" runat="server" style="color:green;"></p>
            </div>
        </div>
          <div runat="server" id="div_customerAdd" class="row">
            <h2>Add a Customer to the customers' list</h2>
            <div class="col-12">
                <input type="text" placeholder="Customer's Name" id="custnametx"  runat="server"/>
                <input type="text" placeholder="Customer ID" id="custidtxt" runat="server"/>
                <input type="text" placeholder="Phone no" id="custphonetxt" runat="server"/><br />
                <br />
                <asp:Button ID="addcustomerbtn" runat="server" Text="Add Customer" OnClick="addcustomerbtn_Click" />
                <p id="added_customer" runat="server" style="color:green;"></p>
            </div>
        </div>
            <div runat="server" id="div_itemAdd" class="row">
            <h2>Add an Item to the Items' list</h2>
            <div class="col-12">
                <input type="text" placeholder="Items's Name" id="itemnametxt"  runat="server"/>
                <input type="text" placeholder="Item ID" id="itemidtxt" runat="server"/>
                <input type="text" placeholder="Quantity" id="itemquantitytxt" value="1" runat="server"/><br /><br />
                <input type="text" placeholder="Cost Price" id="itemcostpricetxt" runat="server"/>
                <input type="text" placeholder="Sale Price" id="itemsalepricetxt" runat="server"/>
                <br />
                <br />
                <asp:Button ID="additembtn" runat="server" Text="Add Item" OnClick="additembtn_Click" />
                <p id="added_item" runat="server" style="color:green;"></p>
            </div>
             </div>
             </div>
             <div class="col-4">
                 <asp:Button CssClass="btn btn-info btn-lg btn-block" ID="viewitems" OnClick="viewitems_Click"  runat="server" Text="View Items" />
                 <br />
                 <br />
                 <asp:Button CssClass="btn btn-info btn-lg btn-block" ID="viewcustomers" OnClick="viewcustomers_Click"  runat="server" Text="View Customers" />
                 <br />
                 <br />
                 <asp:Button CssClass="btn btn-info btn-lg btn-block" ID="createbill" OnClick="createbill_Click"  runat="server" Text="Create Bill" />
             </div>
             </div>
     </div>
        
    </form>
</body>
</html>
