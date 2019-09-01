<%-- 
    Document   : amortização-constante
    Created on : 26/08/2019, 21:19:23
    Author     : giova
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%DecimalFormat formatarValor = new DecimalFormat("#,##0.00");%>
        <%DecimalFormat formatarVl = new DecimalFormat("0,00");%>

        <div class = "content">
            <%if (request.getParameter("calc") == null) {%>
            <form>
                <p>
                    Saldo devedor:<br>
                    <input type="text" name="valor" plachouder="Digite o valor"/> <br>
                </p>
                <p>
                    Taxa de juros %:<br>
                    <input type="text" name="txj" plachouder="Digite o valor"/> <br>
                </p>
                <p>
                    Número de meses:<br>
                    <input type="text" name="mes" plachouder="Digite o valor"/> <br>
                </p>
                <p>
                    <input type="submit" name="calc" value="Calcular"/> <br>
                </p>
            </form>
            <%} else {%>
            <%
                double saldoDevedor = Double.parseDouble(request.getParameter("valor"));
                double taxaDeJuros = Double.parseDouble(request.getParameter("txj"));
                double numeroDeMeses = Double.parseDouble(request.getParameter("mes"));
                taxaDeJuros = taxaDeJuros/100;
                double amortizacao = saldoDevedor / numeroDeMeses;
                double parcela;
                double valorJuros;
                double totalAmor;
                double totalParc;
            %>
            <table border="1px" style="text-align: center">
                <tr>
                    <th>n° da parcela</th>
                    <th>Prestações</th>
                    <th>Amortizações</th>
                    <th>Juros</th>
                    <th>Saldo Devedor</th>
                </tr>
                <%for (int i = 1; i <= numeroDeMeses; i++) {%>
                <%
                    valorJuros = taxaDeJuros * saldoDevedor;
                    parcela = amortizacao + valorJuros;
                    saldoDevedor -= amortizacao;
                    totalAmor = amortizacao + amortizacao;
                    totalParc = parcela + parcela;

                %>

                <tr>
                    <td><%= i%></td>
                    <td><%= formatarValor.format(parcela)%></td>
                    <td><%= formatarValor.format(amortizacao)%></td>
                    <td><%= formatarVl.format(valorJuros)%></td>
                    <td><%= formatarValor.format(saldoDevedor)%></td>
                </tr>
                <%}%>
                <tr>
                    <th>Total</th>
                    <td><%= amortizacao * numeroDeMeses %></td>
                    <td><%= amortizacao * numeroDeMeses %></td>
                    <td> --- </td>
                    <td> --- </td>
                </tr>
                <%}%>
                
            </table>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
