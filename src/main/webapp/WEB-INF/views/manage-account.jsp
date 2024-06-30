<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
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

            <!-- Search Bar Start -->
            <div class="mb-4">
                <input type="text" id="searchInput" class="form-control" placeholder="Search accounts by name, email or phone..." onkeyup="filterAccounts()">
            </div>
            <!-- Search Bar End -->

            <!-- Accounts Table Start -->
            <div class="table-responsive">
                <table class="table table-bordered" id="accountsTable">
                    <thead>
                        <tr>
                            <th>Profile Image</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample Account Row Start -->
                        <tr>
                            <td><img src="img/profile.jpg" alt="Profile Image" class="img-fluid rounded-circle" style="width: 50px; height: 50px;"></td>
                            <td>John Doe</td>
                            <td>Email@Example.com</td>
                            <td>+0123 456 7890</td>
                            <td>123 Street, New York, USA</td>
                        </tr>
                        <!-- Sample Account Row End -->

                        <!-- Add more account rows as needed -->
                    </tbody>
                </table>
            </div>
            <!-- Accounts Table End -->
        </div>
    </div>
    <!-- Account Management End -->

    <script>
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