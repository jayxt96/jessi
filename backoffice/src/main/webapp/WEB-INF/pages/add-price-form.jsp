<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>CSC Inside</title>
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet"/>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"/>
        <link href="<c:url value="/resources/css/mdb.min.css" />" rel="stylesheet"/>
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
    </head>
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-dark indigo">
                <a class="navbar-brand" href="<c:url value="/"/>">CSC Inside</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <%--<li class="nav-item active">--%>
                            <%--<a class="nav-link" href="<c:url value="/car/"/>">Maintain vehicle referential<span class="sr-only">(current)</span></a>--%>
                        <%--</li>--%>

                        <!-- Dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">Véhicules</a>
                            <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value="/car/"/>">Liste véhicule</a>
                                <a class="dropdown-item" href="<c:url value="/car/add"/>">Ajouter</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/parking"/>">Places de parking</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/pricing"/>">Tarifs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/users"/>">Utilisateurs</a>
                        </li>
                    </ul>
                    <%--<form class="form-inline">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                    </form>--%>
                </div>
            </nav>
            <!--/.Navbar-->
        </div>
        <div class="container">
            <button type="button" class="btn btn-primary mt-2" data-toggle="modal" data-target="#exampleModal">
                <i class="fa fa-plus mr-1"></i>
                Ajouter un pricing
            </button>
            <a href="<c:url value="/pricing/search"/>">
                <button type="button" class="btn btn-primary mt-2">
                    <i class="fa fa-search mr-1"></i>
                    Rechercher un pricing
                </button>
            </a>

            <!-- Modal -->
            <div class="modal fade mt-3" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width:650px;">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ajouter un pricing</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%--@elvariable id="pricing" type="fr.digicar.model.Pricing"--%>
                            <form:form method="POST" action="/pricing/addPricing" modelAttribute="pricing">

                            <div class="md-form">
                                <i class="fa fa-tag prefix grey-text"></i>
                                <form:input type="text" path="label" class="form-control" required="required"/>
                                <form:label path="label">Libellé</form:label>
                            </div>

                            <div class="md-form">
                                <i class="fa fa-eur prefix grey-text"></i>
                                <form:input type="number" step="0.01" path="hourlyPrice" class="form-control"
                                            required="required"/>
                                <form:label data-error="Montant invalide" path="hourlyPrice">Prix par heure</form:label>
                            </div>

                                <div class="md-form">
                                    <i class="fa fa-eur prefix grey-text"></i>
                                    <form:input type="number" step="0.01" path="kmPrice" class="form-control"
                                                required="required"/>
                                    <form:label data-error="Montant invalide" path="kmPrice">Prix par km</form:label>
                                </div>

                                <div class="md-form">
                                    <i class="fa fa-eur prefix grey-text"></i>
                                    <form:input type="number" step="1" path="monthlyFees" class="form-control"
                                                required="required"/>
                                    <form:label data-error="Montant invalide" path="monthlyFees">
                                        Frais mensuels
                                    </form:label>
                                </div>

                                <p style="color:rgb(117, 117, 117);">Catégories de véhicule :</p>
                            <div class="btn-group mr-4" data-toggle="buttons">
                                <label class="btn btn-default">
                                    <input value="1" type="checkbox" checked autocomplete="off"/>
                                    A
                                </label>
                                <label class="btn btn-default">
                                    <input value="2" type="checkbox" autocomplete="off"/>
                                    B
                                </label>
                                <label class="btn btn-default">
                                    <input value="3" type="checkbox" autocomplete="off"/>
                                    C
                                </label>
                                <label class="btn btn-default">
                                    <input value="4" type="checkbox" autocomplete="off"/>
                                    D
                                </label>
                                <br/>
                                <label class="btn btn-default">
                                    <input value="5" type="checkbox" checked autocomplete="off"/>
                                    E
                                </label>
                                <label class="btn btn-default">
                                    <input value="6" type="checkbox" autocomplete="off"/>
                                    F
                                </label>
                                <label class="btn btn-default">
                                    <input value="7" type="checkbox" autocomplete="off"/>
                                    G
                                </label>
                                <label class="btn btn-default">
                                    <input value="8" type="checkbox" autocomplete="off"/>
                                    V
                                </label>
                            </div>
                            <br/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-plus mr-1"></i>
                                Ajouter pricing
                            </button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>


            <h3>Liste des pricings</h3>

            <%--@elvariable id="listOfPricings" type="java.util.List"--%>
            <c:if test="${!empty listOfPricings}">
                <table class="table table-hover">
                    <tr>
                        <th width="80">Id</th>
                        <th width="120">Libelle</th>
                        <th width="60">Prix par heure(€)</th>
                        <th width="60">Prix par km(€)</th>
                        <th width="60">Frais mensuels(€)</th>
                        <th width="100">Catégories</th>
                        <th width="100">Actions</th>
                        <th width="100"></th>
                    </tr>
                    <c:forEach items="${listOfPricings}" var="pricing">
                        <%--@elvariable id="pricing" type="fr.digicar.model.Pricing"--%>
                        <c:if test="${!empty id} && ${pricing.id}==${id}">
                            <c:set value="table-success" var="cssClass"></c:set>
                        </c:if>
                        <tr class="${cssClass}">
                            <td>${pricing.id}</td>
                            <td>${pricing.label}</td>
                            <td>${pricing.hourlyPrice}</td>
                            <td>${pricing.kmPrice}</td>
                            <td>${pricing.monthlyFees}</td>
                            <td></td>
                            <td>
                                <button class="btn btn-warning m-0">
                                    <a href="<c:url value="" />">Modifier</a>
                                </button>
                            </td>
                            <td>
                                <button class="btn btn-danger m-0">
                                    <a href="<c:url value="" />">Supprimer</a>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <p>${id}</p>
            <br>
        </div>

        <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/mdb.min.js" />"></script>
    </body>
</html>