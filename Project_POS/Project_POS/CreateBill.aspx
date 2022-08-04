<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateBill.aspx.cs" Inherits="POS_system.CreateBill" %>

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
    <title>Create Bill</title>
</head>
<body class="container" style="padding-top: 2%;">
    <form id="form1" runat="server">
      
        <div id="tabletohide" >
            <table id="customerstable" class="display">
                <thead>
                    <tr>
                        <th>Customer Name</th>
                        <th>Customer Id</th>
                        <th>Phone number</th>
                        <th>Select</th>
                    </tr>
                </thead>
            </table>
            </div>
        <div id="tabletoshow" style="display:none;" >
            <table id="itemstable" class="display" style="min-width:100%;">
                <thead>
                    <tr>
                        <th>Item Id</th>
                        <th>Item Name</th>
                        <th>Cost Price</th>
                        <th>Sale Price</th>
                        <th></th>
                    </tr>
                </thead>
            </table>

        </div>
        <div style="padding-top: 2%;">
            <div class="row">
            <h3 class="col-4" runat="server" id="billcustomerid">Customer ID: </h3>
            <h3 class="col-4" runat="server" id="billdate">Date: </h3>      
            </div>
                  <h2>Bill Items</h2>
        </div>
        <div id="billtablediv">
            <table id="billtable" class="display" style="min-width:100%;">
                <thead>
                    <tr>
                        <th>Item Id</th>
                        <th>Item Name</th>
                       
                        <th>Sale Price</th>
                      
                    </tr>
                </thead>
            </table>
            </div>
        <h2 id="total"></h2>
    </form>
</body>
    <script>
        $(document).ready(function () {

            $.ajax({
                url: "ViewCustomers.aspx/customersdatatable",
                method: 'post',
                dataType: 'json',
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    $("#customerstable").dataTable({
                        data: JSON.parse(data.d),
                        columns: [
                            { 'data': 'customerName' },
                            { 'data': 'customerId' },
                            { 'data': 'phoneNo' },
                            {
                                orderable: false,
                                'data': 'customerId',
                                'render': function (data) {
                                    return '<button type="button" class="btn btn-primary" id="selectedCustomer" onclick="selectCustomer(' + data + ')">Select</button>';
                                }
                            }

                        ]
                    });
                }
            });
        });
        $(document).ready(function () {
            $.ajax({
                url: "ViewItems.aspx/itemsdatatable",
                method: 'post',
                dataType: 'json',
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    $("#itemstable").dataTable({
                        data: JSON.parse(data.d),
                        columns: [
                            { 'data': 'itemName' },
                            { 'data': 'itemId' },
                            { 'data': 'costPrice' },
                            { 'data': 'salePrice' },
                            {
                                orderable: false,
                                'data': 'itemId',
                                'render': function (data) {
                                    return '<button type="button" class="btn btn-primary" id="addedItem" onclick="addItem(' + data + ')">Add</button>';
                                }
                            }
                        ]
                    });
                }
            });
        });

        function selectCustomer(customerid) {
            $('#billcustomerid').text("Customer ID: "+customerid);
            $('#tabletohide').hide();
            $('#tabletoshow').show();
        }
        function addItem(itemid) {
            var totalbill = 0;
            if ($.fn.DataTable.isDataTable("#billtable")) {
                $('#billtable').DataTable().clear().destroy();
            }
            $.ajax({
                url: "CreateBill.aspx/billItems",
                method: 'post',
                dataType: 'json',
                data: JSON.stringify({ 'itemid': itemid }),
                contentType: 'application/json',
                async: false,
                success: function (data) {
                    var obj = JSON.parse(data.d);
                    $("#billtable").DataTable({
                        data: JSON.parse(data.d),
                        columns: [
                            { 'data': 'itemName' },
                            { 'data': 'itemId' },
                            {
                                'data': 'salePrice'
                                
                                
                            }

                        ]
                    });
                    obj.forEach(myfunction);
                    function myfunction(item) {
                        totalbill += parseInt(item.salePrice);
                    }

                    $('#total').text("Total Bill = "+ totalbill);
                }
            });
       
        }
    </script>
</html>
