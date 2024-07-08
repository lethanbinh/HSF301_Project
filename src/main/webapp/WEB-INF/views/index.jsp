<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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

    <!-- Hero Start -->
    <div class="container-fluid py-5 mb-5 hero-header">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <div class="col-md-12 col-lg-7">
                    <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                    <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
                    <div class="position-relative mx-auto">
                        <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                        <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>
                    </div>
                </div>
                <div class="col-md-12 col-lg-5">
                    <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active rounded">
                                <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                            </div>
                            <div class="carousel-item rounded">
                                <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->


    <!-- Featurs Section Start -->
    <div class="container-fluid featurs py-5">
        <div class="container py-5">
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="featurs-item text-center rounded bg-light p-4">
                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                            <i class="fas fa-car-side fa-3x text-white"></i>
                        </div>
                        <div class="featurs-content text-center">
                            <h5>Free Shipping</h5>
                            <p class="mb-0">Free on order over $300</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="featurs-item text-center rounded bg-light p-4">
                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                            <i class="fas fa-user-shield fa-3x text-white"></i>
                        </div>
                        <div class="featurs-content text-center">
                            <h5>Security Payment</h5>
                            <p class="mb-0">100% security payment</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="featurs-item text-center rounded bg-light p-4">
                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                            <i class="fas fa-exchange-alt fa-3x text-white"></i>
                        </div>
                        <div class="featurs-content text-center">
                            <h5>30 Day Return</h5>
                            <p class="mb-0">30 day money guarantee</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="featurs-item text-center rounded bg-light p-4">
                        <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                            <i class="fa fa-phone-alt fa-3x text-white"></i>
                        </div>
                        <div class="featurs-content text-center">
                            <h5>24/7 Support</h5>
                            <p class="mb-0">Support every time fast</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Featurs Section End -->

    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5">
        <div class="container py-5">
            <div class="tab-class text-center">
                <div class="row g-4">
                    <div class="col-lg-12 text-start">
                        <h1>Our Organic Products</h1>
                    </div>
                    <div class="col-lg-12 text-end">
                        <ul class="nav nav-pills d-inline-flex text-center mb-5">
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">All Products</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Infant Formula</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Baby Milk</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Breast Milk Substitutes</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Specialty Baby Formulas</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-6">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Maternal Milk</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-7">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Milk-Based Drinks for Kids</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-8">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Nutritional Supplements</span>
                                </a>
                            </li>
                            <li class="nav-item" style="width: 25%">
                                <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-9">
                                    <span class="text-dark" style="display: inline-block; width: 100%; text-align: center">Dairy-Free Alternatives</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content">
                    <!-- All Products Tab -->
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
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
                                                            <form action="/cart/add-item" method="POST">
                                                            <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                            <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
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

                    <!-- Infant Formula Tab -->
                    <div id="tab-2" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Infant Formula'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Baby Milk Tab -->
                    <div id="tab-3" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Baby Milk'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Breast Milk Substitutes Tab -->
                    <div id="tab-4" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Breast Milk Substitutes'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Specialty Baby Formulas Tab -->
                    <div id="tab-5" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Specialty Baby Formulas'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Maternal Milk Tab -->
                    <div id="tab-6" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Maternal Milk'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Milk-Based Drinks for Kids Tab -->
                    <div id="tab-7" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Milk-Based Drinks for Kids'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Nutritional Supplements Tab -->
                    <div id="tab-8" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Nutritional Supplements'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Dairy-Free Alternatives Tab -->
                    <div id="tab-9" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach var="product" items="${PRODUCT_LIST}">
                                        <c:if test="${product.category == 'Dairy-Free Alternatives'}">
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
                                                                <form action="/cart/add-item" method="POST">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <input type="hidden" name="username" value="${sessionScope.USER.username}">
                                                                <button class="add-to-cart-btn btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
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

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    </body>

</html>
