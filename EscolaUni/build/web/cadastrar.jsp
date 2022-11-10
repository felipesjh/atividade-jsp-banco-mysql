<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@page  import="classes.BancoDeDados"%>   
    <%@page  import="classes.Aluno"%> 
    
    <% 
        /*Aplicando conexão com Banco de dados e cadastrar*/
        
        
        try{
        
        /*Verificando se os campos foram preenchidos, 
        verificando o campo NOME, se tiver em branco não faz nada 
        caso contrário ele vai iniciar o processo de cadastro.
        */
            String cadastrar = request.getParameter("nome");

            if(cadastrar != null){

                Aluno aluno = new Aluno();
                
                //SETs do objeto aluno - receber os nomes do formulário
                aluno.setNome(request.getParameter("nome"));
                aluno.setCpf(request.getParameter("cpf"));
                aluno.setEndereco(request.getParameter("endereco"));
                aluno.setIdade(Integer.parseInt(request.getParameter("idade")));

                BancoDeDados bd = new BancoDeDados();
                bd.inserir(aluno);
                response.sendRedirect("./index.jsp");


            }
        }catch(Exception e){
            out.println("Erro ao fazer cadastro!" + e);
        }

    
    %>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Aluno</title>
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
                    <li class="nav-item">
                      <a class="nav-link" href="#">Editar</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Excluir</a>
                    </li>
                  </ul>
            </nav>
        </header>
        
        <main>
            
            <h1>Cadastrar Aluno</h1>
            <form method="post" action="./cadastrar.jsp">
                <label>RA:</label><input type="number" name="ra" disabled><br>
                <label>Nome:</label><input type="text" name="nome" required><br>
                <label>CPF:</label><input type="text" name="cpf" required><br>
                <label>Endereço:</label><input type="text" name="endereco" required><br>
                <label>Idade:</label><input type="text" name="idade" required><br>
                <input type="submit" value="Cadastrar">
            </form>
        </main>
        
        <footer>
            <p>Desenvolvido por Felipe</p>
        </footer>
        
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>   
    </body>
</html>