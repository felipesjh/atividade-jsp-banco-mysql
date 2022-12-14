<%-- 
    Document   : editar
    Created on : 22 de nov. de 2022, 19:57:08
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page  import="classes.BancoDeDados"%>   
    <%@page  import="classes.Aluno"%> 
    
    <%
        BancoDeDados bd = new BancoDeDados();
        Aluno aluno = null;
        int ra = 0;
                
        //Busca os valores
        try{
            ra = Integer.parseInt(request.getParameter("ra"));
            aluno = bd.buscar(ra);
            if(aluno.getRa() <=0 || aluno==null){
                response.sendRedirect("./index.jsp");
            }
        }catch(Exception e){
            out.println("Erro com RA do formulário"+e);
        }
        
        
        //Atualizar no Banco de Dados
        try{
           String gravar = request.getParameter("nome"); 
        if(gravar!=null){
            //aluno = new Aluno();
         
            aluno.setNome(request.getParameter("nome"));
            aluno.setCpf(request.getParameter("cpf"));
            aluno.setEndereco(request.getParameter("endereco"));
            aluno.setIdade(Integer.parseInt(request.getParameter("idade")));
            aluno.setRa(ra);
            
            out.println(aluno.getNome());
            out.println(aluno.getCpf());
            out.println(aluno.getEndereco());
            out.println(aluno.getIdade());
            out.println(aluno.getRa());
        
            bd.editar(aluno);
            //response.sendRedirect("./index.jsp");
        }   
        }catch(Exception e){
            out.println("Erro na página de atualizar"+e);
        }
    %>
        
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Aluno</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    </head>
    <body>
        
        <header>
            <nav>
                <ul class="nav">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="./index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="./cadastrar.jsp">Cadastrar</a>
                    </li>
            </nav>
        </header>
        
        <main>
            
            <h1>Editar Aluno</h1>
            <form method="post" action="./editar.jsp?ra=<%=ra%>">
                <label>RA:</label>
                <input type="number" name="ra" value="<%=aluno.getRa()%>" disabled><br>
                <label>Nome:</label>
                <input type="text" name="nome" value="<%=aluno.getNome()%>"  required><br>
                <label>CPF:</label>
                <input type="text" name="cpf" value="<%=aluno.getCpf()%>" required><br>
                <label>Endereço:</label>
                <input type="text" name="endereco" value="<%=aluno.getEndereco()%>" required><br>
                <label>Idade:</label>
                <input type="number" name="idade" value="<%=aluno.getIdade()%>"  required><br>
                <input type="submit" value="Atualizar">
            </form>
        </main>
        
        <footer>
            <p>Desenvolvido por Felipe</p>
        </footer>
        
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>   
    </body>
</html>
