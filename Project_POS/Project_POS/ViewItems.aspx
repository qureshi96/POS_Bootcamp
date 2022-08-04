<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewItems.aspx.cs" Inherits="POS_system.ViewItems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css"/>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"/>

    <link rel="stylesheet" href="ControlPage.css" />
    <title>Items list</title>
</head>
<body class="container-sm" style="margin-top:2%">
    <form id="form1" runat="server">
        <div>
            <div class="col-4">
            <label for="editItemName">Updated Item Name</label>
            <input type="text" runat="server" id="editItemName" /> 
            <label for="editCostPrice">Updated Cost Price</label>
            <input type="text" runat="server" id="editCostPrice" />
            <label for="editSalePrice">Updated Sale Price</label>
            <input type="text" runat="server" id="editSalePrice" />
            <asp:Button ID="updateItem" runat="server" Text="UpdateItem" OnClick="updateItem_Click" />
            </div>
            <table id="itemstable" class="display">
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
    </form>
</body>
 <script>
     function editItem(itemId) {
         $.ajax({
             url: "ViewItems.aspx/returnItem",
             method: 'post',
             data: JSON.stringify({ 'itemId': itemId }),
             dataType: 'json',
             contentType: 'application/json',
             async: false,
             success: function (data) {
                 const obj = JSON.parse(data.d);
                 $('#editItemName').val(obj.itemName);
                 $('#editCostPrice').val(obj.costPrice);
                 $('#editSalePrice').val(obj.salePrice);

             }
         });
     }
     $(document).ready(function () {
         $.ajax({
             url: "ViewItems.aspx/itemsdatatable",
             method: 'post',
             dataType: 'json',
             contentType: 'application/json',
             async: false,
             success: function (data) {
                 $("#itemstable").DataTable({
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
                                 return '<button type="button" class="btn btn-primary" id="updateItem" onclick="editItem(' + data + ')">Edit</button>&nbsp<button type = "button" class="btn btn-primary" id = "removeItem" onclick = "deleteItem(' + data + ')"> Delete</button>';
                             }
                         }
                     ]
                 });
             }
         });
     });

     
         function deleteItem(itemId) {
             if ($.fn.DataTable.isDataTable("#itemstable")) {
                 $('#itemstable').DataTable().clear().destroy();
             }
             $.ajax({
                 url: "ViewItems.aspx/deleteitem",
                 method: 'post',
                 dataType: 'json',
                 data: JSON.stringify({ 'itemid': itemId }),
                 contentType: 'application/json',
                 async: false,
                 success: function (data) {
                     var obj = JSON.parse(data.d);
                     $("#itemstable").DataTable({
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
                                     return '<button type="button" class="btn btn-primary" id="updateItem" onclick="editItem(' + data + ')">Edit</button>&nbsp<button type = "button" class="btn btn-primary" id = "removeItem" onclick = "deleteItem(' + data + ')"> Delete</button>';
                                 }
                             }
                         ]
                     });
                 }
             });
         }
 </script>
</html>
