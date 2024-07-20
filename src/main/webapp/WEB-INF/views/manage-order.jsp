<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <title>MilkHeaven - Milk for mothers and babies</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="./common/header.jsp"></jsp:include>

<!-- Order Management Start -->
<div class="container-fluid py-5" style="min-height: 80vh">
    <div class="container py-5">
        <h4 class="text-primary mb-4">Manage Orders</h4>

        <!-- Search Bar Start -->
        <%--            <div class="mb-4">--%>
        <%--                <input type="text" id="searchInput" class="form-control" placeholder="Search orders by customer name..." onkeyup="filterOrders()">--%>
        <%--            </div>--%>
        <!-- Search Bar End -->
        <c:if test="${empty sessionScope.USER}">
            <c:redirect url="login"/>
        </c:if>
        <!-- Orders Table Start -->
        <div class="table-responsive">
            <table class="table table-bordered" id="ordersTable">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- Order rows will be dynamically added here -->
                <c:forEach var="item" items="${listUserOrder}">
                    <tr>
                        <th scope="row">${item.orderId}</th>
                        <td>${item.name}</td>
                        <td>${item.orderDate}</td>
                        <td>${item.totalAmount}</td>
                        <td>${item.status}</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-primary view-details-btn"
                                    data-order-id="${item.orderId}"
                                    data-name="${item.name}"
                                    data-order-date="${item.orderDate}"
                                    data-total-amount="${item.totalAmount}"
                                    data-status="${item.status}"
                                    data-items="${item.listItemDetail}"
                                    data-toggle="modal" data-target="#orderDetailsModal">View Details</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- Orders Table End -->
    </div>
</div>
<!-- Order Management End -->

<!-- Order Details Modal Start -->
<div class="modal fade" id="orderDetailsModal" tabindex="-1" aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderDetailsModalLabel">Order Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="orderItemsContainer">
                    <p><strong>Order ID:</strong> <span id="modalOrderId"></span></p>
                    <p><strong>Name:</strong> <span id="modalName"></span></p>
                    <p><strong>Order Date:</strong> <span id="modalOrderDate"></span></p>
                    <p><strong>Total Amount:</strong> <span id="modalTotalAmount"></span></p>
                    <p><strong>Status:</strong> <span id="modalStatus"></span></p>
                    <div id="modalItemsList"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Order Details Modal End -->

