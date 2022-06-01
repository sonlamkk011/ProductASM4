<%@ page import="com.example.productasm.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.productasm.entity.Product" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
        <div>
            <a href="https://www.javaguides.net" class="navbar-brand"> Product
                Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Products</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">

    <div class="container">

        <h3 class="text-center">List of Products</h3>
        <hr>
        <div class="container text-left">

            <a href="<%=request.getContextPath()%>/create" class="btn btn-success">Add
                New Account</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Thumbnail</th>
                <th>Name</th>
                <th>Price</th>
                <th>Status</th>
                <th>Created At</th>
                <th>Updated At</th>
            </tr>
            </thead>
            <tbody>
            <%--            <%--%>
            <%
                List<Product> products = (ArrayList<Product>) request.getAttribute("productList");
                for(Product product : products) {%>
            <tr>
                <td><%= product.getId() %></td>
                <td>
                    <img width="200" src="<%= product.getThumbnail() %>" />
                </td>
                <td><%= product.getName() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getProductStatus() %></td>
                <td><%= product.getCreatedAt() %></td>
                <td><%= product.getUpdatedAt() %></td>
                <td>
                    <a class="btn btn-primary" href="/update?id=<%= product.getId() %>">Edit</a>
                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<%= product.getId() %>">Delete</button>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal<%= product.getId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure delete <%= product.getName() %>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <a href="/delete?id=<%= product.getId() %>" class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <%}%>
            </tbody>

        </table>
    </div>
</div>

</body>

</html>
