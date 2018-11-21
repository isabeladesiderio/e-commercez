package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conecta {

    /**
     * Devolve a conex�o com o banco de dados
     *
     * @return
     */
    public static Connection getConexao() throws Exception {

        Connection con = null;
        //Configura servidor de Banco de Dados e nome do Banco
        String serverName = "127.0.0.1";
        String portNumber = "3306";
        String mydatabase = "e-commercez";

        //Login e senha do banco
        String username = "root";
        String password = "";//"root";

        //Carregando o JDBC Driver
        String driverName = "com.mysql.jdbc.Driver";
        Class.forName(driverName);

        // Criando a conexao com o Banco de Dados
        // ex: "jdbc:mysql://127.0.0.1:3306/mydb?useSSL=false"
        String url = "jdbc:mysql://" + serverName +  ":"+ portNumber+"/" + mydatabase+"?useSSL=false"; // a JDBC url
        con = DriverManager.getConnection(url, username, password);

        return con;
    }
}

