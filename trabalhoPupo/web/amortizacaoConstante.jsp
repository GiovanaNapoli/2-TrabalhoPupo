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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <title>Amortização Constante</title>
    </head>
    <body>

        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%DecimalFormat formatarValor = new DecimalFormat("#,##0.00");%>

        <h1 class="p-3 mb-2">Amortização Constante</h1>

        <div class = "content">
            <%if (request.getParameter("calc") == null) {%>
            <form class="p-3 mb-2">
                <div class="form-group">
                    <p>
                        Saldo devedor R$:<br>
                        <input class="form-control" style="max-width:40%;" type="text" min="0" name="valor" plachouder="Digite o valor"/> <br>
                    </p>
                    <p>
                        Taxa de juros %:<br>
                        <input class="form-control" style="max-width:40%;" type="text" min="0" name="txj" plachouder="Digite o valor"/> <br>
                    </p>
                    <p>
                        Meses:<br>
                        <input class="form-control" style="max-width:40%;" type="text" min="0" name="mes" plachouder="Digite o valor"/> <br>
                    </p>
                    <p>
                        <input class="btn btn-danger" type="submit" name="calc" value="Calcular"/> <br>
                    </p>
                </div>
            </form>
            <%} else {%>
            <%
                double saldoDevedor = Double.parseDouble(request.getParameter("valor"));
                double taxaDeJuros = Double.parseDouble(request.getParameter("txj"));
                double numeroDeMeses = Double.parseDouble(request.getParameter("mes"));
                double amortizacao = saldoDevedor / numeroDeMeses;
                double parcela;
                double valorJuros;
                double totalAmortizacao = 0;
                double totalPrestacao = 0;
                double totalParcelas = 0;
            %>
            <table border="1" class="table table-dark table-striped" style="text-align: center;">
                <tbody>
                    <tr>
                        <td>Nº Prestação</td>
                        <td>Saldo Devedor R$</td>
                        <td>Amortização R$</td>
                        <td>Juros R$</td>
                        <td>Prestação R$</td>  
                    </tr>
                    <%  taxaDeJuros = taxaDeJuros / 100;

                        for (int i = 1; i <= numeroDeMeses; i++) {
                    %>
                    <%
                        valorJuros = taxaDeJuros * saldoDevedor;
                        parcela = amortizacao + valorJuros;
                        saldoDevedor -= amortizacao;
                        totalPrestacao += parcela;
                        totalParcelas += valorJuros;

                    %>

                    <tr>
                        <td><%= i%></td>
                        <td><%= formatarValor.format(saldoDevedor)%></td>
                        <td><%= formatarValor.format(amortizacao)%></td>
                        <td><%= formatarValor.format(valorJuros)%></td>
                        <td><%= formatarValor.format(parcela)%></td>
                    </tr>
                    <%}
                        totalAmortizacao = amortizacao * numeroDeMeses;
                    %>
                    <tr>
                        <th>Total</th>
                        <td><%= 0%> </td>
                        <td><%= formatarValor.format(totalAmortizacao)%></td>
                        <td><%= formatarValor.format(totalParcelas)%></td>
                        <td><%= formatarValor.format(totalPrestacao)%></td>
                    </tr>
                <a class="btn btn-warning ml-3" href="amortizacaoConstante.jsp" style="margin-bottom:1%;">Preencher Novamente o Formulário</a>
                <h3 class="ml-3 h3">Total Juros: R$ <%= formatarValor.format(totalParcelas)%> | Total a Pagar: R$ <%= formatarValor.format(totalParcelas + totalAmortizacao)%></h3>

                <hr class="m-3 bg-dark">

                <%}%>
                </tbody>
            </table>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
