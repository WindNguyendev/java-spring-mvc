<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Dashboard - SB Admin</title>

                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <!-- header -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- endHeader -->
                    <div id="layoutSidenav">
                        <!-- sidebar -->

                        <jsp:include page="../layout/sidebar.jsp" />

                        <!-- endsidebar -->
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manager Product</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Product</li>
                                    </ol>

                                    <div>
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Table Product</h3>
                                                    <a href="/admin/product/create" class="btn btn-primary">Create a
                                                        product</a>
                                                </div>
                                                <br>
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Factory</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${products}" var="product">
                                                            <tr>
                                                                <th scope="row">${product.id}</th>
                                                                <td>${product.name}</td>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" /> đ
                                                                </td>
                                                                <td>${product.factory}</td>
                                                                <td>
                                                                    <div>
                                                                        <a href="/admin/product/${product.id}"
                                                                            class="btn btn-success">View</a>
                                                                        <a href="/admin/product/update/${product.id}"
                                                                            class="btn btn-warning">Update</a>
                                                                        <a href="/admin/product/delete/${product.id}"
                                                                            class="btn btn-danger">Delete</a>

                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>



                                                    </tbody>
                                                </table>
                                                <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <li class="page-item">
                                                            <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                                href="/admin/product?page=${currentPage - 1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                                        <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                            <li class="page-item"><a
                                                                    class="${(loop.index + 1 ) eq currentPage ? 'active page-link': 'page-link'}"
                                                                    href="/admin/product?page=${loop.index + 1}">${loop.index
                                                                    + 1}</a>
                                                            </li>
                                                        </c:forEach>




                                                        <li class="page-item">
                                                            <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                                href="/admin/product?page=${currentPage + 1}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </main>
                            <!-- footer -->
                            <jsp:include page="../layout/footer.jsp" />
                            <!-- endFooter -->
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>