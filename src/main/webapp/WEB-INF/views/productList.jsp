<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <title>Product Management Page</title>
    <script>
        function sortTable(columnIndex) {
            let table, rows, switching, i, x, y, shouldSwitch;
            table = document.getElementById("productTable");
            switching = true;
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[columnIndex];
                    y = rows[i + 1].getElementsByTagName("TD")[columnIndex];
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                }
            }
        }
    </script>
</head>

<body>
<jsp:include page="adminHeader.jsp" />
<div class="container">
    <a href="/admin/product/add" style="margin: 20px 0" class="btn btn-primary">Add Product</a>
    <div class="btn-toolbar" role="toolbar" aria-label="Sort Buttons">
        <div class="btn-group" role="group" aria-label="Sort by Code">
            <button type="button" class="btn btn-secondary" onclick="sortTable(0)">Sort by Code</button>
        </div>
        <div class="btn-group" role="group" aria-label="Sort by Name">
            <button type="button" class="btn btn-secondary" onclick="sortTable(1)">Sort by Name</button>
        </div>
        <div class="btn-group" role="group" aria-label="Sort by Brand">
            <button type="button" class="btn btn-secondary" onclick="sortTable(2)">Sort by Brand</button>
        </div>
    </div>
    <table id="productTable" class="table table-striped" border="1" width="100%">
        <thead class="thead-dark">
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Preview Image</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>

        <c:forEach var="product" items="${products}">
            <c:url var="editLink" value="/admin/product/Edit">
                <c:param name="productId" value="${product.productCode}"/>
            </c:url>
            <c:url var="deleteLink" value="/admin/product/Delete">
                <c:param name="productId" value="${product.productCode}"/>
            </c:url>

            <tr>
                <td>${product.productCode}</td>
                <td>${product.productName}</td>
                <td>${product.getProductCategory().getBrandName()}</td>
                <td>
                    <img height="100px" width="100px" src="/productImages/${product.image_Url}" alt="">
                </td>
                <td><a href="${editLink}">Edit</a></td>
                <td>
                    <a href="${deleteLink}" onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
