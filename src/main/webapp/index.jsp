<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<%@page import="java.util.Date" %>--%>
<%--<%! Date now = new Date(); %>--%>

<jsp:useBean scope="session" id="now" class="java.util.Date" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Title</title>
</head>
<body>
<p>Hello.</p>
<p>Aujourd'hui: <%= now %></p>
</body>
</html>