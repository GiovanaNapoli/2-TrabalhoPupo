<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
        <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <h1>Tabela Price </h1>
       
        
        <form>
            Valor Empréstimo R$:  <input type="text" name="v">
            Quantidade de Meses (N) : <input type="text" name="meses">
            Taxa de Juros Aplicada (%):  <input type="text" name="taxa">
            
            <input type="submit" value="Calcular" name="calcular">
                
        </form>
        <% if (request.getParameter("calcular")!= null ){ %>
            <%try{ %>
                <%
                    double v = Double.parseDouble(request.getParameter("v"));
                    int meses = Integer.parseInt(request.getParameter("meses"));
                    double taxa = Double.parseDouble(request.getParameter("taxa"));
                    
                    DecimalFormat formatar = new DecimalFormat("0.##");
                    
                    double j = taxa/100;                   
                    double jurosTotal=0;
                    double taxaJ;
                    
                    double p;
                    double ptotal=0;
                    
                    double a;
                    double atotal=0;      
                    
                    double aux = 1+j;
                    double conta = Math.pow(aux,meses); 
                    double conta1 = Math.pow(aux,meses);
                    
                %>
                <br>
                <br>
                <table border='1'>                        
                    <tr>
                        <th>Meses</th>
                        <th>Prestação</th>
                        <th>Juros</th>
                        <th>Amortizações</th>                       
                        <th>Saldo Devedor</th>                        
                    </tr>
                    
                    <% conta = conta * j; %>
                    <% conta1 = conta1 - 1; %>
                    <% p = v * (conta/conta1); %>
                   
                    
                  
                    <% for(int i=1; i<= meses; i++){ %>
                        
                        <% taxaJ = v * j; %>
                        <% a = p - taxaJ; %>                      
                        <% v = v - a; %>                        
                        
                        <% atotal += a; %>
                        <% ptotal += p; %>
                        <% jurosTotal += taxaJ; %>
                        
                                                    
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
                        
            <% }catch (Exception ex) { %>
              
                <h2> Verifique os dados inseridos e tente novamente!!!</h2>
            <% } %> 
        <% } %>
           
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>