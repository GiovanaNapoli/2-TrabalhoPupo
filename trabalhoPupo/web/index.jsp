<%-- 
    Document   : index
    Created on : 26/08/2019, 21:11:29
    Author     : giova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <title>Home</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div style="text-align: center">
            <h2 class="p-3 mb-2">Cálculo de Amortização</h2>
            <p> Caroline Pistoresi  (Home; Tabela Price) </p>
            <p> Giovana Aparecida Napoli da Silva (Amortização Constante) </p>
            <p> Eric Araújo Lima (Amortização Americana) </p><br/>

            <p>A aplicação tem como objetivo anular uma dívida em parcelas periódicas, sendo elas a amortização constante, americana e tabela price, por exemplo.  </p><br/>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
