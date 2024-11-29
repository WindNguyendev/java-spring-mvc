<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

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
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a product</h3>
                                            <br>
                                            <form:form method="post" action="/admin/product/create"
                                                modelAttribute="newProduct" class="row" enctype="multipart/form-data">
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Name:</label>
                                                    <form:input type="name"
                                                        class="form-control ${not empty errorName ? 'is-invalid':'' }"
                                                        path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Price:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorPrice ? 'is-invalid':''}"
                                                        path="price" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <c:set var="errorDetailDesc">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">DetailDesc:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid':''}"
                                                        path="detailDesc" />
                                                    ${errorDetailDesc}
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorShortDesc">
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">ShortDesc:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid':''}"
                                                        path="shortDesc" />
                                                    ${errorShortDesc}
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorQuantity">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Quantity:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid':''}"
                                                        path="quantity" />
                                                    ${errorQuantity}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Slod:</label>
                                                    <form:input type="number" class="form-control" path="sold" />

                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" path="factory">

                                                        <form:option value="DELL">DELL</form:option>
                                                        <form:option value="ASU">ASU</form:option>
                                                        <form:option value="HP">HP</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Target:</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="GAMING">GAMING</form:option>
                                                        <form:option value="1">1</form:option>
                                                        <form:option value="2">2</form:option>
                                                        <form:option value="3">3</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="md-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Image</label>
                                                    <input type="file" class="form-control" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="hoidanitFile" />
                                                </div>


                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" id="avatarPreview"
                                                        alt="avatar preview">
                                                </div>

                                                <div class="col-12 mb-5"><button type="submit"
                                                        class="btn btn-primary">Create</button></div>

                                            </form:form>
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