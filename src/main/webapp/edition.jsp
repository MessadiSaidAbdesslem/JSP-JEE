<%@ page import="java.util.Map" %>
<jsp:useBean id="person" type="com.example.myapp2.Person" scope="request"/>

<html>
<head>
    <title>Modifier une personne</title>
</head>
<body>
<h1>Modifier une personne</h1>
<%
    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>
<form method="post" action="person">
    <label>ID :</label>
    <input name="id" type="text" value="${person.id}"/>
    <!-- Affichage du message d'erreur pour l'ID -->
    <p style="color: red"><%= errors.get("id") == null ? "" : errors.get("id") %>
    </p> <br/>
    <label>Name : </label>
    <input name="name" type="text" value="${person.name}"/>
    <!-- Affichage du message d'erreur pour le nom -->
    <p style="color: red"><%= errors.get("name") == null ? "" : errors.get("name") %>
    </p> <br/>
    <label>Mail : </label>
    <input name="mail" type="text" value="${person.mail}"/>
    <!-- Affichage du message d'erreur pour l'email -->
    <p style="color: red"><%= errors.get("mail") == null ? "" : errors.get("mail") %>
    </p> <br/>
    <label>Validation :</label>
    <input name="ok" type="submit" value="Ok"/>
    <% request.getSession().removeAttribute("errors"); %>
</form>
</body>
</html>