package classes;

import java.sql.Connection;//Classe para conectar banco de dados
import java.sql.DriverManager;//Gerenciar Driver de conexão com banco
import java.sql.PreparedStatement; //Prepara os comando dos textos em SQL
import java.sql.ResultSet;
import java.sql.SQLException;//Verifica se o SQL está funcionando

public class BancoDeDados {
    
    //Método para criar conexão com o banco de dados
    public Connection getConexao(){
    
        Connection conexao = null;
        
        /*utilizar o Driver de conector mysql .jar*/
        try{
            //Código que funciona
            Class.forName("com.mysql.cj.jdbc.Driver");
            
        }catch(ClassNotFoundException e){
            System.out.println("Driver não encontrado!" + e);
        }
        
        //Conexão com o banco
        
       //Não esquecer de trocar usuario e a senha do banco - se baixar do github
        try{
            String urlBanco = "jdbc:mysql://localhost:3306/db_escola";
            String usuario = "root";
            String senha = "root";
            
            //utilizar as variéveis de conexão
            conexao = DriverManager.getConnection(urlBanco,usuario,senha);            
        }catch(SQLException e){
            System.out.println("Erro ao conectar Banco de Dados!" + e);
        }
        
        return conexao;
    }
    
    //Inserir aluno no banco de dados.
    public void inserir(Aluno aluno){
    
        try{
            
         Connection conexao = getConexao();//conexão com o banco de dados
    
         String sql = "INSERT INTO aluno(nome, cpf, endereco, idade)" 
                 +"VALUES (?, ?, ?, ?)";
         
            //ordem do preenchimento e valor que será utilizado
            try ( //Verifica o comando sql - Faz segurança
                    PreparedStatement ps = conexao.prepareStatement(sql)) {
                //ordem do preenchimento e valor que será utilizado
                ps.setString(1,aluno.getNome());
                ps.setString(2,aluno.getCpf());
                ps.setString(3,aluno.getEndereco());
                ps.setInt(4,aluno.getIdade());
                
                //Executar o SQL de Inserir
                ps.execute();
            }
        
        }catch(SQLException e){
            System.out.println("Erro ao cadastrar no banco!" + e);
        }
           
    }
    
   
    //Exibir dados do banco de dados
    public String listar(){
        
        String html="";
        
        try{
            
            Connection conexao = getConexao();//conexão com o banco de dados
            String sql = "SELECT * FROM aluno";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            
            while(rs.next()){
                int ra = rs.getInt(1);//RA
                String nome =  rs.getString(2);//Nome
                String cpf = rs.getString(3);//CPF
                String endereco = rs.getString(4);//Endereço
                int idade = rs.getInt(5);//Idade
                
                html = html+"<tr>" +
                                    "<th scope='row'>"+ ra +"</th>" +
                                    "<td>"+ nome +"</td>" +
                                    "<td>"+ cpf +"</td>" +
                                    "<td>"+ endereco +"</td>" +
                                    "<td>"+ idade +"</td>" +
                                    "<td><a class='btn btn-primary' href='./editar.jsp?ra="+ra+"'>Editar</a></td>" +
                                    "<td><a class='btn btn-danger' href='./excluir.jsp?ra="+ra+"'>Excluir</a></td>" +
                               "</tr>";
                
            }
                       
        }catch(SQLException e){
            System.out.println("Erro ao listar no banco!" + e);
        }
        System.out.println("Teste");
     return html;
    }
    
      
    public void excluir(int ra){
        try{
            Connection conexao = getConexao();
            String sql = "DELETE FROM aluno WHERE ra ="+ ra;
            try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                ps.execute();
            }
            
        }catch(SQLException e){
            System.out.println("Erro ao excluir"+e);
        }
    }
    
     public void editar(Aluno aluno){
        
         try{
            Connection conexao = getConexao();//conexão com o banco de dados
                String sql = "UPDATE aluno SET "
                +"nome = ?,"
                +"cpf = ?," 
                +"endereco = ?,"
                +"idade = ?" 
                +" WHERE ra = ?";
             try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                 ps.setString(1,aluno.getNome());
                 ps.setString(2,aluno.getCpf());
                 ps.setString(3,aluno.getEndereco());
                 ps.setInt(4,aluno.getIdade());
                 ps.setInt(5,aluno.getRa());
                 
                 System.out.println(aluno.getNome());
                 ps.execute();
             }
            
         }catch(SQLException e){
            System.out.println("Erro ao Atualizar"+ e);
        }
        
    }
     
    public Aluno buscar(int raBuscar){
        
        Aluno aluno = new Aluno(); 
        try{
            
            Connection conexao = getConexao();//conexão com o banco de dados
            String sql = "SELECT * FROM aluno WHERE ra ="+raBuscar;
            PreparedStatement ps = conexao.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(sql);
            
            while(rs.next()){
                aluno.setRa(rs.getInt(1));//RA
                aluno.setNome(rs.getString(2));//Nome
                aluno.setCpf(rs.getString(3));//CPF
                aluno.setEndereco(rs.getString(4));//Endereço
                aluno.setIdade(rs.getInt(5));//Idade
                }
            
            }
                       
       catch(SQLException e){
            System.out.println("Erro ao buscar no banco!" + e);
        }
        
        return aluno;
    } 
}