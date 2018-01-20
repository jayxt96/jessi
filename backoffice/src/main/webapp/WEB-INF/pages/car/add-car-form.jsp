<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>CSC - BackOffice</title>
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/mdb.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark indigo">
    <a class="navbar-brand" href="#">CSC Inside</a>
    <button class="navbar-toggler" type="button"
            data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Maintain vehicle referential<span class="sr-only">(current)</span></a>
                <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<c:url value="/car/"/>">Liste véhicule</a>
                    <a class="dropdown-item" href="">Ajouter</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/parking/add"/>">Maintain parking spot referential</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/pricing"/>">Maintain pricing referential</a>
            </li>

        </ul>
    </div>
</nav>

<div>

</div>

<div class="container">
    <h5 class="modal-title text-center" id="exampleModalLabel">Ajouter un véhicule</h5>
<%--@elvariable id="car" type="fr.digicar.model.Car"--%>
    <form:form method="POST" action="${pageContext.request.contextPath}/car/adding" modelAttribute="car">
        <div class="row">
            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                <form:input type="text" path="registration_number" cssClass="form-control" required="required"/>
                <form:label path="registration_number">Immatriculation</form:label>
                </div>
            </div>

            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                <form:input type="text" path="mark" cssClass="form-control"/>
                <form:label data-error="Marque invalide" path="mark">Marque</form:label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:input type="text" path="name_model" cssClass="form-control"/>
                    <form:label data-error="modèle invalide" path="name_model">Nom du modèle</form:label>
                </div>
            </div>

            <div class="col-md-4">
                <form:label path="transmission" >Transmission</form:label>
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:select cssClass="form-control rounded validate mdb-select  my-0 py-1 grey-border" path="transmission">
                        <form:option value="" disabled="true" selected="true">Choisir un type</form:option>
                        <c:forEach items="${listOfTransmissionMode}" var="transmissionMode" >
                            <form:option value="${transmissionMode.id}" >${transmissionMode.name}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:input type="number" path="nb_places" cssClass="form-control"/>
                    <form:label data-error="champs invalide" path="nb_places">Nombre de places</form:label>
                </div>
            </div>

            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                <form:input type="number" path="nb_doors" cssClass="form-control"/>
                <form:label data-error="champs invalide" path="nb_doors">Nombre de portes</form:label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <form:label path="type" >Type de véhicule</form:label>
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:select cssClass="form-control rounded validate mdb-select  my-0 py-1 grey-border" path="type">
                        <form:option value="" disabled="true" selected="true">Choisir un type</form:option>
                        <c:forEach items="${listOfCarType}" var="carType" >
                            <form:option value="${carType.id}" >${carType.name}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:input type="text" path="location" cssClass="form-control"/>
                    <form:label data-error="champs invalide" path="location">Emplacement</form:label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:input type="number" path="kilometers" cssClass="form-control"/>
                    <form:label data-error="champs invalide" path="kilometers">Kilométrage</form:label>
                </div>
            </div>
            <div class="col-md-4">
                <form:label data-error="champs invalide" path="release_date">Date de mise en circulation</form:label>
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:input type="date" path="release_date" cssClass="form-control"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="input-group md-form form-sm form-2 pl-0">
                <form:input type="text" path="comfort" cssClass="form-control"/>
                <form:label data-error="champs invalide" path="comfort">Confort</form:label>
                </div>
            </div>
            <div class="col-md-4">
                <form:label path="fuel_type" >Carburant</form:label>
                <div class="input-group md-form form-sm form-2 pl-0">
                    <form:select cssClass="form-control rounded validate mdb-select  my-0 py-1 grey-border" path="fuel_type">
                        <form:option value="" disabled="true" selected="true">Choisir un type</form:option>
                        <c:forEach items="${listOfFuelType}" var="fuelType" >
                            <form:option value="${fuelType.id}" >${fuelType.name}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="">Annuler</button>
            <button type="submit" class="btn btn-primary">Ajouter un véhicule</button>
        </div>
    </form:form>
</div>
<%@include file="car-details.jsp"%>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/mdb.min.js" />"></script>
</body>
</html>

