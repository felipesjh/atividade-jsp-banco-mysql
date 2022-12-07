<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@page  import="classes.BancoDeDados"%>   
    <%@page  import="classes.Aluno"%> 
    
    
    
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
                  </ul>
            </nav>
        </header>
        
        <%
            int ra = 0;
            
            try{
                ra = Integer.parseInt(request.getParameter("ra"));
                BancoDeDados bd = new BancoDeDados();
                bd.excluir(ra);
            }catch(Exception e){
                out.println("Erro na pagina de exclusão"+e);
            }
            
            response.sendRedirect("./index.jsp");
        %>
        
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>   
    </body>
</html>