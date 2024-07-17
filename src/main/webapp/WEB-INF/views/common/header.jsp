<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->
        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand"><h1 class="text-primary display-6">MilkHaven</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="/" class="nav-item nav-link">Home</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Product</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="/product-list" class="dropdown-item">View product</a>
                                    <a href="/manage-product" class="dropdown-item">Manage product</a>
                                </div>
                            </div>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Account</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="/manage-account" class="dropdown-item">Manage Account</a>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                            <a href="/cart?username=${sessionScope.USER.username}" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${fn:length(sessionScope.CART)}</span>
                            </a>
                            <div class="nav-item dropdown">
                                <a href="#" class="my-auto nav-link dropdown-toggle active">
                                    <i class="fas fa-user fa-2x"></i>
                                </a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="/manage-profile" class="dropdown-item">Manage Profile</a>
                                    <a href="/manage-order" class="dropdown-item">Manage Order</a>
                                    <a href="/logout" class="dropdown-item">Logout</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <script>
    $(document).ready(function() {
        // Check for cart total items in localStorage
        var cartTotalItems = localStorage.getItem('cartTotalItems');
        if (cartTotalItems) {
            updateHeaderCartTotalItems(cartTotalItems);
        }

        // Listen for the custom event to update the header cart total items
        window.addEventListener('cartTotalItemsUpdated', function(event) {
            updateHeaderCartTotalItems(event.detail);
        });
    });

    // Function to update the header cart total items
    function updateHeaderCartTotalItems(totalItems) {
        const cartItemCount = document.querySelector('.fa-shopping-bag').nextElementSibling;
        if (cartItemCount) {
            cartItemCount.textContent = totalItems;
        }
    }
    </script>

    </body>

</html>