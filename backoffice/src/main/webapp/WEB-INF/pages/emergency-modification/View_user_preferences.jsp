<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>CarSharingClub - FrontOffice</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/mdb.min.css" />" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"/>
</head>
<body>
<div class="header">
    <nav class="navbar navbar-expand-lg navbar-dark indigo">
        <a class="navbar-brand" href="<c:url value="/"/>">CSC Inside</a>
        <button class="navbar-toggler" type="button"
                data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Modification de session</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="<c:url value="/modifurgent/impactedSession/"/>">sessions impactées</a>
                        <a class="dropdown-item" href="<c:url value="/modifurgent/"/>">Liste retards</a>
                        <a class="dropdown-item" href="<c:url value="/modifurgent/usersPreferencesView"/>">préférences utilisateurs</a>
                        <a class="dropdown-item" href="<c:url value="/modifurgent/commercialGestureView"/>">Gestes commerciaux</a>
                        <a class="dropdown-item" href="<c:url value="/modifurgent/bookingList"/>">Liste des réservations</a>
                    </div>
                </li>

            </ul>
        </div>
    </nav>
</div>

<div class="container">
    <h3 class="text-center">Liste des utilisateurs</h3>

    <%--@elvariable id="users" type="java.util.List"--%>
    <c:if test="${!empty users}">
        <div class="table">
            <table class="table table-hover">
                <tr>

                    <th width="150">Identifiant utilisateur</th>
                    <th width="150">Prénom Nom</th>
                    <th width="500">Total gestes commerciales</th>
                </tr>
                    <%--@elvariable id="user" type="java.util.List"--%>
                <c:forEach items="${users}" var="user">

                    <tr>
                        <td>${user.idUser}</td>
                        <td>${user.firstName} ${user.lastName}</td>
                        <td>${user.numberOfDiscount}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </c:if>
</div>


<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/popper.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/mdb.min.js" />"></script>
</body>
</html>