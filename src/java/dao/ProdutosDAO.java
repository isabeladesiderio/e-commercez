/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Windows 7
 */
public class ProdutosDAO {
    
    public ArrayList<String> getMarcas(){
        ArrayList<String> marcas = new ArrayList<String>();
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement ps = con.prepareStatement("SELECT vendedor FROM products");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                marcas.add(rs.getString("vendedor"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return marcas;
    }
    
    public ArrayList<Produto> getProdutos(String marca, String search){
        ArrayList<Produto> produtos = new ArrayList<Produto>();
        
        String filter = "";
        if(!marca.equals("null")){
            filter = "WHERE vendedor = '"+marca+"'";
        }
        if(!filter.equals("") && !search.equals("null")){
            filter += " AND titulo LIKE '%"+search+"%' OR descri��o LIKE'%"+search+"%'";
        }else if(!search.equals("null")){
            filter = "WHERE titulo LIKE '%"+search+"%' OR descri��o LIKE'%"+search+"%'";
        }
        
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products "+filter+"");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Produto produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setTitulo(rs.getString("titulo"));
                produto.setDescricao(rs.getString("descri��o"));
                produto.setPreco(rs.getInt("preco"));
                produto.setItensCompoem(rs.getString("itensCompoem"));
                produto.setVendedor(rs.getString("vendedor"));
                produto.setQtdeDisponivel(rs.getInt("qtdeDisponivel"));
                produto.setEndLoja(rs.getString("endLoja"));
                produto.setTelefone(rs.getInt("telefone"));
                produto.setImage(rs.getString("image"));
                
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
    
    public ArrayList<Produto> getBySlug(String search){
        ArrayList<Produto> produtos = new ArrayList<Produto>();
        
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE titulo LIKE'%"+search+"%' OR descri��o LIKE '%"+search+"%'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Produto produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setTitulo(rs.getString("titulo"));
                produto.setDescricao(rs.getString("descri��o"));
                produto.setPreco(rs.getInt("preco"));
                produto.setItensCompoem(rs.getString("itensCompoem"));
                produto.setVendedor(rs.getString("vendedor"));
                produto.setQtdeDisponivel(rs.getInt("qtdeDisponivel"));
                produto.setEndLoja(rs.getString("endLoja"));
                produto.setTelefone(rs.getInt("telefone"));
                produto.setImage(rs.getString("image"));
                
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

    public Produto getById(String id) {
        Produto produto = new Produto();
        
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE id = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                produto.setId(rs.getInt("id"));
                produto.setTitulo(rs.getString("titulo"));
                produto.setDescricao(rs.getString("descri��o"));
                produto.setPreco(rs.getInt("preco"));
                produto.setItensCompoem(rs.getString("itensCompoem"));
                produto.setVendedor(rs.getString("vendedor"));
                produto.setQtdeDisponivel(rs.getInt("qtdeDisponivel"));
                produto.setEndLoja(rs.getString("endLoja"));
                produto.setTelefone(rs.getInt("telefone"));
                produto.setImage(rs.getString("image"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return produto;
    }

    public boolean register(String imagem, String titulo, String descricao, String vendedor, String quantidade, String endereco, String telefone, String preco) {
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement ps = con.prepareStatement("INSERT INTO products(titulo, descri��o, preco, vendedor, qtdeDisponivel, endLoja, telefone, image, itensCompoem) VALUES(?,?,?,?,?,?,?,?, '')");
            ps.setString(1, titulo);
            ps.setString(2, descricao);
            ps.setInt(3, Integer.parseInt(preco) * 100);
            ps.setString(4, vendedor);
            ps.setInt(5, Integer.parseInt(quantidade));
            ps.setString(6, endereco);
            ps.setString(7, telefone);
            ps.setString(8, imagem);
            ps.execute();
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return true;
    }
    
}
