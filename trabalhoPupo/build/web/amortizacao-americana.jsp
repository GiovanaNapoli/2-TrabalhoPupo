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
        <title>Amortização Americana</title>
    </head>
    <body>
        <h1>Amortização Americana</h1>
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
        <form>
            <label>R$</label>
            <input type="number" min="0" value="0" name="reais"/><br></br>
            <label>Juros %</label>
            <input type="number" min="0" value="0" name="juros"/><br></br>
            <label>Meses</label>
            <input type="number" min="1" value="1" name="meses"/><br></br>
            <input type="submit" name="calculaAmortizacao" value="Calcular">
        </form>
        <% } else {

            reais = Double.parseDouble(request.getParameter("reais"));
            juros = Double.parseDouble(request.getParameter("juros"));
            meses = Integer.parseInt(request.getParameter("meses"));

        %>        

        <table border="1">
            <tr>
                <td>Nº Prestação</td>
                <td>Saldo Devedor R$</td>
                <td>Amortização R$</td>
                <td>Juros (% <%= (int) juros%> de R$<%= formatarReal.format(reais)%>)</td>
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
            
            <h3>Total Juros R$ <%= formatarReal.format(totalPagar)%></h3>
            <h2>Total a Pagar R$ <%= formatarReal.format(totalPagar + reais)%></h2>
            
            <a href="amortizacao-americana.jsp">Preencher Novamente o Formulário</a>
            
            <%
                }
            %>
            
        </table>
    </body>
</html>
