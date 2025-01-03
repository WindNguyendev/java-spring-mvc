<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Product Detail ${user.id}</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- <link rel="stylesheet" href="../css/demo.css"> -->

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            </head>

            <body>

                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>User Detail by id: ${product.id}</h3>

                                <br>


                            </div>
                            <div class="card" style="width: 60%;">
                                <img class="card-img-top" src="/images/product/${product.image}" alt="Card image cap">
                                <div class="card-header">
                                    Product information
                                </div>


                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">ID: ${id}</li>
                                    <li class="list-group-item">Name: ${product.name}</li>
                                    <li class="list-group-item">Price: ${product.price}</li>
                                    <li class="list-group-item">Detail Desc: ${product.detailDesc}</li>
                                    <li class="list-group-item">Short Desc: ${product.shortDesc}</li>
                                    <li class="list-group-item">Quantity: ${product.quantity}</li>
                                    <li class="list-group-item">Sold: ${product.sold}</li>
                                    <li class="list-group-item">Factory: ${product.factory}</li>
                                    <li class="list-group-item">Target: ${product.target}</li>

                                </ul>

                            </div>
                            <br>
                            <a href="/admin/product" class="btn btn-success">Back</a>

                        </div>
                    </div>


            </body>

            </html>