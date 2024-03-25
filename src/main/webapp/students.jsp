<%--
  Created by IntelliJ IDEA.
  User: piko
  Date: 25/03/2024
  Time: 08:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- controle, iterations, tests, variables -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- traitement XML -->
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>
<!-- formattage des donnees -->
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!-- SQL/JDBC -->
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<body>
<p>Age de Anne est <c:out value="${anne.age}"/></p>
<p>Aujourd'hui nous sommes le <c:out value="${today}"/></p>
<p>Anne's best friend <c:out value="${anne.bestFriend.getName()}"/></p>

<p>John's best friend <c:out value="${john.bestFriend.getName()}"/></p>

<p>Using students bean showing <c:out value="${students[2].name} ${students[2].age}"/></p>
<p>There is <c:out value="${students.size()}"/> student(s)</p>
<p>students list</p>
<p>from sessionScope date <c:out value="${sessionScope.get('today')}"/></p>
<p>from applicationScope date <c:out value="${applicationScope.get('today')}"/></p>
<p>unsafe parsing <c:out escapeXml="false" value="${sessionScope.get('injection')}"/></p>

<p>safe parsing <c:out value="${sessionScope.get('injection')}"/></p>

<c:if test="${param.size() > 0}">
    <p>Il y a des paramètres.</p>
</c:if>

<!-- Un exemple de boucle -->
<p>Les parametres:</p>
<ul>
    <c:forEach var="aParam" items="${param}">
        <li>un parametre :
            <c:out value="${aParam.key}"/> = <c:out value="${aParam.value}"/>
        </li>
    </c:forEach>
</ul>

<!-- Une étude de cas -->
<c:choose>
    <c:when test="${param['question'] == 'oui'}">
        <p>OUI</p>
    </c:when>
    <c:otherwise>
        <p>NON</p>
    </c:otherwise>
</c:choose>

<table border="1">
    <c:forEach var="student" items="${students}">
        <td>
            <c:choose>
                <c:when test="${student.age > 24}">
                    <b><c:out value=" ${student.name}"/></b>
                </c:when>
                <c:otherwise>
                    <p><c:out value="${student.name}"/></p>
                </c:otherwise>
            </c:choose>
        </td>
        <td>
            <p><c:out value="${student.age}"/></p>
        </td>
        <td>
            <c:out value="${student.bestFriend.name}" default="Personne"/>
        </td>
        <tr/>
    </c:forEach>
</table>

<c:url value="person" var="person"/>
<p><a href="${person}"> Person URL</a></p>
</body>
</html>