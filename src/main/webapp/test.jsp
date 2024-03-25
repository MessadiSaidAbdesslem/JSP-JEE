<%@page import="java.util.Arrays" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags/mestags" %>
<html>

<body>
<h1>Ajouter une balise</h1>

<mm:message type="Important">Mon contenu</mm:message>

<%
    List<String> mesTextes = Arrays.asList("Hello", "Salut");
    pageContext.setAttribute("mesTextes", mesTextes);
%>

<mm:message type="Alerte" textes="${mesTextes}"/>
<mm:message type="Alerte" textes="<%= mesTextes %>"/>

</body>
</html>