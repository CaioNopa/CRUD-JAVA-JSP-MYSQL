<%-- 
    Document   : excluirliv
    Created on : 19 de mai. de 2024, 23:30:07
    Author     : Nopa
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
 
        PreparedStatement st;
        //Recebendo do formulário 
        int id = Integer.parseInt(request.getParameter("ID"));
        //Conecta com o banco de dados
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/livros?useTimezone=true&serverTimezone=America/Sao_Paulo", "root", "tomcat");
        //Deleta no banco de dados
        String sql = ("DELETE FROM livro WHERE id=?");
        st = conecta.prepareStatement(sql);
        
        st.setInt(1, id);
        int resultado = st.executeUpdate(); //Executa o comando
        
        if(resultado == 0){
                 out.print("Este livro não existe");
        }
        else
        {
                out.print("O livro de ID : " + id + " foi excluído com sucesso!");
        }
        


        %>
    </body>
</html>
