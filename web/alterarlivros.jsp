<%-- 
    Document   : alterarlivros
    Created on : 19 de mai. de 2024, 23:55:25
    Author     : Nopa
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar</title>
    </head>
    <body>
        <%
    
    

    try{
    
        Connection conecta;
        PreparedStatement st;

    
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/livros?useTimezone=true&serverTimezone=America/Sao_Paulo", "root", "tomcat");

        int id = Integer.parseInt(request.getParameter("ID"));
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String editora = request.getParameter("editora");
        String ano = request.getParameter("ano");
        String localizacao = request.getParameter("localizacao");

      
            // ALTERAR os dados na tabela livro no banco de dados 
            String sql = ("UPDATE livro SET titulo = ?,autor = ?,editora = ?,ano = ?,localizacao = ? WHERE id = ?");
            st = conecta.prepareStatement(sql);
            
            st.setString(1, titulo);
            st.setString(2, autor);
            st.setString(3, editora);
            st.setString(4, ano);
            st.setString(5, localizacao);
            st.setInt(6, id);

            st.executeUpdate(); //Executa o comando INSERT
            out.print("Os dados do livro "+ id + " foram alterados com sucesso!");
        
    }
    catch (Exception x)
    {
        out.print("Mensagem de erro : " + x.getMessage());
    }
    
%>
    </body>
</html>
