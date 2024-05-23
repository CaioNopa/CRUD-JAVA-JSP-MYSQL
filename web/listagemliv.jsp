<%-- 
    Document   : listagemliv
    Created on : 19 de mai. de 2024, 21:53:32
    Author     : Nopa
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de livros</title>
        <link rel="stylesheet" href="tabela.css"/>
    </head>
    <body>

<%
    Connection conecta;
    PreparedStatement st;
    ResultSet rs;

    try {
        // Conexão com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/livros?useTimezone=true&serverTimezone=America/Sao_Paulo", "root", "tomcat");
        
        // Listagem de livros
        String sql = "SELECT * FROM livro";
        st = conecta.prepareStatement(sql);
        rs = st.executeQuery();
%>
        <table>
            <tr>
                <th>ID</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Editora</th>
                <th>Ano</th>
                <th>Localizacao</th>
            </tr>
<%
        while(rs.next()) {
%>
            <tr>
                <td><%= rs.getString("ID") %></td>
                <td><%= rs.getString("titulo") %></td>
                <td><%= rs.getString("autor") %></td>
                <td><%= rs.getString("editora") %></td>
                <td><%= rs.getString("ano") %></td>
                <td><%= rs.getString("localizacao") %></td>
            </tr>
<%
        }
%>
        </table>
<%
    } catch (Exception x) {
        out.print("Mensagem de erro : " + x.getMessage());
    } 
%>

    </body>
</html>
