<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

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

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Shop</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Shop</li>
    </ol>
</div>
<!-- Single Page Header End -->

<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <c:if test="${empty sessionScope.USER}">
            <c:redirect url="login"/>
        </c:if>
        <h1 class="mb-4">Milk for mother and babies</h1>
        <div class="row g-4">
            <div class="col-xl-3">
                <form:form method="GET" action="/product-list" id="form-search" modelAttribute="productSearch">
                    <div class="input-group w-100 mx-auto d-flex">
                        <form:input type="search" path="name" class="form-control p-3" placeholder="Search name..." aria-describedby="search-icon-1" id="searchInput" />
                        <button type="submit" class="input-group-text p-3"><i class="fa fa-search"></i></button>
                    </div>
                    <div class="row g-4 mt-3">
                        <div class="col-lg-12">
                            <h4>Categories</h4>
                            <ul class="list-unstyled fruite-categorie">
                                <c:if test="${not empty CATEGORY_LIST}">
                                    <c:forEach var="category" items="${CATEGORY_LIST}" varStatus="loop">
                                        <li>
                                            <div class="d-flex">
                                                <form:checkbox path="categoryList" id="productCategory${loop.index}" value="${category}" />
                                                <label style="color: #81c408" for="productCategory${loop.index}" class="ms-3 justify-content-between fruite-name">${category}</label>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                        <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                            <label for="fruits">Default Sorting:</label>
                            <form:select path="sort" id="fruits" class="border-0 form-select-sm bg-light me-3">
                                <form:option value="Nothing">Nothing</form:option>
                                <form:option value="Popularity">Popularity</form:option>
                            </form:select>
                        </div>
                        <div class="col-lg-12">
                            <h4 class="mb-2">Price to</h4>
                            <form:input type="range" path="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="100" value="${param.range}" oninput="amount.value=rangeInput.value" />
                            <output id="amount" name="amount" min-value="0" max-value="100" for="rangeInput">${param.range}</output>
                        </div>

                    </div>

                </form:form>
            </div>
            <div class="col-xl-9">
                <div class="row g-4 justify-content-center">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <c:forEach var="product" items="${PRODUCT_LIST}">
                                <div class="col-md-6 col-lg-6 col-xl-4">
                                    <a href="/product-detail?id=${product.id}">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src="${product.imageUrl}" class="img-fluid w-100 rounded-top" alt="">
                                            </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${product.category}</div>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>${product.name}</h4>
                                                <p>${product.description}</p>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <p class="text-dark fs-5 fw-bold mb-0">$<fmt:formatNumber value="${product.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/></p>
                                                    <form method="POST" action="/cart/add-item">
                                                        <input type="hidden" name="productId" value="${product.id}">
                                                        <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                        <button type="submit" class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fruits Shop End-->

<jsp:include page="./common/footer.jsp"></jsp:include>

<!-- Modal HTML -->
<div class="modal fade" id="addToCartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Product Added to Cart</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                The product has been successfully added to your cart.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


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

    // Handle add item to cart
    $(document).on('click', '.add-to-cart-btn', function(event) {
        event.preventDefault();
        var form = $(this).closest('form');
        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function(response) {
                $('#cart').html(response);
                $('#addToCartModal').modal('show');
                updateCartTotalItems();
            },
            error: function(response) {
                alert("An error occurred while adding product to cart.");
            }
        });
    });

    // Function to update total cart items
    function updateCartTotalItems() {
        var username = "${sessionScope.USER.username}";
        $.ajax({
            type: 'GET',
            url: '/cart/total-items',
            data: { username: username },
            success: function(response) {
                localStorage.setItem('cartTotalItems', response);
                window.dispatchEvent(new CustomEvent('cartTotalItemsUpdated', { detail: response }));
            },
            error: function(response) {
                console.error("An error occurred while updating total cart items.");
            }
        });
    }

</script>
</body>

</html>