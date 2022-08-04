<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomers.aspx.cs" Inherits="POS_system.ViewCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.4.0/js/dataTables.select.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>
    <title>Customers list</title>
</head>
<body class="container-sm" style="margin-top:2%">
    <form id="form1" runat="server">
        <div>
            <div class="col-4">
            <label for="editCustomerName">Updated Customer Name</label>
            <input type="text" runat="server" id="editCustomerName" /> 
           
            <label for="editCustomerPhoneNo">Updated Phone Number</label>
            <input type="text" runat="server" id="editCustomerPhoneNo" />
            <asp:Button ID="updateCustomer" runat="server" Text="Update Customer" OnClick="updateCustomer_Click" />
            </div>
            <table id="customerstable" class="display">
                <thead>
                    <tr>
                        <th>Customer Name</th>
                        <th>Customer Id</th>
                        <th>Phone number</th>
                        <th>Edit/Delete</th>
                    </tr>
                </thead>
            </table>
        </div>
    </form>
</body>
    <script>
        function editCustomer(customerId) {
            $.ajax({
                url: "ViewCustomers.aspx/returnCustomer",
                method: 'post',
                data: JSON.stringify({ 'customerId': customerId }),
                dataType: 'json',
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    const obj = JSON.parse(data.d);
                    $('#editCustomerName').val(obj.customerName);
                    $('#editCustomerPhoneNo').val(obj.phoneNo);
                   

                }
            });
        }
        $(document).ready(function () {

            $.ajax({
                url: "ViewCustomers.aspx/customersdatatable",
                method: 'post',
                dataType: 'json',
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    $("#customerstable").DataTable({
                        data: JSON.parse(data.d),
                        columns: [
                            { 'data': 'customerName' },
                            { 'data': 'customerId' },
                            { 'data': 'phoneNo' },
                            {
                                orderable: false,
                                'data': 'customerId',
                                'render': function (data) {
                                    return '<button type="button" class="btn btn-primary" id="updateCustomer" onclick="editCustomer(' + data + ')">Edit</button>&nbsp<button type = "button" class="btn btn-primary" id = "removeCustomer" onclick = "deleteCustomer(' + data + ')"> Delete</button>';
                                }
                            }

                        ]
                    });
                }
            });

        });
          
      
            function deleteCustomer(customerId) {
                if ($.fn.DataTable.isDataTable("#customerstable")) {
                    $('#customerstable').DataTable().clear().destroy();
                }
                $.ajax({
                    url: "ViewCustomers.aspx/deletecustomer",
                    method: 'post',
                    dataType: 'json',
                    data: JSON.stringify({ 'customerid': customerId }),
                    contentType: 'application/json',
                    async: false,
                    success: function (data) {
                        $("#customerstable").DataTable({
                            data: JSON.parse(data.d),
                            columns: [
                                { 'data': 'customerName' },
                                { 'data': 'customerId' },
                                { 'data': 'phoneNo' },
                                {
                                    orderable: false,
                                    'data': 'customerId',
                                    'render': function (data) {
                                        return '<button type="button" class="btn btn-primary" id="updateCustomer" onclick="editCustomer(' + data + ')">Edit</button>&nbsp<button type = "button" class="btn btn-primary" id = "removeCustomer" onclick = "deleteCustomer(' + data + ')"> Delete</button>';
                                    }
                                }

                            ]
                        });
                    
                    }
                });
       
               }
    </script>
</html>
