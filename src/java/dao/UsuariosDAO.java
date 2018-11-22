/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Produto;
import classes.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Isabela Desiderio
 */
public class UsuariosDAO {
     public ArrayList<Usuarios> getUsuarios(String id){
        ArrayList<Usuarios> usuarios = new ArrayList<Usuarios>();
        
                
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuarios usuario = new Usuarios();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setLogin(rs.getString("login"));
                usuario.setEmail(rs.getString("email"));
                usuario.setCpf(rs.getInt("cpf"));
                
                usuarios.add(usuario);
            }
            rs.close();
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return usuarios;
    }



public ArrayList<Produto> getProdutos(String id){
        ArrayList<Produto> produtos = new ArrayList<Produto>();
        
        
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products");
            ResultSet rs = ps.executeQuery();
             while(rs.next()){
                Produto produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setTitulo(rs.getString("titulo"));
                produto.setDescricao(rs.getString("descrição"));
                produto.setPreco(rs.getInt("preco"));
                produto.setItensCompoem(rs.getString("itensCompoem"));
                produto.setVendedor(rs.getString("vendedor"));
                produto.setQtdeDisponivel(rs.getInt("qtdeDisponivel"));
                produto.setEndLoja(rs.getString("endLoja"));
                produto.setTelefone(rs.getInt("telefone"));
             
                                produtos.add(produto);
            }
            rs.close();
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return produtos;
    }
    
}