<jsp:include page="./common/footer.jsp"></jsp:include>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<script type="text/javascript">

    $('.view-details-btn').on('click', function() {
        var orderId = $(this).data('order-id');
        var name = $(this).data('name');
        var orderDate = $(this).data('order-date');
        var totalAmount = $(this).data('total-amount');
        var status = $(this).data('status');
        var itemsJson = $(this).data('items');
        console.log(orderId);
        console.log(name);
        console.log(orderDate);
        console.log(totalAmount);
        console.log(status);
        console.log(itemsJson);
        if (!itemsJson) {
            console.error('Items data is not available.');
            return;
        }

        // Parse the JSON string into an array
        console.log(itemsJson.substring(0, itemsJson.length - 1)+",]")
        itemsJson = itemsJson.substring(0, itemsJson.length - 1)+", ]"

        var items;
        try {
            // items = JSON.parse(itemsJson);
            // Remove the surrounding square brackets
            const cleanedString = itemsJson.slice(1, -1);
            console.log(cleanedString)

// Split based on 'ItemDetailResponseDTO(' and trim each resulting string

            items = cleanedString.split(/ItemDetailResponseDTO\(/).filter(Boolean).map(item => {
                return item.substring(0, item.length - 3);
            });
            // Map itemStrings to objects
            items = items.map(itemString => {
                const parts = itemString.split(', ');
                const item = {};
                parts.forEach(part => {
                    const [key, value] = part.split('=');
                    item[key] = value;
                });
                return item;
            });
            console.log(items)


        } catch (e) {
            console.error('Error parsing items JSON:', e);
            return;
        }

        // Populate the modal fields
        $('#modalOrderId').text(orderId);
        $('#modalName').text(name);
        $('#modalOrderDate').text(orderDate);
        $('#modalTotalAmount').text(totalAmount);
        $('#modalStatus').text(status);

        // Generate and populate the items list
        var itemsListHtml = '<p><strong>Items:</strong></p>';
        itemsListHtml += '<ul>';
        items.forEach(function(item) {
            itemsListHtml += '<li>' + item.productName + ' - ' + item.quantity + ' x $' + item.price + '</li>';
        });
        itemsListHtml += '</ul>';

        $('#modalItemsList').html(itemsListHtml);
        const orderDetailsModal = new bootstrap.Modal(document.getElementById("orderDetailsModal"));
        orderDetailsModal.show();
    });

    // let ordersData = [
    //     {
    //         orderId: 1,
    //         customerName: "John Doe",
    //         orderDate: "2024-06-30",
    //         totalAmount: 456.00,
    //         status: "Pending",
    //         items: [
    //             { productName: "Product 1", quantity: 2, price: 123.00 },
    //             { productName: "Product 2", quantity: 1, price: 210.00 }
    //         ]
    //     },
    //     {
    //         orderId: 2,
    //         customerName: "Jane Smith",
    //         orderDate: "2024-06-29",
    //         totalAmount: 300.00,
    //         status: "Shipped",
    //         items: [
    //             { productName: "Product 3", quantity: 3, price: 100.00 }
    //         ]
    //     },
    //     // Add more sample orders as needed
    // ];

    // function filterOrders() {
    //     const input = document.getElementById("searchInput");
    //     const filter = input.value.toUpperCase();
    //     const table = document.getElementById("ordersTable");
    //     const tr = table.getElementsByTagName("tr");
    //
    //     for (let i = 1; i < tr.length; i++) {
    //         tr[i].style.display = "none";
    //         const td = tr[i].getElementsByTagName("td");
    //         if (td[1]) {
    //             const txtValue = td[1].textContent || td[1].innerText;
    //             if (txtValue.toUpperCase().indexOf(filter) > -1) {
    //                 tr[i].style.display = "";
    //             }
    //         }
    //     }
    // }
    //
    // function showOrderDetails(button) {
    //     const selectedRow = button.parentElement.parentElement;
    //     const orderId = selectedRow.cells[0].innerText;
    //     const order = ordersData.find(o => o.orderId == orderId);
    //     const orderItemsContainer = document.getElementById("orderItemsContainer");
    //     orderItemsContainer.innerHTML = '';
    //
    //     const orderIdElement = document.createElement('p');
    //     orderIdElement.innerHTML = '<strong>Order ID:</strong> ' + order.orderId;
    //     orderItemsContainer.appendChild(orderIdElement);
    //
    //     const customerNameElement = document.createElement('p');
    //     customerNameElement.innerHTML = '<strong>Customer Name:</strong> ' + order.customerName;
    //     orderItemsContainer.appendChild(customerNameElement);
    //
    //     const orderDateElement = document.createElement('p');
    //     orderDateElement.innerHTML = '<strong>Order Date:</strong> ' + order.orderDate;
    //     orderItemsContainer.appendChild(orderDateElement);
    //
    //     const totalAmountElement = document.createElement('p');
    //     totalAmountElement.innerHTML = '<strong>Total Amount:</strong> $' + order.totalAmount.toFixed(2);
    //     orderItemsContainer.appendChild(totalAmountElement);
    //
    //     const statusElement = document.createElement('p');
    //     statusElement.innerHTML = '<strong>Status:</strong> ' + order.status;
    //     orderItemsContainer.appendChild(statusElement);
    //
    //     const itemsHeader = document.createElement('h5');
    //     itemsHeader.textContent = 'Items';
    //     orderItemsContainer.appendChild(itemsHeader);
    //
    //     const itemsList = document.createElement('ul');
    //     order.items.forEach(function(item) {
    //         const itemElement = document.createElement('li');
    //         itemElement.textContent = item.productName + ' - ' + item.quantity + ' x $' + item.price;
    //         itemsList.appendChild(itemElement);
    //     });
    //     orderItemsContainer.appendChild(itemsList);
    //
    //     const orderDetailsModal = new bootstrap.Modal(document.getElementById("orderDetailsModal"));
    //     orderDetailsModal.show();
    // }
    //
    // // Function to dynamically load the orders data into the table
    // function loadOrders() {
    //     const table = document.getElementById("ordersTable").getElementsByTagName('tbody')[0];
    //     ordersData.forEach(function(order) {
    //         const newRow = table.insertRow();
    //
    //         const orderIdCell = newRow.insertCell(0);
    //         orderIdCell.textContent = order.orderId;
    //
    //         const customerNameCell = newRow.insertCell(1);
    //         customerNameCell.textContent = order.customerName;
    //
    //         const orderDateCell = newRow.insertCell(2);
    //         orderDateCell.textContent = order.orderDate;
    //
    //         const totalAmountCell = newRow.insertCell(3);
    //         totalAmountCell.textContent = '$' + order.totalAmount.toFixed(2);
    //
    //         const statusCell = newRow.insertCell(4);
    //         statusCell.textContent = order.status;
    //
    //         const actionsCell = newRow.insertCell(5);
    //         const viewButton = document.createElement('button');
    //         viewButton.textContent = 'View Details';
    //         viewButton.className = 'btn btn-sm btn-primary';
    //         viewButton.onclick = function() { showOrderDetails(this); };
    //         actionsCell.appendChild(viewButton);
    //     });
    // }

    // Load orders data when the page loads
    // document.addEventListener("DOMContentLoaded", loadOrders);
</script>

</body>

</html>
