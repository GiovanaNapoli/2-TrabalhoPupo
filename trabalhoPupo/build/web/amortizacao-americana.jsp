<%-- 
    Document   : amortizacao-americana
    Created on : 30/08/2019, 12:36:45
    Author     : Eric   
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Amortização Americana</title>
    </head>
    <%@include file="WEB-INF/jspf/header.jspf"%>
    <body class="bg-light">
        <h1 class="p-3 mb-2">Amortização Americana</h1>
        <%
            double reais = 0;
            double juros = 0;
            double totalPagar = 0;
            double calcularJuros = 0;
            double valorJuros = 0;
            int meses = 0;

            DecimalFormat formatarReal = new DecimalFormat();
            formatarReal.applyPattern("#,##0.00");

            if (request.getParameter("calculaAmortizacao") == null) {

        %>
        <form class="p-3 mb-2">
            <div class="form-group">
                <label>Saldo Devedor R$:</label>
                <input class="form-control" style="max-width:40%;" type="text" value="0" name="reais"/><br></br>
                <label>Taxa de Juros %</label>
                <input class="form-control" style="max-width:40%;" type="text" value="0" name="juros"/><br></br>
                <label>Meses</label>
                <input class="form-control" style="max-width:40%;" type="text" value="1" name="meses"/><br></br>
                <input class="btn btn-danger" type="submit" name="calculaAmortizacao" value="Calcular">
            </div>
        </form>
        <% } else {

            reais = Double.parseDouble(request.getParameter("reais"));
            juros = Double.parseDouble(request.getParameter("juros"));
            meses = Integer.parseInt(request.getParameter("meses"));

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

                <%
                    calcularJuros = juros / 100;

                    for (int i = 1; i <= meses; i++) {

                        valorJuros = reais * calcularJuros;

                        totalPagar += valorJuros;

                %>
                <tr>
                    <td><%= i%></td>
                    <td><%= (i == meses) ? 0 : formatarReal.format(reais)%></td>
                    <td><%= (i == meses) ? formatarReal.format(reais) : 0%></td>
                    <td><%= formatarReal.format(valorJuros)%></td>
                    <td><%= (i == meses) ? formatarReal.format(totalPagar + valorJuros) : formatarReal.format(valorJuros)%></td>
                </tr>

                <%
                    }
                %>

                <tr>
                    <td>Total</td>
                    <td></td>
                    <td><%= formatarReal.format(reais)%></td>
                    <td><%= formatarReal.format(totalPagar)%></td>
                    <td><%= formatarReal.format(totalPagar + reais)%></td>

                </tr>
            <a class="btn btn-warning ml-3" href="amortizacao-americana.jsp" style="margin-bottom:1%;">Preencher Novamente o Formulário</a>
            <h3 class="ml-3 h3">Total Juros: R$ <%= formatarReal.format(totalPagar)%> | Total a Pagar: R$ <%= formatarReal.format(totalPagar + reais)%></h3>

            <hr class="m-3 bg-dark">
            <%
                }
            %>
            </tbody>
        </table>

    </body>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
</html>
