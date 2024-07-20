<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
          rel="stylesheet">

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
<jsp:include page="./common/header.jsp"/>

<!-- Product Management Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <h4 class="text-primary mb-4">Manage Products</h4>
        <c:if test="${empty sessionScope.USER}">
            <c:redirect url="login"/>
        </c:if>
        <c:if test="${not empty sessionScope.USER && sessionScope.USER.role eq 'USER'}">
            <h1 class="alert-warning">Your role is not allow</h1>
        </c:if>
        <c:if test="${not empty sessionScope.USER && sessionScope.USER.role eq 'ADMIN'}">
            <!-- Search Bar Start -->
            <div class="mb-4">
                <input type="text" id="searchInput" class="form-control" placeholder="Search products by name..."
                       onkeyup="filterProducts()">
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
                        <th>ID</th>
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
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td><c:out value="${product.id}"/></td>
                            <td>
                                <c:if test="${not empty product.imageUrl}">
                                    <img src="${product.imageUrl}" alt="Product Image" style="width: 50px; height: auto;">
                                </c:if>
                            </td>
                            <td><c:out value="${product.name}"/></td>
                            <td><c:out value="${product.price}"/></td>
                            <td><c:out value="${product.category}"/></td>
                            <td><c:out value="${product.stock}"/></td>
                            <td><c:out value="${product.description}"/></td>
                            <td>
                                <form method="post">
                                    <button type="button" class="btn btn-sm btn-warning"
                                            onclick="showEditProductModal(this)">Edit
                                    </button>
                                </form>
                                <form id="deleteProductForm" action="" method="post">
                                    <button type="button" class="btn btn-sm btn-danger"
                                            onclick="showDeleteModal(${product.id})">Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- Products Table End -->
        </c:if>
    </div>
</div>
<!-- Product Management End -->

<!-- Add Product Modal Start -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="productModalLabel">Add Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="productForm">
                    <input type="hidden" id="productId" name="productId">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <input type="text" class="form-control" id="productDescription" name="productDescription"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPrice" name="productPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <select class="form-select" id="productCategory" name="productCategory">
                            <option value="" disabled selected>-- Select Category --</option>
                            <option value="Infant Formula">Infant Formula</option>
                            <option value="Baby Milk">Baby Milk</option>
                            <option value="Breast Milk Substitutes">Breast Milk Substitutes</option>
                            <option value="Specialty Baby Formulas">Specialty Baby Formulas</option>
                            <option value="Maternal Milk">Maternal Milk</option>
                            <option value="Milk-Based Drinks for Kids">Milk-Based Drinks for Kids</option>
                            <option value="Nutritional Supplements">Nutritional Supplements</option>
                            <option value="Dairy-Free Alternatives">Dairy-Free Alternatives</option>
                        </select>

                    </div>
                    <div class="mb-3">
                        <label for="productStock" class="form-label">Stock</label>
                        <input type="number" class="form-control" id="productStock" name="productStock" required>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Image URL</label>
                        <input type="url" class="form-control" id="productImage" name="productImage" required>
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
<!-- Add Product Modal End -->

<!-- Modal Edit Product -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editProductForm" method="post" action="/edit">
                    <input type="hidden" id="editProductId" name="editProductId"> <!-- Changed to editProductId -->
                    <div class="mb-3">
                        <label for="editProductName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="editProductName" name="editProductName" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductDescription" class="form-label">Description</label>
                        <input type="text" class="form-control" id="editProductDescription" name="editProductDescription" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="editProductPrice" name="editProductPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductCategory" class="form-label">Category</label>
                        <select class="form-select" id="editProductCategory" name="editProductCategory" required>
                            <option value="" disabled selected>-- Select Category --</option>
                            <option value="Infant Formula">Infant Formula</option>
                            <option value="Baby Milk">Baby Milk</option>
                            <option value="Breast Milk Substitutes">Breast Milk Substitutes</option>
                            <option value="Specialty Baby Formulas">Specialty Baby Formulas</option>
                            <option value="Maternal Milk">Maternal Milk</option>
                            <option value="Milk-Based Drinks for Kids">Milk-Based Drinks for Kids</option>
                            <option value="Nutritional Supplements">Nutritional Supplements</option>
                            <option value="Dairy-Free Alternatives">Dairy-Free Alternatives</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="editProductStock" class="form-label">Stock</label>
                        <input type="number" class="form-control" id="editProductStock" name="editProductStock" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductImage" class="form-label">Image URL</label>
                        <input type="url" class="form-control" id="editProductImage" name="editProductImage" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="document.getElementById('editProductForm').submit()">Update Product</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Edit Product End -->

<!-- Delete Product Modal Start -->
<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteProductModalLabel">Delete Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this product?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
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

    function showEditProductModal(button) {
        let selectedRow = button.closest('tr');

        const id = selectedRow.cells[0].innerText.trim();
        const name = selectedRow.cells[2].innerText.trim();
        const description = selectedRow.cells[6].innerText.trim();
        const price = selectedRow.cells[3].innerText.trim();
        const category = selectedRow.cells[4].innerText.trim();
        const stock = selectedRow.cells[5].innerText.trim();

        const imageCell = selectedRow.cells[1].querySelector('img');
        const imageUrl = imageCell ? imageCell.src : '';

        // Set values to form fields
        document.getElementById("editProductId").value = id;
        document.getElementById("editProductName").value = name;
        document.getElementById("editProductDescription").value = description;
        document.getElementById("editProductPrice").value = price;
        document.getElementById("editProductCategory").value = category;
        document.getElementById("editProductStock").value = stock;
        document.getElementById("editProductImage").value = imageUrl;

        // Show the modal
        const productModal = new bootstrap.Modal(document.getElementById("editProductModal"));
        productModal.show();
    }




    function updateProduct() {
        document.getElementById("productForm").submit(); // Submit the form
    }

    function saveProduct() {
        const name = document.getElementById("productName").value;
        const price = document.getElementById("productPrice").value;
        const category = document.getElementById("productCategory").value;
        const imageUrl = document.getElementById("productImage").value;
        const description = document.getElementById("productDescription").value;
        const stock = document.getElementById("productStock").value;

        const xhr = new XMLHttpRequest();
        let url = "/add";
        let method = "POST";


        xhr.open(method, url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onload = function () {
            if (xhr.status === 200) {
                location.reload();
            } else {
                alert("Error saving product.");
            }
        };

        xhr.send("name=" + encodeURIComponent(name) + "&price=" + encodeURIComponent(price) +
            "&category=" + encodeURIComponent(category) + "&imageFileName=" + encodeURIComponent(imageUrl) +
            "&description=" + encodeURIComponent(description) + "&stock=" + encodeURIComponent(stock));
    }


    function showDeleteModal(productId) {
        const deleteForm = document.getElementById('deleteProductForm');
        deleteForm.action = '/delete/' + productId;
        const deleteModal = new bootstrap.Modal(document.getElementById('deleteProductModal'));
        deleteModal.show();
    }

    document.getElementById('confirmDeleteButton').addEventListener('click', function () {
        document.getElementById('deleteProductForm').submit();
    });


</script>

<jsp:include page="./common/footer.jsp"/>

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
