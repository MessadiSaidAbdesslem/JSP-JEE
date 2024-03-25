<%@page import="java.util.List" %>
<%@page import="com.example.myapp2.Person" %>

<jsp:useBean id="persons" type="java.util.List<com.example.myapp2.Person>" scope="request"/>

<html>
<body>

<h1>Liste des personnes</h1>

<table border='1'>
    <%
        for (Person person : persons) {
            pageContext.setAttribute("person", person);
    %>
    <tr>
        <td>${person.id}</td>
        <td>${person.name}</td>
        <td>${person.mail}</td>
        <td><a href="person?id=${person.id}">Modifier</a></td>
        <td><a href="deletePerson?id=${person.id}">Supprimer cette personne</a></td>

    </tr>
    <%
        }
    %>
</table>
<p><a href="addPerson">Ajouter une personne</a></p>

</body>
</html>