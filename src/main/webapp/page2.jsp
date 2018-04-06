<%-- 
    Document   : page2
    Created on : 5 avr. 2018, 10:05:31
    Author     : Formation
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <%@include file="entete2.jsp" %>
    </head>
    <body>
        <h1>Choix du Projet </h1><br/>
        <div id="Body">
            <ul>
                <!--<li><a href="pageFormation/">pageFormation</a></li><!-- -->
                <li><a href="NouvelleEmployer.jsp">Nouvelle Employer</a></li><!-- -->
                <li><a href="ListeEmployer.jsp">Voire Employer</a></li><!-- -->
                <li><a href="modifierEmployerSelection.jsp">Modifier Employer</a></li><!-- -->
                
            </ul>
        </div>
        <%@include file="pied2.jsp" %>
    </body>
</html>
