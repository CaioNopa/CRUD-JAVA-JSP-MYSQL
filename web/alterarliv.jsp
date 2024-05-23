<%-- 
    Document   : alterarliv
    Created on : 19 de mai. de 2024, 23:44:25
    Author     : Nopa
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Livro</title>
    </head>
    <body>
        <%
         PreparedStatement st;
        //Recebendo do formulário 
        int id = Integer.parseInt(request.getParameter("ID"));
        //Conecta com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/livros?useTimezone=true&serverTimezone=America/Sao_Paulo", "root", "tomcat");
        //Busca no banco de dados
        String sql = ("SELECT * FROM livro WHERE id=?");
        st = conecta.prepareStatement(sql);
        
        st.setInt(1,id);
        ResultSet resultado = st.executeQuery();
        //Certifica se o livro informado existe
        if(!resultado.next()){
                 out.print("Este livro não foi encontrado");
        }
        else
        {
        %>
        <form method="post" action="alterarlivros.jsp">
            
            
            <p>
                <label for="ID"> ID :</label>
                <input type="number" name="ID" id="ID" value="<%= resultado.getString("ID") %>" readonly>
            </p>
            
             <p>
                <label for="titulo"> Titulo :</label>
                <input type="text" name="titulo" id="titulo" value="<%= resultado.getString("titulo") %>">
            </p>
            
            <p>
                <label for="autor"> Autor :</label>
                <input type="text" name="autor" id="autor" value="<%= resultado.getString("autor") %>">
            </p>
              <p>
                <label for="editora"> Editora :</label>
                <input type="text" name="editora" id="editora" value="<%= resultado.getString("editora") %>">
            </p>  <p>
                <label for="ano"> Ano :</label>
                <input type="number" name="ano" id="ano" value="<%= resultado.getString("ano") %>">
            </p>
              <p>
                <label for="localizacao"> Localizacao :</label>
                <input type="text" name="localizacao" id="localizacao" value="<%= resultado.getString("localizacao") %>">
            </p>
            <p>
                <input type="submit" value="Salvar Alterações">
            </p>
        <%
        }
        %>
        </form>
    </body>
</html>
