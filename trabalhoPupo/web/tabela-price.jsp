<%-- 
    Document   : tabela-price
    Created on : 26/08/2019, 21:20:17
    Author     : giova
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <h1 class="p-3 mb-2">Tabela Price </h1>


        <form class="p-3 mb-2">
            <div class="form-group">
                <p>
                    Valor Empréstimo R$:
                    <input class="form-control" style="max-width:40%;" type="text" name="v">
                <p/>
                <p>
                    Quantidade de Meses (N) :
                    <input class="form-control" style="max-width:40%;" type="text" name="meses">
                </p>
                <p>
                    Taxa de Juros Aplicada (%):
                    <input class="form-control" style="max-width:40%;" type="text" name="taxa">
                </p>

                <input class="btn btn-danger" type="submit" value="Calcular" name="calcular">
            </div>    
        </form>
        <% if (request.getParameter("calcular") != null) { %>
        <%try { %>
        <%
            double v = Double.parseDouble(request.getParameter("v"));
            int meses = Integer.parseInt(request.getParameter("meses"));
            double taxa = Double.parseDouble(request.getParameter("taxa"));

            DecimalFormat formatar = new DecimalFormat("0.##");

            double j = taxa / 100;
            double jurosTotal = 0;
            double taxaJ;

            double p;
            double ptotal = 0;

            double a;
            double atotal = 0;

            double aux = 1 + j;
            double conta = Math.pow(aux, meses);
            double conta1 = Math.pow(aux, meses);

        %>
        <br>
        <br>
        <table border='1' class="table table-dark table-striped" style="text-align: center;">                        
            <tr>
                <th>Meses</th>
                <th>Prestação</th>
                <th>Juros</th>
                <th>Amortizações</th>                       
                <th>Saldo Devedor</th>                        
            </tr>

            <% conta = conta * j; %>
            <% conta1 = conta1 - 1; %>
            <% p = v * (conta / conta1); %>



            <% for (int i = 1; i <= meses; i++) { %>

            <% taxaJ = v * j; %>
            <% a = p - taxaJ; %>                      
            <% v = v - a; %>                        

            <% atotal += a; %>
            <% ptotal += p; %>
            <% jurosTotal += taxaJ;%>


            <tr>
                <td><%=i%></td>
                <td><%=formatar.format(p)%></td>
                <td><%=formatar.format(taxaJ)%></td>
                <td><%=formatar.format(a)%></td>
                <td><%=formatar.format(v)%></td>                              
            </tr>
            <%}%>
            <tr>
                <td><%="Total"%></td>
                <td><%=formatar.format(ptotal)%></td>
                <td><%=formatar.format(jurosTotal)%></td>
                <td><%=formatar.format(atotal)%></td>
                <td><%='-'%></td>                              
            </tr>
        </table>

        <% } catch (Exception ex) { %>

        <h2> Verifique os dados inseridos e tente novamente!!!</h2>
        <% } %> 
        <% }%>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
        
    </body>
</html>
