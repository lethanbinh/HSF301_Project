<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MilkHaven - Milk for mothers and babies</title>
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
    <c:if test="${not empty SUCCESS_MESSAGE}">
        <div class="alert alert-success">
            ${SUCCESS_MESSAGE}
        </div>
    </c:if>
    <c:if test="${not empty ERROR_MESSAGE}">
        <div class="alert alert-danger">
            ${ERROR_MESSAGE}
        </div>
    </c:if>

    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Cart</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item active text-white">Cart</li>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <!-- Cart Page Start -->
    <div class="container-fluid py-5">
        <c:if test="${sessionScope.CART != null && not empty sessionScope.CART}">
            <div class="container py-5">
                <div class="table-responsive">
                    <div id="cart">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Products</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cartItem" items="${sessionScope.CART}">
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img src="${cartItem.imageUrl}" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                            </div>
                                        </th>
                                        <td>
                                            <p class="mb-0 mt-4">${cartItem.productName}</p>
                                        </td>
                                        <td class="item-price">
                                            <p class="mb-0 mt-4"><fmt:formatNumber value="${cartItem.itemPrice}" type="number" minFractionDigits="2" maxFractionDigits="2"/> $</p>
                                        </td>
                                        <td>
                                            <div class="input-group quantity mt-4" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <form class="update-quantity-form" method="post" action="/cart/update-item">
                                                        <input type="hidden" name="cartItem" value="${cartItem.id}">
                                                        <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                        <input type="hidden" name="quantity" value="${cartItem.quantity - 1}">
                                                        <button type="button" class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                                <input min="1" type="text" class="form-control form-control-sm text-center border-0" value="${cartItem.quantity}">
                                                <div class="input-group-btn">
                                                    <form class="update-quantity-form" method="post" action="/cart/update-item">
                                                        <input type="hidden" name="cartItem" value="${cartItem.id}">
                                                        <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                        <input type="hidden" name="quantity" value="${cartItem.quantity + 1}">
                                                        <button type="button" class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                            <i class="fa fa-plus"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="item-total">
                                            <p class="mb-0 mt-4 item-total-text"><fmt:formatNumber value="${cartItem.quantity * cartItem.itemPrice}" type="number" minFractionDigits="2" maxFractionDigits="2"/> $</p>
                                        </td>
                                        <td>
                                            <form class="delete-item-form" method="post" action="/cart/delete-item">
                                                <input type="hidden" name="cartItem" value="${cartItem.id}">
                                                <button type="button" class="btn btn-md rounded-circle bg-light border mt-4 delete-item-btn">
                                                    <i class="fa fa-times text-danger"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
                <div class="row g-4 justify-content-end">
                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                        <div class="bg-light rounded">
                            <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                <h5 class="mb-0 ps-4 me-4">Total</h5>
                                <p id="cart-total" class="mb-0 pe-4">$<fmt:formatNumber value="${sessionScope.CART_TOTAL}" type="number" minFractionDigits="2" maxFractionDigits="2"/></p>
                            </div>
                            <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button">
                                <a href="/checkout?username=${sessionScope.USER.username}">Proceed Checkout</a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.CART == null || empty sessionScope.CART}">
            <div class="container py-5 text-center">
                <i class="fas fa-shopping-cart fa-3x text-muted mb-4"></i>
                <h2 class="text-muted">Your cart is empty</h2>
            </div>
        </c:if>

    </div>
    <!-- Cart Page End -->

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
    <script>
// Function to format number to two decimal places
    function formatNumber(num) {
        return num.toFixed(2);
    }

    // Function to update cart total
    function updateCartTotal() {
        var total = 0;
        $('#cart tbody tr').each(function() {
            var itemTotal = parseFloat($(this).find('.item-total-text').text().replace('$', ''));
            total += itemTotal;
        });
        $('#cart-total').text('$' + formatNumber(total));
    }

    // Handle update item quantity
    $(document).on('click', '.btn-minus, .btn-plus', function(event) {
        event.preventDefault();
        var form = $(this).closest('form');
        var quantityInput = form.closest('.input-group').find('input[type="text"]');
        var currentQuantity = parseInt(quantityInput.val());
        var newQuantity = currentQuantity + ($(this).hasClass('btn-plus') ? 1 : -1);

        // Ensure new quantity is >= 1 before updating
        if (newQuantity >= 1) {
            // Update the hidden quantity input value
            form.find('input[name="quantity"]').val(newQuantity);

            $.ajax({
                type: form.attr('method'),
                url: form.attr('action'),
                data: form.serialize(),
                success: function(response) {
                    quantityInput.val(newQuantity);
                    var itemPrice = parseFloat(form.closest('tr').find('.item-price').text().replace('$', ''));
                    form.closest('tr').find('.item-total-text').text('$' + formatNumber(itemPrice * newQuantity));
                    updateCartTotal();
                },
                error: function(response) {
                    alert("An error occurred while updating product quantity.");
                }
            });
        } else {
            alert("Quantity cannot be less than 1.");
        }
    });

    // Handle remove item from cart
    $(document).on('click', '.delete-item-btn', function(event) {
        event.preventDefault();
        var form = $(this).closest('form');
        var row = $(this).closest('tr');

        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function(response) {
                row.remove(); // Remove the item row from the table
                updateCartTotal(); // Update the cart total
            },
            error: function(response) {
                alert("An error occurred while removing product from cart.");
            }
        });
    });
    </script>
</body>

</html>
