<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<jsp:include page="./common/header.jsp" />

<!-- Product Management Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <h4 class="text-primary mb-4">Manage Products</h4>

        <!-- Search Bar Start -->
        <div class="mb-4">
            <input type="text" id="searchInput" class="form-control" placeholder="Search products by name..." onkeyup="filterProducts()">
        </div>
        <!-- Search Bar End -->

        <!-- Add Product Button Start -->
        <div class="mb-4">
            <button class="btn btn-primary" onclick="showAddProductModal()">Add Product</button>
        </div>
        <!-- Add Product Button End -->

        <!-- Products Table Start -->
        <div class="table-responsive">
            <table class="table table-bordered" id="productsTable">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Stock</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Sample Product Row Start -->
                    <c:if test="${not empty PRODUCT_LIST}">
                        <c:forEach var="product" items="${PRODUCT_LIST}">
                            <tr>
                                <td><img src="${product.imageUrl}" alt="Product Image" class="img-fluid" style="width: 50px; height: 50px;"></td>
                                <td>${product.name}</td>
                                <td>${product.price}</td>
                                <td>${product.category}</td>
                                <td>${product.stock}</td>
                                <td>${product.description}</td>
                                <td class="d-flex">
                                    <button class="btn btn-sm btn-warning" onclick="showEditProductModal(this, ${product.id})">Edit</button>
                                    <button class="btn btn-sm btn-danger" onclick="showDeleteProductModal(this,  ${product.id})">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <!-- Sample Product Row End -->

                    <!-- Add more product rows as needed -->
                </tbody>
            </table>
        </div>
        <!-- Products Table End -->
    </div>
</div>
<!-- Product Management End -->

<!-- Add/Edit Product Modal Start -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="productModalLabel">Add/Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="productForm">
                    <input type="hidden" id="productId" name="id" value="">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPrice" name="price" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <input type="text" class="form-control" id="productCategory" name="category" required>
                    </div>
                    <div class="mb-3">
                        <label for="productStock" class="form-label">Stock</label>
                        <input type="number" class="form-control" id="productStock" name="stock" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <input type="text" class="form-control" id="productDescription" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Image URL</label>
                        <input type="url" class="form-control" id="productImage" name="imageUrl" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="saveProduct()">Save changes</button>
            </div>
        </div>
    </div>
</div>
<!-- Add/Edit Product Modal End -->

<!-- Delete Product Modal Start -->
<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteProductModalLabel">Delete Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this product?
                <input type="hidden" id="productDeleteId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" onclick="deleteProduct()">Delete</button>
            </div>
        </div>
    </div>
</div>
<!-- Delete Product Modal End -->
<script>
    let selectedRow;

    function filterProducts() {
        const input = document.getElementById("searchInput");
        const filter = input.value.toUpperCase();
        const table = document.getElementById("productsTable");
        const tr = table.getElementsByTagName("tr");

        for (let i = 1; i < tr.length; i++) {
            tr[i].style.display = "none";
            const td = tr[i].getElementsByTagName("td");
            for (let j = 0; j < td.length; j++) {
                if (td[j]) {
                    const txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    }
                }
            }
        }
    }

    function showAddProductModal() {
        document.getElementById("productForm").reset();
        document.getElementById("productModalLabel").textContent = "Add Product";
        selectedRow = null;
        const productModal = new bootstrap.Modal(document.getElementById("productModal"));
        productModal.show();
    }

    function showEditProductModal(button, productId) {
        selectedRow = button.parentElement.parentElement;
        document.getElementById("productId").value = productId;
        document.getElementById("productName").value = document.getElementById("productName").value = selectedRow.cells[1].innerText;
        document.getElementById("productPrice").value = selectedRow.cells[2].innerText.replace('$', '');
        document.getElementById("productCategory").value = selectedRow.cells[3].innerText;
        document.getElementById("productStock").value = selectedRow.cells[4].innerText;
        document.getElementById("productDescription").value = selectedRow.cells[5].innerText;
        document.getElementById("productImage").value = selectedRow.cells[0].children[0].src;
        document.getElementById("productModalLabel").textContent = "Edit Product";
        const productModal = new bootstrap.Modal(document.getElementById("productModal"));
        productModal.show();
    }

    function saveProduct() {
        var data = {
            id:  document.getElementById('productId').value,
            name: document.getElementById('productName').value,
            price: document.getElementById('productPrice').value,
            category: document.getElementById('productCategory').value,
            stock: document.getElementById('productStock').value,
            description: document.getElementById('productDescription').value,
            imageUrl: document.getElementById('productImage').value
        };
        console.log(data)
        $.ajax({
            type: 'POST',
            url: '/manage-product',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function(response) {
                console.log('Product saved successfully:', response);
                $('#productModal').modal('hide');
                window.location.reload();
            },
            error: function(error) {
                console.error('Error saving product:', error);
            }
        });
    }

    function showDeleteProductModal(button, productId) {
        selectedRow = button.parentElement.parentElement;
        const deleteProductModal = new bootstrap.Modal(document.getElementById("deleteProductModal"));
        document.getElementById("productDeleteId").value = productId;
        deleteProductModal.show();
    }

    function deleteProduct() {
        const productId = document.getElementById("productDeleteId").value;
        var data ={
            'id' : productId
        }
        $.ajax({
            type: 'DELETE',
            url: '/manage-product',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function(response) {
                alert(response);
            },
            error: function(response) {
                alert(response);
            }
        });
        const deleteProductModal = bootstrap.Modal.getInstance(document.getElementById("deleteProductModal"));
        deleteProductModal.hide();
        window.location.reload();
    }
</script>

<jsp:include page="./common/footer.jsp" />

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>
