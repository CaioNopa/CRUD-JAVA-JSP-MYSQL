<%-- 
    Document   : salvarlivros
    Created on : 19 de mai. de 2024, 19:45:41
    Author     : Nopa
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Livros</title>
    </head>
    <body>
        
        
        
        
<%
    
    

    try{
    
        Connection conecta;
        PreparedStatement st;

    
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/livros?useTimezone=true&serverTimezone=America/Sao_Paulo", "root", "tomcat");

        String id = request.getParameter("ID");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String editora = request.getParameter("editora");
        String ano = request.getParameter("ano");
        String localizacao = request.getParameter("localizacao");

        // Verifica se algum campo necessário está vazio
       if (id == null || id.trim().isEmpty() ||
            titulo == null || titulo.trim().isEmpty() ||
            autor == null || autor.trim().isEmpty() ||
            editora == null || editora.trim().isEmpty() ||
            ano == null || ano.trim().isEmpty() ||
            localizacao == null || localizacao.trim().isEmpty()) {
            out.print("Erro: Todos os campos são obrigatórios e não podem estar vazios.");
        } else {
            // Insere os dados na tabela livro no banco de dados 
            String sql = "INSERT INTO livro (id, titulo, autor, editora, ano, localizacao) VALUES (?, ?, ?, ?, ?, ?)";
            st = conecta.prepareStatement(sql);
            
            st.setInt(1, Integer.parseInt(id));
            st.setString(2, titulo);
            st.setString(3, autor);
            st.setString(4, editora);
            st.setString(5, ano);
            st.setString(6, localizacao);

            st.executeUpdate(); //Executa o comando INSERT
            out.print("Livro cadastrado com sucesso!");
        }
    }
    catch (Exception x)
    {
        out.print("Mensagem de erro : " + x.getMessage());
    }
    
%>

                
   
    </body>
</html>
