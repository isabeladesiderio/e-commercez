<%-- 
    Document   : index
    Created on : 20/11/2018, 01:09:28
    Author     : Windows 7
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>E-Commercez</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap-grid.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <nav>
            <div class="nav-logo">
                E-Commercez
            </div>
            <div class="nav-container">
                <input type="search" name="search" id="search" placeholder="Pesquise um produto..."/>
            </div>
            <div class="nav-items">
                <ul>
                    <li>
                        <a href="cart.jsp">Carrinho</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-lg-2">
                    Filtros
                </div>
                <div class="col-sm-12 col-md-10 col-lg-10">
                    Produtos
                </div>
            </div>
        </div>
    </body>
</html>
