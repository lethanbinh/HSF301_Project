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
<jsp:include page="./common/header.jsp"></jsp:include>

<!-- Account Management Start -->
<div class="container-fluid py-5" style="min-height: 80vh">
    <div class="container py-5">
        <h4 class="text-primary mb-4">Manage Accounts</h4>
        <c:if test="${empty sessionScope.USER}">
            <c:redirect url="login"/>
        </c:if>
        <c:if test="${not empty sessionScope.USER && sessionScope.USER.role eq 'USER'}">
            <h1 class="alert-warning">Your role is not allow</h1>
        </c:if>

       <c:if test="${not empty sessionScope.USER && sessionScope.USER.role eq 'ADMIN'}">
           <!-- Search Bar Start -->
           <div class="mb-4">
               <input type="text" id="searchInput" class="form-control" placeholder="Search accounts by name, email or phone..." onkeyup="filterAccounts()">
           </div>
           <!-- Search Bar End -->

           <!-- Add Account Button Start -->
           <div class="mb-4">
               <button class="btn btn-primary" onclick="showAddAccountModal()">Add Account</button>
           </div>

           <!-- Accounts Table Start -->
           <div class="table-responsive">
               <table class="table table-bordered" id="accountsTable">
                   <thead>
                   <tr>
                       <th>Profile Image</th>
                       <th>UserName</th>
                       <th>Email</th>
                       <th>Phone</th>
                       <th>Address</th>
                       <th>Status</th>
                       <th>Actions</th>
                   </tr>
                   </thead>
                   <tbody>
                   <!-- Sample Account Row Start -->
                   <c:if test="${not empty ACCOUNT_LIST}">
                       <c:forEach var="account" items="${ACCOUNT_LIST}">
                           <tr>
                               <td><img src="${account.avatar}" alt="Profile Image" class="img-fluid rounded-circle" style="width: 50px; height: 50px;"></td>
                               <td>${account.username}</td>
                               <td>${account.email}</td>
                               <td>${account.phone}</td>
                               <td>${account.address}</td>
                               <td>${account.status ? 'Active' : 'Inactive'}</td>
                               <td>
                                   <button class="btn btn-sm btn-warning" onclick="showEditAccountModal(this, ${account.id})">Edit</button>
                               </td>
                           </tr>
                       </c:forEach>
                   </c:if>
                   <!-- Sample Account Row End -->
                   </tbody>
               </table>
           </div>
           <!-- Accounts Table End -->
        </c:if>
    </div>
</div>
<!-- Account Management End -->

<!-- Add/Edit Account Modal Start -->
<div class="modal fade" id="accountModal" tabindex="-1" aria-labelledby="accountModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="accountModalLabel">Add/Edit Account</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="accountForm">
                <div class="modal-body">
                    <input type="hidden" id="accountId" name="id" value="">
                    <div class="mb-3">
                        <label for="accountName" class="form-label">User Name</label>
                        <input type="text" class="form-control" id="accountName" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="accountEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="accountEmail" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="accountPhone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="accountPhone" name="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="accountAddress" class="form-label">Address</label>
                        <input type="text" class="form-control" id="accountAddress" name="address" required>
                    </div>
                    <div class="mb-3">
                        <label for="accountProfileImage" class="form-label">Profile Image URL</label>
                        <input type="text" class="form-control" id="accountProfileImage" name="avatar" required>
                    </div>
                    <div class="mb-3">
                        <label for="accountStatus" class="form-label">Status</label>
                        <select class="form-control" id="accountStatus" name="status" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <div class="mb-3" id="passwordField">
                        <label for="accountPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="accountPassword" name="password" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" onclick="saveAccount()">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Add/Edit Account Modal End -->
<script>
    function showAddAccountModal() {
        document.getElementById("accountForm").reset();
        document.getElementById("accountModalLabel").textContent = "Add Account";
        document.getElementById("passwordField").style.display = 'block';
        document.getElementById("accountPassword").removeAttribute('disabled');
        selectedRow = null;
        const accountModal = new bootstrap.Modal(document.getElementById("accountModal"));
        accountModal.show();
    }

    function showEditAccountModal(button, accountId) {
        selectedRow = button.parentElement.parentElement;
        document.getElementById("accountId").value = accountId;
        document.getElementById("accountName").value = selectedRow.cells[1].innerText;
        document.getElementById("accountEmail").value = selectedRow.cells[2].innerText;
        document.getElementById("accountPhone").value = selectedRow.cells[3].innerText;
        document.getElementById("accountAddress").value = selectedRow.cells[4].innerText;
        document.getElementById("accountProfileImage").value = selectedRow.cells[0].children[0].src;
        var status = selectedRow.cells[5].innerText.trim();
        document.getElementById("accountStatus").value = status === 'Active' ? 'Active' : 'Inactive';
        document.getElementById("accountModalLabel").textContent = "Edit Account";
        document.getElementById("passwordField").style.display = 'none';
        const accountModal = new bootstrap.Modal(document.getElementById("accountModal"));
        accountModal.show();
    }


    function filterAccounts() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("accountsTable");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            tr[i].style.display = "none";
            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    }
                }
            }
        }
    }

    function saveAccount() {
        var data = {
            id: document.getElementById('accountId').value,
            status: document.getElementById('accountStatus').value,
            address: document.getElementById('accountAddress').value,
            avatar: document.getElementById('accountProfileImage').value,
            email: document.getElementById('accountEmail').value,
            password: document.getElementById('accountPassword').value,
            phone: document.getElementById('accountPhone').value,
            role: 'USER',
            userName: document.getElementById('accountName').value
        };

        console.log('Data to be sent:', data);

        $.ajax({
            type: 'POST',
            url: '/manage-account',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function(response) {
                console.log('Account saved successfully:', response);
                $('#accountModal').modal('hide');
                window.location.reload();
            },
            error: function(error) {
                console.error('Error saving account:', error);
            }
        });
    }
</script>

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
</body>

</html>
