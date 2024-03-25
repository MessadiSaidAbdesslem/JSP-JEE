<%@ tag language="java" pageEncoding="utf-8" %>
<%@ attribute name="type" required="true" description="the message type" %>
<%@ attribute name="textes" required="false" type="java.util.List" %>

<p>Votre contenu (type ${type}) :
    <jsp:doBody/>
</p>

<c:if test="${textes != null}">
    <p>Vos textes :</p>
    <ul>
        <c:forEach var="texte" items="${textes}">
            <li><c:out value="${texte}"/></li>
        </c:forEach>
    </ul>
</c:if>