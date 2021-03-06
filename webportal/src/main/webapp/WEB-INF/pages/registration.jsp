<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>S'enregistrer - CarSharingClub</title>
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/mdb.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark elegant-color-dark">
        <div class="container">
            <a class="navbar-brand" href="<c:url value="/"/>">CarSharingClub</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                </ul>
                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                </form>
            </div>
        </div>
    </nav>
</header>

<div class="container">
    <%--@elvariable id="user" type="fr.digicar.model.User"--%>
    <form:form method="POST" modelAttribute="user" cssClass="m-5"
               action="${pageContext.request.contextPath}/registration">
        <div class="row">
            <a class="btn btn-sm btn-default col">Identifiants</a>
            <hr class="col-2"/>
            <a class="btn btn-sm btn-blue-grey col">Informations personnelles</a>
            <hr class="col-2"/>
            <a class="btn btn-sm btn-blue-grey col">Activation</a>
        </div>
        <div class="row mt-4">
            <h1>Créer votre compte</h1>
        </div>
        <%--@elvariable id="message" type="java.lang.String"--%>
        <c:if test="${not empty message}">
            <div class="row">
                <div class="alert alert-danger w-100">${message}</div>
            </div>
        </c:if>
        <div class="row mt-2">
            <div class="col-12">
                <div class="md-form">
                    <i class="fa fa-envelope prefix text-info"></i>
                    <form:input type="email" id="email" cssClass="form-control validate" path="email"
                                required="required"/>
                    <form:label for="email" data-error="Email invalide" path="email">
                        Email
                        <span class="text-danger">*</span>
                    </form:label>
                </div>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-12">
                <div class="md-form">
                    <i class="fa fa-lock prefix text-info"></i>
                    <form:input type="password" id="password" cssClass="form-control validate" path="password"
                                minlength="6" required="required"/>
                    <form:label for="password" data-error="Un mot de passde de plus de 6 caractères est requis"
                                path="password">
                        Mot de passe
                        <span class="text-danger">*</span>
                    </form:label>
                </div>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-12">
                <div class="md-form">
                    <i class="prefix"></i>
                    <form:input type="password" id="password" cssClass="form-control validate" path="passwordConfirm"
                                minlegth="6" required="required"/>
                    <form:label for="password" data-error="Un mot de passde de plus de 6 caractères est requis"
                                path="passwordConfirm">
                        Mot de passe (confirmation)
                        <span class="text-danger">*</span>
                    </form:label>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col text-right">
                <button type="submit" class="btn btn-primary">
                    Suivant &nbsp;
                    <i class="fa fa-angle-right"></i>
                </button>
            </div>
        </div>
    </form:form>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/mdb.min.js" />"></script>
</body>
</html>
